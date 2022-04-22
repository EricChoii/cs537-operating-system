
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       8:	83 e4 f0             	and    $0xfffffff0,%esp
       b:	ff 71 fc             	pushl  -0x4(%ecx)
       e:	55                   	push   %ebp
       f:	89 e5                	mov    %esp,%ebp
      11:	51                   	push   %ecx
      12:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      15:	eb 12                	jmp    29 <main+0x29>
      17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      1e:	66 90                	xchg   %ax,%ax
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f b7 00 00 00    	jg     e0 <main+0xe0>
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 99 14 00 00       	push   $0x1499
      33:	e8 30 0f 00 00       	call   f68 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
      3f:	eb 32                	jmp    73 <main+0x73>
      41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      48:	80 3d 82 1b 00 00 20 	cmpb   $0x20,0x1b82
      4f:	74 51                	je     a2 <main+0xa2>
      51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      58:	e8 c3 0e 00 00       	call   f20 <fork>
  if(pid == -1)
      5d:	83 f8 ff             	cmp    $0xffffffff,%eax
      60:	0f 84 9d 00 00 00    	je     103 <main+0x103>
    if(fork1() == 0)
      66:	85 c0                	test   %eax,%eax
      68:	0f 84 80 00 00 00    	je     ee <main+0xee>
    wait();
      6e:	e8 bd 0e 00 00       	call   f30 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      73:	83 ec 08             	sub    $0x8,%esp
      76:	6a 64                	push   $0x64
      78:	68 80 1b 00 00       	push   $0x1b80
      7d:	e8 8e 00 00 00       	call   110 <getcmd>
      82:	83 c4 10             	add    $0x10,%esp
      85:	85 c0                	test   %eax,%eax
      87:	78 14                	js     9d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      89:	80 3d 80 1b 00 00 63 	cmpb   $0x63,0x1b80
      90:	75 c6                	jne    58 <main+0x58>
      92:	80 3d 81 1b 00 00 64 	cmpb   $0x64,0x1b81
      99:	75 bd                	jne    58 <main+0x58>
      9b:	eb ab                	jmp    48 <main+0x48>
  exit();
      9d:	e8 86 0e 00 00       	call   f28 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
      a2:	83 ec 0c             	sub    $0xc,%esp
      a5:	68 80 1b 00 00       	push   $0x1b80
      aa:	e8 01 0b 00 00       	call   bb0 <strlen>
      if(chdir(buf+3) < 0)
      af:	c7 04 24 83 1b 00 00 	movl   $0x1b83,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      b6:	c6 80 7f 1b 00 00 00 	movb   $0x0,0x1b7f(%eax)
      if(chdir(buf+3) < 0)
      bd:	e8 d6 0e 00 00       	call   f98 <chdir>
      c2:	83 c4 10             	add    $0x10,%esp
      c5:	85 c0                	test   %eax,%eax
      c7:	79 aa                	jns    73 <main+0x73>
        printf(2, "cannot cd %s\n", buf+3);
      c9:	50                   	push   %eax
      ca:	68 83 1b 00 00       	push   $0x1b83
      cf:	68 a1 14 00 00       	push   $0x14a1
      d4:	6a 02                	push   $0x2
      d6:	e8 b5 0f 00 00       	call   1090 <printf>
      db:	83 c4 10             	add    $0x10,%esp
      de:	eb 93                	jmp    73 <main+0x73>
      close(fd);
      e0:	83 ec 0c             	sub    $0xc,%esp
      e3:	50                   	push   %eax
      e4:	e8 67 0e 00 00       	call   f50 <close>
      break;
      e9:	83 c4 10             	add    $0x10,%esp
      ec:	eb 85                	jmp    73 <main+0x73>
      runcmd(parsecmd(buf));
      ee:	83 ec 0c             	sub    $0xc,%esp
      f1:	68 80 1b 00 00       	push   $0x1b80
      f6:	e8 c5 09 00 00       	call   ac0 <parsecmd>
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 7d 00 00 00       	call   180 <runcmd>
    panic("fork");
     103:	83 ec 0c             	sub    $0xc,%esp
     106:	68 22 14 00 00       	push   $0x1422
     10b:	e8 50 00 00 00       	call   160 <panic>

00000110 <getcmd>:
{
     110:	f3 0f 1e fb          	endbr32 
     114:	55                   	push   %ebp
     115:	89 e5                	mov    %esp,%ebp
     117:	56                   	push   %esi
     118:	53                   	push   %ebx
     119:	8b 75 0c             	mov    0xc(%ebp),%esi
     11c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     11f:	83 ec 08             	sub    $0x8,%esp
     122:	68 f8 13 00 00       	push   $0x13f8
     127:	6a 02                	push   $0x2
     129:	e8 62 0f 00 00       	call   1090 <printf>
  memset(buf, 0, nbuf);
     12e:	83 c4 0c             	add    $0xc,%esp
     131:	56                   	push   %esi
     132:	6a 00                	push   $0x0
     134:	53                   	push   %ebx
     135:	e8 b6 0a 00 00       	call   bf0 <memset>
  gets(buf, nbuf);
     13a:	58                   	pop    %eax
     13b:	5a                   	pop    %edx
     13c:	56                   	push   %esi
     13d:	53                   	push   %ebx
     13e:	e8 0d 0b 00 00       	call   c50 <gets>
  if(buf[0] == 0) // EOF
     143:	83 c4 10             	add    $0x10,%esp
     146:	31 c0                	xor    %eax,%eax
     148:	80 3b 00             	cmpb   $0x0,(%ebx)
     14b:	0f 94 c0             	sete   %al
}
     14e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     151:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
     152:	f7 d8                	neg    %eax
}
     154:	5e                   	pop    %esi
     155:	5d                   	pop    %ebp
     156:	c3                   	ret    
     157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     15e:	66 90                	xchg   %ax,%ax

