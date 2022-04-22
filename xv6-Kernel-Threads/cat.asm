
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 50                	jle    7d <main+0x7d>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 0c 05 00 00       	call   548 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 d4 04 00 00       	call   530 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 9f 04 00 00       	call   508 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 fb 09 00 00       	push   $0x9fb
  71:	6a 01                	push   $0x1
  73:	e8 f8 05 00 00       	call   670 <printf>
      exit();
  78:	e8 8b 04 00 00       	call   508 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 7c 04 00 00       	call   508 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	56                   	push   %esi
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  9b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9c:	eb 19                	jmp    b7 <cat+0x27>
  9e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 e0 0d 00 00       	push   $0xde0
  a9:	6a 01                	push   $0x1
  ab:	e8 78 04 00 00       	call   528 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 e0 0d 00 00       	push   $0xde0
  c4:	56                   	push   %esi
  c5:	e8 56 04 00 00       	call   520 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 d8 09 00 00       	push   $0x9d8
  e4:	6a 01                	push   $0x1
  e6:	e8 85 05 00 00       	call   670 <printf>
      exit();
  eb:	e8 18 04 00 00       	call   508 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 ea 09 00 00       	push   $0x9ea
  f7:	6a 01                	push   $0x1
  f9:	e8 72 05 00 00       	call   670 <printf>
    exit();
  fe:	e8 05 04 00 00       	call   508 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 115:	31 c0                	xor    %eax,%eax
{
 117:	89 e5                	mov    %esp,%ebp
 119:	53                   	push   %ebx
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14e:	0f b6 01             	movzbl (%ecx),%eax
 151:	0f b6 1a             	movzbl (%edx),%ebx
 154:	84 c0                	test   %al,%al
 156:	75 19                	jne    171 <strcmp+0x31>
 158:	eb 26                	jmp    180 <strcmp+0x40>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 3a 00             	cmpb   $0x0,(%edx)
 19d:	74 21                	je     1c0 <strlen+0x30>
 19f:	31 c0                	xor    %eax,%eax
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1af:	89 c1                	mov    %eax,%ecx
 1b1:	75 f5                	jne    1a8 <strlen+0x18>
    ;
  return n;
}
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 d7                	mov    %edx,%edi
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	0f b6 10             	movzbl (%eax),%edx
 201:	84 d2                	test   %dl,%dl
 203:	75 16                	jne    21b <strchr+0x2b>
 205:	eb 21                	jmp    228 <strchr+0x38>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 f6                	xor    %esi,%esi
{
 23b:	53                   	push   %ebx
 23c:	89 f3                	mov    %esi,%ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
 241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 244:	eb 33                	jmp    279 <gets+0x49>
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 45 e7             	lea    -0x19(%ebp),%eax
 256:	6a 01                	push   $0x1
 258:	50                   	push   %eax
 259:	6a 00                	push   $0x0
 25b:	e8 c0 02 00 00       	call   520 <read>
    if(cc < 1)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	7e 1c                	jle    283 <gets+0x53>
      break;
    buf[i++] = c;
 267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26b:	83 c7 01             	add    $0x1,%edi
 26e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 23                	je     298 <gets+0x68>
 275:	3c 0d                	cmp    $0xd,%al
 277:	74 1f                	je     298 <gets+0x68>
  for(i=0; i+1 < max; ){
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	89 fe                	mov    %edi,%esi
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7c cd                	jl     250 <gets+0x20>
 283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 288:	c6 03 00             	movb   $0x0,(%ebx)
}
 28b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5f                   	pop    %edi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	8b 75 08             	mov    0x8(%ebp),%esi
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	01 de                	add    %ebx,%esi
 2a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 82 02 00 00       	call   548 <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 2b                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2cd:	83 ec 08             	sub    $0x8,%esp
 2d0:	ff 75 0c             	pushl  0xc(%ebp)
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	50                   	push   %eax
 2d6:	e8 85 02 00 00       	call   560 <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 4b 02 00 00       	call   530 <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb e9                	jmp    2e8 <stat+0x38>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	53                   	push   %ebx
 308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30b:	0f be 02             	movsbl (%edx),%eax
 30e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 319:	77 1a                	ja     335 <atoi+0x35>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	89 c8                	mov    %ecx,%eax
 337:	5b                   	pop    %ebx
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
 34e:	56                   	push   %esi
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 0f                	jle    365 <memmove+0x25>
 356:	01 d0                	add    %edx,%eax
  dst = vdst;
 358:	89 d7                	mov    %edx,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 37b:	68 00 20 00 00       	push   $0x2000
 380:	e8 4b 05 00 00       	call   8d0 <malloc>
  void* stack;
  if(freeptr == 0)
 385:	83 c4 10             	add    $0x10,%esp
 388:	85 c0                	test   %eax,%eax
 38a:	74 6e                	je     3fa <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 38c:	89 c2                	mov    %eax,%edx
 38e:	89 c3                	mov    %eax,%ebx
 390:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 396:	75 58                	jne    3f0 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 398:	b9 e0 0f 00 00       	mov    $0xfe0,%ecx
 39d:	31 d2                	xor    %edx,%edx
 39f:	eb 12                	jmp    3b3 <thread_create+0x43>
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	83 c2 01             	add    $0x1,%edx
 3ab:	83 c1 0c             	add    $0xc,%ecx
 3ae:	83 fa 40             	cmp    $0x40,%edx
 3b1:	74 21                	je     3d4 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 3b3:	83 39 00             	cmpl   $0x0,(%ecx)
 3b6:	75 f0                	jne    3a8 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 3b8:	8d 14 52             	lea    (%edx,%edx,2),%edx
 3bb:	c1 e2 02             	shl    $0x2,%edx
 3be:	89 82 e4 0f 00 00    	mov    %eax,0xfe4(%edx)
      ptrs[i].stack = stack;
 3c4:	89 9a e8 0f 00 00    	mov    %ebx,0xfe8(%edx)
      ptrs[i].busy = 1;
 3ca:	c7 82 e0 0f 00 00 01 	movl   $0x1,0xfe0(%edx)
 3d1:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 3d4:	53                   	push   %ebx
 3d5:	ff 75 10             	pushl  0x10(%ebp)
 3d8:	ff 75 0c             	pushl  0xc(%ebp)
 3db:	ff 75 08             	pushl  0x8(%ebp)
 3de:	e8 c5 01 00 00       	call   5a8 <clone>
 3e3:	83 c4 10             	add    $0x10,%esp
}
 3e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e9:	c9                   	leave  
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 3f0:	29 d3                	sub    %edx,%ebx
 3f2:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 3f8:	eb 9e                	jmp    398 <thread_create+0x28>
    return -1;
 3fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ff:	eb e5                	jmp    3e6 <thread_create+0x76>
 401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <thread_join>:

