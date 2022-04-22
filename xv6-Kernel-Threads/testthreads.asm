
_testthreads:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void consume(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int i;
  ppid = getpid();
  13:	e8 e0 06 00 00       	call   6f8 <getpid>

  lock_init(&lock);
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 10 10 00 00       	push   $0x1010
  ppid = getpid();
  20:	a3 2c 10 00 00       	mov    %eax,0x102c
  lock_init(&lock);
  25:	e8 e6 05 00 00       	call   610 <lock_init>
  
  running_flag = 1;
  assert((pid1 = thread_create(consume, NULL, NULL)) > 0);
  2a:	83 c4 0c             	add    $0xc,%esp
  running_flag = 1;
  2d:	c7 05 30 10 00 00 01 	movl   $0x1,0x1030
  34:	00 00 00 
  assert((pid1 = thread_create(consume, NULL, NULL)) > 0);
  37:	6a 00                	push   $0x0
  39:	6a 00                	push   $0x0
  3b:	68 10 02 00 00       	push   $0x210
  40:	e8 9b 04 00 00       	call   4e0 <thread_create>
  45:	83 c4 10             	add    $0x10,%esp
  48:	a3 24 10 00 00       	mov    %eax,0x1024
  4d:	85 c0                	test   %eax,%eax
  4f:	0f 8e 1c 01 00 00    	jle    171 <main+0x171>
  assert((pid2 = thread_create(consume, NULL, NULL)) > 0);
  55:	50                   	push   %eax
  56:	6a 00                	push   $0x0
  58:	6a 00                	push   $0x0
  5a:	68 10 02 00 00       	push   $0x210
  5f:	e8 7c 04 00 00       	call   4e0 <thread_create>
  64:	83 c4 10             	add    $0x10,%esp
  67:	a3 1c 10 00 00       	mov    %eax,0x101c
  6c:	85 c0                	test   %eax,%eax
  6e:	0f 8e b7 00 00 00    	jle    12b <main+0x12b>
  assert((pid3 = thread_create(consume, NULL, NULL)) > 0);
  74:	51                   	push   %ecx
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 10 02 00 00       	push   $0x210
  7e:	e8 5d 04 00 00       	call   4e0 <thread_create>
  83:	83 c4 10             	add    $0x10,%esp
  86:	a3 20 10 00 00       	mov    %eax,0x1020
  8b:	85 c0                	test   %eax,%eax
  8d:	0f 8e 18 01 00 00    	jle    1ab <main+0x1ab>
  assert((pid4 = thread_create(consume, NULL, NULL)) > 0);
  93:	52                   	push   %edx
  94:	bb 32 00 00 00       	mov    $0x32,%ebx
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 10 02 00 00       	push   $0x210
  a2:	e8 39 04 00 00       	call   4e0 <thread_create>
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	a3 18 10 00 00       	mov    %eax,0x1018
  af:	85 c0                	test   %eax,%eax
  b1:	0f 8e d7 00 00 00    	jle    18e <main+0x18e>
  b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  be:	66 90                	xchg   %ax,%ax

    a+=10;

    //printf(1, "produce in main\n");

    sleep(10);
  c0:	83 ec 0c             	sub    $0xc,%esp
    a+=10;
  c3:	83 05 28 10 00 00 0a 	addl   $0xa,0x1028
    sleep(10);
  ca:	6a 0a                	push   $0xa
  cc:	e8 37 06 00 00       	call   708 <sleep>
  for(i = 0; i < 50; i++) {
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	83 eb 01             	sub    $0x1,%ebx
  d7:	75 e7                	jne    c0 <main+0xc0>
  }
  
  sleep(2000);
  d9:	83 ec 0c             	sub    $0xc,%esp
  running_flag = 0;
  sleep(100);
  dc:	bb 04 00 00 00       	mov    $0x4,%ebx
  sleep(2000);
  e1:	68 d0 07 00 00       	push   $0x7d0
  e6:	e8 1d 06 00 00       	call   708 <sleep>
  sleep(100);
  eb:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  running_flag = 0;
  f2:	c7 05 30 10 00 00 00 	movl   $0x0,0x1030
  f9:	00 00 00 
  sleep(100);
  fc:	e8 07 06 00 00       	call   708 <sleep>
 101:	83 c4 10             	add    $0x10,%esp
  
  
  for(i = 0; i < 4; i++) {
    int join_pid = thread_join();
 104:	e8 77 04 00 00       	call   580 <thread_join>
    assert(join_pid > 0);
 109:	85 c0                	test   %eax,%eax
 10b:	0f 8e ba 00 00 00    	jle    1cb <main+0x1cb>
  for(i = 0; i < 4; i++) {
 111:	83 eb 01             	sub    $0x1,%ebx
 114:	75 ee                	jne    104 <main+0x104>
    //printf(1, "joined pid %d\n", i);
  }
  
  //printf(1, "b is %d\n", b);
  if(b == 500)
 116:	81 3d 0c 10 00 00 f4 	cmpl   $0x1f4,0x100c
 11d:	01 00 00 
 120:	0f 84 c5 00 00 00    	je     1eb <main+0x1eb>
    printf(1, "TEST PASSED\n");
  exit();
 126:	e8 4d 05 00 00       	call   678 <exit>
  assert((pid2 = thread_create(consume, NULL, NULL)) > 0);
 12b:	6a 26                	push   $0x26
 12d:	68 48 0b 00 00       	push   $0xb48
 132:	68 56 0b 00 00       	push   $0xb56
 137:	6a 01                	push   $0x1
 139:	e8 a2 06 00 00       	call   7e0 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 cc 0b 00 00       	push   $0xbcc
 146:	68 5e 0b 00 00       	push   $0xb5e
 14b:	6a 01                	push   $0x1
 14d:	e8 8e 06 00 00       	call   7e0 <printf>
 152:	5b                   	pop    %ebx
 153:	58                   	pop    %eax
 154:	68 72 0b 00 00       	push   $0xb72
 159:	6a 01                	push   $0x1
 15b:	e8 80 06 00 00       	call   7e0 <printf>
 160:	58                   	pop    %eax
 161:	ff 35 2c 10 00 00    	pushl  0x102c
 167:	e8 3c 05 00 00       	call   6a8 <kill>
 16c:	e8 07 05 00 00       	call   678 <exit>
  assert((pid1 = thread_create(consume, NULL, NULL)) > 0);
 171:	6a 25                	push   $0x25
 173:	68 48 0b 00 00       	push   $0xb48
 178:	68 56 0b 00 00       	push   $0xb56
 17d:	6a 01                	push   $0x1
 17f:	e8 5c 06 00 00       	call   7e0 <printf>
 184:	83 c4 0c             	add    $0xc,%esp
 187:	68 9c 0b 00 00       	push   $0xb9c
 18c:	eb b8                	jmp    146 <main+0x146>
  assert((pid4 = thread_create(consume, NULL, NULL)) > 0);
 18e:	6a 28                	push   $0x28
 190:	68 48 0b 00 00       	push   $0xb48
 195:	68 56 0b 00 00       	push   $0xb56
 19a:	6a 01                	push   $0x1
 19c:	e8 3f 06 00 00       	call   7e0 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 2c 0c 00 00       	push   $0xc2c
 1a9:	eb 9b                	jmp    146 <main+0x146>
  assert((pid3 = thread_create(consume, NULL, NULL)) > 0);
 1ab:	6a 27                	push   $0x27
 1ad:	68 48 0b 00 00       	push   $0xb48
 1b2:	68 56 0b 00 00       	push   $0xb56
 1b7:	6a 01                	push   $0x1
 1b9:	e8 22 06 00 00       	call   7e0 <printf>
 1be:	83 c4 0c             	add    $0xc,%esp
 1c1:	68 fc 0b 00 00       	push   $0xbfc
 1c6:	e9 7b ff ff ff       	jmp    146 <main+0x146>
    assert(join_pid > 0);
 1cb:	6a 3b                	push   $0x3b
 1cd:	68 48 0b 00 00       	push   $0xb48
 1d2:	68 56 0b 00 00       	push   $0xb56
 1d7:	6a 01                	push   $0x1
 1d9:	e8 02 06 00 00       	call   7e0 <printf>
 1de:	83 c4 0c             	add    $0xc,%esp
 1e1:	68 7f 0b 00 00       	push   $0xb7f
 1e6:	e9 5b ff ff ff       	jmp    146 <main+0x146>
    printf(1, "TEST PASSED\n");
 1eb:	50                   	push   %eax
 1ec:	50                   	push   %eax
 1ed:	68 8c 0b 00 00       	push   $0xb8c
 1f2:	6a 01                	push   $0x1
 1f4:	e8 e7 05 00 00       	call   7e0 <printf>
 1f9:	83 c4 10             	add    $0x10,%esp
 1fc:	e9 25 ff ff ff       	jmp    126 <main+0x126>
 201:	66 90                	xchg   %ax,%ax
 203:	66 90                	xchg   %ax,%ax
 205:	66 90                	xchg   %ax,%ax
 207:	66 90                	xchg   %ax,%ax
 209:	66 90                	xchg   %ax,%ax
 20b:	66 90                	xchg   %ax,%ax
 20d:	66 90                	xchg   %ax,%ax
 20f:	90                   	nop

00000210 <consume>:
}

void
consume(void *arg1, void *arg2) {
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	83 ec 14             	sub    $0x14,%esp
  //printf(1, "in consume\n");
  sleep(100);
 21a:	6a 64                	push   $0x64
 21c:	e8 e7 04 00 00       	call   708 <sleep>
  while(running_flag) {
 221:	8b 15 30 10 00 00    	mov    0x1030,%edx
 227:	83 c4 10             	add    $0x10,%esp
 22a:	85 d2                	test   %edx,%edx
 22c:	74 43                	je     271 <consume+0x61>
 22e:	66 90                	xchg   %ax,%ax
    //printf(1, "in consume\n");
    lock_acquire(&lock);
 230:	83 ec 0c             	sub    $0xc,%esp
 233:	68 10 10 00 00       	push   $0x1010
 238:	e8 f3 03 00 00       	call   630 <lock_acquire>
	if (a > 0) {
 23d:	a1 28 10 00 00       	mov    0x1028,%eax
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	7e 0f                	jle    258 <consume+0x48>
		a--;
 249:	83 e8 01             	sub    $0x1,%eax

		//printf(1, "consumed 1\n");
		b++;
 24c:	83 05 0c 10 00 00 01 	addl   $0x1,0x100c
		a--;
 253:	a3 28 10 00 00       	mov    %eax,0x1028

	}
        lock_release(&lock);
 258:	83 ec 0c             	sub    $0xc,%esp
 25b:	68 10 10 00 00       	push   $0x1010
 260:	e8 fb 03 00 00       	call   660 <lock_release>
  while(running_flag) {
 265:	a1 30 10 00 00       	mov    0x1030,%eax
 26a:	83 c4 10             	add    $0x10,%esp
 26d:	85 c0                	test   %eax,%eax
 26f:	75 bf                	jne    230 <consume+0x20>
  }

  //printf(1, "out of consume\n");
  exit();
 271:	e8 02 04 00 00       	call   678 <exit>
 276:	66 90                	xchg   %ax,%ax
 278:	66 90                	xchg   %ax,%ax
 27a:	66 90                	xchg   %ax,%ax
 27c:	66 90                	xchg   %ax,%ax
 27e:	66 90                	xchg   %ax,%ax

00000280 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 285:	31 c0                	xor    %eax,%eax
{
 287:	89 e5                	mov    %esp,%ebp
 289:	53                   	push   %ebx
 28a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 290:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 294:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 297:	83 c0 01             	add    $0x1,%eax
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strcpy+0x10>
    ;
  return os;
}
 29e:	89 c8                	mov    %ecx,%eax
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	53                   	push   %ebx
 2b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2be:	0f b6 01             	movzbl (%ecx),%eax
 2c1:	0f b6 1a             	movzbl (%edx),%ebx
 2c4:	84 c0                	test   %al,%al
 2c6:	75 19                	jne    2e1 <strcmp+0x31>
 2c8:	eb 26                	jmp    2f0 <strcmp+0x40>
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2d4:	83 c1 01             	add    $0x1,%ecx
 2d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2da:	0f b6 1a             	movzbl (%edx),%ebx
 2dd:	84 c0                	test   %al,%al
 2df:	74 0f                	je     2f0 <strcmp+0x40>
 2e1:	38 d8                	cmp    %bl,%al
 2e3:	74 eb                	je     2d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2e5:	29 d8                	sub    %ebx,%eax
}
 2e7:	5b                   	pop    %ebx
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2f2:	29 d8                	sub    %ebx,%eax
}
 2f4:	5b                   	pop    %ebx
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <strlen>:

uint
strlen(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 30a:	80 3a 00             	cmpb   $0x0,(%edx)
 30d:	74 21                	je     330 <strlen+0x30>
 30f:	31 c0                	xor    %eax,%eax
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	83 c0 01             	add    $0x1,%eax
 31b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 31f:	89 c1                	mov    %eax,%ecx
 321:	75 f5                	jne    318 <strlen+0x18>
    ;
  return n;
}
 323:	89 c8                	mov    %ecx,%eax
 325:	5d                   	pop    %ebp
 326:	c3                   	ret    
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 330:	31 c9                	xor    %ecx,%ecx
}
 332:	5d                   	pop    %ebp
 333:	89 c8                	mov    %ecx,%eax
 335:	c3                   	ret    
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34e:	8b 45 0c             	mov    0xc(%ebp),%eax
 351:	89 d7                	mov    %edx,%edi
 353:	fc                   	cld    
 354:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	8b 45 08             	mov    0x8(%ebp),%eax
 36a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36e:	0f b6 10             	movzbl (%eax),%edx
 371:	84 d2                	test   %dl,%dl
 373:	75 16                	jne    38b <strchr+0x2b>
 375:	eb 21                	jmp    398 <strchr+0x38>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
 380:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 384:	83 c0 01             	add    $0x1,%eax
 387:	84 d2                	test   %dl,%dl
 389:	74 0d                	je     398 <strchr+0x38>
    if(*s == c)
 38b:	38 d1                	cmp    %dl,%cl
 38d:	75 f1                	jne    380 <strchr+0x20>
      return (char*)s;
  return 0;
}
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 398:	31 c0                	xor    %eax,%eax
}
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a9:	31 f6                	xor    %esi,%esi
{
 3ab:	53                   	push   %ebx
 3ac:	89 f3                	mov    %esi,%ebx
 3ae:	83 ec 1c             	sub    $0x1c,%esp
 3b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3b4:	eb 33                	jmp    3e9 <gets+0x49>
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3c0:	83 ec 04             	sub    $0x4,%esp
 3c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c6:	6a 01                	push   $0x1
 3c8:	50                   	push   %eax
 3c9:	6a 00                	push   $0x0
 3cb:	e8 c0 02 00 00       	call   690 <read>
    if(cc < 1)
 3d0:	83 c4 10             	add    $0x10,%esp
 3d3:	85 c0                	test   %eax,%eax
 3d5:	7e 1c                	jle    3f3 <gets+0x53>
      break;
    buf[i++] = c;
 3d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3db:	83 c7 01             	add    $0x1,%edi
 3de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3e1:	3c 0a                	cmp    $0xa,%al
 3e3:	74 23                	je     408 <gets+0x68>
 3e5:	3c 0d                	cmp    $0xd,%al
 3e7:	74 1f                	je     408 <gets+0x68>
  for(i=0; i+1 < max; ){
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	89 fe                	mov    %edi,%esi
 3ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f1:	7c cd                	jl     3c0 <gets+0x20>
 3f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3f8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fe:	5b                   	pop    %ebx
 3ff:	5e                   	pop    %esi
 400:	5f                   	pop    %edi
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    
 403:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 407:	90                   	nop
 408:	8b 75 08             	mov    0x8(%ebp),%esi
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	01 de                	add    %ebx,%esi
 410:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 412:	c6 03 00             	movb   $0x0,(%ebx)
}
 415:	8d 65 f4             	lea    -0xc(%ebp),%esp
 418:	5b                   	pop    %ebx
 419:	5e                   	pop    %esi
 41a:	5f                   	pop    %edi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <stat>:

int
stat(const char *n, struct stat *st)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	56                   	push   %esi
 428:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 429:	83 ec 08             	sub    $0x8,%esp
 42c:	6a 00                	push   $0x0
 42e:	ff 75 08             	pushl  0x8(%ebp)
 431:	e8 82 02 00 00       	call   6b8 <open>
  if(fd < 0)
 436:	83 c4 10             	add    $0x10,%esp
 439:	85 c0                	test   %eax,%eax
 43b:	78 2b                	js     468 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 43d:	83 ec 08             	sub    $0x8,%esp
 440:	ff 75 0c             	pushl  0xc(%ebp)
 443:	89 c3                	mov    %eax,%ebx
 445:	50                   	push   %eax
 446:	e8 85 02 00 00       	call   6d0 <fstat>
  close(fd);
 44b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44e:	89 c6                	mov    %eax,%esi
  close(fd);
 450:	e8 4b 02 00 00       	call   6a0 <close>
  return r;
 455:	83 c4 10             	add    $0x10,%esp
}
 458:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45b:	89 f0                	mov    %esi,%eax
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 468:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46d:	eb e9                	jmp    458 <stat+0x38>
 46f:	90                   	nop

