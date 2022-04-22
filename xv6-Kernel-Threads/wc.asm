
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 8c 05 00 00       	call   5c8 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 52 05 00 00       	call   5b0 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 1d 05 00 00       	call   588 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 7b 0a 00 00       	push   $0xa7b
  73:	6a 01                	push   $0x1
  75:	e8 76 06 00 00       	call   6f0 <printf>
      exit();
  7a:	e8 09 05 00 00       	call   588 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 6d 0a 00 00       	push   $0xa6d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 f6 04 00 00       	call   588 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 60 0e 00 00       	push   $0xe60
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 c3 04 00 00       	call   5a0 <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 60 0e 00 00 	movsbl 0xe60(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 58 0a 00 00       	push   $0xa58
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 6e 0a 00 00       	push   $0xa6e
 15c:	6a 01                	push   $0x1
 15e:	e8 8d 05 00 00       	call   6f0 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 5e 0a 00 00       	push   $0xa5e
 175:	6a 01                	push   $0x1
 177:	e8 74 05 00 00       	call   6f0 <printf>
    exit();
 17c:	e8 07 04 00 00       	call   588 <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 c0 02 00 00       	call   5a0 <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 82 02 00 00       	call   5c8 <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 85 02 00 00       	call   5e0 <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 4b 02 00 00       	call   5b0 <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	53                   	push   %ebx
 3f8:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 3fb:	68 00 20 00 00       	push   $0x2000
 400:	e8 4b 05 00 00       	call   950 <malloc>
  void* stack;
  if(freeptr == 0)
 405:	83 c4 10             	add    $0x10,%esp
 408:	85 c0                	test   %eax,%eax
 40a:	74 6e                	je     47a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 40c:	89 c2                	mov    %eax,%edx
 40e:	89 c3                	mov    %eax,%ebx
 410:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 416:	75 58                	jne    470 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 418:	b9 60 10 00 00       	mov    $0x1060,%ecx
 41d:	31 d2                	xor    %edx,%edx
 41f:	eb 12                	jmp    433 <thread_create+0x43>
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 428:	83 c2 01             	add    $0x1,%edx
 42b:	83 c1 0c             	add    $0xc,%ecx
 42e:	83 fa 40             	cmp    $0x40,%edx
 431:	74 21                	je     454 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 433:	83 39 00             	cmpl   $0x0,(%ecx)
 436:	75 f0                	jne    428 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 438:	8d 14 52             	lea    (%edx,%edx,2),%edx
 43b:	c1 e2 02             	shl    $0x2,%edx
 43e:	89 82 64 10 00 00    	mov    %eax,0x1064(%edx)
      ptrs[i].stack = stack;
 444:	89 9a 68 10 00 00    	mov    %ebx,0x1068(%edx)
      ptrs[i].busy = 1;
 44a:	c7 82 60 10 00 00 01 	movl   $0x1,0x1060(%edx)
 451:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 454:	53                   	push   %ebx
 455:	ff 75 10             	pushl  0x10(%ebp)
 458:	ff 75 0c             	pushl  0xc(%ebp)
 45b:	ff 75 08             	pushl  0x8(%ebp)
 45e:	e8 c5 01 00 00       	call   628 <clone>
 463:	83 c4 10             	add    $0x10,%esp
}
 466:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 469:	c9                   	leave  
 46a:	c3                   	ret    
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 470:	29 d3                	sub    %edx,%ebx
 472:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 478:	eb 9e                	jmp    418 <thread_create+0x28>
    return -1;
 47a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 47f:	eb e5                	jmp    466 <thread_create+0x76>
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <thread_join>:

int thread_join()
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	57                   	push   %edi
 498:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 499:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 49c:	53                   	push   %ebx
 49d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 4a0:	50                   	push   %eax
 4a1:	e8 8a 01 00 00       	call   630 <join>
 4a6:	ba 60 10 00 00       	mov    $0x1060,%edx
 4ab:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 4ae:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 4b0:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 4b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b5:	eb 14                	jmp    4cb <thread_join+0x3b>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 4c0:	83 c1 01             	add    $0x1,%ecx
 4c3:	83 c2 0c             	add    $0xc,%edx
 4c6:	83 f9 40             	cmp    $0x40,%ecx
 4c9:	74 3f                	je     50a <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 4cb:	83 3a 01             	cmpl   $0x1,(%edx)
 4ce:	75 f0                	jne    4c0 <thread_join+0x30>
 4d0:	39 42 08             	cmp    %eax,0x8(%edx)
 4d3:	75 eb                	jne    4c0 <thread_join+0x30>
      free(ptrs[i].ptr);
 4d5:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 4d8:	83 ec 0c             	sub    $0xc,%esp
 4db:	c1 e6 02             	shl    $0x2,%esi
 4de:	ff b6 64 10 00 00    	pushl  0x1064(%esi)
 4e4:	e8 d7 03 00 00       	call   8c0 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 4e9:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 4ec:	c7 86 68 10 00 00 00 	movl   $0x0,0x1068(%esi)
 4f3:	00 00 00 
      ptrs[i].busy = 0;
 4f6:	c7 86 60 10 00 00 00 	movl   $0x0,0x1060(%esi)
 4fd:	00 00 00 
      ptrs[i].ptr = NULL;
 500:	c7 86 64 10 00 00 00 	movl   $0x0,0x1064(%esi)
 507:	00 00 00 
    }
  }
  return ret;  
}
 50a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50d:	89 d8                	mov    %ebx,%eax
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5f                   	pop    %edi
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop

00000520 <lock_init>:

void lock_init(lock_t *lock)
{
 520:	f3 0f 1e fb          	endbr32 
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 52a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 530:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 537:	5d                   	pop    %ebp
 538:	c3                   	ret    
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <lock_acquire>:

void lock_acquire(lock_t *lock){
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
    __asm__ volatile
 545:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 54a:	89 e5                	mov    %esp,%ebp
 54c:	53                   	push   %ebx
 54d:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 550:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 554:	31 db                	xor    %ebx,%ebx
 556:	83 c2 04             	add    $0x4,%edx
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 560:	89 d8                	mov    %ebx,%eax
 562:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 566:	39 c1                	cmp    %eax,%ecx
 568:	75 f6                	jne    560 <lock_acquire+0x20>
}
 56a:	5b                   	pop    %ebx
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi

00000570 <lock_release>:

void lock_release(lock_t *lock){
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 57a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 580:	b8 01 00 00 00       	mov    $0x1,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exit>:
SYSCALL(exit)
 588:	b8 02 00 00 00       	mov    $0x2,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <wait>:
SYSCALL(wait)
 590:	b8 03 00 00 00       	mov    $0x3,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <pipe>:
SYSCALL(pipe)
 598:	b8 04 00 00 00       	mov    $0x4,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <read>:
SYSCALL(read)
 5a0:	b8 06 00 00 00       	mov    $0x6,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <write>:
SYSCALL(write)
 5a8:	b8 05 00 00 00       	mov    $0x5,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <close>:
SYSCALL(close)
 5b0:	b8 07 00 00 00       	mov    $0x7,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <kill>:
SYSCALL(kill)
 5b8:	b8 08 00 00 00       	mov    $0x8,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exec>:
SYSCALL(exec)
 5c0:	b8 09 00 00 00       	mov    $0x9,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <open>:
SYSCALL(open)
 5c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <mknod>:
SYSCALL(mknod)
 5d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unlink>:
SYSCALL(unlink)
 5d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <fstat>:
SYSCALL(fstat)
 5e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <link>:
SYSCALL(link)
 5e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <mkdir>:
SYSCALL(mkdir)
 5f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <chdir>:
SYSCALL(chdir)
 5f8:	b8 10 00 00 00       	mov    $0x10,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <dup>:
SYSCALL(dup)
 600:	b8 11 00 00 00       	mov    $0x11,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getpid>:
SYSCALL(getpid)
 608:	b8 12 00 00 00       	mov    $0x12,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <sbrk>:
SYSCALL(sbrk)
 610:	b8 13 00 00 00       	mov    $0x13,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sleep>:
SYSCALL(sleep)
 618:	b8 14 00 00 00       	mov    $0x14,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <uptime>:
SYSCALL(uptime)
 620:	b8 15 00 00 00       	mov    $0x15,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <clone>:
SYSCALL(clone)
 628:	b8 16 00 00 00       	mov    $0x16,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <join>:
SYSCALL(join) 
 630:	b8 17 00 00 00       	mov    $0x17,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    
 638:	66 90                	xchg   %ax,%ax
 63a:	66 90                	xchg   %ax,%ax
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 3c             	sub    $0x3c,%esp
 649:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 64c:	89 d1                	mov    %edx,%ecx
{
 64e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 651:	85 d2                	test   %edx,%edx
 653:	0f 89 7f 00 00 00    	jns    6d8 <printint+0x98>
 659:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 65d:	74 79                	je     6d8 <printint+0x98>
    neg = 1;
 65f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 666:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 668:	31 db                	xor    %ebx,%ebx
 66a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 670:	89 c8                	mov    %ecx,%eax
 672:	31 d2                	xor    %edx,%edx
 674:	89 cf                	mov    %ecx,%edi
 676:	f7 75 c4             	divl   -0x3c(%ebp)
 679:	0f b6 92 98 0a 00 00 	movzbl 0xa98(%edx),%edx
 680:	89 45 c0             	mov    %eax,-0x40(%ebp)
 683:	89 d8                	mov    %ebx,%eax
 685:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 688:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 68b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 68e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 691:	76 dd                	jbe    670 <printint+0x30>
  if(neg)
 693:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 696:	85 c9                	test   %ecx,%ecx
 698:	74 0c                	je     6a6 <printint+0x66>
    buf[i++] = '-';
 69a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 69f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6ad:	eb 07                	jmp    6b6 <printint+0x76>
 6af:	90                   	nop
 6b0:	0f b6 13             	movzbl (%ebx),%edx
 6b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6bc:	6a 01                	push   $0x1
 6be:	56                   	push   %esi
 6bf:	57                   	push   %edi
 6c0:	e8 e3 fe ff ff       	call   5a8 <write>
  while(--i >= 0)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	39 de                	cmp    %ebx,%esi
 6ca:	75 e4                	jne    6b0 <printint+0x70>
    putc(fd, buf[i]);
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6df:	eb 87                	jmp    668 <printint+0x28>
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop

000006f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	55                   	push   %ebp
 6f5:	89 e5                	mov    %esp,%ebp
 6f7:	57                   	push   %edi
 6f8:	56                   	push   %esi
 6f9:	53                   	push   %ebx
 6fa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6fd:	8b 75 0c             	mov    0xc(%ebp),%esi
 700:	0f b6 1e             	movzbl (%esi),%ebx
 703:	84 db                	test   %bl,%bl
 705:	0f 84 b4 00 00 00    	je     7bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 70b:	8d 45 10             	lea    0x10(%ebp),%eax
 70e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 711:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 714:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 716:	89 45 d0             	mov    %eax,-0x30(%ebp)
 719:	eb 33                	jmp    74e <printf+0x5e>
 71b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop
 720:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 723:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	74 17                	je     744 <printf+0x54>
  write(fd, &c, 1);
 72d:	83 ec 04             	sub    $0x4,%esp
 730:	88 5d e7             	mov    %bl,-0x19(%ebp)
 733:	6a 01                	push   $0x1
 735:	57                   	push   %edi
 736:	ff 75 08             	pushl  0x8(%ebp)
 739:	e8 6a fe ff ff       	call   5a8 <write>
 73e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 741:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 744:	0f b6 1e             	movzbl (%esi),%ebx
 747:	83 c6 01             	add    $0x1,%esi
 74a:	84 db                	test   %bl,%bl
 74c:	74 71                	je     7bf <printf+0xcf>
    c = fmt[i] & 0xff;
 74e:	0f be cb             	movsbl %bl,%ecx
 751:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 754:	85 d2                	test   %edx,%edx
 756:	74 c8                	je     720 <printf+0x30>
      }
    } else if(state == '%'){
 758:	83 fa 25             	cmp    $0x25,%edx
 75b:	75 e7                	jne    744 <printf+0x54>
      if(c == 'd'){
 75d:	83 f8 64             	cmp    $0x64,%eax
 760:	0f 84 9a 00 00 00    	je     800 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 766:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 76c:	83 f9 70             	cmp    $0x70,%ecx
 76f:	74 5f                	je     7d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 771:	83 f8 73             	cmp    $0x73,%eax
 774:	0f 84 d6 00 00 00    	je     850 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 77a:	83 f8 63             	cmp    $0x63,%eax
 77d:	0f 84 8d 00 00 00    	je     810 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 783:	83 f8 25             	cmp    $0x25,%eax
 786:	0f 84 b4 00 00 00    	je     840 <printf+0x150>
  write(fd, &c, 1);
 78c:	83 ec 04             	sub    $0x4,%esp
 78f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 793:	6a 01                	push   $0x1
 795:	57                   	push   %edi
 796:	ff 75 08             	pushl  0x8(%ebp)
 799:	e8 0a fe ff ff       	call   5a8 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 79e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7a1:	83 c4 0c             	add    $0xc,%esp
 7a4:	6a 01                	push   $0x1
 7a6:	83 c6 01             	add    $0x1,%esi
 7a9:	57                   	push   %edi
 7aa:	ff 75 08             	pushl  0x8(%ebp)
 7ad:	e8 f6 fd ff ff       	call   5a8 <write>
  for(i = 0; fmt[i]; i++){
 7b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 7b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7bb:	84 db                	test   %bl,%bl
 7bd:	75 8f                	jne    74e <printf+0x5e>
    }
  }
}
 7bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c2:	5b                   	pop    %ebx
 7c3:	5e                   	pop    %esi
 7c4:	5f                   	pop    %edi
 7c5:	5d                   	pop    %ebp
 7c6:	c3                   	ret    
 7c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d8:	6a 00                	push   $0x0
 7da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	8b 13                	mov    (%ebx),%edx
 7e2:	e8 59 fe ff ff       	call   640 <printint>
        ap++;
 7e7:	89 d8                	mov    %ebx,%eax
 7e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ec:	31 d2                	xor    %edx,%edx
        ap++;
 7ee:	83 c0 04             	add    $0x4,%eax
 7f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7f4:	e9 4b ff ff ff       	jmp    744 <printf+0x54>
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	b9 0a 00 00 00       	mov    $0xa,%ecx
 808:	6a 01                	push   $0x1
 80a:	eb ce                	jmp    7da <printf+0xea>
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 810:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 816:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 818:	6a 01                	push   $0x1
        ap++;
 81a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 81d:	57                   	push   %edi
 81e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 821:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 824:	e8 7f fd ff ff       	call   5a8 <write>
        ap++;
 829:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 82c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 0e ff ff ff       	jmp    744 <printf+0x54>
 836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 840:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 843:	83 ec 04             	sub    $0x4,%esp
 846:	e9 59 ff ff ff       	jmp    7a4 <printf+0xb4>
 84b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
        s = (char*)*ap;
 850:	8b 45 d0             	mov    -0x30(%ebp),%eax
 853:	8b 18                	mov    (%eax),%ebx
        ap++;
 855:	83 c0 04             	add    $0x4,%eax
 858:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 85b:	85 db                	test   %ebx,%ebx
 85d:	74 17                	je     876 <printf+0x186>
        while(*s != 0){
 85f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 862:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 864:	84 c0                	test   %al,%al
 866:	0f 84 d8 fe ff ff    	je     744 <printf+0x54>
 86c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 86f:	89 de                	mov    %ebx,%esi
 871:	8b 5d 08             	mov    0x8(%ebp),%ebx
 874:	eb 1a                	jmp    890 <printf+0x1a0>
          s = "(null)";
 876:	bb 8f 0a 00 00       	mov    $0xa8f,%ebx
        while(*s != 0){
 87b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 87e:	b8 28 00 00 00       	mov    $0x28,%eax
 883:	89 de                	mov    %ebx,%esi
 885:	8b 5d 08             	mov    0x8(%ebp),%ebx
 888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
          s++;
 893:	83 c6 01             	add    $0x1,%esi
 896:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 899:	6a 01                	push   $0x1
 89b:	57                   	push   %edi
 89c:	53                   	push   %ebx
 89d:	e8 06 fd ff ff       	call   5a8 <write>
        while(*s != 0){
 8a2:	0f b6 06             	movzbl (%esi),%eax
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	84 c0                	test   %al,%al
 8aa:	75 e4                	jne    890 <printf+0x1a0>
 8ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 8af:	31 d2                	xor    %edx,%edx
 8b1:	e9 8e fe ff ff       	jmp    744 <printf+0x54>
 8b6:	66 90                	xchg   %ax,%ax
 8b8:	66 90                	xchg   %ax,%ax
 8ba:	66 90                	xchg   %ax,%ax
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c0:	f3 0f 1e fb          	endbr32 
 8c4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c5:	a1 40 0e 00 00       	mov    0xe40,%eax
{
 8ca:	89 e5                	mov    %esp,%ebp
 8cc:	57                   	push   %edi
 8cd:	56                   	push   %esi
 8ce:	53                   	push   %ebx
 8cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8d2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 8d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d7:	39 c8                	cmp    %ecx,%eax
 8d9:	73 15                	jae    8f0 <free+0x30>
 8db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
 8e0:	39 d1                	cmp    %edx,%ecx
 8e2:	72 14                	jb     8f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	39 d0                	cmp    %edx,%eax
 8e6:	73 10                	jae    8f8 <free+0x38>
{
 8e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	39 c8                	cmp    %ecx,%eax
 8ee:	72 f0                	jb     8e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f0:	39 d0                	cmp    %edx,%eax
 8f2:	72 f4                	jb     8e8 <free+0x28>
 8f4:	39 d1                	cmp    %edx,%ecx
 8f6:	73 f0                	jae    8e8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fe:	39 fa                	cmp    %edi,%edx
 900:	74 1e                	je     920 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 902:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 905:	8b 50 04             	mov    0x4(%eax),%edx
 908:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 90b:	39 f1                	cmp    %esi,%ecx
 90d:	74 28                	je     937 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 911:	5b                   	pop    %ebx
  freep = p;
 912:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 917:	5e                   	pop    %esi
 918:	5f                   	pop    %edi
 919:	5d                   	pop    %ebp
 91a:	c3                   	ret    
 91b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 91f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 920:	03 72 04             	add    0x4(%edx),%esi
 923:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 926:	8b 10                	mov    (%eax),%edx
 928:	8b 12                	mov    (%edx),%edx
 92a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 92d:	8b 50 04             	mov    0x4(%eax),%edx
 930:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 933:	39 f1                	cmp    %esi,%ecx
 935:	75 d8                	jne    90f <free+0x4f>
    p->s.size += bp->s.size;
 937:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 93a:	a3 40 0e 00 00       	mov    %eax,0xe40
    p->s.size += bp->s.size;
 93f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 942:	8b 53 f8             	mov    -0x8(%ebx),%edx
 945:	89 10                	mov    %edx,(%eax)
}
 947:	5b                   	pop    %ebx
 948:	5e                   	pop    %esi
 949:	5f                   	pop    %edi
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	f3 0f 1e fb          	endbr32 
 954:	55                   	push   %ebp
 955:	89 e5                	mov    %esp,%ebp
 957:	57                   	push   %edi
 958:	56                   	push   %esi
 959:	53                   	push   %ebx
 95a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 95d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 960:	8b 3d 40 0e 00 00    	mov    0xe40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 966:	8d 70 07             	lea    0x7(%eax),%esi
 969:	c1 ee 03             	shr    $0x3,%esi
 96c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 96f:	85 ff                	test   %edi,%edi
 971:	0f 84 a9 00 00 00    	je     a20 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 977:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 979:	8b 48 04             	mov    0x4(%eax),%ecx
 97c:	39 f1                	cmp    %esi,%ecx
 97e:	73 6d                	jae    9ed <malloc+0x9d>
 980:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 986:	bb 00 10 00 00       	mov    $0x1000,%ebx
 98b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 98e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 995:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 998:	eb 17                	jmp    9b1 <malloc+0x61>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 9a2:	8b 4a 04             	mov    0x4(%edx),%ecx
 9a5:	39 f1                	cmp    %esi,%ecx
 9a7:	73 4f                	jae    9f8 <malloc+0xa8>
 9a9:	8b 3d 40 0e 00 00    	mov    0xe40,%edi
 9af:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9b1:	39 c7                	cmp    %eax,%edi
 9b3:	75 eb                	jne    9a0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 9b5:	83 ec 0c             	sub    $0xc,%esp
 9b8:	ff 75 e4             	pushl  -0x1c(%ebp)
 9bb:	e8 50 fc ff ff       	call   610 <sbrk>
  if(p == (char*)-1)
 9c0:	83 c4 10             	add    $0x10,%esp
 9c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 9c6:	74 1b                	je     9e3 <malloc+0x93>
  hp->s.size = nu;
 9c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9cb:	83 ec 0c             	sub    $0xc,%esp
 9ce:	83 c0 08             	add    $0x8,%eax
 9d1:	50                   	push   %eax
 9d2:	e8 e9 fe ff ff       	call   8c0 <free>
  return freep;
 9d7:	a1 40 0e 00 00       	mov    0xe40,%eax
      if((p = morecore(nunits)) == 0)
 9dc:	83 c4 10             	add    $0x10,%esp
 9df:	85 c0                	test   %eax,%eax
 9e1:	75 bd                	jne    9a0 <malloc+0x50>
        return 0;
  }
}
 9e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9e6:	31 c0                	xor    %eax,%eax
}
 9e8:	5b                   	pop    %ebx
 9e9:	5e                   	pop    %esi
 9ea:	5f                   	pop    %edi
 9eb:	5d                   	pop    %ebp
 9ec:	c3                   	ret    
    if(p->s.size >= nunits){
 9ed:	89 c2                	mov    %eax,%edx
 9ef:	89 f8                	mov    %edi,%eax
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 9f8:	39 ce                	cmp    %ecx,%esi
 9fa:	74 54                	je     a50 <malloc+0x100>
        p->s.size -= nunits;
 9fc:	29 f1                	sub    %esi,%ecx
 9fe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 a01:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 a04:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 a07:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 a0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a0f:	8d 42 08             	lea    0x8(%edx),%eax
}
 a12:	5b                   	pop    %ebx
 a13:	5e                   	pop    %esi
 a14:	5f                   	pop    %edi
 a15:	5d                   	pop    %ebp
 a16:	c3                   	ret    
 a17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 a20:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 a27:	0e 00 00 
    base.s.size = 0;
 a2a:	bf 44 0e 00 00       	mov    $0xe44,%edi
    base.s.ptr = freep = prevp = &base;
 a2f:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 a36:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a39:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 a3b:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 a42:	00 00 00 
    if(p->s.size >= nunits){
 a45:	e9 36 ff ff ff       	jmp    980 <malloc+0x30>
 a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a50:	8b 0a                	mov    (%edx),%ecx
 a52:	89 08                	mov    %ecx,(%eax)
 a54:	eb b1                	jmp    a07 <malloc+0xb7>