int thread_join()
{
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	57                   	push   %edi
 418:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 419:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 41c:	53                   	push   %ebx
 41d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 420:	50                   	push   %eax
 421:	e8 8a 01 00 00       	call   5b0 <join>
 426:	ba e0 0f 00 00       	mov    $0xfe0,%edx
 42b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 42e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 430:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 432:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 435:	eb 14                	jmp    44b <thread_join+0x3b>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 440:	83 c1 01             	add    $0x1,%ecx
 443:	83 c2 0c             	add    $0xc,%edx
 446:	83 f9 40             	cmp    $0x40,%ecx
 449:	74 3f                	je     48a <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 44b:	83 3a 01             	cmpl   $0x1,(%edx)
 44e:	75 f0                	jne    440 <thread_join+0x30>
 450:	39 42 08             	cmp    %eax,0x8(%edx)
 453:	75 eb                	jne    440 <thread_join+0x30>
      free(ptrs[i].ptr);
 455:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 458:	83 ec 0c             	sub    $0xc,%esp
 45b:	c1 e6 02             	shl    $0x2,%esi
 45e:	ff b6 e4 0f 00 00    	pushl  0xfe4(%esi)
 464:	e8 d7 03 00 00       	call   840 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 469:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 46c:	c7 86 e8 0f 00 00 00 	movl   $0x0,0xfe8(%esi)
 473:	00 00 00 
      ptrs[i].busy = 0;
 476:	c7 86 e0 0f 00 00 00 	movl   $0x0,0xfe0(%esi)
 47d:	00 00 00 
      ptrs[i].ptr = NULL;
 480:	c7 86 e4 0f 00 00 00 	movl   $0x0,0xfe4(%esi)
 487:	00 00 00 
    }
  }
  return ret;  
}
 48a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48d:	89 d8                	mov    %ebx,%eax
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5f                   	pop    %edi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
 494:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <lock_init>:

void lock_init(lock_t *lock)
{
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 4aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 4b0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 4b7:	5d                   	pop    %ebp
 4b8:	c3                   	ret    
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4c0:	f3 0f 1e fb          	endbr32 
 4c4:	55                   	push   %ebp
    __asm__ volatile
 4c5:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	53                   	push   %ebx
 4cd:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 4d0:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 4d4:	31 db                	xor    %ebx,%ebx
 4d6:	83 c2 04             	add    $0x4,%edx
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e0:	89 d8                	mov    %ebx,%eax
 4e2:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 4e6:	39 c1                	cmp    %eax,%ecx
 4e8:	75 f6                	jne    4e0 <lock_acquire+0x20>
}
 4ea:	5b                   	pop    %ebx
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <lock_release>:

void lock_release(lock_t *lock){
 4f0:	f3 0f 1e fb          	endbr32 
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 4fa:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

00000500 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 500:	b8 01 00 00 00       	mov    $0x1,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <exit>:
SYSCALL(exit)
 508:	b8 02 00 00 00       	mov    $0x2,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <wait>:
SYSCALL(wait)
 510:	b8 03 00 00 00       	mov    $0x3,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <pipe>:
SYSCALL(pipe)
 518:	b8 04 00 00 00       	mov    $0x4,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <read>:
SYSCALL(read)
 520:	b8 06 00 00 00       	mov    $0x6,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <write>:
SYSCALL(write)
 528:	b8 05 00 00 00       	mov    $0x5,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <close>:
SYSCALL(close)
 530:	b8 07 00 00 00       	mov    $0x7,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <kill>:
SYSCALL(kill)
 538:	b8 08 00 00 00       	mov    $0x8,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <exec>:
SYSCALL(exec)
 540:	b8 09 00 00 00       	mov    $0x9,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <open>:
SYSCALL(open)
 548:	b8 0a 00 00 00       	mov    $0xa,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <mknod>:
SYSCALL(mknod)
 550:	b8 0b 00 00 00       	mov    $0xb,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <unlink>:
SYSCALL(unlink)
 558:	b8 0c 00 00 00       	mov    $0xc,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <fstat>:
SYSCALL(fstat)
 560:	b8 0d 00 00 00       	mov    $0xd,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <link>:
SYSCALL(link)
 568:	b8 0e 00 00 00       	mov    $0xe,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <mkdir>:
SYSCALL(mkdir)
 570:	b8 0f 00 00 00       	mov    $0xf,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <chdir>:
SYSCALL(chdir)
 578:	b8 10 00 00 00       	mov    $0x10,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <dup>:
SYSCALL(dup)
 580:	b8 11 00 00 00       	mov    $0x11,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <getpid>:
SYSCALL(getpid)
 588:	b8 12 00 00 00       	mov    $0x12,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <sbrk>:
SYSCALL(sbrk)
 590:	b8 13 00 00 00       	mov    $0x13,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <sleep>:
SYSCALL(sleep)
 598:	b8 14 00 00 00       	mov    $0x14,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <uptime>:
SYSCALL(uptime)
 5a0:	b8 15 00 00 00       	mov    $0x15,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <clone>:
SYSCALL(clone)
 5a8:	b8 16 00 00 00       	mov    $0x16,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <join>:
SYSCALL(join) 
 5b0:	b8 17 00 00 00       	mov    $0x17,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    
 5b8:	66 90                	xchg   %ax,%ax
 5ba:	66 90                	xchg   %ax,%ax
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 3c             	sub    $0x3c,%esp
 5c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5cc:	89 d1                	mov    %edx,%ecx
{
 5ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5d1:	85 d2                	test   %edx,%edx
 5d3:	0f 89 7f 00 00 00    	jns    658 <printint+0x98>
 5d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5dd:	74 79                	je     658 <printint+0x98>
    neg = 1;
 5df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5e8:	31 db                	xor    %ebx,%ebx
 5ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5f0:	89 c8                	mov    %ecx,%eax
 5f2:	31 d2                	xor    %edx,%edx
 5f4:	89 cf                	mov    %ecx,%edi
 5f6:	f7 75 c4             	divl   -0x3c(%ebp)
 5f9:	0f b6 92 18 0a 00 00 	movzbl 0xa18(%edx),%edx
 600:	89 45 c0             	mov    %eax,-0x40(%ebp)
 603:	89 d8                	mov    %ebx,%eax
 605:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 608:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 60b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 60e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 611:	76 dd                	jbe    5f0 <printint+0x30>
  if(neg)
 613:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 616:	85 c9                	test   %ecx,%ecx
 618:	74 0c                	je     626 <printint+0x66>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 61f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 621:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 626:	8b 7d b8             	mov    -0x48(%ebp),%edi
 629:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 62d:	eb 07                	jmp    636 <printint+0x76>
 62f:	90                   	nop
 630:	0f b6 13             	movzbl (%ebx),%edx
 633:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 636:	83 ec 04             	sub    $0x4,%esp
 639:	88 55 d7             	mov    %dl,-0x29(%ebp)
 63c:	6a 01                	push   $0x1
 63e:	56                   	push   %esi
 63f:	57                   	push   %edi
 640:	e8 e3 fe ff ff       	call   528 <write>
  while(--i >= 0)
 645:	83 c4 10             	add    $0x10,%esp
 648:	39 de                	cmp    %ebx,%esi
 64a:	75 e4                	jne    630 <printint+0x70>
    putc(fd, buf[i]);
}
 64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 658:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 65f:	eb 87                	jmp    5e8 <printint+0x28>
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop

00000670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	57                   	push   %edi
 678:	56                   	push   %esi
 679:	53                   	push   %ebx
 67a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 67d:	8b 75 0c             	mov    0xc(%ebp),%esi
 680:	0f b6 1e             	movzbl (%esi),%ebx
 683:	84 db                	test   %bl,%bl
 685:	0f 84 b4 00 00 00    	je     73f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 68b:	8d 45 10             	lea    0x10(%ebp),%eax
 68e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 691:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 694:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 696:	89 45 d0             	mov    %eax,-0x30(%ebp)
 699:	eb 33                	jmp    6ce <printf+0x5e>
 69b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
 6a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	74 17                	je     6c4 <printf+0x54>
  write(fd, &c, 1);
 6ad:	83 ec 04             	sub    $0x4,%esp
 6b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6b3:	6a 01                	push   $0x1
 6b5:	57                   	push   %edi
 6b6:	ff 75 08             	pushl  0x8(%ebp)
 6b9:	e8 6a fe ff ff       	call   528 <write>
 6be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c4:	0f b6 1e             	movzbl (%esi),%ebx
 6c7:	83 c6 01             	add    $0x1,%esi
 6ca:	84 db                	test   %bl,%bl
 6cc:	74 71                	je     73f <printf+0xcf>
    c = fmt[i] & 0xff;
 6ce:	0f be cb             	movsbl %bl,%ecx
 6d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6d4:	85 d2                	test   %edx,%edx
 6d6:	74 c8                	je     6a0 <printf+0x30>
      }
    } else if(state == '%'){
 6d8:	83 fa 25             	cmp    $0x25,%edx
 6db:	75 e7                	jne    6c4 <printf+0x54>
      if(c == 'd'){
 6dd:	83 f8 64             	cmp    $0x64,%eax
 6e0:	0f 84 9a 00 00 00    	je     780 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ec:	83 f9 70             	cmp    $0x70,%ecx
 6ef:	74 5f                	je     750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f1:	83 f8 73             	cmp    $0x73,%eax
 6f4:	0f 84 d6 00 00 00    	je     7d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fa:	83 f8 63             	cmp    $0x63,%eax
 6fd:	0f 84 8d 00 00 00    	je     790 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 703:	83 f8 25             	cmp    $0x25,%eax
 706:	0f 84 b4 00 00 00    	je     7c0 <printf+0x150>
  write(fd, &c, 1);
 70c:	83 ec 04             	sub    $0x4,%esp
 70f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 713:	6a 01                	push   $0x1
 715:	57                   	push   %edi
 716:	ff 75 08             	pushl  0x8(%ebp)
 719:	e8 0a fe ff ff       	call   528 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 71e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 721:	83 c4 0c             	add    $0xc,%esp
 724:	6a 01                	push   $0x1
 726:	83 c6 01             	add    $0x1,%esi
 729:	57                   	push   %edi
 72a:	ff 75 08             	pushl  0x8(%ebp)
 72d:	e8 f6 fd ff ff       	call   528 <write>
  for(i = 0; fmt[i]; i++){
 732:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 736:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 739:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 73b:	84 db                	test   %bl,%bl
 73d:	75 8f                	jne    6ce <printf+0x5e>
    }
  }
}
 73f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 742:	5b                   	pop    %ebx
 743:	5e                   	pop    %esi
 744:	5f                   	pop    %edi
 745:	5d                   	pop    %ebp
 746:	c3                   	ret    
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 10 00 00 00       	mov    $0x10,%ecx
 758:	6a 00                	push   $0x0
 75a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	8b 13                	mov    (%ebx),%edx
 762:	e8 59 fe ff ff       	call   5c0 <printint>
        ap++;
 767:	89 d8                	mov    %ebx,%eax
 769:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76c:	31 d2                	xor    %edx,%edx
        ap++;
 76e:	83 c0 04             	add    $0x4,%eax
 771:	89 45 d0             	mov    %eax,-0x30(%ebp)
 774:	e9 4b ff ff ff       	jmp    6c4 <printf+0x54>
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 0a 00 00 00       	mov    $0xa,%ecx
 788:	6a 01                	push   $0x1
 78a:	eb ce                	jmp    75a <printf+0xea>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 790:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 796:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
        ap++;
 79a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 79d:	57                   	push   %edi
 79e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7a4:	e8 7f fd ff ff       	call   528 <write>
        ap++;
 7a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 0e ff ff ff       	jmp    6c4 <printf+0x54>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7c3:	83 ec 04             	sub    $0x4,%esp
 7c6:	e9 59 ff ff ff       	jmp    724 <printf+0xb4>
 7cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
        s = (char*)*ap;
 7d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7d5:	83 c0 04             	add    $0x4,%eax
 7d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7db:	85 db                	test   %ebx,%ebx
 7dd:	74 17                	je     7f6 <printf+0x186>
        while(*s != 0){
 7df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7e4:	84 c0                	test   %al,%al
 7e6:	0f 84 d8 fe ff ff    	je     6c4 <printf+0x54>
 7ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ef:	89 de                	mov    %ebx,%esi
 7f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7f4:	eb 1a                	jmp    810 <printf+0x1a0>
          s = "(null)";
 7f6:	bb 10 0a 00 00       	mov    $0xa10,%ebx
        while(*s != 0){
 7fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7fe:	b8 28 00 00 00       	mov    $0x28,%eax
 803:	89 de                	mov    %ebx,%esi
 805:	8b 5d 08             	mov    0x8(%ebp),%ebx
 808:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
  write(fd, &c, 1);
 810:	83 ec 04             	sub    $0x4,%esp
          s++;
 813:	83 c6 01             	add    $0x1,%esi
 816:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 819:	6a 01                	push   $0x1
 81b:	57                   	push   %edi
 81c:	53                   	push   %ebx
 81d:	e8 06 fd ff ff       	call   528 <write>
        while(*s != 0){
 822:	0f b6 06             	movzbl (%esi),%eax
 825:	83 c4 10             	add    $0x10,%esp
 828:	84 c0                	test   %al,%al
 82a:	75 e4                	jne    810 <printf+0x1a0>
 82c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 8e fe ff ff       	jmp    6c4 <printf+0x54>
 836:	66 90                	xchg   %ax,%ax
 838:	66 90                	xchg   %ax,%ax
 83a:	66 90                	xchg   %ax,%ax
 83c:	66 90                	xchg   %ax,%ax
 83e:	66 90                	xchg   %ax,%ax

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	f3 0f 1e fb          	endbr32 
 844:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 845:	a1 c0 0d 00 00       	mov    0xdc0,%eax
{
 84a:	89 e5                	mov    %esp,%ebp
 84c:	57                   	push   %edi
 84d:	56                   	push   %esi
 84e:	53                   	push   %ebx
 84f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 852:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 854:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 857:	39 c8                	cmp    %ecx,%eax
 859:	73 15                	jae    870 <free+0x30>
 85b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
 860:	39 d1                	cmp    %edx,%ecx
 862:	72 14                	jb     878 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 864:	39 d0                	cmp    %edx,%eax
 866:	73 10                	jae    878 <free+0x38>
{
 868:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	8b 10                	mov    (%eax),%edx
 86c:	39 c8                	cmp    %ecx,%eax
 86e:	72 f0                	jb     860 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	39 d0                	cmp    %edx,%eax
 872:	72 f4                	jb     868 <free+0x28>
 874:	39 d1                	cmp    %edx,%ecx
 876:	73 f0                	jae    868 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 878:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87e:	39 fa                	cmp    %edi,%edx
 880:	74 1e                	je     8a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 882:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 885:	8b 50 04             	mov    0x4(%eax),%edx
 888:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 88b:	39 f1                	cmp    %esi,%ecx
 88d:	74 28                	je     8b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 88f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 891:	5b                   	pop    %ebx
  freep = p;
 892:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 897:	5e                   	pop    %esi
 898:	5f                   	pop    %edi
 899:	5d                   	pop    %ebp
 89a:	c3                   	ret    
 89b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 8a0:	03 72 04             	add    0x4(%edx),%esi
 8a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a6:	8b 10                	mov    (%eax),%edx
 8a8:	8b 12                	mov    (%edx),%edx
 8aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b3:	39 f1                	cmp    %esi,%ecx
 8b5:	75 d8                	jne    88f <free+0x4f>
    p->s.size += bp->s.size;
 8b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ba:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    p->s.size += bp->s.size;
 8bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8c5:	89 10                	mov    %edx,(%eax)
}
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	f3 0f 1e fb          	endbr32 
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	57                   	push   %edi
 8d8:	56                   	push   %esi
 8d9:	53                   	push   %ebx
 8da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8e0:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e6:	8d 70 07             	lea    0x7(%eax),%esi
 8e9:	c1 ee 03             	shr    $0x3,%esi
 8ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8ef:	85 ff                	test   %edi,%edi
 8f1:	0f 84 a9 00 00 00    	je     9a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8f9:	8b 48 04             	mov    0x4(%eax),%ecx
 8fc:	39 f1                	cmp    %esi,%ecx
 8fe:	73 6d                	jae    96d <malloc+0x9d>
 900:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 906:	bb 00 10 00 00       	mov    $0x1000,%ebx
 90b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 90e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 915:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 918:	eb 17                	jmp    931 <malloc+0x61>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 920:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 922:	8b 4a 04             	mov    0x4(%edx),%ecx
 925:	39 f1                	cmp    %esi,%ecx
 927:	73 4f                	jae    978 <malloc+0xa8>
 929:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
 92f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 931:	39 c7                	cmp    %eax,%edi
 933:	75 eb                	jne    920 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 935:	83 ec 0c             	sub    $0xc,%esp
 938:	ff 75 e4             	pushl  -0x1c(%ebp)
 93b:	e8 50 fc ff ff       	call   590 <sbrk>
  if(p == (char*)-1)
 940:	83 c4 10             	add    $0x10,%esp
 943:	83 f8 ff             	cmp    $0xffffffff,%eax
 946:	74 1b                	je     963 <malloc+0x93>
  hp->s.size = nu;
 948:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 94b:	83 ec 0c             	sub    $0xc,%esp
 94e:	83 c0 08             	add    $0x8,%eax
 951:	50                   	push   %eax
 952:	e8 e9 fe ff ff       	call   840 <free>
  return freep;
 957:	a1 c0 0d 00 00       	mov    0xdc0,%eax
      if((p = morecore(nunits)) == 0)
 95c:	83 c4 10             	add    $0x10,%esp
 95f:	85 c0                	test   %eax,%eax
 961:	75 bd                	jne    920 <malloc+0x50>
        return 0;
  }
}
 963:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 966:	31 c0                	xor    %eax,%eax
}
 968:	5b                   	pop    %ebx
 969:	5e                   	pop    %esi
 96a:	5f                   	pop    %edi
 96b:	5d                   	pop    %ebp
 96c:	c3                   	ret    
    if(p->s.size >= nunits){
 96d:	89 c2                	mov    %eax,%edx
 96f:	89 f8                	mov    %edi,%eax
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 978:	39 ce                	cmp    %ecx,%esi
 97a:	74 54                	je     9d0 <malloc+0x100>
        p->s.size -= nunits;
 97c:	29 f1                	sub    %esi,%ecx
 97e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 981:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 984:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 987:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 98c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 98f:	8d 42 08             	lea    0x8(%edx),%eax
}
 992:	5b                   	pop    %ebx
 993:	5e                   	pop    %esi
 994:	5f                   	pop    %edi
 995:	5d                   	pop    %ebp
 996:	c3                   	ret    
 997:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 9a0:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 9a7:	0d 00 00 
    base.s.size = 0;
 9aa:	bf c4 0d 00 00       	mov    $0xdc4,%edi
    base.s.ptr = freep = prevp = &base;
 9af:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 9b6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9bb:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 9c2:	00 00 00 
    if(p->s.size >= nunits){
 9c5:	e9 36 ff ff ff       	jmp    900 <malloc+0x30>
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 0a                	mov    (%edx),%ecx
 9d2:	89 08                	mov    %ecx,(%eax)
 9d4:	eb b1                	jmp    987 <malloc+0xb7>
