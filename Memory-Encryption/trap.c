#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"


#include "ptentry.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }
  char *addr;
  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;
  case T_PGFLT:
    //Food for thought: How can one distinguish between a regular page fault and a decryption request?
    cprintf("p4Debug : Page fault !    ");
    addr = (char*)rcr2();  // addr is virtual address
    cprintf("addr: %x\n", addr);
    struct proc *proc = myproc();
    pte_t *pte;
    pte = (pte_t *) walkpgdir_public(proc->pgdir, addr);

    // regular page fault
    if (!((*pte & PTE_P) == 0 && (*pte & PTE_E) > 0))
      exit();
    
    // decryption request
    // PTE_P was cleared and PTE_E was set
    print_clockqueue(proc);	
    int count = count_entries(proc->clockqueue);
    cprintf("clockqueue entry count: %d\n", count);

    int idx = find_idx(proc->clockqueue, (uint)addr);
    if (idx != -1) {
      cprintf("Page found in WS queue, idx: %d\n", idx);
      // Set the PTE_A for this Page in the WS queue
      *pte |= PTE_A;
    } else {
      cprintf("Page NOT found in WS queue\n");
      if (count < CLOCKSIZE) {
	if (mdecrypt(addr))
	  exit();
	
	// Step 1: Set PTE_A = 1 (redundant...HW already does this)
	// Step 2: Find position in clockqueue to put this new entry
	// Step 3: Set va, access bit, and valid values accordingly	
	int position = get_empty_slot(proc->clockqueue, proc->clock_hand_idx);	

	cprintf("first empty position: %d\n", position);

	cprintf("Before Inserting entry to clockqueue\n");
	struct wsentry *entryp = &proc->clockqueue[position];
	entryp->va = addr;
	entryp->valid = 1;

	cprintf("After inserting to clockqueue\n");	
	print_clockqueue(proc);
      } else {
	// Find victim index to evict from clock queue
	int victim_idx = find_victim_idx(proc->clockqueue, &proc->clock_hand_idx);
	cprintf("victim_idx: %d, clock_hand_idx: %d\n", victim_idx, proc->clock_hand_idx);
	print_clockqueue(proc);
	struct pt_entry pt_entry[10];
	getpgtable(pt_entry, 10, 0);
	cprintf("Page table:\n");
	for (int i = 0; i < 10; i++) {
	  cprintf("%d: pdx: %p, ptx: %p, ppage: %p, present: %d, writable: %d, " 
		  "user: %p, encrypted: %d, ref: %p\n", i, pt_entry[i].pdx, pt_entry[i].ptx, 
		  pt_entry[i].ppage, pt_entry[i].present, pt_entry[i].writable,
		  pt_entry[i].user, pt_entry[i].encrypted, pt_entry[i].ref);
	}
	// encrypt the victim page	
	cprintf("Encrypting the victim page\n");
	struct wsentry *victim_entry = &proc->clockqueue[victim_idx];				
	mencrypt(victim_entry->va, 1);
	    
	// decrypt the new page
	cprintf("decrypting the new page\n");
	if (mdecrypt(addr)) {
	  panic("p4Debug: Memory fault");
	  exit();
	}

	// insert the newly decrypted page to clock queue
	cprintf("inserting the newly decrypted page to clock queue\n");
	victim_entry->va = addr;
	victim_entry->valid = 1;
	cprintf("After inserting to clockqueue\n");
	print_clockqueue(proc);
      }
    }

    break;
    //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
