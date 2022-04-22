
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 b8 09 00 00       	push   $0x9b8
  1d:	e8 06 05 00 00       	call   528 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 29 05 00 00       	call   560 <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 1d 05 00 00       	call   560 <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 c0 09 00 00       	push   $0x9c0
  58:	6a 01                	push   $0x1
  5a:	e8 f1 05 00 00       	call   650 <printf>
    pid = fork();
  5f:	e8 7c 04 00 00       	call   4e0 <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 7b 04 00 00       	call   4f0 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 ff 09 00 00       	push   $0x9ff
  85:	6a 01                	push   $0x1
  87:	e8 c4 05 00 00       	call   650 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 d3 09 00 00       	push   $0x9d3
  98:	6a 01                	push   $0x1
  9a:	e8 b1 05 00 00       	call   650 <printf>
      exit();
  9f:	e8 44 04 00 00       	call   4e8 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 74 0d 00 00       	push   $0xd74
  ab:	68 e6 09 00 00       	push   $0x9e6
  b0:	e8 6b 04 00 00       	call   520 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 e9 09 00 00       	push   $0x9e9
  bc:	6a 01                	push   $0x1
  be:	e8 8d 05 00 00       	call   650 <printf>
      exit();
  c3:	e8 20 04 00 00       	call   4e8 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 b8 09 00 00       	push   $0x9b8
  d2:	e8 59 04 00 00       	call   530 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 b8 09 00 00       	push   $0x9b8
  e0:	e8 43 04 00 00       	call   528 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f5:	31 c0                	xor    %eax,%eax
{
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12e:	0f b6 01             	movzbl (%ecx),%eax
 131:	0f b6 1a             	movzbl (%edx),%ebx
 134:	84 c0                	test   %al,%al
 136:	75 19                	jne    151 <strcmp+0x31>
 138:	eb 26                	jmp    160 <strcmp+0x40>
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 14a:	0f b6 1a             	movzbl (%edx),%ebx
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 155:	29 d8                	sub    %ebx,%eax
}
 157:	5b                   	pop    %ebx
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 21                	je     1a0 <strlen+0x30>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18f:	89 c1                	mov    %eax,%ecx
 191:	75 f5                	jne    188 <strlen+0x18>
    ;
  return n;
}
 193:	89 c8                	mov    %ecx,%eax
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 d7                	mov    %edx,%edi
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1de:	0f b6 10             	movzbl (%eax),%edx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	75 16                	jne    1fb <strchr+0x2b>
 1e5:	eb 21                	jmp    208 <strchr+0x38>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
    if(*s == c)
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 208:	31 c0                	xor    %eax,%eax
}
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 219:	31 f6                	xor    %esi,%esi
{
 21b:	53                   	push   %ebx
 21c:	89 f3                	mov    %esi,%ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 224:	eb 33                	jmp    259 <gets+0x49>
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	6a 01                	push   $0x1
 238:	50                   	push   %eax
 239:	6a 00                	push   $0x0
 23b:	e8 c0 02 00 00       	call   500 <read>
    if(cc < 1)
 240:	83 c4 10             	add    $0x10,%esp
 243:	85 c0                	test   %eax,%eax
 245:	7e 1c                	jle    263 <gets+0x53>
      break;
    buf[i++] = c;
 247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24b:	83 c7 01             	add    $0x1,%edi
 24e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 251:	3c 0a                	cmp    $0xa,%al
 253:	74 23                	je     278 <gets+0x68>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 1f                	je     278 <gets+0x68>
  for(i=0; i+1 < max; ){
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	89 fe                	mov    %edi,%esi
 25e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 261:	7c cd                	jl     230 <gets+0x20>
 263:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 265:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 268:	c6 03 00             	movb   $0x0,(%ebx)
}
 26b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26e:	5b                   	pop    %ebx
 26f:	5e                   	pop    %esi
 270:	5f                   	pop    %edi
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	8b 75 08             	mov    0x8(%ebp),%esi
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	01 de                	add    %ebx,%esi
 280:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 282:	c6 03 00             	movb   $0x0,(%ebx)
}
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	6a 00                	push   $0x0
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 82 02 00 00       	call   528 <open>
  if(fd < 0)
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	78 2b                	js     2d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	50                   	push   %eax
 2b6:	e8 85 02 00 00       	call   540 <fstat>
  close(fd);
 2bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2be:	89 c6                	mov    %eax,%esi
  close(fd);
 2c0:	e8 4b 02 00 00       	call   510 <close>
  return r;
 2c5:	83 c4 10             	add    $0x10,%esp
}
 2c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dd:	eb e9                	jmp    2c8 <stat+0x38>
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2eb:	0f be 02             	movsbl (%edx),%eax
 2ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f9:	77 1a                	ja     315 <atoi+0x35>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	89 c8                	mov    %ecx,%eax
 317:	5b                   	pop    %ebx
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
 32e:	56                   	push   %esi
 32f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	85 c0                	test   %eax,%eax
 334:	7e 0f                	jle    345 <memmove+0x25>
 336:	01 d0                	add    %edx,%eax
  dst = vdst;
 338:	89 d7                	mov    %edx,%edi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	53                   	push   %ebx
 358:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 35b:	68 00 20 00 00       	push   $0x2000
 360:	e8 4b 05 00 00       	call   8b0 <malloc>
  void* stack;
  if(freeptr == 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	74 6e                	je     3da <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 36c:	89 c2                	mov    %eax,%edx
 36e:	89 c3                	mov    %eax,%ebx
 370:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 376:	75 58                	jne    3d0 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 378:	b9 a0 0d 00 00       	mov    $0xda0,%ecx
 37d:	31 d2                	xor    %edx,%edx
 37f:	eb 12                	jmp    393 <thread_create+0x43>
 381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 388:	83 c2 01             	add    $0x1,%edx
 38b:	83 c1 0c             	add    $0xc,%ecx
 38e:	83 fa 40             	cmp    $0x40,%edx
 391:	74 21                	je     3b4 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 393:	83 39 00             	cmpl   $0x0,(%ecx)
 396:	75 f0                	jne    388 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 398:	8d 14 52             	lea    (%edx,%edx,2),%edx
 39b:	c1 e2 02             	shl    $0x2,%edx
 39e:	89 82 a4 0d 00 00    	mov    %eax,0xda4(%edx)
      ptrs[i].stack = stack;
 3a4:	89 9a a8 0d 00 00    	mov    %ebx,0xda8(%edx)
      ptrs[i].busy = 1;
 3aa:	c7 82 a0 0d 00 00 01 	movl   $0x1,0xda0(%edx)
 3b1:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 3b4:	53                   	push   %ebx
 3b5:	ff 75 10             	pushl  0x10(%ebp)
 3b8:	ff 75 0c             	pushl  0xc(%ebp)
 3bb:	ff 75 08             	pushl  0x8(%ebp)
 3be:	e8 c5 01 00 00       	call   588 <clone>
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c9:	c9                   	leave  
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 3d0:	29 d3                	sub    %edx,%ebx
 3d2:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 3d8:	eb 9e                	jmp    378 <thread_create+0x28>
    return -1;
 3da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3df:	eb e5                	jmp    3c6 <thread_create+0x76>
 3e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_join>:

int thread_join()
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 3f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 3fc:	53                   	push   %ebx
 3fd:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 400:	50                   	push   %eax
 401:	e8 8a 01 00 00       	call   590 <join>
 406:	ba a0 0d 00 00       	mov    $0xda0,%edx
 40b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 40e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 410:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 412:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 415:	eb 14                	jmp    42b <thread_join+0x3b>
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 420:	83 c1 01             	add    $0x1,%ecx
 423:	83 c2 0c             	add    $0xc,%edx
 426:	83 f9 40             	cmp    $0x40,%ecx
 429:	74 3f                	je     46a <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 42b:	83 3a 01             	cmpl   $0x1,(%edx)
 42e:	75 f0                	jne    420 <thread_join+0x30>
 430:	39 42 08             	cmp    %eax,0x8(%edx)
 433:	75 eb                	jne    420 <thread_join+0x30>
      free(ptrs[i].ptr);
 435:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 438:	83 ec 0c             	sub    $0xc,%esp
 43b:	c1 e6 02             	shl    $0x2,%esi
 43e:	ff b6 a4 0d 00 00    	pushl  0xda4(%esi)
 444:	e8 d7 03 00 00       	call   820 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 449:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 44c:	c7 86 a8 0d 00 00 00 	movl   $0x0,0xda8(%esi)
 453:	00 00 00 
      ptrs[i].busy = 0;
 456:	c7 86 a0 0d 00 00 00 	movl   $0x0,0xda0(%esi)
 45d:	00 00 00 
      ptrs[i].ptr = NULL;
 460:	c7 86 a4 0d 00 00 00 	movl   $0x0,0xda4(%esi)
 467:	00 00 00 
    }
  }
  return ret;  
}
 46a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46d:	89 d8                	mov    %ebx,%eax
 46f:	5b                   	pop    %ebx
 470:	5e                   	pop    %esi
 471:	5f                   	pop    %edi
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <lock_init>:

void lock_init(lock_t *lock)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 48a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 490:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
    __asm__ volatile
 4a5:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	53                   	push   %ebx
 4ad:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 4b0:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 4b4:	31 db                	xor    %ebx,%ebx
 4b6:	83 c2 04             	add    $0x4,%edx
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c0:	89 d8                	mov    %ebx,%eax
 4c2:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 4c6:	39 c1                	cmp    %eax,%ecx
 4c8:	75 f6                	jne    4c0 <lock_acquire+0x20>
}
 4ca:	5b                   	pop    %ebx
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
 4cd:	8d 76 00             	lea    0x0(%esi),%esi

000004d0 <lock_release>:

void lock_release(lock_t *lock){
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 4da:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4e0:	b8 01 00 00 00       	mov    $0x1,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <exit>:
SYSCALL(exit)
 4e8:	b8 02 00 00 00       	mov    $0x2,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <wait>:
SYSCALL(wait)
 4f0:	b8 03 00 00 00       	mov    $0x3,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <pipe>:
SYSCALL(pipe)
 4f8:	b8 04 00 00 00       	mov    $0x4,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <read>:
SYSCALL(read)
 500:	b8 06 00 00 00       	mov    $0x6,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <write>:
SYSCALL(write)
 508:	b8 05 00 00 00       	mov    $0x5,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <close>:
SYSCALL(close)
 510:	b8 07 00 00 00       	mov    $0x7,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <kill>:
SYSCALL(kill)
 518:	b8 08 00 00 00       	mov    $0x8,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <exec>:
SYSCALL(exec)
 520:	b8 09 00 00 00       	mov    $0x9,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <open>:
SYSCALL(open)
 528:	b8 0a 00 00 00       	mov    $0xa,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <mknod>:
SYSCALL(mknod)
 530:	b8 0b 00 00 00       	mov    $0xb,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <unlink>:
SYSCALL(unlink)
 538:	b8 0c 00 00 00       	mov    $0xc,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <fstat>:
SYSCALL(fstat)
 540:	b8 0d 00 00 00       	mov    $0xd,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <link>:
SYSCALL(link)
 548:	b8 0e 00 00 00       	mov    $0xe,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <mkdir>:
SYSCALL(mkdir)
 550:	b8 0f 00 00 00       	mov    $0xf,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <chdir>:
SYSCALL(chdir)
 558:	b8 10 00 00 00       	mov    $0x10,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <dup>:
SYSCALL(dup)
 560:	b8 11 00 00 00       	mov    $0x11,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <getpid>:
SYSCALL(getpid)
 568:	b8 12 00 00 00       	mov    $0x12,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <sbrk>:
SYSCALL(sbrk)
 570:	b8 13 00 00 00       	mov    $0x13,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <sleep>:
SYSCALL(sleep)
 578:	b8 14 00 00 00       	mov    $0x14,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <uptime>:
SYSCALL(uptime)
 580:	b8 15 00 00 00       	mov    $0x15,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <clone>:
SYSCALL(clone)
 588:	b8 16 00 00 00       	mov    $0x16,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <join>:
SYSCALL(join) 
 590:	b8 17 00 00 00       	mov    $0x17,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    
 598:	66 90                	xchg   %ax,%ax
 59a:	66 90                	xchg   %ax,%ax
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 10 0a 00 00 	movzbl 0xa10(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 e3 fe ff ff       	call   508 <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
    putc(fd, buf[i]);
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	57                   	push   %edi
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 65d:	8b 75 0c             	mov    0xc(%ebp),%esi
 660:	0f b6 1e             	movzbl (%esi),%ebx
 663:	84 db                	test   %bl,%bl
 665:	0f 84 b4 00 00 00    	je     71f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 66b:	8d 45 10             	lea    0x10(%ebp),%eax
 66e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 671:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 674:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 676:	89 45 d0             	mov    %eax,-0x30(%ebp)
 679:	eb 33                	jmp    6ae <printf+0x5e>
 67b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
 680:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 17                	je     6a4 <printf+0x54>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 5d e7             	mov    %bl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	ff 75 08             	pushl  0x8(%ebp)
 699:	e8 6a fe ff ff       	call   508 <write>
 69e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a4:	0f b6 1e             	movzbl (%esi),%ebx
 6a7:	83 c6 01             	add    $0x1,%esi
 6aa:	84 db                	test   %bl,%bl
 6ac:	74 71                	je     71f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ae:	0f be cb             	movsbl %bl,%ecx
 6b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6b4:	85 d2                	test   %edx,%edx
 6b6:	74 c8                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b8:	83 fa 25             	cmp    $0x25,%edx
 6bb:	75 e7                	jne    6a4 <printf+0x54>
      if(c == 'd'){
 6bd:	83 f8 64             	cmp    $0x64,%eax
 6c0:	0f 84 9a 00 00 00    	je     760 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6cc:	83 f9 70             	cmp    $0x70,%ecx
 6cf:	74 5f                	je     730 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6d1:	83 f8 73             	cmp    $0x73,%eax
 6d4:	0f 84 d6 00 00 00    	je     7b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6da:	83 f8 63             	cmp    $0x63,%eax
 6dd:	0f 84 8d 00 00 00    	je     770 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6e3:	83 f8 25             	cmp    $0x25,%eax
 6e6:	0f 84 b4 00 00 00    	je     7a0 <printf+0x150>
  write(fd, &c, 1);
 6ec:	83 ec 04             	sub    $0x4,%esp
 6ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6f3:	6a 01                	push   $0x1
 6f5:	57                   	push   %edi
 6f6:	ff 75 08             	pushl  0x8(%ebp)
 6f9:	e8 0a fe ff ff       	call   508 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 701:	83 c4 0c             	add    $0xc,%esp
 704:	6a 01                	push   $0x1
 706:	83 c6 01             	add    $0x1,%esi
 709:	57                   	push   %edi
 70a:	ff 75 08             	pushl  0x8(%ebp)
 70d:	e8 f6 fd ff ff       	call   508 <write>
  for(i = 0; fmt[i]; i++){
 712:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 716:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 719:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 71b:	84 db                	test   %bl,%bl
 71d:	75 8f                	jne    6ae <printf+0x5e>
    }
  }
}
 71f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5f                   	pop    %edi
 725:	5d                   	pop    %ebp
 726:	c3                   	ret    
 727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	6a 00                	push   $0x0
 73a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	8b 13                	mov    (%ebx),%edx
 742:	e8 59 fe ff ff       	call   5a0 <printint>
        ap++;
 747:	89 d8                	mov    %ebx,%eax
 749:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74c:	31 d2                	xor    %edx,%edx
        ap++;
 74e:	83 c0 04             	add    $0x4,%eax
 751:	89 45 d0             	mov    %eax,-0x30(%ebp)
 754:	e9 4b ff ff ff       	jmp    6a4 <printf+0x54>
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	eb ce                	jmp    73a <printf+0xea>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 770:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 776:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 778:	6a 01                	push   $0x1
        ap++;
 77a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 77d:	57                   	push   %edi
 77e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 781:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 784:	e8 7f fd ff ff       	call   508 <write>
        ap++;
 789:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 78c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 0e ff ff ff       	jmp    6a4 <printf+0x54>
 796:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
 7a6:	e9 59 ff ff ff       	jmp    704 <printf+0xb4>
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
        s = (char*)*ap;
 7b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7b5:	83 c0 04             	add    $0x4,%eax
 7b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7bb:	85 db                	test   %ebx,%ebx
 7bd:	74 17                	je     7d6 <printf+0x186>
        while(*s != 0){
 7bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7c4:	84 c0                	test   %al,%al
 7c6:	0f 84 d8 fe ff ff    	je     6a4 <printf+0x54>
 7cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7cf:	89 de                	mov    %ebx,%esi
 7d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d4:	eb 1a                	jmp    7f0 <printf+0x1a0>
          s = "(null)";
 7d6:	bb 08 0a 00 00       	mov    $0xa08,%ebx
        while(*s != 0){
 7db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7de:	b8 28 00 00 00       	mov    $0x28,%eax
 7e3:	89 de                	mov    %ebx,%esi
 7e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7f3:	83 c6 01             	add    $0x1,%esi
 7f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7f9:	6a 01                	push   $0x1
 7fb:	57                   	push   %edi
 7fc:	53                   	push   %ebx
 7fd:	e8 06 fd ff ff       	call   508 <write>
        while(*s != 0){
 802:	0f b6 06             	movzbl (%esi),%eax
 805:	83 c4 10             	add    $0x10,%esp
 808:	84 c0                	test   %al,%al
 80a:	75 e4                	jne    7f0 <printf+0x1a0>
 80c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 80f:	31 d2                	xor    %edx,%edx
 811:	e9 8e fe ff ff       	jmp    6a4 <printf+0x54>
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 825:	a1 80 0d 00 00       	mov    0xd80,%eax
{
 82a:	89 e5                	mov    %esp,%ebp
 82c:	57                   	push   %edi
 82d:	56                   	push   %esi
 82e:	53                   	push   %ebx
 82f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 832:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 834:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 837:	39 c8                	cmp    %ecx,%eax
 839:	73 15                	jae    850 <free+0x30>
 83b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
 840:	39 d1                	cmp    %edx,%ecx
 842:	72 14                	jb     858 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	39 d0                	cmp    %edx,%eax
 846:	73 10                	jae    858 <free+0x38>
{
 848:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	8b 10                	mov    (%eax),%edx
 84c:	39 c8                	cmp    %ecx,%eax
 84e:	72 f0                	jb     840 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 850:	39 d0                	cmp    %edx,%eax
 852:	72 f4                	jb     848 <free+0x28>
 854:	39 d1                	cmp    %edx,%ecx
 856:	73 f0                	jae    848 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 858:	8b 73 fc             	mov    -0x4(%ebx),%esi
 85b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 85e:	39 fa                	cmp    %edi,%edx
 860:	74 1e                	je     880 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 862:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 865:	8b 50 04             	mov    0x4(%eax),%edx
 868:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 86b:	39 f1                	cmp    %esi,%ecx
 86d:	74 28                	je     897 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 86f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 871:	5b                   	pop    %ebx
  freep = p;
 872:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 877:	5e                   	pop    %esi
 878:	5f                   	pop    %edi
 879:	5d                   	pop    %ebp
 87a:	c3                   	ret    
 87b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 880:	03 72 04             	add    0x4(%edx),%esi
 883:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 886:	8b 10                	mov    (%eax),%edx
 888:	8b 12                	mov    (%edx),%edx
 88a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 88d:	8b 50 04             	mov    0x4(%eax),%edx
 890:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 893:	39 f1                	cmp    %esi,%ecx
 895:	75 d8                	jne    86f <free+0x4f>
    p->s.size += bp->s.size;
 897:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 89a:	a3 80 0d 00 00       	mov    %eax,0xd80
    p->s.size += bp->s.size;
 89f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a5:	89 10                	mov    %edx,(%eax)
}
 8a7:	5b                   	pop    %ebx
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8b0:	f3 0f 1e fb          	endbr32 
 8b4:	55                   	push   %ebp
 8b5:	89 e5                	mov    %esp,%ebp
 8b7:	57                   	push   %edi
 8b8:	56                   	push   %esi
 8b9:	53                   	push   %ebx
 8ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8c0:	8b 3d 80 0d 00 00    	mov    0xd80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c6:	8d 70 07             	lea    0x7(%eax),%esi
 8c9:	c1 ee 03             	shr    $0x3,%esi
 8cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8cf:	85 ff                	test   %edi,%edi
 8d1:	0f 84 a9 00 00 00    	je     980 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8d9:	8b 48 04             	mov    0x4(%eax),%ecx
 8dc:	39 f1                	cmp    %esi,%ecx
 8de:	73 6d                	jae    94d <malloc+0x9d>
 8e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8f8:	eb 17                	jmp    911 <malloc+0x61>
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 900:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 902:	8b 4a 04             	mov    0x4(%edx),%ecx
 905:	39 f1                	cmp    %esi,%ecx
 907:	73 4f                	jae    958 <malloc+0xa8>
 909:	8b 3d 80 0d 00 00    	mov    0xd80,%edi
 90f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 911:	39 c7                	cmp    %eax,%edi
 913:	75 eb                	jne    900 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 915:	83 ec 0c             	sub    $0xc,%esp
 918:	ff 75 e4             	pushl  -0x1c(%ebp)
 91b:	e8 50 fc ff ff       	call   570 <sbrk>
  if(p == (char*)-1)
 920:	83 c4 10             	add    $0x10,%esp
 923:	83 f8 ff             	cmp    $0xffffffff,%eax
 926:	74 1b                	je     943 <malloc+0x93>
  hp->s.size = nu;
 928:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	83 c0 08             	add    $0x8,%eax
 931:	50                   	push   %eax
 932:	e8 e9 fe ff ff       	call   820 <free>
  return freep;
 937:	a1 80 0d 00 00       	mov    0xd80,%eax
      if((p = morecore(nunits)) == 0)
 93c:	83 c4 10             	add    $0x10,%esp
 93f:	85 c0                	test   %eax,%eax
 941:	75 bd                	jne    900 <malloc+0x50>
        return 0;
  }
}
 943:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 946:	31 c0                	xor    %eax,%eax
}
 948:	5b                   	pop    %ebx
 949:	5e                   	pop    %esi
 94a:	5f                   	pop    %edi
 94b:	5d                   	pop    %ebp
 94c:	c3                   	ret    
    if(p->s.size >= nunits){
 94d:	89 c2                	mov    %eax,%edx
 94f:	89 f8                	mov    %edi,%eax
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 958:	39 ce                	cmp    %ecx,%esi
 95a:	74 54                	je     9b0 <malloc+0x100>
        p->s.size -= nunits;
 95c:	29 f1                	sub    %esi,%ecx
 95e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 961:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 964:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 967:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 96f:	8d 42 08             	lea    0x8(%edx),%eax
}
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
 977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 987:	0d 00 00 
    base.s.size = 0;
 98a:	bf 84 0d 00 00       	mov    $0xd84,%edi
    base.s.ptr = freep = prevp = &base;
 98f:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 996:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 999:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 99b:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 9a2:	00 00 00 
    if(p->s.size >= nunits){
 9a5:	e9 36 ff ff ff       	jmp    8e0 <malloc+0x30>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9b0:	8b 0a                	mov    (%edx),%ecx
 9b2:	89 08                	mov    %ecx,(%eax)
 9b4:	eb b1                	jmp    967 <malloc+0xb7>