00000160 <panic>:
{
     160:	f3 0f 1e fb          	endbr32 
     164:	55                   	push   %ebp
     165:	89 e5                	mov    %esp,%ebp
     167:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     16a:	ff 75 08             	pushl  0x8(%ebp)
     16d:	68 95 14 00 00       	push   $0x1495
     172:	6a 02                	push   $0x2
     174:	e8 17 0f 00 00       	call   1090 <printf>
  exit();
     179:	e8 aa 0d 00 00       	call   f28 <exit>
     17e:	66 90                	xchg   %ax,%ax

00000180 <runcmd>:
{
     180:	f3 0f 1e fb          	endbr32 
     184:	55                   	push   %ebp
     185:	89 e5                	mov    %esp,%ebp
     187:	53                   	push   %ebx
     188:	83 ec 14             	sub    $0x14,%esp
     18b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     18e:	85 db                	test   %ebx,%ebx
     190:	74 7e                	je     210 <runcmd+0x90>
  switch(cmd->type){
     192:	83 3b 05             	cmpl   $0x5,(%ebx)
     195:	0f 87 04 01 00 00    	ja     29f <runcmd+0x11f>
     19b:	8b 03                	mov    (%ebx),%eax
     19d:	3e ff 24 85 b0 14 00 	notrack jmp *0x14b0(,%eax,4)
     1a4:	00 
    if(pipe(p) < 0)
     1a5:	83 ec 0c             	sub    $0xc,%esp
     1a8:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1ab:	50                   	push   %eax
     1ac:	e8 87 0d 00 00       	call   f38 <pipe>
     1b1:	83 c4 10             	add    $0x10,%esp
     1b4:	85 c0                	test   %eax,%eax
     1b6:	0f 88 05 01 00 00    	js     2c1 <runcmd+0x141>
  pid = fork();
     1bc:	e8 5f 0d 00 00       	call   f20 <fork>
  if(pid == -1)
     1c1:	83 f8 ff             	cmp    $0xffffffff,%eax
     1c4:	0f 84 60 01 00 00    	je     32a <runcmd+0x1aa>
    if(fork1() == 0){
     1ca:	85 c0                	test   %eax,%eax
     1cc:	0f 84 fc 00 00 00    	je     2ce <runcmd+0x14e>
  pid = fork();
     1d2:	e8 49 0d 00 00       	call   f20 <fork>
  if(pid == -1)
     1d7:	83 f8 ff             	cmp    $0xffffffff,%eax
     1da:	0f 84 4a 01 00 00    	je     32a <runcmd+0x1aa>
    if(fork1() == 0){
     1e0:	85 c0                	test   %eax,%eax
     1e2:	0f 84 14 01 00 00    	je     2fc <runcmd+0x17c>
    close(p[0]);
     1e8:	83 ec 0c             	sub    $0xc,%esp
     1eb:	ff 75 f0             	pushl  -0x10(%ebp)
     1ee:	e8 5d 0d 00 00       	call   f50 <close>
    close(p[1]);
     1f3:	58                   	pop    %eax
     1f4:	ff 75 f4             	pushl  -0xc(%ebp)
     1f7:	e8 54 0d 00 00       	call   f50 <close>
    wait();
     1fc:	e8 2f 0d 00 00       	call   f30 <wait>
    wait();
     201:	e8 2a 0d 00 00       	call   f30 <wait>
    break;
     206:	83 c4 10             	add    $0x10,%esp
     209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
     210:	e8 13 0d 00 00       	call   f28 <exit>
  pid = fork();
     215:	e8 06 0d 00 00       	call   f20 <fork>
  if(pid == -1)
     21a:	83 f8 ff             	cmp    $0xffffffff,%eax
     21d:	0f 84 07 01 00 00    	je     32a <runcmd+0x1aa>
    if(fork1() == 0)
     223:	85 c0                	test   %eax,%eax
     225:	75 e9                	jne    210 <runcmd+0x90>
     227:	eb 6b                	jmp    294 <runcmd+0x114>
    if(ecmd->argv[0] == 0)
     229:	8b 43 04             	mov    0x4(%ebx),%eax
     22c:	85 c0                	test   %eax,%eax
     22e:	74 e0                	je     210 <runcmd+0x90>
    exec(ecmd->argv[0], ecmd->argv);
     230:	8d 53 04             	lea    0x4(%ebx),%edx
     233:	51                   	push   %ecx
     234:	51                   	push   %ecx
     235:	52                   	push   %edx
     236:	50                   	push   %eax
     237:	e8 24 0d 00 00       	call   f60 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     23c:	83 c4 0c             	add    $0xc,%esp
     23f:	ff 73 04             	pushl  0x4(%ebx)
     242:	68 02 14 00 00       	push   $0x1402
     247:	6a 02                	push   $0x2
     249:	e8 42 0e 00 00       	call   1090 <printf>
    break;
     24e:	83 c4 10             	add    $0x10,%esp
     251:	eb bd                	jmp    210 <runcmd+0x90>
  pid = fork();
     253:	e8 c8 0c 00 00       	call   f20 <fork>
  if(pid == -1)
     258:	83 f8 ff             	cmp    $0xffffffff,%eax
     25b:	0f 84 c9 00 00 00    	je     32a <runcmd+0x1aa>
    if(fork1() == 0)
     261:	85 c0                	test   %eax,%eax
     263:	74 2f                	je     294 <runcmd+0x114>
    wait();
     265:	e8 c6 0c 00 00       	call   f30 <wait>
    runcmd(lcmd->right);
     26a:	83 ec 0c             	sub    $0xc,%esp
     26d:	ff 73 08             	pushl  0x8(%ebx)
     270:	e8 0b ff ff ff       	call   180 <runcmd>
    close(rcmd->fd);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 14             	pushl  0x14(%ebx)
     27b:	e8 d0 0c 00 00       	call   f50 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     280:	58                   	pop    %eax
     281:	5a                   	pop    %edx
     282:	ff 73 10             	pushl  0x10(%ebx)
     285:	ff 73 08             	pushl  0x8(%ebx)
     288:	e8 db 0c 00 00       	call   f68 <open>
     28d:	83 c4 10             	add    $0x10,%esp
     290:	85 c0                	test   %eax,%eax
     292:	78 18                	js     2ac <runcmd+0x12c>
      runcmd(bcmd->cmd);
     294:	83 ec 0c             	sub    $0xc,%esp
     297:	ff 73 04             	pushl  0x4(%ebx)
     29a:	e8 e1 fe ff ff       	call   180 <runcmd>
    panic("runcmd");
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	68 fb 13 00 00       	push   $0x13fb
     2a7:	e8 b4 fe ff ff       	call   160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2ac:	51                   	push   %ecx
     2ad:	ff 73 08             	pushl  0x8(%ebx)
     2b0:	68 12 14 00 00       	push   $0x1412
     2b5:	6a 02                	push   $0x2
     2b7:	e8 d4 0d 00 00       	call   1090 <printf>
      exit();
     2bc:	e8 67 0c 00 00       	call   f28 <exit>
      panic("pipe");
     2c1:	83 ec 0c             	sub    $0xc,%esp
     2c4:	68 27 14 00 00       	push   $0x1427
     2c9:	e8 92 fe ff ff       	call   160 <panic>
      close(1);
     2ce:	83 ec 0c             	sub    $0xc,%esp
     2d1:	6a 01                	push   $0x1
     2d3:	e8 78 0c 00 00       	call   f50 <close>
      dup(p[1]);
     2d8:	58                   	pop    %eax
     2d9:	ff 75 f4             	pushl  -0xc(%ebp)
     2dc:	e8 bf 0c 00 00       	call   fa0 <dup>
      close(p[0]);
     2e1:	58                   	pop    %eax
     2e2:	ff 75 f0             	pushl  -0x10(%ebp)
     2e5:	e8 66 0c 00 00       	call   f50 <close>
      close(p[1]);
     2ea:	58                   	pop    %eax
     2eb:	ff 75 f4             	pushl  -0xc(%ebp)
     2ee:	e8 5d 0c 00 00       	call   f50 <close>
      runcmd(pcmd->left);
     2f3:	5a                   	pop    %edx
     2f4:	ff 73 04             	pushl  0x4(%ebx)
     2f7:	e8 84 fe ff ff       	call   180 <runcmd>
      close(0);
     2fc:	83 ec 0c             	sub    $0xc,%esp
     2ff:	6a 00                	push   $0x0
     301:	e8 4a 0c 00 00       	call   f50 <close>
      dup(p[0]);
     306:	5a                   	pop    %edx
     307:	ff 75 f0             	pushl  -0x10(%ebp)
     30a:	e8 91 0c 00 00       	call   fa0 <dup>
      close(p[0]);
     30f:	59                   	pop    %ecx
     310:	ff 75 f0             	pushl  -0x10(%ebp)
     313:	e8 38 0c 00 00       	call   f50 <close>
      close(p[1]);
     318:	58                   	pop    %eax
     319:	ff 75 f4             	pushl  -0xc(%ebp)
     31c:	e8 2f 0c 00 00       	call   f50 <close>
      runcmd(pcmd->right);
     321:	58                   	pop    %eax
     322:	ff 73 08             	pushl  0x8(%ebx)
     325:	e8 56 fe ff ff       	call   180 <runcmd>
    panic("fork");
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	68 22 14 00 00       	push   $0x1422
     332:	e8 29 fe ff ff       	call   160 <panic>
     337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33e:	66 90                	xchg   %ax,%ax

00000340 <fork1>:
{
     340:	f3 0f 1e fb          	endbr32 
     344:	55                   	push   %ebp
     345:	89 e5                	mov    %esp,%ebp
     347:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     34a:	e8 d1 0b 00 00       	call   f20 <fork>
  if(pid == -1)
     34f:	83 f8 ff             	cmp    $0xffffffff,%eax
     352:	74 02                	je     356 <fork1+0x16>
  return pid;
}
     354:	c9                   	leave  
     355:	c3                   	ret    
    panic("fork");
     356:	83 ec 0c             	sub    $0xc,%esp
     359:	68 22 14 00 00       	push   $0x1422
     35e:	e8 fd fd ff ff       	call   160 <panic>
     363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     370:	f3 0f 1e fb          	endbr32 
     374:	55                   	push   %ebp
     375:	89 e5                	mov    %esp,%ebp
     377:	53                   	push   %ebx
     378:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     37b:	6a 54                	push   $0x54
     37d:	e8 6e 0f 00 00       	call   12f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     382:	83 c4 0c             	add    $0xc,%esp
     385:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     387:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     389:	6a 00                	push   $0x0
     38b:	50                   	push   %eax
     38c:	e8 5f 08 00 00       	call   bf0 <memset>
  cmd->type = EXEC;
     391:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     397:	89 d8                	mov    %ebx,%eax
     399:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     39c:	c9                   	leave  
     39d:	c3                   	ret    
     39e:	66 90                	xchg   %ax,%ax

000003a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3a0:	f3 0f 1e fb          	endbr32 
     3a4:	55                   	push   %ebp
     3a5:	89 e5                	mov    %esp,%ebp
     3a7:	53                   	push   %ebx
     3a8:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3ab:	6a 18                	push   $0x18
     3ad:	e8 3e 0f 00 00       	call   12f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3b2:	83 c4 0c             	add    $0xc,%esp
     3b5:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     3b7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b9:	6a 00                	push   $0x0
     3bb:	50                   	push   %eax
     3bc:	e8 2f 08 00 00       	call   bf0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3c1:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     3c4:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3ca:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
     3d0:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3d3:	8b 45 10             	mov    0x10(%ebp),%eax
     3d6:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3d9:	8b 45 14             	mov    0x14(%ebp),%eax
     3dc:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3df:	8b 45 18             	mov    0x18(%ebp),%eax
     3e2:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3e5:	89 d8                	mov    %ebx,%eax
     3e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3ea:	c9                   	leave  
     3eb:	c3                   	ret    
     3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3f0:	f3 0f 1e fb          	endbr32 
     3f4:	55                   	push   %ebp
     3f5:	89 e5                	mov    %esp,%ebp
     3f7:	53                   	push   %ebx
     3f8:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3fb:	6a 0c                	push   $0xc
     3fd:	e8 ee 0e 00 00       	call   12f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     402:	83 c4 0c             	add    $0xc,%esp
     405:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     407:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     409:	6a 00                	push   $0x0
     40b:	50                   	push   %eax
     40c:	e8 df 07 00 00       	call   bf0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     411:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     414:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     41a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     41d:	8b 45 0c             	mov    0xc(%ebp),%eax
     420:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     423:	89 d8                	mov    %ebx,%eax
     425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     428:	c9                   	leave  
     429:	c3                   	ret    
     42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000430 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     430:	f3 0f 1e fb          	endbr32 
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	53                   	push   %ebx
     438:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     43b:	6a 0c                	push   $0xc
     43d:	e8 ae 0e 00 00       	call   12f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     442:	83 c4 0c             	add    $0xc,%esp
     445:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     447:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     449:	6a 00                	push   $0x0
     44b:	50                   	push   %eax
     44c:	e8 9f 07 00 00       	call   bf0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     451:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     454:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     45a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     45d:	8b 45 0c             	mov    0xc(%ebp),%eax
     460:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     463:	89 d8                	mov    %ebx,%eax
     465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     468:	c9                   	leave  
     469:	c3                   	ret    
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000470 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     470:	f3 0f 1e fb          	endbr32 
     474:	55                   	push   %ebp
     475:	89 e5                	mov    %esp,%ebp
     477:	53                   	push   %ebx
     478:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     47b:	6a 08                	push   $0x8
     47d:	e8 6e 0e 00 00       	call   12f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     482:	83 c4 0c             	add    $0xc,%esp
     485:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     487:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     489:	6a 00                	push   $0x0
     48b:	50                   	push   %eax
     48c:	e8 5f 07 00 00       	call   bf0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     491:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     494:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     49a:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     49d:	89 d8                	mov    %ebx,%eax
     49f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4a2:	c9                   	leave  
     4a3:	c3                   	ret    
     4a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4af:	90                   	nop

000004b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4b0:	f3 0f 1e fb          	endbr32 
     4b4:	55                   	push   %ebp
     4b5:	89 e5                	mov    %esp,%ebp
     4b7:	57                   	push   %edi
     4b8:	56                   	push   %esi
     4b9:	53                   	push   %ebx
     4ba:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     4bd:	8b 45 08             	mov    0x8(%ebp),%eax
{
     4c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4c3:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     4c6:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     4c8:	39 df                	cmp    %ebx,%edi
     4ca:	72 0b                	jb     4d7 <gettoken+0x27>
     4cc:	eb 21                	jmp    4ef <gettoken+0x3f>
     4ce:	66 90                	xchg   %ax,%ax
    s++;
     4d0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4d3:	39 fb                	cmp    %edi,%ebx
     4d5:	74 18                	je     4ef <gettoken+0x3f>
     4d7:	0f be 07             	movsbl (%edi),%eax
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	50                   	push   %eax
     4de:	68 78 1b 00 00       	push   $0x1b78
     4e3:	e8 28 07 00 00       	call   c10 <strchr>
     4e8:	83 c4 10             	add    $0x10,%esp
     4eb:	85 c0                	test   %eax,%eax
     4ed:	75 e1                	jne    4d0 <gettoken+0x20>
  if(q)
     4ef:	85 f6                	test   %esi,%esi
     4f1:	74 02                	je     4f5 <gettoken+0x45>
    *q = s;
     4f3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4f5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4f8:	3c 3c                	cmp    $0x3c,%al
     4fa:	0f 8f d0 00 00 00    	jg     5d0 <gettoken+0x120>
     500:	3c 3a                	cmp    $0x3a,%al
     502:	0f 8f b4 00 00 00    	jg     5bc <gettoken+0x10c>
     508:	84 c0                	test   %al,%al
     50a:	75 44                	jne    550 <gettoken+0xa0>
     50c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     50e:	8b 55 14             	mov    0x14(%ebp),%edx
     511:	85 d2                	test   %edx,%edx
     513:	74 05                	je     51a <gettoken+0x6a>
    *eq = s;
     515:	8b 45 14             	mov    0x14(%ebp),%eax
     518:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     51a:	39 df                	cmp    %ebx,%edi
     51c:	72 09                	jb     527 <gettoken+0x77>
     51e:	eb 1f                	jmp    53f <gettoken+0x8f>
    s++;
     520:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     523:	39 fb                	cmp    %edi,%ebx
     525:	74 18                	je     53f <gettoken+0x8f>
     527:	0f be 07             	movsbl (%edi),%eax
     52a:	83 ec 08             	sub    $0x8,%esp
     52d:	50                   	push   %eax
     52e:	68 78 1b 00 00       	push   $0x1b78
     533:	e8 d8 06 00 00       	call   c10 <strchr>
     538:	83 c4 10             	add    $0x10,%esp
     53b:	85 c0                	test   %eax,%eax
     53d:	75 e1                	jne    520 <gettoken+0x70>
  *ps = s;
     53f:	8b 45 08             	mov    0x8(%ebp),%eax
     542:	89 38                	mov    %edi,(%eax)
  return ret;
}
     544:	8d 65 f4             	lea    -0xc(%ebp),%esp
     547:	89 f0                	mov    %esi,%eax
     549:	5b                   	pop    %ebx
     54a:	5e                   	pop    %esi
     54b:	5f                   	pop    %edi
     54c:	5d                   	pop    %ebp
     54d:	c3                   	ret    
     54e:	66 90                	xchg   %ax,%ax
  switch(*s){
     550:	79 5e                	jns    5b0 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     552:	39 fb                	cmp    %edi,%ebx
     554:	77 34                	ja     58a <gettoken+0xda>
  if(eq)
     556:	8b 45 14             	mov    0x14(%ebp),%eax
     559:	be 61 00 00 00       	mov    $0x61,%esi
     55e:	85 c0                	test   %eax,%eax
     560:	75 b3                	jne    515 <gettoken+0x65>
     562:	eb db                	jmp    53f <gettoken+0x8f>
     564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     568:	0f be 07             	movsbl (%edi),%eax
     56b:	83 ec 08             	sub    $0x8,%esp
     56e:	50                   	push   %eax
     56f:	68 70 1b 00 00       	push   $0x1b70
     574:	e8 97 06 00 00       	call   c10 <strchr>
     579:	83 c4 10             	add    $0x10,%esp
     57c:	85 c0                	test   %eax,%eax
     57e:	75 22                	jne    5a2 <gettoken+0xf2>
      s++;
     580:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     583:	39 fb                	cmp    %edi,%ebx
     585:	74 cf                	je     556 <gettoken+0xa6>
     587:	0f b6 07             	movzbl (%edi),%eax
     58a:	83 ec 08             	sub    $0x8,%esp
     58d:	0f be f0             	movsbl %al,%esi
     590:	56                   	push   %esi
     591:	68 78 1b 00 00       	push   $0x1b78
     596:	e8 75 06 00 00       	call   c10 <strchr>
     59b:	83 c4 10             	add    $0x10,%esp
     59e:	85 c0                	test   %eax,%eax
     5a0:	74 c6                	je     568 <gettoken+0xb8>
    ret = 'a';
     5a2:	be 61 00 00 00       	mov    $0x61,%esi
     5a7:	e9 62 ff ff ff       	jmp    50e <gettoken+0x5e>
     5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5b0:	3c 26                	cmp    $0x26,%al
     5b2:	74 08                	je     5bc <gettoken+0x10c>
     5b4:	8d 48 d8             	lea    -0x28(%eax),%ecx
     5b7:	80 f9 01             	cmp    $0x1,%cl
     5ba:	77 96                	ja     552 <gettoken+0xa2>
  ret = *s;
     5bc:	0f be f0             	movsbl %al,%esi
    s++;
     5bf:	83 c7 01             	add    $0x1,%edi
    break;
     5c2:	e9 47 ff ff ff       	jmp    50e <gettoken+0x5e>
     5c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ce:	66 90                	xchg   %ax,%ax
  switch(*s){
     5d0:	3c 3e                	cmp    $0x3e,%al
     5d2:	75 1c                	jne    5f0 <gettoken+0x140>
    if(*s == '>'){
     5d4:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     5d8:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     5db:	74 1c                	je     5f9 <gettoken+0x149>
    s++;
     5dd:	89 c7                	mov    %eax,%edi
     5df:	be 3e 00 00 00       	mov    $0x3e,%esi
     5e4:	e9 25 ff ff ff       	jmp    50e <gettoken+0x5e>
     5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5f0:	3c 7c                	cmp    $0x7c,%al
     5f2:	74 c8                	je     5bc <gettoken+0x10c>
     5f4:	e9 59 ff ff ff       	jmp    552 <gettoken+0xa2>
      s++;
     5f9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5fc:	be 2b 00 00 00       	mov    $0x2b,%esi
     601:	e9 08 ff ff ff       	jmp    50e <gettoken+0x5e>
     606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     60d:	8d 76 00             	lea    0x0(%esi),%esi

00000610 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     610:	f3 0f 1e fb          	endbr32 
     614:	55                   	push   %ebp
     615:	89 e5                	mov    %esp,%ebp
     617:	57                   	push   %edi
     618:	56                   	push   %esi
     619:	53                   	push   %ebx
     61a:	83 ec 0c             	sub    $0xc,%esp
     61d:	8b 7d 08             	mov    0x8(%ebp),%edi
     620:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     623:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     625:	39 f3                	cmp    %esi,%ebx
     627:	72 0e                	jb     637 <peek+0x27>
     629:	eb 24                	jmp    64f <peek+0x3f>
     62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     62f:	90                   	nop
    s++;
     630:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     633:	39 de                	cmp    %ebx,%esi
     635:	74 18                	je     64f <peek+0x3f>
     637:	0f be 03             	movsbl (%ebx),%eax
     63a:	83 ec 08             	sub    $0x8,%esp
     63d:	50                   	push   %eax
     63e:	68 78 1b 00 00       	push   $0x1b78
     643:	e8 c8 05 00 00       	call   c10 <strchr>
     648:	83 c4 10             	add    $0x10,%esp
     64b:	85 c0                	test   %eax,%eax
     64d:	75 e1                	jne    630 <peek+0x20>
  *ps = s;
     64f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     651:	0f be 03             	movsbl (%ebx),%eax
     654:	31 d2                	xor    %edx,%edx
     656:	84 c0                	test   %al,%al
     658:	75 0e                	jne    668 <peek+0x58>
}
     65a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     65d:	89 d0                	mov    %edx,%eax
     65f:	5b                   	pop    %ebx
     660:	5e                   	pop    %esi
     661:	5f                   	pop    %edi
     662:	5d                   	pop    %ebp
     663:	c3                   	ret    
     664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     668:	83 ec 08             	sub    $0x8,%esp
     66b:	50                   	push   %eax
     66c:	ff 75 10             	pushl  0x10(%ebp)
     66f:	e8 9c 05 00 00       	call   c10 <strchr>
     674:	83 c4 10             	add    $0x10,%esp
     677:	31 d2                	xor    %edx,%edx
     679:	85 c0                	test   %eax,%eax
     67b:	0f 95 c2             	setne  %dl
}
     67e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     681:	5b                   	pop    %ebx
     682:	89 d0                	mov    %edx,%eax
     684:	5e                   	pop    %esi
     685:	5f                   	pop    %edi
     686:	5d                   	pop    %ebp
     687:	c3                   	ret    
     688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     68f:	90                   	nop

00000690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     690:	f3 0f 1e fb          	endbr32 
     694:	55                   	push   %ebp
     695:	89 e5                	mov    %esp,%ebp
     697:	57                   	push   %edi
     698:	56                   	push   %esi
     699:	53                   	push   %ebx
     69a:	83 ec 1c             	sub    $0x1c,%esp
     69d:	8b 75 0c             	mov    0xc(%ebp),%esi
     6a0:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     6a7:	90                   	nop
     6a8:	83 ec 04             	sub    $0x4,%esp
     6ab:	68 49 14 00 00       	push   $0x1449
     6b0:	53                   	push   %ebx
     6b1:	56                   	push   %esi
     6b2:	e8 59 ff ff ff       	call   610 <peek>
     6b7:	83 c4 10             	add    $0x10,%esp
     6ba:	85 c0                	test   %eax,%eax
     6bc:	74 6a                	je     728 <parseredirs+0x98>
    tok = gettoken(ps, es, 0, 0);
     6be:	6a 00                	push   $0x0
     6c0:	6a 00                	push   $0x0
     6c2:	53                   	push   %ebx
     6c3:	56                   	push   %esi
     6c4:	e8 e7 fd ff ff       	call   4b0 <gettoken>
     6c9:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6cb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6ce:	50                   	push   %eax
     6cf:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6d2:	50                   	push   %eax
     6d3:	53                   	push   %ebx
     6d4:	56                   	push   %esi
     6d5:	e8 d6 fd ff ff       	call   4b0 <gettoken>
     6da:	83 c4 20             	add    $0x20,%esp
     6dd:	83 f8 61             	cmp    $0x61,%eax
     6e0:	75 51                	jne    733 <parseredirs+0xa3>
      panic("missing file for redirection");
    switch(tok){
     6e2:	83 ff 3c             	cmp    $0x3c,%edi
     6e5:	74 31                	je     718 <parseredirs+0x88>
     6e7:	83 ff 3e             	cmp    $0x3e,%edi
     6ea:	74 05                	je     6f1 <parseredirs+0x61>
     6ec:	83 ff 2b             	cmp    $0x2b,%edi
     6ef:	75 b7                	jne    6a8 <parseredirs+0x18>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6f1:	83 ec 0c             	sub    $0xc,%esp
     6f4:	6a 01                	push   $0x1
     6f6:	68 01 02 00 00       	push   $0x201
     6fb:	ff 75 e4             	pushl  -0x1c(%ebp)
     6fe:	ff 75 e0             	pushl  -0x20(%ebp)
     701:	ff 75 08             	pushl  0x8(%ebp)
     704:	e8 97 fc ff ff       	call   3a0 <redircmd>
      break;
     709:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     70c:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     70f:	eb 97                	jmp    6a8 <parseredirs+0x18>
     711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     718:	83 ec 0c             	sub    $0xc,%esp
     71b:	6a 00                	push   $0x0
     71d:	6a 00                	push   $0x0
     71f:	eb da                	jmp    6fb <parseredirs+0x6b>
     721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     728:	8b 45 08             	mov    0x8(%ebp),%eax
     72b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     72e:	5b                   	pop    %ebx
     72f:	5e                   	pop    %esi
     730:	5f                   	pop    %edi
     731:	5d                   	pop    %ebp
     732:	c3                   	ret    
      panic("missing file for redirection");
     733:	83 ec 0c             	sub    $0xc,%esp
     736:	68 2c 14 00 00       	push   $0x142c
     73b:	e8 20 fa ff ff       	call   160 <panic>

00000740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     740:	f3 0f 1e fb          	endbr32 
     744:	55                   	push   %ebp
     745:	89 e5                	mov    %esp,%ebp
     747:	57                   	push   %edi
     748:	56                   	push   %esi
     749:	53                   	push   %ebx
     74a:	83 ec 30             	sub    $0x30,%esp
     74d:	8b 75 08             	mov    0x8(%ebp),%esi
     750:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     753:	68 4c 14 00 00       	push   $0x144c
     758:	57                   	push   %edi
     759:	56                   	push   %esi
     75a:	e8 b1 fe ff ff       	call   610 <peek>
     75f:	83 c4 10             	add    $0x10,%esp
     762:	85 c0                	test   %eax,%eax
     764:	0f 85 96 00 00 00    	jne    800 <parseexec+0xc0>
     76a:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     76c:	e8 ff fb ff ff       	call   370 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     771:	83 ec 04             	sub    $0x4,%esp
     774:	57                   	push   %edi
     775:	56                   	push   %esi
     776:	50                   	push   %eax
  ret = execcmd();
     777:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     77a:	e8 11 ff ff ff       	call   690 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     77f:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     782:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     785:	eb 1c                	jmp    7a3 <parseexec+0x63>
     787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     790:	83 ec 04             	sub    $0x4,%esp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	ff 75 d4             	pushl  -0x2c(%ebp)
     798:	e8 f3 fe ff ff       	call   690 <parseredirs>
     79d:	83 c4 10             	add    $0x10,%esp
     7a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7a3:	83 ec 04             	sub    $0x4,%esp
     7a6:	68 63 14 00 00       	push   $0x1463
     7ab:	57                   	push   %edi
     7ac:	56                   	push   %esi
     7ad:	e8 5e fe ff ff       	call   610 <peek>
     7b2:	83 c4 10             	add    $0x10,%esp
     7b5:	85 c0                	test   %eax,%eax
     7b7:	75 67                	jne    820 <parseexec+0xe0>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7bc:	50                   	push   %eax
     7bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7c0:	50                   	push   %eax
     7c1:	57                   	push   %edi
     7c2:	56                   	push   %esi
     7c3:	e8 e8 fc ff ff       	call   4b0 <gettoken>
     7c8:	83 c4 10             	add    $0x10,%esp
     7cb:	85 c0                	test   %eax,%eax
     7cd:	74 51                	je     820 <parseexec+0xe0>
    if(tok != 'a')
     7cf:	83 f8 61             	cmp    $0x61,%eax
     7d2:	75 6b                	jne    83f <parseexec+0xff>
    cmd->argv[argc] = q;
     7d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7d7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7da:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     7de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7e1:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     7e5:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     7e8:	83 fb 0a             	cmp    $0xa,%ebx
     7eb:	75 a3                	jne    790 <parseexec+0x50>
      panic("too many args");
     7ed:	83 ec 0c             	sub    $0xc,%esp
     7f0:	68 55 14 00 00       	push   $0x1455
     7f5:	e8 66 f9 ff ff       	call   160 <panic>
     7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     800:	83 ec 08             	sub    $0x8,%esp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	e8 66 01 00 00       	call   970 <parseblock>
     80a:	83 c4 10             	add    $0x10,%esp
     80d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     810:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     813:	8d 65 f4             	lea    -0xc(%ebp),%esp
     816:	5b                   	pop    %ebx
     817:	5e                   	pop    %esi
     818:	5f                   	pop    %edi
     819:	5d                   	pop    %ebp
     81a:	c3                   	ret    
     81b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     81f:	90                   	nop
  cmd->argv[argc] = 0;
     820:	8b 45 d0             	mov    -0x30(%ebp),%eax
     823:	8d 04 98             	lea    (%eax,%ebx,4),%eax
     826:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     82d:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     837:	8d 65 f4             	lea    -0xc(%ebp),%esp
     83a:	5b                   	pop    %ebx
     83b:	5e                   	pop    %esi
     83c:	5f                   	pop    %edi
     83d:	5d                   	pop    %ebp
     83e:	c3                   	ret    
      panic("syntax");
     83f:	83 ec 0c             	sub    $0xc,%esp
     842:	68 4e 14 00 00       	push   $0x144e
     847:	e8 14 f9 ff ff       	call   160 <panic>
     84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <parsepipe>:
{
     850:	f3 0f 1e fb          	endbr32 
     854:	55                   	push   %ebp
     855:	89 e5                	mov    %esp,%ebp
     857:	57                   	push   %edi
     858:	56                   	push   %esi
     859:	53                   	push   %ebx
     85a:	83 ec 14             	sub    $0x14,%esp
     85d:	8b 75 08             	mov    0x8(%ebp),%esi
     860:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	e8 d6 fe ff ff       	call   740 <parseexec>
  if(peek(ps, es, "|")){
     86a:	83 c4 0c             	add    $0xc,%esp
     86d:	68 68 14 00 00       	push   $0x1468
  cmd = parseexec(ps, es);
     872:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     874:	57                   	push   %edi
     875:	56                   	push   %esi
     876:	e8 95 fd ff ff       	call   610 <peek>
     87b:	83 c4 10             	add    $0x10,%esp
     87e:	85 c0                	test   %eax,%eax
     880:	75 0e                	jne    890 <parsepipe+0x40>
}
     882:	8d 65 f4             	lea    -0xc(%ebp),%esp
     885:	89 d8                	mov    %ebx,%eax
     887:	5b                   	pop    %ebx
     888:	5e                   	pop    %esi
     889:	5f                   	pop    %edi
     88a:	5d                   	pop    %ebp
     88b:	c3                   	ret    
     88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	57                   	push   %edi
     895:	56                   	push   %esi
     896:	e8 15 fc ff ff       	call   4b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     89b:	58                   	pop    %eax
     89c:	5a                   	pop    %edx
     89d:	57                   	push   %edi
     89e:	56                   	push   %esi
     89f:	e8 ac ff ff ff       	call   850 <parsepipe>
     8a4:	89 5d 08             	mov    %ebx,0x8(%ebp)
     8a7:	83 c4 10             	add    $0x10,%esp
     8aa:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b0:	5b                   	pop    %ebx
     8b1:	5e                   	pop    %esi
     8b2:	5f                   	pop    %edi
     8b3:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8b4:	e9 37 fb ff ff       	jmp    3f0 <pipecmd>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008c0 <parseline>:
{
     8c0:	f3 0f 1e fb          	endbr32 
     8c4:	55                   	push   %ebp
     8c5:	89 e5                	mov    %esp,%ebp
     8c7:	57                   	push   %edi
     8c8:	56                   	push   %esi
     8c9:	53                   	push   %ebx
     8ca:	83 ec 14             	sub    $0x14,%esp
     8cd:	8b 75 08             	mov    0x8(%ebp),%esi
     8d0:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     8d3:	57                   	push   %edi
     8d4:	56                   	push   %esi
     8d5:	e8 76 ff ff ff       	call   850 <parsepipe>
  while(peek(ps, es, "&")){
     8da:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     8dd:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     8df:	eb 1f                	jmp    900 <parseline+0x40>
     8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     8e8:	6a 00                	push   $0x0
     8ea:	6a 00                	push   $0x0
     8ec:	57                   	push   %edi
     8ed:	56                   	push   %esi
     8ee:	e8 bd fb ff ff       	call   4b0 <gettoken>
    cmd = backcmd(cmd);
     8f3:	89 1c 24             	mov    %ebx,(%esp)
     8f6:	e8 75 fb ff ff       	call   470 <backcmd>
     8fb:	83 c4 10             	add    $0x10,%esp
     8fe:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     900:	83 ec 04             	sub    $0x4,%esp
     903:	68 6a 14 00 00       	push   $0x146a
     908:	57                   	push   %edi
     909:	56                   	push   %esi
     90a:	e8 01 fd ff ff       	call   610 <peek>
     90f:	83 c4 10             	add    $0x10,%esp
     912:	85 c0                	test   %eax,%eax
     914:	75 d2                	jne    8e8 <parseline+0x28>
  if(peek(ps, es, ";")){
     916:	83 ec 04             	sub    $0x4,%esp
     919:	68 66 14 00 00       	push   $0x1466
     91e:	57                   	push   %edi
     91f:	56                   	push   %esi
     920:	e8 eb fc ff ff       	call   610 <peek>
     925:	83 c4 10             	add    $0x10,%esp
     928:	85 c0                	test   %eax,%eax
     92a:	75 14                	jne    940 <parseline+0x80>
}
     92c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     92f:	89 d8                	mov    %ebx,%eax
     931:	5b                   	pop    %ebx
     932:	5e                   	pop    %esi
     933:	5f                   	pop    %edi
     934:	5d                   	pop    %ebp
     935:	c3                   	ret    
     936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     93d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     940:	6a 00                	push   $0x0
     942:	6a 00                	push   $0x0
     944:	57                   	push   %edi
     945:	56                   	push   %esi
     946:	e8 65 fb ff ff       	call   4b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     94b:	58                   	pop    %eax
     94c:	5a                   	pop    %edx
     94d:	57                   	push   %edi
     94e:	56                   	push   %esi
     94f:	e8 6c ff ff ff       	call   8c0 <parseline>
     954:	89 5d 08             	mov    %ebx,0x8(%ebp)
     957:	83 c4 10             	add    $0x10,%esp
     95a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     95d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     960:	5b                   	pop    %ebx
     961:	5e                   	pop    %esi
     962:	5f                   	pop    %edi
     963:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     964:	e9 c7 fa ff ff       	jmp    430 <listcmd>
     969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000970 <parseblock>:
{
     970:	f3 0f 1e fb          	endbr32 
     974:	55                   	push   %ebp
     975:	89 e5                	mov    %esp,%ebp
     977:	57                   	push   %edi
     978:	56                   	push   %esi
     979:	53                   	push   %ebx
     97a:	83 ec 10             	sub    $0x10,%esp
     97d:	8b 5d 08             	mov    0x8(%ebp),%ebx
     980:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     983:	68 4c 14 00 00       	push   $0x144c
     988:	56                   	push   %esi
     989:	53                   	push   %ebx
     98a:	e8 81 fc ff ff       	call   610 <peek>
     98f:	83 c4 10             	add    $0x10,%esp
     992:	85 c0                	test   %eax,%eax
     994:	74 4a                	je     9e0 <parseblock+0x70>
  gettoken(ps, es, 0, 0);
     996:	6a 00                	push   $0x0
     998:	6a 00                	push   $0x0
     99a:	56                   	push   %esi
     99b:	53                   	push   %ebx
     99c:	e8 0f fb ff ff       	call   4b0 <gettoken>
  cmd = parseline(ps, es);
     9a1:	58                   	pop    %eax
     9a2:	5a                   	pop    %edx
     9a3:	56                   	push   %esi
     9a4:	53                   	push   %ebx
     9a5:	e8 16 ff ff ff       	call   8c0 <parseline>
  if(!peek(ps, es, ")"))
     9aa:	83 c4 0c             	add    $0xc,%esp
     9ad:	68 88 14 00 00       	push   $0x1488
  cmd = parseline(ps, es);
     9b2:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     9b4:	56                   	push   %esi
     9b5:	53                   	push   %ebx
     9b6:	e8 55 fc ff ff       	call   610 <peek>
     9bb:	83 c4 10             	add    $0x10,%esp
     9be:	85 c0                	test   %eax,%eax
     9c0:	74 2b                	je     9ed <parseblock+0x7d>
  gettoken(ps, es, 0, 0);
     9c2:	6a 00                	push   $0x0
     9c4:	6a 00                	push   $0x0
     9c6:	56                   	push   %esi
     9c7:	53                   	push   %ebx
     9c8:	e8 e3 fa ff ff       	call   4b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     9cd:	83 c4 0c             	add    $0xc,%esp
     9d0:	56                   	push   %esi
     9d1:	53                   	push   %ebx
     9d2:	57                   	push   %edi
     9d3:	e8 b8 fc ff ff       	call   690 <parseredirs>
}
     9d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9db:	5b                   	pop    %ebx
     9dc:	5e                   	pop    %esi
     9dd:	5f                   	pop    %edi
     9de:	5d                   	pop    %ebp
     9df:	c3                   	ret    
    panic("parseblock");
     9e0:	83 ec 0c             	sub    $0xc,%esp
     9e3:	68 6c 14 00 00       	push   $0x146c
     9e8:	e8 73 f7 ff ff       	call   160 <panic>
    panic("syntax - missing )");
     9ed:	83 ec 0c             	sub    $0xc,%esp
     9f0:	68 77 14 00 00       	push   $0x1477
     9f5:	e8 66 f7 ff ff       	call   160 <panic>
     9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a00 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a00:	f3 0f 1e fb          	endbr32 
     a04:	55                   	push   %ebp
     a05:	89 e5                	mov    %esp,%ebp
     a07:	53                   	push   %ebx
     a08:	83 ec 04             	sub    $0x4,%esp
     a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a0e:	85 db                	test   %ebx,%ebx
     a10:	0f 84 9a 00 00 00    	je     ab0 <nulterminate+0xb0>
    return 0;

  switch(cmd->type){
     a16:	83 3b 05             	cmpl   $0x5,(%ebx)
     a19:	77 6d                	ja     a88 <nulterminate+0x88>
     a1b:	8b 03                	mov    (%ebx),%eax
     a1d:	3e ff 24 85 c8 14 00 	notrack jmp *0x14c8(,%eax,4)
     a24:	00 
     a25:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a28:	83 ec 0c             	sub    $0xc,%esp
     a2b:	ff 73 04             	pushl  0x4(%ebx)
     a2e:	e8 cd ff ff ff       	call   a00 <nulterminate>
    nulterminate(lcmd->right);
     a33:	58                   	pop    %eax
     a34:	ff 73 08             	pushl  0x8(%ebx)
     a37:	e8 c4 ff ff ff       	call   a00 <nulterminate>
    break;
     a3c:	83 c4 10             	add    $0x10,%esp
     a3f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a44:	c9                   	leave  
     a45:	c3                   	ret    
     a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a4d:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(bcmd->cmd);
     a50:	83 ec 0c             	sub    $0xc,%esp
     a53:	ff 73 04             	pushl  0x4(%ebx)
     a56:	e8 a5 ff ff ff       	call   a00 <nulterminate>
    break;
     a5b:	89 d8                	mov    %ebx,%eax
     a5d:	83 c4 10             	add    $0x10,%esp
}
     a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a63:	c9                   	leave  
     a64:	c3                   	ret    
     a65:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     a68:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a6b:	8d 43 08             	lea    0x8(%ebx),%eax
     a6e:	85 c9                	test   %ecx,%ecx
     a70:	74 16                	je     a88 <nulterminate+0x88>
     a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a78:	8b 50 24             	mov    0x24(%eax),%edx
     a7b:	83 c0 04             	add    $0x4,%eax
     a7e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     a81:	8b 50 fc             	mov    -0x4(%eax),%edx
     a84:	85 d2                	test   %edx,%edx
     a86:	75 f0                	jne    a78 <nulterminate+0x78>
  switch(cmd->type){
     a88:	89 d8                	mov    %ebx,%eax
}
     a8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a8d:	c9                   	leave  
     a8e:	c3                   	ret    
     a8f:	90                   	nop
    nulterminate(rcmd->cmd);
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	ff 73 04             	pushl  0x4(%ebx)
     a96:	e8 65 ff ff ff       	call   a00 <nulterminate>
    *rcmd->efile = 0;
     a9b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a9e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     aa1:	c6 00 00             	movb   $0x0,(%eax)
    break;
     aa4:	89 d8                	mov    %ebx,%eax
}
     aa6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aa9:	c9                   	leave  
     aaa:	c3                   	ret    
     aab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aaf:	90                   	nop
    return 0;
     ab0:	31 c0                	xor    %eax,%eax
     ab2:	eb 8d                	jmp    a41 <nulterminate+0x41>
     ab4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     abb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     abf:	90                   	nop

00000ac0 <parsecmd>:
{
     ac0:	f3 0f 1e fb          	endbr32 
     ac4:	55                   	push   %ebp
     ac5:	89 e5                	mov    %esp,%ebp
     ac7:	56                   	push   %esi
     ac8:	53                   	push   %ebx
  es = s + strlen(s);
     ac9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     acc:	83 ec 0c             	sub    $0xc,%esp
     acf:	53                   	push   %ebx
     ad0:	e8 db 00 00 00       	call   bb0 <strlen>
  cmd = parseline(&s, es);
     ad5:	59                   	pop    %ecx
     ad6:	5e                   	pop    %esi
  es = s + strlen(s);
     ad7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     ad9:	8d 45 08             	lea    0x8(%ebp),%eax
     adc:	53                   	push   %ebx
     add:	50                   	push   %eax
     ade:	e8 dd fd ff ff       	call   8c0 <parseline>
  peek(&s, es, "");
     ae3:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(&s, es);
     ae6:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     ae8:	8d 45 08             	lea    0x8(%ebp),%eax
     aeb:	68 11 14 00 00       	push   $0x1411
     af0:	53                   	push   %ebx
     af1:	50                   	push   %eax
     af2:	e8 19 fb ff ff       	call   610 <peek>
  if(s != es){
     af7:	8b 45 08             	mov    0x8(%ebp),%eax
     afa:	83 c4 10             	add    $0x10,%esp
     afd:	39 d8                	cmp    %ebx,%eax
     aff:	75 12                	jne    b13 <parsecmd+0x53>
  nulterminate(cmd);
     b01:	83 ec 0c             	sub    $0xc,%esp
     b04:	56                   	push   %esi
     b05:	e8 f6 fe ff ff       	call   a00 <nulterminate>
}
     b0a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b0d:	89 f0                	mov    %esi,%eax
     b0f:	5b                   	pop    %ebx
     b10:	5e                   	pop    %esi
     b11:	5d                   	pop    %ebp
     b12:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     b13:	52                   	push   %edx
     b14:	50                   	push   %eax
     b15:	68 8a 14 00 00       	push   $0x148a
     b1a:	6a 02                	push   $0x2
     b1c:	e8 6f 05 00 00       	call   1090 <printf>
    panic("syntax");
     b21:	c7 04 24 4e 14 00 00 	movl   $0x144e,(%esp)
     b28:	e8 33 f6 ff ff       	call   160 <panic>
     b2d:	66 90                	xchg   %ax,%ax
     b2f:	90                   	nop

00000b30 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
     b30:	f3 0f 1e fb          	endbr32 
     b34:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b35:	31 c0                	xor    %eax,%eax
{
     b37:	89 e5                	mov    %esp,%ebp
     b39:	53                   	push   %ebx
     b3a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b3d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
     b40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b47:	83 c0 01             	add    $0x1,%eax
     b4a:	84 d2                	test   %dl,%dl
     b4c:	75 f2                	jne    b40 <strcpy+0x10>
    ;
  return os;
}
     b4e:	89 c8                	mov    %ecx,%eax
     b50:	5b                   	pop    %ebx
     b51:	5d                   	pop    %ebp
     b52:	c3                   	ret    
     b53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b60 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b60:	f3 0f 1e fb          	endbr32 
     b64:	55                   	push   %ebp
     b65:	89 e5                	mov    %esp,%ebp
     b67:	53                   	push   %ebx
     b68:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     b6e:	0f b6 01             	movzbl (%ecx),%eax
     b71:	0f b6 1a             	movzbl (%edx),%ebx
     b74:	84 c0                	test   %al,%al
     b76:	75 19                	jne    b91 <strcmp+0x31>
     b78:	eb 26                	jmp    ba0 <strcmp+0x40>
     b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     b84:	83 c1 01             	add    $0x1,%ecx
     b87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     b8a:	0f b6 1a             	movzbl (%edx),%ebx
     b8d:	84 c0                	test   %al,%al
     b8f:	74 0f                	je     ba0 <strcmp+0x40>
     b91:	38 d8                	cmp    %bl,%al
     b93:	74 eb                	je     b80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     b95:	29 d8                	sub    %ebx,%eax
}
     b97:	5b                   	pop    %ebx
     b98:	5d                   	pop    %ebp
     b99:	c3                   	ret    
     b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ba0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     ba2:	29 d8                	sub    %ebx,%eax
}
     ba4:	5b                   	pop    %ebx
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
     ba7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bae:	66 90                	xchg   %ax,%ax

00000bb0 <strlen>:

uint
strlen(const char *s)
{
     bb0:	f3 0f 1e fb          	endbr32 
     bb4:	55                   	push   %ebp
     bb5:	89 e5                	mov    %esp,%ebp
     bb7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     bba:	80 3a 00             	cmpb   $0x0,(%edx)
     bbd:	74 21                	je     be0 <strlen+0x30>
     bbf:	31 c0                	xor    %eax,%eax
     bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bc8:	83 c0 01             	add    $0x1,%eax
     bcb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     bcf:	89 c1                	mov    %eax,%ecx
     bd1:	75 f5                	jne    bc8 <strlen+0x18>
    ;
  return n;
}
     bd3:	89 c8                	mov    %ecx,%eax
     bd5:	5d                   	pop    %ebp
     bd6:	c3                   	ret    
     bd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bde:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     be0:	31 c9                	xor    %ecx,%ecx
}
     be2:	5d                   	pop    %ebp
     be3:	89 c8                	mov    %ecx,%eax
     be5:	c3                   	ret    
     be6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bed:	8d 76 00             	lea    0x0(%esi),%esi

00000bf0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     bf0:	f3 0f 1e fb          	endbr32 
     bf4:	55                   	push   %ebp
     bf5:	89 e5                	mov    %esp,%ebp
     bf7:	57                   	push   %edi
     bf8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     bfb:	8b 4d 10             	mov    0x10(%ebp),%ecx
     bfe:	8b 45 0c             	mov    0xc(%ebp),%eax
     c01:	89 d7                	mov    %edx,%edi
     c03:	fc                   	cld    
     c04:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c06:	89 d0                	mov    %edx,%eax
     c08:	5f                   	pop    %edi
     c09:	5d                   	pop    %ebp
     c0a:	c3                   	ret    
     c0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c0f:	90                   	nop

00000c10 <strchr>:

char*
strchr(const char *s, char c)
{
     c10:	f3 0f 1e fb          	endbr32 
     c14:	55                   	push   %ebp
     c15:	89 e5                	mov    %esp,%ebp
     c17:	8b 45 08             	mov    0x8(%ebp),%eax
     c1a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     c1e:	0f b6 10             	movzbl (%eax),%edx
     c21:	84 d2                	test   %dl,%dl
     c23:	75 16                	jne    c3b <strchr+0x2b>
     c25:	eb 21                	jmp    c48 <strchr+0x38>
     c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c2e:	66 90                	xchg   %ax,%ax
     c30:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     c34:	83 c0 01             	add    $0x1,%eax
     c37:	84 d2                	test   %dl,%dl
     c39:	74 0d                	je     c48 <strchr+0x38>
    if(*s == c)
     c3b:	38 d1                	cmp    %dl,%cl
     c3d:	75 f1                	jne    c30 <strchr+0x20>
      return (char*)s;
  return 0;
}
     c3f:	5d                   	pop    %ebp
     c40:	c3                   	ret    
     c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     c48:	31 c0                	xor    %eax,%eax
}
     c4a:	5d                   	pop    %ebp
     c4b:	c3                   	ret    
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c50 <gets>:

char*
gets(char *buf, int max)
{
     c50:	f3 0f 1e fb          	endbr32 
     c54:	55                   	push   %ebp
     c55:	89 e5                	mov    %esp,%ebp
     c57:	57                   	push   %edi
     c58:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c59:	31 f6                	xor    %esi,%esi
{
     c5b:	53                   	push   %ebx
     c5c:	89 f3                	mov    %esi,%ebx
     c5e:	83 ec 1c             	sub    $0x1c,%esp
     c61:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     c64:	eb 33                	jmp    c99 <gets+0x49>
     c66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     c70:	83 ec 04             	sub    $0x4,%esp
     c73:	8d 45 e7             	lea    -0x19(%ebp),%eax
     c76:	6a 01                	push   $0x1
     c78:	50                   	push   %eax
     c79:	6a 00                	push   $0x0
     c7b:	e8 c0 02 00 00       	call   f40 <read>
    if(cc < 1)
     c80:	83 c4 10             	add    $0x10,%esp
     c83:	85 c0                	test   %eax,%eax
     c85:	7e 1c                	jle    ca3 <gets+0x53>
      break;
    buf[i++] = c;
     c87:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c8b:	83 c7 01             	add    $0x1,%edi
     c8e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     c91:	3c 0a                	cmp    $0xa,%al
     c93:	74 23                	je     cb8 <gets+0x68>
     c95:	3c 0d                	cmp    $0xd,%al
     c97:	74 1f                	je     cb8 <gets+0x68>
  for(i=0; i+1 < max; ){
     c99:	83 c3 01             	add    $0x1,%ebx
     c9c:	89 fe                	mov    %edi,%esi
     c9e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     ca1:	7c cd                	jl     c70 <gets+0x20>
     ca3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     ca8:	c6 03 00             	movb   $0x0,(%ebx)
}
     cab:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cae:	5b                   	pop    %ebx
     caf:	5e                   	pop    %esi
     cb0:	5f                   	pop    %edi
     cb1:	5d                   	pop    %ebp
     cb2:	c3                   	ret    
     cb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cb7:	90                   	nop
     cb8:	8b 75 08             	mov    0x8(%ebp),%esi
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	01 de                	add    %ebx,%esi
     cc0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     cc2:	c6 03 00             	movb   $0x0,(%ebx)
}
     cc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cc8:	5b                   	pop    %ebx
     cc9:	5e                   	pop    %esi
     cca:	5f                   	pop    %edi
     ccb:	5d                   	pop    %ebp
     ccc:	c3                   	ret    
     ccd:	8d 76 00             	lea    0x0(%esi),%esi

00000cd0 <stat>:

int
stat(const char *n, struct stat *st)
{
     cd0:	f3 0f 1e fb          	endbr32 
     cd4:	55                   	push   %ebp
     cd5:	89 e5                	mov    %esp,%ebp
     cd7:	56                   	push   %esi
     cd8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     cd9:	83 ec 08             	sub    $0x8,%esp
     cdc:	6a 00                	push   $0x0
     cde:	ff 75 08             	pushl  0x8(%ebp)
     ce1:	e8 82 02 00 00       	call   f68 <open>
  if(fd < 0)
     ce6:	83 c4 10             	add    $0x10,%esp
     ce9:	85 c0                	test   %eax,%eax
     ceb:	78 2b                	js     d18 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     ced:	83 ec 08             	sub    $0x8,%esp
     cf0:	ff 75 0c             	pushl  0xc(%ebp)
     cf3:	89 c3                	mov    %eax,%ebx
     cf5:	50                   	push   %eax
     cf6:	e8 85 02 00 00       	call   f80 <fstat>
  close(fd);
     cfb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     cfe:	89 c6                	mov    %eax,%esi
  close(fd);
     d00:	e8 4b 02 00 00       	call   f50 <close>
  return r;
     d05:	83 c4 10             	add    $0x10,%esp
}
     d08:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d0b:	89 f0                	mov    %esi,%eax
     d0d:	5b                   	pop    %ebx
     d0e:	5e                   	pop    %esi
     d0f:	5d                   	pop    %ebp
     d10:	c3                   	ret    
     d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     d18:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d1d:	eb e9                	jmp    d08 <stat+0x38>
     d1f:	90                   	nop

00000d20 <atoi>:

int
atoi(const char *s)
{
     d20:	f3 0f 1e fb          	endbr32 
     d24:	55                   	push   %ebp
     d25:	89 e5                	mov    %esp,%ebp
     d27:	53                   	push   %ebx
     d28:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d2b:	0f be 02             	movsbl (%edx),%eax
     d2e:	8d 48 d0             	lea    -0x30(%eax),%ecx
     d31:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     d34:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     d39:	77 1a                	ja     d55 <atoi+0x35>
     d3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d3f:	90                   	nop
    n = n*10 + *s++ - '0';
     d40:	83 c2 01             	add    $0x1,%edx
     d43:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     d46:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     d4a:	0f be 02             	movsbl (%edx),%eax
     d4d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     d50:	80 fb 09             	cmp    $0x9,%bl
     d53:	76 eb                	jbe    d40 <atoi+0x20>
  return n;
}
     d55:	89 c8                	mov    %ecx,%eax
     d57:	5b                   	pop    %ebx
     d58:	5d                   	pop    %ebp
     d59:	c3                   	ret    
     d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d60 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d60:	f3 0f 1e fb          	endbr32 
     d64:	55                   	push   %ebp
     d65:	89 e5                	mov    %esp,%ebp
     d67:	57                   	push   %edi
     d68:	8b 45 10             	mov    0x10(%ebp),%eax
     d6b:	8b 55 08             	mov    0x8(%ebp),%edx
     d6e:	56                   	push   %esi
     d6f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d72:	85 c0                	test   %eax,%eax
     d74:	7e 0f                	jle    d85 <memmove+0x25>
     d76:	01 d0                	add    %edx,%eax
  dst = vdst;
     d78:	89 d7                	mov    %edx,%edi
     d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     d80:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     d81:	39 f8                	cmp    %edi,%eax
     d83:	75 fb                	jne    d80 <memmove+0x20>
  return vdst;
}
     d85:	5e                   	pop    %esi
     d86:	89 d0                	mov    %edx,%eax
     d88:	5f                   	pop    %edi
     d89:	5d                   	pop    %ebp
     d8a:	c3                   	ret    
     d8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d8f:	90                   	nop

00000d90 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
     d90:	f3 0f 1e fb          	endbr32 
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
     d97:	53                   	push   %ebx
     d98:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
     d9b:	68 00 20 00 00       	push   $0x2000
     da0:	e8 4b 05 00 00       	call   12f0 <malloc>
  void* stack;
  if(freeptr == 0)
     da5:	83 c4 10             	add    $0x10,%esp
     da8:	85 c0                	test   %eax,%eax
     daa:	74 6e                	je     e1a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
     dac:	89 c2                	mov    %eax,%edx
     dae:	89 c3                	mov    %eax,%ebx
     db0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     db6:	75 58                	jne    e10 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
     db8:	b9 00 1c 00 00       	mov    $0x1c00,%ecx
     dbd:	31 d2                	xor    %edx,%edx
     dbf:	eb 12                	jmp    dd3 <thread_create+0x43>
     dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dc8:	83 c2 01             	add    $0x1,%edx
     dcb:	83 c1 0c             	add    $0xc,%ecx
     dce:	83 fa 40             	cmp    $0x40,%edx
     dd1:	74 21                	je     df4 <thread_create+0x64>
    if(ptrs[i].busy == 0){
     dd3:	83 39 00             	cmpl   $0x0,(%ecx)
     dd6:	75 f0                	jne    dc8 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
     dd8:	8d 14 52             	lea    (%edx,%edx,2),%edx
     ddb:	c1 e2 02             	shl    $0x2,%edx
     dde:	89 82 04 1c 00 00    	mov    %eax,0x1c04(%edx)
      ptrs[i].stack = stack;
     de4:	89 9a 08 1c 00 00    	mov    %ebx,0x1c08(%edx)
      ptrs[i].busy = 1;
     dea:	c7 82 00 1c 00 00 01 	movl   $0x1,0x1c00(%edx)
     df1:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
     df4:	53                   	push   %ebx
     df5:	ff 75 10             	pushl  0x10(%ebp)
     df8:	ff 75 0c             	pushl  0xc(%ebp)
     dfb:	ff 75 08             	pushl  0x8(%ebp)
     dfe:	e8 c5 01 00 00       	call   fc8 <clone>
     e03:	83 c4 10             	add    $0x10,%esp
}
     e06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e09:	c9                   	leave  
     e0a:	c3                   	ret    
     e0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e0f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
     e10:	29 d3                	sub    %edx,%ebx
     e12:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
     e18:	eb 9e                	jmp    db8 <thread_create+0x28>
    return -1;
     e1a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e1f:	eb e5                	jmp    e06 <thread_create+0x76>
     e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e2f:	90                   	nop

00000e30 <thread_join>:

int thread_join()
{
     e30:	f3 0f 1e fb          	endbr32 
     e34:	55                   	push   %ebp
     e35:	89 e5                	mov    %esp,%ebp
     e37:	57                   	push   %edi
     e38:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
     e39:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
     e3c:	53                   	push   %ebx
     e3d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
     e40:	50                   	push   %eax
     e41:	e8 8a 01 00 00       	call   fd0 <join>
     e46:	ba 00 1c 00 00       	mov    $0x1c00,%edx
     e4b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
     e4e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
     e50:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
     e52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e55:	eb 14                	jmp    e6b <thread_join+0x3b>
     e57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e5e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
     e60:	83 c1 01             	add    $0x1,%ecx
     e63:	83 c2 0c             	add    $0xc,%edx
     e66:	83 f9 40             	cmp    $0x40,%ecx
     e69:	74 3f                	je     eaa <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
     e6b:	83 3a 01             	cmpl   $0x1,(%edx)
     e6e:	75 f0                	jne    e60 <thread_join+0x30>
     e70:	39 42 08             	cmp    %eax,0x8(%edx)
     e73:	75 eb                	jne    e60 <thread_join+0x30>
      free(ptrs[i].ptr);
     e75:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
     e78:	83 ec 0c             	sub    $0xc,%esp
     e7b:	c1 e6 02             	shl    $0x2,%esi
     e7e:	ff b6 04 1c 00 00    	pushl  0x1c04(%esi)
     e84:	e8 d7 03 00 00       	call   1260 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
     e89:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
     e8c:	c7 86 08 1c 00 00 00 	movl   $0x0,0x1c08(%esi)
     e93:	00 00 00 
      ptrs[i].busy = 0;
     e96:	c7 86 00 1c 00 00 00 	movl   $0x0,0x1c00(%esi)
     e9d:	00 00 00 
      ptrs[i].ptr = NULL;
     ea0:	c7 86 04 1c 00 00 00 	movl   $0x0,0x1c04(%esi)
     ea7:	00 00 00 
    }
  }
  return ret;  
}
     eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ead:	89 d8                	mov    %ebx,%eax
     eaf:	5b                   	pop    %ebx
     eb0:	5e                   	pop    %esi
     eb1:	5f                   	pop    %edi
     eb2:	5d                   	pop    %ebp
     eb3:	c3                   	ret    
     eb4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ebb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ebf:	90                   	nop

00000ec0 <lock_init>:

void lock_init(lock_t *lock)
{
     ec0:	f3 0f 1e fb          	endbr32 
     ec4:	55                   	push   %ebp
     ec5:	89 e5                	mov    %esp,%ebp
     ec7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
     eca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
     ed0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
     ed7:	5d                   	pop    %ebp
     ed8:	c3                   	ret    
     ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ee0 <lock_acquire>:

void lock_acquire(lock_t *lock){
     ee0:	f3 0f 1e fb          	endbr32 
     ee4:	55                   	push   %ebp
    __asm__ volatile
     ee5:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
     eea:	89 e5                	mov    %esp,%ebp
     eec:	53                   	push   %ebx
     eed:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
     ef0:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
     ef4:	31 db                	xor    %ebx,%ebx
     ef6:	83 c2 04             	add    $0x4,%edx
     ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f00:	89 d8                	mov    %ebx,%eax
     f02:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
     f06:	39 c1                	cmp    %eax,%ecx
     f08:	75 f6                	jne    f00 <lock_acquire+0x20>
}
     f0a:	5b                   	pop    %ebx
     f0b:	5d                   	pop    %ebp
     f0c:	c3                   	ret    
     f0d:	8d 76 00             	lea    0x0(%esi),%esi

00000f10 <lock_release>:

void lock_release(lock_t *lock){
     f10:	f3 0f 1e fb          	endbr32 
     f14:	55                   	push   %ebp
     f15:	89 e5                	mov    %esp,%ebp
     f17:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
     f1a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
     f1e:	5d                   	pop    %ebp
     f1f:	c3                   	ret    

00000f20 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f20:	b8 01 00 00 00       	mov    $0x1,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	ret    

00000f28 <exit>:
SYSCALL(exit)
     f28:	b8 02 00 00 00       	mov    $0x2,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	ret    

00000f30 <wait>:
SYSCALL(wait)
     f30:	b8 03 00 00 00       	mov    $0x3,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	ret    

00000f38 <pipe>:
SYSCALL(pipe)
     f38:	b8 04 00 00 00       	mov    $0x4,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	ret    

00000f40 <read>:
SYSCALL(read)
     f40:	b8 06 00 00 00       	mov    $0x6,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	ret    

00000f48 <write>:
SYSCALL(write)
     f48:	b8 05 00 00 00       	mov    $0x5,%eax
     f4d:	cd 40                	int    $0x40
     f4f:	c3                   	ret    

00000f50 <close>:
SYSCALL(close)
     f50:	b8 07 00 00 00       	mov    $0x7,%eax
     f55:	cd 40                	int    $0x40
     f57:	c3                   	ret    

00000f58 <kill>:
SYSCALL(kill)
     f58:	b8 08 00 00 00       	mov    $0x8,%eax
     f5d:	cd 40                	int    $0x40
     f5f:	c3                   	ret    

00000f60 <exec>:
SYSCALL(exec)
     f60:	b8 09 00 00 00       	mov    $0x9,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	ret    

00000f68 <open>:
SYSCALL(open)
     f68:	b8 0a 00 00 00       	mov    $0xa,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	ret    

00000f70 <mknod>:
SYSCALL(mknod)
     f70:	b8 0b 00 00 00       	mov    $0xb,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	ret    

00000f78 <unlink>:
SYSCALL(unlink)
     f78:	b8 0c 00 00 00       	mov    $0xc,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	ret    

00000f80 <fstat>:
SYSCALL(fstat)
     f80:	b8 0d 00 00 00       	mov    $0xd,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	ret    

00000f88 <link>:
SYSCALL(link)
     f88:	b8 0e 00 00 00       	mov    $0xe,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	ret    

00000f90 <mkdir>:
SYSCALL(mkdir)
     f90:	b8 0f 00 00 00       	mov    $0xf,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	ret    

00000f98 <chdir>:
SYSCALL(chdir)
     f98:	b8 10 00 00 00       	mov    $0x10,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <dup>:
SYSCALL(dup)
     fa0:	b8 11 00 00 00       	mov    $0x11,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <getpid>:
SYSCALL(getpid)
     fa8:	b8 12 00 00 00       	mov    $0x12,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <sbrk>:
SYSCALL(sbrk)
     fb0:	b8 13 00 00 00       	mov    $0x13,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <sleep>:
SYSCALL(sleep)
     fb8:	b8 14 00 00 00       	mov    $0x14,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <uptime>:
SYSCALL(uptime)
     fc0:	b8 15 00 00 00       	mov    $0x15,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <clone>:
SYSCALL(clone)
     fc8:	b8 16 00 00 00       	mov    $0x16,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <join>:
SYSCALL(join) 
     fd0:	b8 17 00 00 00       	mov    $0x17,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    
     fd8:	66 90                	xchg   %ax,%ax
     fda:	66 90                	xchg   %ax,%ax
     fdc:	66 90                	xchg   %ax,%ax
     fde:	66 90                	xchg   %ax,%ax

00000fe0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fe0:	55                   	push   %ebp
     fe1:	89 e5                	mov    %esp,%ebp
     fe3:	57                   	push   %edi
     fe4:	56                   	push   %esi
     fe5:	53                   	push   %ebx
     fe6:	83 ec 3c             	sub    $0x3c,%esp
     fe9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fec:	89 d1                	mov    %edx,%ecx
{
     fee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     ff1:	85 d2                	test   %edx,%edx
     ff3:	0f 89 7f 00 00 00    	jns    1078 <printint+0x98>
     ff9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     ffd:	74 79                	je     1078 <printint+0x98>
    neg = 1;
     fff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1006:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1008:	31 db                	xor    %ebx,%ebx
    100a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    100d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1010:	89 c8                	mov    %ecx,%eax
    1012:	31 d2                	xor    %edx,%edx
    1014:	89 cf                	mov    %ecx,%edi
    1016:	f7 75 c4             	divl   -0x3c(%ebp)
    1019:	0f b6 92 e8 14 00 00 	movzbl 0x14e8(%edx),%edx
    1020:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1023:	89 d8                	mov    %ebx,%eax
    1025:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1028:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    102b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    102e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1031:	76 dd                	jbe    1010 <printint+0x30>
  if(neg)
    1033:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1036:	85 c9                	test   %ecx,%ecx
    1038:	74 0c                	je     1046 <printint+0x66>
    buf[i++] = '-';
    103a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    103f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1041:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1046:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1049:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    104d:	eb 07                	jmp    1056 <printint+0x76>
    104f:	90                   	nop
    1050:	0f b6 13             	movzbl (%ebx),%edx
    1053:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1056:	83 ec 04             	sub    $0x4,%esp
    1059:	88 55 d7             	mov    %dl,-0x29(%ebp)
    105c:	6a 01                	push   $0x1
    105e:	56                   	push   %esi
    105f:	57                   	push   %edi
    1060:	e8 e3 fe ff ff       	call   f48 <write>
  while(--i >= 0)
    1065:	83 c4 10             	add    $0x10,%esp
    1068:	39 de                	cmp    %ebx,%esi
    106a:	75 e4                	jne    1050 <printint+0x70>
    putc(fd, buf[i]);
}
    106c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    106f:	5b                   	pop    %ebx
    1070:	5e                   	pop    %esi
    1071:	5f                   	pop    %edi
    1072:	5d                   	pop    %ebp
    1073:	c3                   	ret    
    1074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1078:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    107f:	eb 87                	jmp    1008 <printint+0x28>
    1081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1088:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108f:	90                   	nop

00001090 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1090:	f3 0f 1e fb          	endbr32 
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
    1097:	57                   	push   %edi
    1098:	56                   	push   %esi
    1099:	53                   	push   %ebx
    109a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    109d:	8b 75 0c             	mov    0xc(%ebp),%esi
    10a0:	0f b6 1e             	movzbl (%esi),%ebx
    10a3:	84 db                	test   %bl,%bl
    10a5:	0f 84 b4 00 00 00    	je     115f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    10ab:	8d 45 10             	lea    0x10(%ebp),%eax
    10ae:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    10b1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    10b4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    10b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10b9:	eb 33                	jmp    10ee <printf+0x5e>
    10bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop
    10c0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    10c3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    10c8:	83 f8 25             	cmp    $0x25,%eax
    10cb:	74 17                	je     10e4 <printf+0x54>
  write(fd, &c, 1);
    10cd:	83 ec 04             	sub    $0x4,%esp
    10d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
    10d3:	6a 01                	push   $0x1
    10d5:	57                   	push   %edi
    10d6:	ff 75 08             	pushl  0x8(%ebp)
    10d9:	e8 6a fe ff ff       	call   f48 <write>
    10de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    10e1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    10e4:	0f b6 1e             	movzbl (%esi),%ebx
    10e7:	83 c6 01             	add    $0x1,%esi
    10ea:	84 db                	test   %bl,%bl
    10ec:	74 71                	je     115f <printf+0xcf>
    c = fmt[i] & 0xff;
    10ee:	0f be cb             	movsbl %bl,%ecx
    10f1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10f4:	85 d2                	test   %edx,%edx
    10f6:	74 c8                	je     10c0 <printf+0x30>
      }
    } else if(state == '%'){
    10f8:	83 fa 25             	cmp    $0x25,%edx
    10fb:	75 e7                	jne    10e4 <printf+0x54>
      if(c == 'd'){
    10fd:	83 f8 64             	cmp    $0x64,%eax
    1100:	0f 84 9a 00 00 00    	je     11a0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1106:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    110c:	83 f9 70             	cmp    $0x70,%ecx
    110f:	74 5f                	je     1170 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1111:	83 f8 73             	cmp    $0x73,%eax
    1114:	0f 84 d6 00 00 00    	je     11f0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    111a:	83 f8 63             	cmp    $0x63,%eax
    111d:	0f 84 8d 00 00 00    	je     11b0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1123:	83 f8 25             	cmp    $0x25,%eax
    1126:	0f 84 b4 00 00 00    	je     11e0 <printf+0x150>
  write(fd, &c, 1);
    112c:	83 ec 04             	sub    $0x4,%esp
    112f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1133:	6a 01                	push   $0x1
    1135:	57                   	push   %edi
    1136:	ff 75 08             	pushl  0x8(%ebp)
    1139:	e8 0a fe ff ff       	call   f48 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    113e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1141:	83 c4 0c             	add    $0xc,%esp
    1144:	6a 01                	push   $0x1
    1146:	83 c6 01             	add    $0x1,%esi
    1149:	57                   	push   %edi
    114a:	ff 75 08             	pushl  0x8(%ebp)
    114d:	e8 f6 fd ff ff       	call   f48 <write>
  for(i = 0; fmt[i]; i++){
    1152:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1156:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1159:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    115b:	84 db                	test   %bl,%bl
    115d:	75 8f                	jne    10ee <printf+0x5e>
    }
  }
}
    115f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1162:	5b                   	pop    %ebx
    1163:	5e                   	pop    %esi
    1164:	5f                   	pop    %edi
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	b9 10 00 00 00       	mov    $0x10,%ecx
    1178:	6a 00                	push   $0x0
    117a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    117d:	8b 45 08             	mov    0x8(%ebp),%eax
    1180:	8b 13                	mov    (%ebx),%edx
    1182:	e8 59 fe ff ff       	call   fe0 <printint>
        ap++;
    1187:	89 d8                	mov    %ebx,%eax
    1189:	83 c4 10             	add    $0x10,%esp
      state = 0;
    118c:	31 d2                	xor    %edx,%edx
        ap++;
    118e:	83 c0 04             	add    $0x4,%eax
    1191:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1194:	e9 4b ff ff ff       	jmp    10e4 <printf+0x54>
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    11a0:	83 ec 0c             	sub    $0xc,%esp
    11a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    11a8:	6a 01                	push   $0x1
    11aa:	eb ce                	jmp    117a <printf+0xea>
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    11b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    11b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    11b6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    11b8:	6a 01                	push   $0x1
        ap++;
    11ba:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    11bd:	57                   	push   %edi
    11be:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    11c1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11c4:	e8 7f fd ff ff       	call   f48 <write>
        ap++;
    11c9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11cf:	31 d2                	xor    %edx,%edx
    11d1:	e9 0e ff ff ff       	jmp    10e4 <printf+0x54>
    11d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    11e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    11e3:	83 ec 04             	sub    $0x4,%esp
    11e6:	e9 59 ff ff ff       	jmp    1144 <printf+0xb4>
    11eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11ef:	90                   	nop
        s = (char*)*ap;
    11f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11f3:	8b 18                	mov    (%eax),%ebx
        ap++;
    11f5:	83 c0 04             	add    $0x4,%eax
    11f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    11fb:	85 db                	test   %ebx,%ebx
    11fd:	74 17                	je     1216 <printf+0x186>
        while(*s != 0){
    11ff:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1202:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1204:	84 c0                	test   %al,%al
    1206:	0f 84 d8 fe ff ff    	je     10e4 <printf+0x54>
    120c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    120f:	89 de                	mov    %ebx,%esi
    1211:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1214:	eb 1a                	jmp    1230 <printf+0x1a0>
          s = "(null)";
    1216:	bb e0 14 00 00       	mov    $0x14e0,%ebx
        while(*s != 0){
    121b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    121e:	b8 28 00 00 00       	mov    $0x28,%eax
    1223:	89 de                	mov    %ebx,%esi
    1225:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop
  write(fd, &c, 1);
    1230:	83 ec 04             	sub    $0x4,%esp
          s++;
    1233:	83 c6 01             	add    $0x1,%esi
    1236:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1239:	6a 01                	push   $0x1
    123b:	57                   	push   %edi
    123c:	53                   	push   %ebx
    123d:	e8 06 fd ff ff       	call   f48 <write>
        while(*s != 0){
    1242:	0f b6 06             	movzbl (%esi),%eax
    1245:	83 c4 10             	add    $0x10,%esp
    1248:	84 c0                	test   %al,%al
    124a:	75 e4                	jne    1230 <printf+0x1a0>
    124c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    124f:	31 d2                	xor    %edx,%edx
    1251:	e9 8e fe ff ff       	jmp    10e4 <printf+0x54>
    1256:	66 90                	xchg   %ax,%ax
    1258:	66 90                	xchg   %ax,%ax
    125a:	66 90                	xchg   %ax,%ax
    125c:	66 90                	xchg   %ax,%ax
    125e:	66 90                	xchg   %ax,%ax

00001260 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1260:	f3 0f 1e fb          	endbr32 
    1264:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1265:	a1 e4 1b 00 00       	mov    0x1be4,%eax
{
    126a:	89 e5                	mov    %esp,%ebp
    126c:	57                   	push   %edi
    126d:	56                   	push   %esi
    126e:	53                   	push   %ebx
    126f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1272:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1274:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1277:	39 c8                	cmp    %ecx,%eax
    1279:	73 15                	jae    1290 <free+0x30>
    127b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop
    1280:	39 d1                	cmp    %edx,%ecx
    1282:	72 14                	jb     1298 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1284:	39 d0                	cmp    %edx,%eax
    1286:	73 10                	jae    1298 <free+0x38>
{
    1288:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    128a:	8b 10                	mov    (%eax),%edx
    128c:	39 c8                	cmp    %ecx,%eax
    128e:	72 f0                	jb     1280 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1290:	39 d0                	cmp    %edx,%eax
    1292:	72 f4                	jb     1288 <free+0x28>
    1294:	39 d1                	cmp    %edx,%ecx
    1296:	73 f0                	jae    1288 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1298:	8b 73 fc             	mov    -0x4(%ebx),%esi
    129b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    129e:	39 fa                	cmp    %edi,%edx
    12a0:	74 1e                	je     12c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12a5:	8b 50 04             	mov    0x4(%eax),%edx
    12a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12ab:	39 f1                	cmp    %esi,%ecx
    12ad:	74 28                	je     12d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12af:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    12b1:	5b                   	pop    %ebx
  freep = p;
    12b2:	a3 e4 1b 00 00       	mov    %eax,0x1be4
}
    12b7:	5e                   	pop    %esi
    12b8:	5f                   	pop    %edi
    12b9:	5d                   	pop    %ebp
    12ba:	c3                   	ret    
    12bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12bf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    12c0:	03 72 04             	add    0x4(%edx),%esi
    12c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12c6:	8b 10                	mov    (%eax),%edx
    12c8:	8b 12                	mov    (%edx),%edx
    12ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12cd:	8b 50 04             	mov    0x4(%eax),%edx
    12d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12d3:	39 f1                	cmp    %esi,%ecx
    12d5:	75 d8                	jne    12af <free+0x4f>
    p->s.size += bp->s.size;
    12d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    12da:	a3 e4 1b 00 00       	mov    %eax,0x1be4
    p->s.size += bp->s.size;
    12df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    12e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    12e5:	89 10                	mov    %edx,(%eax)
}
    12e7:	5b                   	pop    %ebx
    12e8:	5e                   	pop    %esi
    12e9:	5f                   	pop    %edi
    12ea:	5d                   	pop    %ebp
    12eb:	c3                   	ret    
    12ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    12f0:	f3 0f 1e fb          	endbr32 
    12f4:	55                   	push   %ebp
    12f5:	89 e5                	mov    %esp,%ebp
    12f7:	57                   	push   %edi
    12f8:	56                   	push   %esi
    12f9:	53                   	push   %ebx
    12fa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12fd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1300:	8b 3d e4 1b 00 00    	mov    0x1be4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1306:	8d 70 07             	lea    0x7(%eax),%esi
    1309:	c1 ee 03             	shr    $0x3,%esi
    130c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    130f:	85 ff                	test   %edi,%edi
    1311:	0f 84 a9 00 00 00    	je     13c0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1317:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1319:	8b 48 04             	mov    0x4(%eax),%ecx
    131c:	39 f1                	cmp    %esi,%ecx
    131e:	73 6d                	jae    138d <malloc+0x9d>
    1320:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1326:	bb 00 10 00 00       	mov    $0x1000,%ebx
    132b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    132e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1335:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1338:	eb 17                	jmp    1351 <malloc+0x61>
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1340:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1342:	8b 4a 04             	mov    0x4(%edx),%ecx
    1345:	39 f1                	cmp    %esi,%ecx
    1347:	73 4f                	jae    1398 <malloc+0xa8>
    1349:	8b 3d e4 1b 00 00    	mov    0x1be4,%edi
    134f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1351:	39 c7                	cmp    %eax,%edi
    1353:	75 eb                	jne    1340 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1355:	83 ec 0c             	sub    $0xc,%esp
    1358:	ff 75 e4             	pushl  -0x1c(%ebp)
    135b:	e8 50 fc ff ff       	call   fb0 <sbrk>
  if(p == (char*)-1)
    1360:	83 c4 10             	add    $0x10,%esp
    1363:	83 f8 ff             	cmp    $0xffffffff,%eax
    1366:	74 1b                	je     1383 <malloc+0x93>
  hp->s.size = nu;
    1368:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    136b:	83 ec 0c             	sub    $0xc,%esp
    136e:	83 c0 08             	add    $0x8,%eax
    1371:	50                   	push   %eax
    1372:	e8 e9 fe ff ff       	call   1260 <free>
  return freep;
    1377:	a1 e4 1b 00 00       	mov    0x1be4,%eax
      if((p = morecore(nunits)) == 0)
    137c:	83 c4 10             	add    $0x10,%esp
    137f:	85 c0                	test   %eax,%eax
    1381:	75 bd                	jne    1340 <malloc+0x50>
        return 0;
  }
}
    1383:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1386:	31 c0                	xor    %eax,%eax
}
    1388:	5b                   	pop    %ebx
    1389:	5e                   	pop    %esi
    138a:	5f                   	pop    %edi
    138b:	5d                   	pop    %ebp
    138c:	c3                   	ret    
    if(p->s.size >= nunits){
    138d:	89 c2                	mov    %eax,%edx
    138f:	89 f8                	mov    %edi,%eax
    1391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1398:	39 ce                	cmp    %ecx,%esi
    139a:	74 54                	je     13f0 <malloc+0x100>
        p->s.size -= nunits;
    139c:	29 f1                	sub    %esi,%ecx
    139e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    13a1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    13a4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    13a7:	a3 e4 1b 00 00       	mov    %eax,0x1be4
}
    13ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13af:	8d 42 08             	lea    0x8(%edx),%eax
}
    13b2:	5b                   	pop    %ebx
    13b3:	5e                   	pop    %esi
    13b4:	5f                   	pop    %edi
    13b5:	5d                   	pop    %ebp
    13b6:	c3                   	ret    
    13b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13be:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    13c0:	c7 05 e4 1b 00 00 e8 	movl   $0x1be8,0x1be4
    13c7:	1b 00 00 
    base.s.size = 0;
    13ca:	bf e8 1b 00 00       	mov    $0x1be8,%edi
    base.s.ptr = freep = prevp = &base;
    13cf:	c7 05 e8 1b 00 00 e8 	movl   $0x1be8,0x1be8
    13d6:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13d9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    13db:	c7 05 ec 1b 00 00 00 	movl   $0x0,0x1bec
    13e2:	00 00 00 
    if(p->s.size >= nunits){
    13e5:	e9 36 ff ff ff       	jmp    1320 <malloc+0x30>
    13ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    13f0:	8b 0a                	mov    (%edx),%ecx
    13f2:	89 08                	mov    %ecx,(%eax)
    13f4:	eb b1                	jmp    13a7 <malloc+0xb7>
