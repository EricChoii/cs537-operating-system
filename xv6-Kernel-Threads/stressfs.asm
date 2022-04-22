
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 08 0a 00 00       	push   $0xa08
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 51 06 00 00       	call   6a0 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 a1 01 00 00       	call   200 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 c9 04 00 00       	call   530 <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 1b 0a 00 00       	push   $0xa1b
  8a:	6a 01                	push   $0x1
  8c:	e8 0f 06 00 00       	call   6a0 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 cc 04 00 00       	call   578 <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 91 04 00 00       	call   558 <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 88 04 00 00       	call   560 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 25 0a 00 00       	push   $0xa25
  df:	6a 01                	push   $0x1
  e1:	e8 ba 05 00 00       	call   6a0 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 7d 04 00 00       	call   578 <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 41 04 00 00       	call   550 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 40 04 00 00       	call   560 <close>

  wait();
 120:	e8 1b 04 00 00       	call   540 <wait>

  exit();
 125:	e8 0e 04 00 00       	call   538 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 145:	31 c0                	xor    %eax,%eax
{
 147:	89 e5                	mov    %esp,%ebp
 149:	53                   	push   %ebx
 14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	89 c8                	mov    %ecx,%eax
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	53                   	push   %ebx
 178:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 17e:	0f b6 01             	movzbl (%ecx),%eax
 181:	0f b6 1a             	movzbl (%edx),%ebx
 184:	84 c0                	test   %al,%al
 186:	75 19                	jne    1a1 <strcmp+0x31>
 188:	eb 26                	jmp    1b0 <strcmp+0x40>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 194:	83 c1 01             	add    $0x1,%ecx
 197:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19a:	0f b6 1a             	movzbl (%edx),%ebx
 19d:	84 c0                	test   %al,%al
 19f:	74 0f                	je     1b0 <strcmp+0x40>
 1a1:	38 d8                	cmp    %bl,%al
 1a3:	74 eb                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a5:	29 d8                	sub    %ebx,%eax
}
 1a7:	5b                   	pop    %ebx
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ca:	80 3a 00             	cmpb   $0x0,(%edx)
 1cd:	74 21                	je     1f0 <strlen+0x30>
 1cf:	31 c0                	xor    %eax,%eax
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1df:	89 c1                	mov    %eax,%ecx
 1e1:	75 f5                	jne    1d8 <strlen+0x18>
    ;
  return n;
}
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 20b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20e:	8b 45 0c             	mov    0xc(%ebp),%eax
 211:	89 d7                	mov    %edx,%edi
 213:	fc                   	cld    
 214:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 216:	89 d0                	mov    %edx,%eax
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22e:	0f b6 10             	movzbl (%eax),%edx
 231:	84 d2                	test   %dl,%dl
 233:	75 16                	jne    24b <strchr+0x2b>
 235:	eb 21                	jmp    258 <strchr+0x38>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
 240:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 244:	83 c0 01             	add    $0x1,%eax
 247:	84 d2                	test   %dl,%dl
 249:	74 0d                	je     258 <strchr+0x38>
    if(*s == c)
 24b:	38 d1                	cmp    %dl,%cl
 24d:	75 f1                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 258:	31 c0                	xor    %eax,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	31 f6                	xor    %esi,%esi
{
 26b:	53                   	push   %ebx
 26c:	89 f3                	mov    %esi,%ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 274:	eb 33                	jmp    2a9 <gets+0x49>
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	8d 45 e7             	lea    -0x19(%ebp),%eax
 286:	6a 01                	push   $0x1
 288:	50                   	push   %eax
 289:	6a 00                	push   $0x0
 28b:	e8 c0 02 00 00       	call   550 <read>
    if(cc < 1)
 290:	83 c4 10             	add    $0x10,%esp
 293:	85 c0                	test   %eax,%eax
 295:	7e 1c                	jle    2b3 <gets+0x53>
      break;
    buf[i++] = c;
 297:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29b:	83 c7 01             	add    $0x1,%edi
 29e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 23                	je     2c8 <gets+0x68>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 1f                	je     2c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	89 fe                	mov    %edi,%esi
 2ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b1:	7c cd                	jl     280 <gets+0x20>
 2b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2be:	5b                   	pop    %ebx
 2bf:	5e                   	pop    %esi
 2c0:	5f                   	pop    %edi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	8b 75 08             	mov    0x8(%ebp),%esi
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	01 de                	add    %ebx,%esi
 2d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	6a 00                	push   $0x0
 2ee:	ff 75 08             	pushl  0x8(%ebp)
 2f1:	e8 82 02 00 00       	call   578 <open>
  if(fd < 0)
 2f6:	83 c4 10             	add    $0x10,%esp
 2f9:	85 c0                	test   %eax,%eax
 2fb:	78 2b                	js     328 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2fd:	83 ec 08             	sub    $0x8,%esp
 300:	ff 75 0c             	pushl  0xc(%ebp)
 303:	89 c3                	mov    %eax,%ebx
 305:	50                   	push   %eax
 306:	e8 85 02 00 00       	call   590 <fstat>
  close(fd);
 30b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30e:	89 c6                	mov    %eax,%esi
  close(fd);
 310:	e8 4b 02 00 00       	call   560 <close>
  return r;
 315:	83 c4 10             	add    $0x10,%esp
}
 318:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 328:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32d:	eb e9                	jmp    318 <stat+0x38>
 32f:	90                   	nop

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	53                   	push   %ebx
 338:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33b:	0f be 02             	movsbl (%edx),%eax
 33e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 341:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 344:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 349:	77 1a                	ja     365 <atoi+0x35>
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    n = n*10 + *s++ - '0';
 350:	83 c2 01             	add    $0x1,%edx
 353:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 356:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 35a:	0f be 02             	movsbl (%edx),%eax
 35d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	89 c8                	mov    %ecx,%eax
 367:	5b                   	pop    %ebx
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	8b 45 10             	mov    0x10(%ebp),%eax
 37b:	8b 55 08             	mov    0x8(%ebp),%edx
 37e:	56                   	push   %esi
 37f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	85 c0                	test   %eax,%eax
 384:	7e 0f                	jle    395 <memmove+0x25>
 386:	01 d0                	add    %edx,%eax
  dst = vdst;
 388:	89 d7                	mov    %edx,%edi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 390:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 391:	39 f8                	cmp    %edi,%eax
 393:	75 fb                	jne    390 <memmove+0x20>
  return vdst;
}
 395:	5e                   	pop    %esi
 396:	89 d0                	mov    %edx,%eax
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	53                   	push   %ebx
 3a8:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 3ab:	68 00 20 00 00       	push   $0x2000
 3b0:	e8 4b 05 00 00       	call   900 <malloc>
  void* stack;
  if(freeptr == 0)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	85 c0                	test   %eax,%eax
 3ba:	74 6e                	je     42a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 3bc:	89 c2                	mov    %eax,%edx
 3be:	89 c3                	mov    %eax,%ebx
 3c0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3c6:	75 58                	jne    420 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 3c8:	b9 e0 0d 00 00       	mov    $0xde0,%ecx
 3cd:	31 d2                	xor    %edx,%edx
 3cf:	eb 12                	jmp    3e3 <thread_create+0x43>
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c2 01             	add    $0x1,%edx
 3db:	83 c1 0c             	add    $0xc,%ecx
 3de:	83 fa 40             	cmp    $0x40,%edx
 3e1:	74 21                	je     404 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 3e3:	83 39 00             	cmpl   $0x0,(%ecx)
 3e6:	75 f0                	jne    3d8 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 3e8:	8d 14 52             	lea    (%edx,%edx,2),%edx
 3eb:	c1 e2 02             	shl    $0x2,%edx
 3ee:	89 82 e4 0d 00 00    	mov    %eax,0xde4(%edx)
      ptrs[i].stack = stack;
 3f4:	89 9a e8 0d 00 00    	mov    %ebx,0xde8(%edx)
      ptrs[i].busy = 1;
 3fa:	c7 82 e0 0d 00 00 01 	movl   $0x1,0xde0(%edx)
 401:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 404:	53                   	push   %ebx
 405:	ff 75 10             	pushl  0x10(%ebp)
 408:	ff 75 0c             	pushl  0xc(%ebp)
 40b:	ff 75 08             	pushl  0x8(%ebp)
 40e:	e8 c5 01 00 00       	call   5d8 <clone>
 413:	83 c4 10             	add    $0x10,%esp
}
 416:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 419:	c9                   	leave  
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 420:	29 d3                	sub    %edx,%ebx
 422:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 428:	eb 9e                	jmp    3c8 <thread_create+0x28>
    return -1;
 42a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42f:	eb e5                	jmp    416 <thread_create+0x76>
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <thread_join>:

int thread_join()
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	57                   	push   %edi
 448:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 449:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 44c:	53                   	push   %ebx
 44d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 450:	50                   	push   %eax
 451:	e8 8a 01 00 00       	call   5e0 <join>
 456:	ba e0 0d 00 00       	mov    $0xde0,%edx
 45b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 45e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 460:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 462:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 465:	eb 14                	jmp    47b <thread_join+0x3b>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 470:	83 c1 01             	add    $0x1,%ecx
 473:	83 c2 0c             	add    $0xc,%edx
 476:	83 f9 40             	cmp    $0x40,%ecx
 479:	74 3f                	je     4ba <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 47b:	83 3a 01             	cmpl   $0x1,(%edx)
 47e:	75 f0                	jne    470 <thread_join+0x30>
 480:	39 42 08             	cmp    %eax,0x8(%edx)
 483:	75 eb                	jne    470 <thread_join+0x30>
      free(ptrs[i].ptr);
 485:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	c1 e6 02             	shl    $0x2,%esi
 48e:	ff b6 e4 0d 00 00    	pushl  0xde4(%esi)
 494:	e8 d7 03 00 00       	call   870 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 499:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 49c:	c7 86 e8 0d 00 00 00 	movl   $0x0,0xde8(%esi)
 4a3:	00 00 00 
      ptrs[i].busy = 0;
 4a6:	c7 86 e0 0d 00 00 00 	movl   $0x0,0xde0(%esi)
 4ad:	00 00 00 
      ptrs[i].ptr = NULL;
 4b0:	c7 86 e4 0d 00 00 00 	movl   $0x0,0xde4(%esi)
 4b7:	00 00 00 
    }
  }
  return ret;  
}
 4ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bd:	89 d8                	mov    %ebx,%eax
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <lock_init>:

void lock_init(lock_t *lock)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 4da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 4e0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4f0:	f3 0f 1e fb          	endbr32 
 4f4:	55                   	push   %ebp
    __asm__ volatile
 4f5:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	53                   	push   %ebx
 4fd:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 500:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 504:	31 db                	xor    %ebx,%ebx
 506:	83 c2 04             	add    $0x4,%edx
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 510:	89 d8                	mov    %ebx,%eax
 512:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 516:	39 c1                	cmp    %eax,%ecx
 518:	75 f6                	jne    510 <lock_acquire+0x20>
}
 51a:	5b                   	pop    %ebx
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi

00000520 <lock_release>:

void lock_release(lock_t *lock){
 520:	f3 0f 1e fb          	endbr32 
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 52a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 530:	b8 01 00 00 00       	mov    $0x1,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <exit>:
SYSCALL(exit)
 538:	b8 02 00 00 00       	mov    $0x2,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <wait>:
SYSCALL(wait)
 540:	b8 03 00 00 00       	mov    $0x3,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <pipe>:
SYSCALL(pipe)
 548:	b8 04 00 00 00       	mov    $0x4,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <read>:
SYSCALL(read)
 550:	b8 06 00 00 00       	mov    $0x6,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <write>:
SYSCALL(write)
 558:	b8 05 00 00 00       	mov    $0x5,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <close>:
SYSCALL(close)
 560:	b8 07 00 00 00       	mov    $0x7,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <kill>:
SYSCALL(kill)
 568:	b8 08 00 00 00       	mov    $0x8,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <exec>:
SYSCALL(exec)
 570:	b8 09 00 00 00       	mov    $0x9,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <open>:
SYSCALL(open)
 578:	b8 0a 00 00 00       	mov    $0xa,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <mknod>:
SYSCALL(mknod)
 580:	b8 0b 00 00 00       	mov    $0xb,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <unlink>:
SYSCALL(unlink)
 588:	b8 0c 00 00 00       	mov    $0xc,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <fstat>:
SYSCALL(fstat)
 590:	b8 0d 00 00 00       	mov    $0xd,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <link>:
SYSCALL(link)
 598:	b8 0e 00 00 00       	mov    $0xe,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mkdir>:
SYSCALL(mkdir)
 5a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <chdir>:
SYSCALL(chdir)
 5a8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <dup>:
SYSCALL(dup)
 5b0:	b8 11 00 00 00       	mov    $0x11,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <getpid>:
SYSCALL(getpid)
 5b8:	b8 12 00 00 00       	mov    $0x12,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <sbrk>:
SYSCALL(sbrk)
 5c0:	b8 13 00 00 00       	mov    $0x13,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <sleep>:
SYSCALL(sleep)
 5c8:	b8 14 00 00 00       	mov    $0x14,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <uptime>:
SYSCALL(uptime)
 5d0:	b8 15 00 00 00       	mov    $0x15,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <clone>:
SYSCALL(clone)
 5d8:	b8 16 00 00 00       	mov    $0x16,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <join>:
SYSCALL(join) 
 5e0:	b8 17 00 00 00       	mov    $0x17,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    
 5e8:	66 90                	xchg   %ax,%ax
 5ea:	66 90                	xchg   %ax,%ax
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 3c             	sub    $0x3c,%esp
 5f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5fc:	89 d1                	mov    %edx,%ecx
{
 5fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 601:	85 d2                	test   %edx,%edx
 603:	0f 89 7f 00 00 00    	jns    688 <printint+0x98>
 609:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 60d:	74 79                	je     688 <printint+0x98>
    neg = 1;
 60f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 616:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 618:	31 db                	xor    %ebx,%ebx
 61a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 620:	89 c8                	mov    %ecx,%eax
 622:	31 d2                	xor    %edx,%edx
 624:	89 cf                	mov    %ecx,%edi
 626:	f7 75 c4             	divl   -0x3c(%ebp)
 629:	0f b6 92 34 0a 00 00 	movzbl 0xa34(%edx),%edx
 630:	89 45 c0             	mov    %eax,-0x40(%ebp)
 633:	89 d8                	mov    %ebx,%eax
 635:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 638:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 63b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 63e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 641:	76 dd                	jbe    620 <printint+0x30>
  if(neg)
 643:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 646:	85 c9                	test   %ecx,%ecx
 648:	74 0c                	je     656 <printint+0x66>
    buf[i++] = '-';
 64a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 64f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 651:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 656:	8b 7d b8             	mov    -0x48(%ebp),%edi
 659:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 65d:	eb 07                	jmp    666 <printint+0x76>
 65f:	90                   	nop
 660:	0f b6 13             	movzbl (%ebx),%edx
 663:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 666:	83 ec 04             	sub    $0x4,%esp
 669:	88 55 d7             	mov    %dl,-0x29(%ebp)
 66c:	6a 01                	push   $0x1
 66e:	56                   	push   %esi
 66f:	57                   	push   %edi
 670:	e8 e3 fe ff ff       	call   558 <write>
  while(--i >= 0)
 675:	83 c4 10             	add    $0x10,%esp
 678:	39 de                	cmp    %ebx,%esi
 67a:	75 e4                	jne    660 <printint+0x70>
    putc(fd, buf[i]);
}
 67c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 688:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 68f:	eb 87                	jmp    618 <printint+0x28>
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a0:	f3 0f 1e fb          	endbr32 
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	57                   	push   %edi
 6a8:	56                   	push   %esi
 6a9:	53                   	push   %ebx
 6aa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6ad:	8b 75 0c             	mov    0xc(%ebp),%esi
 6b0:	0f b6 1e             	movzbl (%esi),%ebx
 6b3:	84 db                	test   %bl,%bl
 6b5:	0f 84 b4 00 00 00    	je     76f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 6bb:	8d 45 10             	lea    0x10(%ebp),%eax
 6be:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6c4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 6c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c9:	eb 33                	jmp    6fe <printf+0x5e>
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
 6d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6d8:	83 f8 25             	cmp    $0x25,%eax
 6db:	74 17                	je     6f4 <printf+0x54>
  write(fd, &c, 1);
 6dd:	83 ec 04             	sub    $0x4,%esp
 6e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 6a fe ff ff       	call   558 <write>
 6ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6f4:	0f b6 1e             	movzbl (%esi),%ebx
 6f7:	83 c6 01             	add    $0x1,%esi
 6fa:	84 db                	test   %bl,%bl
 6fc:	74 71                	je     76f <printf+0xcf>
    c = fmt[i] & 0xff;
 6fe:	0f be cb             	movsbl %bl,%ecx
 701:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 704:	85 d2                	test   %edx,%edx
 706:	74 c8                	je     6d0 <printf+0x30>
      }
    } else if(state == '%'){
 708:	83 fa 25             	cmp    $0x25,%edx
 70b:	75 e7                	jne    6f4 <printf+0x54>
      if(c == 'd'){
 70d:	83 f8 64             	cmp    $0x64,%eax
 710:	0f 84 9a 00 00 00    	je     7b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 716:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 71c:	83 f9 70             	cmp    $0x70,%ecx
 71f:	74 5f                	je     780 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 721:	83 f8 73             	cmp    $0x73,%eax
 724:	0f 84 d6 00 00 00    	je     800 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 72a:	83 f8 63             	cmp    $0x63,%eax
 72d:	0f 84 8d 00 00 00    	je     7c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 733:	83 f8 25             	cmp    $0x25,%eax
 736:	0f 84 b4 00 00 00    	je     7f0 <printf+0x150>
  write(fd, &c, 1);
 73c:	83 ec 04             	sub    $0x4,%esp
 73f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 743:	6a 01                	push   $0x1
 745:	57                   	push   %edi
 746:	ff 75 08             	pushl  0x8(%ebp)
 749:	e8 0a fe ff ff       	call   558 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 74e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 751:	83 c4 0c             	add    $0xc,%esp
 754:	6a 01                	push   $0x1
 756:	83 c6 01             	add    $0x1,%esi
 759:	57                   	push   %edi
 75a:	ff 75 08             	pushl  0x8(%ebp)
 75d:	e8 f6 fd ff ff       	call   558 <write>
  for(i = 0; fmt[i]; i++){
 762:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 766:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 769:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 76b:	84 db                	test   %bl,%bl
 76d:	75 8f                	jne    6fe <printf+0x5e>
    }
  }
}
 76f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 772:	5b                   	pop    %ebx
 773:	5e                   	pop    %esi
 774:	5f                   	pop    %edi
 775:	5d                   	pop    %ebp
 776:	c3                   	ret    
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 10 00 00 00       	mov    $0x10,%ecx
 788:	6a 00                	push   $0x0
 78a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	8b 13                	mov    (%ebx),%edx
 792:	e8 59 fe ff ff       	call   5f0 <printint>
        ap++;
 797:	89 d8                	mov    %ebx,%eax
 799:	83 c4 10             	add    $0x10,%esp
      state = 0;
 79c:	31 d2                	xor    %edx,%edx
        ap++;
 79e:	83 c0 04             	add    $0x4,%eax
 7a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a4:	e9 4b ff ff ff       	jmp    6f4 <printf+0x54>
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b8:	6a 01                	push   $0x1
 7ba:	eb ce                	jmp    78a <printf+0xea>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 7c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 7c8:	6a 01                	push   $0x1
        ap++;
 7ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 7cd:	57                   	push   %edi
 7ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 7d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d4:	e8 7f fd ff ff       	call   558 <write>
        ap++;
 7d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 0e ff ff ff       	jmp    6f4 <printf+0x54>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7f3:	83 ec 04             	sub    $0x4,%esp
 7f6:	e9 59 ff ff ff       	jmp    754 <printf+0xb4>
 7fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
        s = (char*)*ap;
 800:	8b 45 d0             	mov    -0x30(%ebp),%eax
 803:	8b 18                	mov    (%eax),%ebx
        ap++;
 805:	83 c0 04             	add    $0x4,%eax
 808:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 80b:	85 db                	test   %ebx,%ebx
 80d:	74 17                	je     826 <printf+0x186>
        while(*s != 0){
 80f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 812:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 814:	84 c0                	test   %al,%al
 816:	0f 84 d8 fe ff ff    	je     6f4 <printf+0x54>
 81c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 81f:	89 de                	mov    %ebx,%esi
 821:	8b 5d 08             	mov    0x8(%ebp),%ebx
 824:	eb 1a                	jmp    840 <printf+0x1a0>
          s = "(null)";
 826:	bb 2b 0a 00 00       	mov    $0xa2b,%ebx
        while(*s != 0){
 82b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 82e:	b8 28 00 00 00       	mov    $0x28,%eax
 833:	89 de                	mov    %ebx,%esi
 835:	8b 5d 08             	mov    0x8(%ebp),%ebx
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
          s++;
 843:	83 c6 01             	add    $0x1,%esi
 846:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 849:	6a 01                	push   $0x1
 84b:	57                   	push   %edi
 84c:	53                   	push   %ebx
 84d:	e8 06 fd ff ff       	call   558 <write>
        while(*s != 0){
 852:	0f b6 06             	movzbl (%esi),%eax
 855:	83 c4 10             	add    $0x10,%esp
 858:	84 c0                	test   %al,%al
 85a:	75 e4                	jne    840 <printf+0x1a0>
 85c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 85f:	31 d2                	xor    %edx,%edx
 861:	e9 8e fe ff ff       	jmp    6f4 <printf+0x54>
 866:	66 90                	xchg   %ax,%ax
 868:	66 90                	xchg   %ax,%ax
 86a:	66 90                	xchg   %ax,%ax
 86c:	66 90                	xchg   %ax,%ax
 86e:	66 90                	xchg   %ax,%ax

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 870:	f3 0f 1e fb          	endbr32 
 874:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 875:	a1 c0 0d 00 00       	mov    0xdc0,%eax
{
 87a:	89 e5                	mov    %esp,%ebp
 87c:	57                   	push   %edi
 87d:	56                   	push   %esi
 87e:	53                   	push   %ebx
 87f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 882:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 884:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 887:	39 c8                	cmp    %ecx,%eax
 889:	73 15                	jae    8a0 <free+0x30>
 88b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
 890:	39 d1                	cmp    %edx,%ecx
 892:	72 14                	jb     8a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 894:	39 d0                	cmp    %edx,%eax
 896:	73 10                	jae    8a8 <free+0x38>
{
 898:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89a:	8b 10                	mov    (%eax),%edx
 89c:	39 c8                	cmp    %ecx,%eax
 89e:	72 f0                	jb     890 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a0:	39 d0                	cmp    %edx,%eax
 8a2:	72 f4                	jb     898 <free+0x28>
 8a4:	39 d1                	cmp    %edx,%ecx
 8a6:	73 f0                	jae    898 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ae:	39 fa                	cmp    %edi,%edx
 8b0:	74 1e                	je     8d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8b5:	8b 50 04             	mov    0x4(%eax),%edx
 8b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8bb:	39 f1                	cmp    %esi,%ecx
 8bd:	74 28                	je     8e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 8c1:	5b                   	pop    %ebx
  freep = p;
 8c2:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 8c7:	5e                   	pop    %esi
 8c8:	5f                   	pop    %edi
 8c9:	5d                   	pop    %ebp
 8ca:	c3                   	ret    
 8cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 8d0:	03 72 04             	add    0x4(%edx),%esi
 8d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d6:	8b 10                	mov    (%eax),%edx
 8d8:	8b 12                	mov    (%edx),%edx
 8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e3:	39 f1                	cmp    %esi,%ecx
 8e5:	75 d8                	jne    8bf <free+0x4f>
    p->s.size += bp->s.size;
 8e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ea:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    p->s.size += bp->s.size;
 8ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f5:	89 10                	mov    %edx,(%eax)
}
 8f7:	5b                   	pop    %ebx
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 900:	f3 0f 1e fb          	endbr32 
 904:	55                   	push   %ebp
 905:	89 e5                	mov    %esp,%ebp
 907:	57                   	push   %edi
 908:	56                   	push   %esi
 909:	53                   	push   %ebx
 90a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 910:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 916:	8d 70 07             	lea    0x7(%eax),%esi
 919:	c1 ee 03             	shr    $0x3,%esi
 91c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 91f:	85 ff                	test   %edi,%edi
 921:	0f 84 a9 00 00 00    	je     9d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 927:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 929:	8b 48 04             	mov    0x4(%eax),%ecx
 92c:	39 f1                	cmp    %esi,%ecx
 92e:	73 6d                	jae    99d <malloc+0x9d>
 930:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 936:	bb 00 10 00 00       	mov    $0x1000,%ebx
 93b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 93e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 945:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 948:	eb 17                	jmp    961 <malloc+0x61>
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 950:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 952:	8b 4a 04             	mov    0x4(%edx),%ecx
 955:	39 f1                	cmp    %esi,%ecx
 957:	73 4f                	jae    9a8 <malloc+0xa8>
 959:	8b 3d c0 0d 00 00    	mov    0xdc0,%edi
 95f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 961:	39 c7                	cmp    %eax,%edi
 963:	75 eb                	jne    950 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 965:	83 ec 0c             	sub    $0xc,%esp
 968:	ff 75 e4             	pushl  -0x1c(%ebp)
 96b:	e8 50 fc ff ff       	call   5c0 <sbrk>
  if(p == (char*)-1)
 970:	83 c4 10             	add    $0x10,%esp
 973:	83 f8 ff             	cmp    $0xffffffff,%eax
 976:	74 1b                	je     993 <malloc+0x93>
  hp->s.size = nu;
 978:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 97b:	83 ec 0c             	sub    $0xc,%esp
 97e:	83 c0 08             	add    $0x8,%eax
 981:	50                   	push   %eax
 982:	e8 e9 fe ff ff       	call   870 <free>
  return freep;
 987:	a1 c0 0d 00 00       	mov    0xdc0,%eax
      if((p = morecore(nunits)) == 0)
 98c:	83 c4 10             	add    $0x10,%esp
 98f:	85 c0                	test   %eax,%eax
 991:	75 bd                	jne    950 <malloc+0x50>
        return 0;
  }
}
 993:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 996:	31 c0                	xor    %eax,%eax
}
 998:	5b                   	pop    %ebx
 999:	5e                   	pop    %esi
 99a:	5f                   	pop    %edi
 99b:	5d                   	pop    %ebp
 99c:	c3                   	ret    
    if(p->s.size >= nunits){
 99d:	89 c2                	mov    %eax,%edx
 99f:	89 f8                	mov    %edi,%eax
 9a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 9a8:	39 ce                	cmp    %ecx,%esi
 9aa:	74 54                	je     a00 <malloc+0x100>
        p->s.size -= nunits;
 9ac:	29 f1                	sub    %esi,%ecx
 9ae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 9b1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 9b4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 9b7:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 9bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9bf:	8d 42 08             	lea    0x8(%edx),%eax
}
 9c2:	5b                   	pop    %ebx
 9c3:	5e                   	pop    %esi
 9c4:	5f                   	pop    %edi
 9c5:	5d                   	pop    %ebp
 9c6:	c3                   	ret    
 9c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 9d0:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 9d7:	0d 00 00 
    base.s.size = 0;
 9da:	bf c4 0d 00 00       	mov    $0xdc4,%edi
    base.s.ptr = freep = prevp = &base;
 9df:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 9e6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9eb:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 9f2:	00 00 00 
    if(p->s.size >= nunits){
 9f5:	e9 36 ff ff ff       	jmp    930 <malloc+0x30>
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a00:	8b 0a                	mov    (%edx),%ecx
 a02:	89 08                	mov    %ecx,(%eax)
 a04:	eb b1                	jmp    9b7 <malloc+0xb7>