00000470 <atoi>:

int
atoi(const char *s)
{
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	53                   	push   %ebx
 478:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 47b:	0f be 02             	movsbl (%edx),%eax
 47e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 481:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 484:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 489:	77 1a                	ja     4a5 <atoi+0x35>
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
    n = n*10 + *s++ - '0';
 490:	83 c2 01             	add    $0x1,%edx
 493:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 496:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 49a:	0f be 02             	movsbl (%edx),%eax
 49d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	89 c8                	mov    %ecx,%eax
 4a7:	5b                   	pop    %ebx
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	8b 45 10             	mov    0x10(%ebp),%eax
 4bb:	8b 55 08             	mov    0x8(%ebp),%edx
 4be:	56                   	push   %esi
 4bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c2:	85 c0                	test   %eax,%eax
 4c4:	7e 0f                	jle    4d5 <memmove+0x25>
 4c6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4c8:	89 d7                	mov    %edx,%edi
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4d1:	39 f8                	cmp    %edi,%eax
 4d3:	75 fb                	jne    4d0 <memmove+0x20>
  return vdst;
}
 4d5:	5e                   	pop    %esi
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	53                   	push   %ebx
 4e8:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 4eb:	68 00 20 00 00       	push   $0x2000
 4f0:	e8 4b 05 00 00       	call   a40 <malloc>
  void* stack;
  if(freeptr == 0)
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	85 c0                	test   %eax,%eax
 4fa:	74 6e                	je     56a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 4fc:	89 c2                	mov    %eax,%edx
 4fe:	89 c3                	mov    %eax,%ebx
 500:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 506:	75 58                	jne    560 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 508:	b9 40 10 00 00       	mov    $0x1040,%ecx
 50d:	31 d2                	xor    %edx,%edx
 50f:	eb 12                	jmp    523 <thread_create+0x43>
 511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 518:	83 c2 01             	add    $0x1,%edx
 51b:	83 c1 0c             	add    $0xc,%ecx
 51e:	83 fa 40             	cmp    $0x40,%edx
 521:	74 21                	je     544 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 523:	83 39 00             	cmpl   $0x0,(%ecx)
 526:	75 f0                	jne    518 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 528:	8d 14 52             	lea    (%edx,%edx,2),%edx
 52b:	c1 e2 02             	shl    $0x2,%edx
 52e:	89 82 44 10 00 00    	mov    %eax,0x1044(%edx)
      ptrs[i].stack = stack;
 534:	89 9a 48 10 00 00    	mov    %ebx,0x1048(%edx)
      ptrs[i].busy = 1;
 53a:	c7 82 40 10 00 00 01 	movl   $0x1,0x1040(%edx)
 541:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 544:	53                   	push   %ebx
 545:	ff 75 10             	pushl  0x10(%ebp)
 548:	ff 75 0c             	pushl  0xc(%ebp)
 54b:	ff 75 08             	pushl  0x8(%ebp)
 54e:	e8 c5 01 00 00       	call   718 <clone>
 553:	83 c4 10             	add    $0x10,%esp
}
 556:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 559:	c9                   	leave  
 55a:	c3                   	ret    
 55b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 560:	29 d3                	sub    %edx,%ebx
 562:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 568:	eb 9e                	jmp    508 <thread_create+0x28>
    return -1;
 56a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 56f:	eb e5                	jmp    556 <thread_create+0x76>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <thread_join>:

int thread_join()
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 589:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 58c:	53                   	push   %ebx
 58d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 590:	50                   	push   %eax
 591:	e8 8a 01 00 00       	call   720 <join>
 596:	ba 40 10 00 00       	mov    $0x1040,%edx
 59b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 59e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 5a0:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 5a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a5:	eb 14                	jmp    5bb <thread_join+0x3b>
 5a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ae:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 5b0:	83 c1 01             	add    $0x1,%ecx
 5b3:	83 c2 0c             	add    $0xc,%edx
 5b6:	83 f9 40             	cmp    $0x40,%ecx
 5b9:	74 3f                	je     5fa <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 5bb:	83 3a 01             	cmpl   $0x1,(%edx)
 5be:	75 f0                	jne    5b0 <thread_join+0x30>
 5c0:	39 42 08             	cmp    %eax,0x8(%edx)
 5c3:	75 eb                	jne    5b0 <thread_join+0x30>
      free(ptrs[i].ptr);
 5c5:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	c1 e6 02             	shl    $0x2,%esi
 5ce:	ff b6 44 10 00 00    	pushl  0x1044(%esi)
 5d4:	e8 d7 03 00 00       	call   9b0 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 5d9:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 5dc:	c7 86 48 10 00 00 00 	movl   $0x0,0x1048(%esi)
 5e3:	00 00 00 
      ptrs[i].busy = 0;
 5e6:	c7 86 40 10 00 00 00 	movl   $0x0,0x1040(%esi)
 5ed:	00 00 00 
      ptrs[i].ptr = NULL;
 5f0:	c7 86 44 10 00 00 00 	movl   $0x0,0x1044(%esi)
 5f7:	00 00 00 
    }
  }
  return ret;  
}
 5fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fd:	89 d8                	mov    %ebx,%eax
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <lock_init>:

void lock_init(lock_t *lock)
{
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 61a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 620:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000630 <lock_acquire>:

void lock_acquire(lock_t *lock){
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
    __asm__ volatile
 635:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 63a:	89 e5                	mov    %esp,%ebp
 63c:	53                   	push   %ebx
 63d:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 640:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 644:	31 db                	xor    %ebx,%ebx
 646:	83 c2 04             	add    $0x4,%edx
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 650:	89 d8                	mov    %ebx,%eax
 652:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 656:	39 c1                	cmp    %eax,%ecx
 658:	75 f6                	jne    650 <lock_acquire+0x20>
}
 65a:	5b                   	pop    %ebx
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <lock_release>:

void lock_release(lock_t *lock){
 660:	f3 0f 1e fb          	endbr32 
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 66a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 66e:	5d                   	pop    %ebp
 66f:	c3                   	ret    

00000670 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 670:	b8 01 00 00 00       	mov    $0x1,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <exit>:
SYSCALL(exit)
 678:	b8 02 00 00 00       	mov    $0x2,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <wait>:
SYSCALL(wait)
 680:	b8 03 00 00 00       	mov    $0x3,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <pipe>:
SYSCALL(pipe)
 688:	b8 04 00 00 00       	mov    $0x4,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <read>:
SYSCALL(read)
 690:	b8 06 00 00 00       	mov    $0x6,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <write>:
SYSCALL(write)
 698:	b8 05 00 00 00       	mov    $0x5,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <close>:
SYSCALL(close)
 6a0:	b8 07 00 00 00       	mov    $0x7,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <kill>:
SYSCALL(kill)
 6a8:	b8 08 00 00 00       	mov    $0x8,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <exec>:
SYSCALL(exec)
 6b0:	b8 09 00 00 00       	mov    $0x9,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <open>:
SYSCALL(open)
 6b8:	b8 0a 00 00 00       	mov    $0xa,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <mknod>:
SYSCALL(mknod)
 6c0:	b8 0b 00 00 00       	mov    $0xb,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <unlink>:
SYSCALL(unlink)
 6c8:	b8 0c 00 00 00       	mov    $0xc,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <fstat>:
SYSCALL(fstat)
 6d0:	b8 0d 00 00 00       	mov    $0xd,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <link>:
SYSCALL(link)
 6d8:	b8 0e 00 00 00       	mov    $0xe,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <mkdir>:
SYSCALL(mkdir)
 6e0:	b8 0f 00 00 00       	mov    $0xf,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <chdir>:
SYSCALL(chdir)
 6e8:	b8 10 00 00 00       	mov    $0x10,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <dup>:
SYSCALL(dup)
 6f0:	b8 11 00 00 00       	mov    $0x11,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <getpid>:
SYSCALL(getpid)
 6f8:	b8 12 00 00 00       	mov    $0x12,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <sbrk>:
SYSCALL(sbrk)
 700:	b8 13 00 00 00       	mov    $0x13,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <sleep>:
SYSCALL(sleep)
 708:	b8 14 00 00 00       	mov    $0x14,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <uptime>:
SYSCALL(uptime)
 710:	b8 15 00 00 00       	mov    $0x15,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <clone>:
SYSCALL(clone)
 718:	b8 16 00 00 00       	mov    $0x16,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <join>:
SYSCALL(join) 
 720:	b8 17 00 00 00       	mov    $0x17,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    
 728:	66 90                	xchg   %ax,%ax
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 3c             	sub    $0x3c,%esp
 739:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 73c:	89 d1                	mov    %edx,%ecx
{
 73e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 741:	85 d2                	test   %edx,%edx
 743:	0f 89 7f 00 00 00    	jns    7c8 <printint+0x98>
 749:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 74d:	74 79                	je     7c8 <printint+0x98>
    neg = 1;
 74f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 756:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 758:	31 db                	xor    %ebx,%ebx
 75a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 760:	89 c8                	mov    %ecx,%eax
 762:	31 d2                	xor    %edx,%edx
 764:	89 cf                	mov    %ecx,%edi
 766:	f7 75 c4             	divl   -0x3c(%ebp)
 769:	0f b6 92 64 0c 00 00 	movzbl 0xc64(%edx),%edx
 770:	89 45 c0             	mov    %eax,-0x40(%ebp)
 773:	89 d8                	mov    %ebx,%eax
 775:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 778:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 77b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 77e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 781:	76 dd                	jbe    760 <printint+0x30>
  if(neg)
 783:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 786:	85 c9                	test   %ecx,%ecx
 788:	74 0c                	je     796 <printint+0x66>
    buf[i++] = '-';
 78a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 78f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 791:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 796:	8b 7d b8             	mov    -0x48(%ebp),%edi
 799:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 79d:	eb 07                	jmp    7a6 <printint+0x76>
 79f:	90                   	nop
 7a0:	0f b6 13             	movzbl (%ebx),%edx
 7a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	56                   	push   %esi
 7af:	57                   	push   %edi
 7b0:	e8 e3 fe ff ff       	call   698 <write>
  while(--i >= 0)
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	39 de                	cmp    %ebx,%esi
 7ba:	75 e4                	jne    7a0 <printint+0x70>
    putc(fd, buf[i]);
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bf:	5b                   	pop    %ebx
 7c0:	5e                   	pop    %esi
 7c1:	5f                   	pop    %edi
 7c2:	5d                   	pop    %ebp
 7c3:	c3                   	ret    
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7cf:	eb 87                	jmp    758 <printint+0x28>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop

000007e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
 7e5:	89 e5                	mov    %esp,%ebp
 7e7:	57                   	push   %edi
 7e8:	56                   	push   %esi
 7e9:	53                   	push   %ebx
 7ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 7f0:	0f b6 1e             	movzbl (%esi),%ebx
 7f3:	84 db                	test   %bl,%bl
 7f5:	0f 84 b4 00 00 00    	je     8af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 7fb:	8d 45 10             	lea    0x10(%ebp),%eax
 7fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 801:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 804:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 806:	89 45 d0             	mov    %eax,-0x30(%ebp)
 809:	eb 33                	jmp    83e <printf+0x5e>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
 810:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 813:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	74 17                	je     834 <printf+0x54>
  write(fd, &c, 1);
 81d:	83 ec 04             	sub    $0x4,%esp
 820:	88 5d e7             	mov    %bl,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	57                   	push   %edi
 826:	ff 75 08             	pushl  0x8(%ebp)
 829:	e8 6a fe ff ff       	call   698 <write>
 82e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 831:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 834:	0f b6 1e             	movzbl (%esi),%ebx
 837:	83 c6 01             	add    $0x1,%esi
 83a:	84 db                	test   %bl,%bl
 83c:	74 71                	je     8af <printf+0xcf>
    c = fmt[i] & 0xff;
 83e:	0f be cb             	movsbl %bl,%ecx
 841:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 844:	85 d2                	test   %edx,%edx
 846:	74 c8                	je     810 <printf+0x30>
      }
    } else if(state == '%'){
 848:	83 fa 25             	cmp    $0x25,%edx
 84b:	75 e7                	jne    834 <printf+0x54>
      if(c == 'd'){
 84d:	83 f8 64             	cmp    $0x64,%eax
 850:	0f 84 9a 00 00 00    	je     8f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 856:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 85c:	83 f9 70             	cmp    $0x70,%ecx
 85f:	74 5f                	je     8c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 861:	83 f8 73             	cmp    $0x73,%eax
 864:	0f 84 d6 00 00 00    	je     940 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 86a:	83 f8 63             	cmp    $0x63,%eax
 86d:	0f 84 8d 00 00 00    	je     900 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 873:	83 f8 25             	cmp    $0x25,%eax
 876:	0f 84 b4 00 00 00    	je     930 <printf+0x150>
  write(fd, &c, 1);
 87c:	83 ec 04             	sub    $0x4,%esp
 87f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 883:	6a 01                	push   $0x1
 885:	57                   	push   %edi
 886:	ff 75 08             	pushl  0x8(%ebp)
 889:	e8 0a fe ff ff       	call   698 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 88e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 891:	83 c4 0c             	add    $0xc,%esp
 894:	6a 01                	push   $0x1
 896:	83 c6 01             	add    $0x1,%esi
 899:	57                   	push   %edi
 89a:	ff 75 08             	pushl  0x8(%ebp)
 89d:	e8 f6 fd ff ff       	call   698 <write>
  for(i = 0; fmt[i]; i++){
 8a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8ab:	84 db                	test   %bl,%bl
 8ad:	75 8f                	jne    83e <printf+0x5e>
    }
  }
}
 8af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8b2:	5b                   	pop    %ebx
 8b3:	5e                   	pop    %esi
 8b4:	5f                   	pop    %edi
 8b5:	5d                   	pop    %ebp
 8b6:	c3                   	ret    
 8b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c8:	6a 00                	push   $0x0
 8ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	8b 13                	mov    (%ebx),%edx
 8d2:	e8 59 fe ff ff       	call   730 <printint>
        ap++;
 8d7:	89 d8                	mov    %ebx,%eax
 8d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8dc:	31 d2                	xor    %edx,%edx
        ap++;
 8de:	83 c0 04             	add    $0x4,%eax
 8e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8e4:	e9 4b ff ff ff       	jmp    834 <printf+0x54>
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	eb ce                	jmp    8ca <printf+0xea>
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 900:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 906:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 908:	6a 01                	push   $0x1
        ap++;
 90a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 90d:	57                   	push   %edi
 90e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 911:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 914:	e8 7f fd ff ff       	call   698 <write>
        ap++;
 919:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 91c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91f:	31 d2                	xor    %edx,%edx
 921:	e9 0e ff ff ff       	jmp    834 <printf+0x54>
 926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 930:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
 936:	e9 59 ff ff ff       	jmp    894 <printf+0xb4>
 93b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 93f:	90                   	nop
        s = (char*)*ap;
 940:	8b 45 d0             	mov    -0x30(%ebp),%eax
 943:	8b 18                	mov    (%eax),%ebx
        ap++;
 945:	83 c0 04             	add    $0x4,%eax
 948:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 94b:	85 db                	test   %ebx,%ebx
 94d:	74 17                	je     966 <printf+0x186>
        while(*s != 0){
 94f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 952:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 954:	84 c0                	test   %al,%al
 956:	0f 84 d8 fe ff ff    	je     834 <printf+0x54>
 95c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 95f:	89 de                	mov    %ebx,%esi
 961:	8b 5d 08             	mov    0x8(%ebp),%ebx
 964:	eb 1a                	jmp    980 <printf+0x1a0>
          s = "(null)";
 966:	bb 5c 0c 00 00       	mov    $0xc5c,%ebx
        while(*s != 0){
 96b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 96e:	b8 28 00 00 00       	mov    $0x28,%eax
 973:	89 de                	mov    %ebx,%esi
 975:	8b 5d 08             	mov    0x8(%ebp),%ebx
 978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop
  write(fd, &c, 1);
 980:	83 ec 04             	sub    $0x4,%esp
          s++;
 983:	83 c6 01             	add    $0x1,%esi
 986:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 989:	6a 01                	push   $0x1
 98b:	57                   	push   %edi
 98c:	53                   	push   %ebx
 98d:	e8 06 fd ff ff       	call   698 <write>
        while(*s != 0){
 992:	0f b6 06             	movzbl (%esi),%eax
 995:	83 c4 10             	add    $0x10,%esp
 998:	84 c0                	test   %al,%al
 99a:	75 e4                	jne    980 <printf+0x1a0>
 99c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 99f:	31 d2                	xor    %edx,%edx
 9a1:	e9 8e fe ff ff       	jmp    834 <printf+0x54>
 9a6:	66 90                	xchg   %ax,%ax
 9a8:	66 90                	xchg   %ax,%ax
 9aa:	66 90                	xchg   %ax,%ax
 9ac:	66 90                	xchg   %ax,%ax
 9ae:	66 90                	xchg   %ax,%ax

000009b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b0:	f3 0f 1e fb          	endbr32 
 9b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b5:	a1 00 10 00 00       	mov    0x1000,%eax
{
 9ba:	89 e5                	mov    %esp,%ebp
 9bc:	57                   	push   %edi
 9bd:	56                   	push   %esi
 9be:	53                   	push   %ebx
 9bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 9c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c7:	39 c8                	cmp    %ecx,%eax
 9c9:	73 15                	jae    9e0 <free+0x30>
 9cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9cf:	90                   	nop
 9d0:	39 d1                	cmp    %edx,%ecx
 9d2:	72 14                	jb     9e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d4:	39 d0                	cmp    %edx,%eax
 9d6:	73 10                	jae    9e8 <free+0x38>
{
 9d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9da:	8b 10                	mov    (%eax),%edx
 9dc:	39 c8                	cmp    %ecx,%eax
 9de:	72 f0                	jb     9d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e0:	39 d0                	cmp    %edx,%eax
 9e2:	72 f4                	jb     9d8 <free+0x28>
 9e4:	39 d1                	cmp    %edx,%ecx
 9e6:	73 f0                	jae    9d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ee:	39 fa                	cmp    %edi,%edx
 9f0:	74 1e                	je     a10 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9f5:	8b 50 04             	mov    0x4(%eax),%edx
 9f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9fb:	39 f1                	cmp    %esi,%ecx
 9fd:	74 28                	je     a27 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 a01:	5b                   	pop    %ebx
  freep = p;
 a02:	a3 00 10 00 00       	mov    %eax,0x1000
}
 a07:	5e                   	pop    %esi
 a08:	5f                   	pop    %edi
 a09:	5d                   	pop    %ebp
 a0a:	c3                   	ret    
 a0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 a10:	03 72 04             	add    0x4(%edx),%esi
 a13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a16:	8b 10                	mov    (%eax),%edx
 a18:	8b 12                	mov    (%edx),%edx
 a1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a1d:	8b 50 04             	mov    0x4(%eax),%edx
 a20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a23:	39 f1                	cmp    %esi,%ecx
 a25:	75 d8                	jne    9ff <free+0x4f>
    p->s.size += bp->s.size;
 a27:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a2a:	a3 00 10 00 00       	mov    %eax,0x1000
    p->s.size += bp->s.size;
 a2f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a32:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a35:	89 10                	mov    %edx,(%eax)
}
 a37:	5b                   	pop    %ebx
 a38:	5e                   	pop    %esi
 a39:	5f                   	pop    %edi
 a3a:	5d                   	pop    %ebp
 a3b:	c3                   	ret    
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a40:	f3 0f 1e fb          	endbr32 
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	57                   	push   %edi
 a48:	56                   	push   %esi
 a49:	53                   	push   %ebx
 a4a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a50:	8b 3d 00 10 00 00    	mov    0x1000,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a56:	8d 70 07             	lea    0x7(%eax),%esi
 a59:	c1 ee 03             	shr    $0x3,%esi
 a5c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a5f:	85 ff                	test   %edi,%edi
 a61:	0f 84 a9 00 00 00    	je     b10 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a67:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a69:	8b 48 04             	mov    0x4(%eax),%ecx
 a6c:	39 f1                	cmp    %esi,%ecx
 a6e:	73 6d                	jae    add <malloc+0x9d>
 a70:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a76:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a7b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a7e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a85:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a88:	eb 17                	jmp    aa1 <malloc+0x61>
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a90:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a92:	8b 4a 04             	mov    0x4(%edx),%ecx
 a95:	39 f1                	cmp    %esi,%ecx
 a97:	73 4f                	jae    ae8 <malloc+0xa8>
 a99:	8b 3d 00 10 00 00    	mov    0x1000,%edi
 a9f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa1:	39 c7                	cmp    %eax,%edi
 aa3:	75 eb                	jne    a90 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 aa5:	83 ec 0c             	sub    $0xc,%esp
 aa8:	ff 75 e4             	pushl  -0x1c(%ebp)
 aab:	e8 50 fc ff ff       	call   700 <sbrk>
  if(p == (char*)-1)
 ab0:	83 c4 10             	add    $0x10,%esp
 ab3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ab6:	74 1b                	je     ad3 <malloc+0x93>
  hp->s.size = nu;
 ab8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 abb:	83 ec 0c             	sub    $0xc,%esp
 abe:	83 c0 08             	add    $0x8,%eax
 ac1:	50                   	push   %eax
 ac2:	e8 e9 fe ff ff       	call   9b0 <free>
  return freep;
 ac7:	a1 00 10 00 00       	mov    0x1000,%eax
      if((p = morecore(nunits)) == 0)
 acc:	83 c4 10             	add    $0x10,%esp
 acf:	85 c0                	test   %eax,%eax
 ad1:	75 bd                	jne    a90 <malloc+0x50>
        return 0;
  }
}
 ad3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 ad6:	31 c0                	xor    %eax,%eax
}
 ad8:	5b                   	pop    %ebx
 ad9:	5e                   	pop    %esi
 ada:	5f                   	pop    %edi
 adb:	5d                   	pop    %ebp
 adc:	c3                   	ret    
    if(p->s.size >= nunits){
 add:	89 c2                	mov    %eax,%edx
 adf:	89 f8                	mov    %edi,%eax
 ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ae8:	39 ce                	cmp    %ecx,%esi
 aea:	74 54                	je     b40 <malloc+0x100>
        p->s.size -= nunits;
 aec:	29 f1                	sub    %esi,%ecx
 aee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 af1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 af4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 af7:	a3 00 10 00 00       	mov    %eax,0x1000
}
 afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 aff:	8d 42 08             	lea    0x8(%edx),%eax
}
 b02:	5b                   	pop    %ebx
 b03:	5e                   	pop    %esi
 b04:	5f                   	pop    %edi
 b05:	5d                   	pop    %ebp
 b06:	c3                   	ret    
 b07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b0e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b10:	c7 05 00 10 00 00 04 	movl   $0x1004,0x1000
 b17:	10 00 00 
    base.s.size = 0;
 b1a:	bf 04 10 00 00       	mov    $0x1004,%edi
    base.s.ptr = freep = prevp = &base;
 b1f:	c7 05 04 10 00 00 04 	movl   $0x1004,0x1004
 b26:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b29:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b2b:	c7 05 08 10 00 00 00 	movl   $0x0,0x1008
 b32:	00 00 00 
    if(p->s.size >= nunits){
 b35:	e9 36 ff ff ff       	jmp    a70 <malloc+0x30>
 b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b40:	8b 0a                	mov    (%edx),%ecx
 b42:	89 08                	mov    %ecx,(%eax)
 b44:	eb b1                	jmp    af7 <malloc+0xb7>
