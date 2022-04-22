
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 30                	jle    51 <main+0x51>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 23 02 00 00       	call   260 <atoi>
  3d:	89 04 24             	mov    %eax,(%esp)
  40:	e8 53 04 00 00       	call   498 <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 17 04 00 00       	call   468 <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 38 09 00 00       	push   $0x938
  58:	6a 02                	push   $0x2
  5a:	e8 71 05 00 00       	call   5d0 <printf>
    exit();
  5f:	e8 04 04 00 00       	call   468 <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
  70:	f3 0f 1e fb          	endbr32 
  74:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  75:	31 c0                	xor    %eax,%eax
{
  77:	89 e5                	mov    %esp,%ebp
  79:	53                   	push   %ebx
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	89 c8                	mov    %ecx,%eax
  90:	5b                   	pop    %ebx
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	0f b6 1a             	movzbl (%edx),%ebx
  b4:	84 c0                	test   %al,%al
  b6:	75 19                	jne    d1 <strcmp+0x31>
  b8:	eb 26                	jmp    e0 <strcmp+0x40>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  c4:	83 c1 01             	add    $0x1,%ecx
  c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ca:	0f b6 1a             	movzbl (%edx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	38 d8                	cmp    %bl,%al
  d3:	74 eb                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	5b                   	pop    %ebx
  d8:	5d                   	pop    %ebp
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  fa:	80 3a 00             	cmpb   $0x0,(%edx)
  fd:	74 21                	je     120 <strlen+0x30>
  ff:	31 c0                	xor    %eax,%eax
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c0 01             	add    $0x1,%eax
 10b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10f:	89 c1                	mov    %eax,%ecx
 111:	75 f5                	jne    108 <strlen+0x18>
    ;
  return n;
}
 113:	89 c8                	mov    %ecx,%eax
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 13b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	89 d7                	mov    %edx,%edi
 143:	fc                   	cld    
 144:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 146:	89 d0                	mov    %edx,%eax
 148:	5f                   	pop    %edi
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15e:	0f b6 10             	movzbl (%eax),%edx
 161:	84 d2                	test   %dl,%dl
 163:	75 16                	jne    17b <strchr+0x2b>
 165:	eb 21                	jmp    188 <strchr+0x38>
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret    
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 199:	31 f6                	xor    %esi,%esi
{
 19b:	53                   	push   %ebx
 19c:	89 f3                	mov    %esi,%ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a4:	eb 33                	jmp    1d9 <gets+0x49>
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b6:	6a 01                	push   $0x1
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 c0 02 00 00       	call   480 <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 1c                	jle    1e3 <gets+0x53>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	83 c7 01             	add    $0x1,%edi
 1ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	74 23                	je     1f8 <gets+0x68>
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 1f                	je     1f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	89 fe                	mov    %edi,%esi
 1de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e1:	7c cd                	jl     1b0 <gets+0x20>
 1e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5f                   	pop    %edi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	8b 75 08             	mov    0x8(%ebp),%esi
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 de                	add    %ebx,%esi
 200:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 202:	c6 03 00             	movb   $0x0,(%ebx)
}
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	6a 00                	push   $0x0
 21e:	ff 75 08             	pushl  0x8(%ebp)
 221:	e8 82 02 00 00       	call   4a8 <open>
  if(fd < 0)
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	78 2b                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 22d:	83 ec 08             	sub    $0x8,%esp
 230:	ff 75 0c             	pushl  0xc(%ebp)
 233:	89 c3                	mov    %eax,%ebx
 235:	50                   	push   %eax
 236:	e8 85 02 00 00       	call   4c0 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 4b 02 00 00       	call   490 <close>
  return r;
 245:	83 c4 10             	add    $0x10,%esp
}
 248:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24b:	89 f0                	mov    %esi,%eax
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb e9                	jmp    248 <stat+0x38>
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	0f be 02             	movsbl (%edx),%eax
 26e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 271:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 274:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 279:	77 1a                	ja     295 <atoi+0x35>
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	89 c8                	mov    %ecx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	57                   	push   %edi
 2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 2ab:	8b 55 08             	mov    0x8(%ebp),%edx
 2ae:	56                   	push   %esi
 2af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 0f                	jle    2c5 <memmove+0x25>
 2b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b8:	89 d7                	mov    %edx,%edi
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 2db:	68 00 20 00 00       	push   $0x2000
 2e0:	e8 4b 05 00 00       	call   830 <malloc>
  void* stack;
  if(freeptr == 0)
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	85 c0                	test   %eax,%eax
 2ea:	74 6e                	je     35a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 2ec:	89 c2                	mov    %eax,%edx
 2ee:	89 c3                	mov    %eax,%ebx
 2f0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2f6:	75 58                	jne    350 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 2f8:	b9 e0 0c 00 00       	mov    $0xce0,%ecx
 2fd:	31 d2                	xor    %edx,%edx
 2ff:	eb 12                	jmp    313 <thread_create+0x43>
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	83 c2 01             	add    $0x1,%edx
 30b:	83 c1 0c             	add    $0xc,%ecx
 30e:	83 fa 40             	cmp    $0x40,%edx
 311:	74 21                	je     334 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 313:	83 39 00             	cmpl   $0x0,(%ecx)
 316:	75 f0                	jne    308 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 318:	8d 14 52             	lea    (%edx,%edx,2),%edx
 31b:	c1 e2 02             	shl    $0x2,%edx
 31e:	89 82 e4 0c 00 00    	mov    %eax,0xce4(%edx)
      ptrs[i].stack = stack;
 324:	89 9a e8 0c 00 00    	mov    %ebx,0xce8(%edx)
      ptrs[i].busy = 1;
 32a:	c7 82 e0 0c 00 00 01 	movl   $0x1,0xce0(%edx)
 331:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 334:	53                   	push   %ebx
 335:	ff 75 10             	pushl  0x10(%ebp)
 338:	ff 75 0c             	pushl  0xc(%ebp)
 33b:	ff 75 08             	pushl  0x8(%ebp)
 33e:	e8 c5 01 00 00       	call   508 <clone>
 343:	83 c4 10             	add    $0x10,%esp
}
 346:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 349:	c9                   	leave  
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 350:	29 d3                	sub    %edx,%ebx
 352:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 358:	eb 9e                	jmp    2f8 <thread_create+0x28>
    return -1;
 35a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 35f:	eb e5                	jmp    346 <thread_create+0x76>
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_join>:

int thread_join()
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 379:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 37c:	53                   	push   %ebx
 37d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 380:	50                   	push   %eax
 381:	e8 8a 01 00 00       	call   510 <join>
 386:	ba e0 0c 00 00       	mov    $0xce0,%edx
 38b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 38e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 390:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 392:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 395:	eb 14                	jmp    3ab <thread_join+0x3b>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 3a0:	83 c1 01             	add    $0x1,%ecx
 3a3:	83 c2 0c             	add    $0xc,%edx
 3a6:	83 f9 40             	cmp    $0x40,%ecx
 3a9:	74 3f                	je     3ea <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 3ab:	83 3a 01             	cmpl   $0x1,(%edx)
 3ae:	75 f0                	jne    3a0 <thread_join+0x30>
 3b0:	39 42 08             	cmp    %eax,0x8(%edx)
 3b3:	75 eb                	jne    3a0 <thread_join+0x30>
      free(ptrs[i].ptr);
 3b5:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 3b8:	83 ec 0c             	sub    $0xc,%esp
 3bb:	c1 e6 02             	shl    $0x2,%esi
 3be:	ff b6 e4 0c 00 00    	pushl  0xce4(%esi)
 3c4:	e8 d7 03 00 00       	call   7a0 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 3c9:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 3cc:	c7 86 e8 0c 00 00 00 	movl   $0x0,0xce8(%esi)
 3d3:	00 00 00 
      ptrs[i].busy = 0;
 3d6:	c7 86 e0 0c 00 00 00 	movl   $0x0,0xce0(%esi)
 3dd:	00 00 00 
      ptrs[i].ptr = NULL;
 3e0:	c7 86 e4 0c 00 00 00 	movl   $0x0,0xce4(%esi)
 3e7:	00 00 00 
    }
  }
  return ret;  
}
 3ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ed:	89 d8                	mov    %ebx,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5f                   	pop    %edi
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <lock_init>:

void lock_init(lock_t *lock)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 40a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 410:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <lock_acquire>:

void lock_acquire(lock_t *lock){
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
    __asm__ volatile
 425:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 42a:	89 e5                	mov    %esp,%ebp
 42c:	53                   	push   %ebx
 42d:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 430:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 434:	31 db                	xor    %ebx,%ebx
 436:	83 c2 04             	add    $0x4,%edx
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 440:	89 d8                	mov    %ebx,%eax
 442:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 446:	39 c1                	cmp    %eax,%ecx
 448:	75 f6                	jne    440 <lock_acquire+0x20>
}
 44a:	5b                   	pop    %ebx
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <lock_release>:

void lock_release(lock_t *lock){
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 45a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 45e:	5d                   	pop    %ebp
 45f:	c3                   	ret    

00000460 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 460:	b8 01 00 00 00       	mov    $0x1,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <exit>:
SYSCALL(exit)
 468:	b8 02 00 00 00       	mov    $0x2,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <wait>:
SYSCALL(wait)
 470:	b8 03 00 00 00       	mov    $0x3,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <pipe>:
SYSCALL(pipe)
 478:	b8 04 00 00 00       	mov    $0x4,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <read>:
SYSCALL(read)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <write>:
SYSCALL(write)
 488:	b8 05 00 00 00       	mov    $0x5,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <close>:
SYSCALL(close)
 490:	b8 07 00 00 00       	mov    $0x7,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <kill>:
SYSCALL(kill)
 498:	b8 08 00 00 00       	mov    $0x8,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <exec>:
SYSCALL(exec)
 4a0:	b8 09 00 00 00       	mov    $0x9,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <open>:
SYSCALL(open)
 4a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <mknod>:
SYSCALL(mknod)
 4b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <unlink>:
SYSCALL(unlink)
 4b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <fstat>:
SYSCALL(fstat)
 4c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <link>:
SYSCALL(link)
 4c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <mkdir>:
SYSCALL(mkdir)
 4d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <chdir>:
SYSCALL(chdir)
 4d8:	b8 10 00 00 00       	mov    $0x10,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <dup>:
SYSCALL(dup)
 4e0:	b8 11 00 00 00       	mov    $0x11,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <getpid>:
SYSCALL(getpid)
 4e8:	b8 12 00 00 00       	mov    $0x12,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <sbrk>:
SYSCALL(sbrk)
 4f0:	b8 13 00 00 00       	mov    $0x13,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <sleep>:
SYSCALL(sleep)
 4f8:	b8 14 00 00 00       	mov    $0x14,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <uptime>:
SYSCALL(uptime)
 500:	b8 15 00 00 00       	mov    $0x15,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <clone>:
SYSCALL(clone)
 508:	b8 16 00 00 00       	mov    $0x16,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <join>:
SYSCALL(join) 
 510:	b8 17 00 00 00       	mov    $0x17,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    
 518:	66 90                	xchg   %ax,%ax
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 3c             	sub    $0x3c,%esp
 529:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 52c:	89 d1                	mov    %edx,%ecx
{
 52e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 531:	85 d2                	test   %edx,%edx
 533:	0f 89 7f 00 00 00    	jns    5b8 <printint+0x98>
 539:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 53d:	74 79                	je     5b8 <printint+0x98>
    neg = 1;
 53f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 546:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 548:	31 db                	xor    %ebx,%ebx
 54a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 c8                	mov    %ecx,%eax
 552:	31 d2                	xor    %edx,%edx
 554:	89 cf                	mov    %ecx,%edi
 556:	f7 75 c4             	divl   -0x3c(%ebp)
 559:	0f b6 92 54 09 00 00 	movzbl 0x954(%edx),%edx
 560:	89 45 c0             	mov    %eax,-0x40(%ebp)
 563:	89 d8                	mov    %ebx,%eax
 565:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 568:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 56b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 56e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 571:	76 dd                	jbe    550 <printint+0x30>
  if(neg)
 573:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 576:	85 c9                	test   %ecx,%ecx
 578:	74 0c                	je     586 <printint+0x66>
    buf[i++] = '-';
 57a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 57f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 581:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 586:	8b 7d b8             	mov    -0x48(%ebp),%edi
 589:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 58d:	eb 07                	jmp    596 <printint+0x76>
 58f:	90                   	nop
 590:	0f b6 13             	movzbl (%ebx),%edx
 593:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 596:	83 ec 04             	sub    $0x4,%esp
 599:	88 55 d7             	mov    %dl,-0x29(%ebp)
 59c:	6a 01                	push   $0x1
 59e:	56                   	push   %esi
 59f:	57                   	push   %edi
 5a0:	e8 e3 fe ff ff       	call   488 <write>
  while(--i >= 0)
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	39 de                	cmp    %ebx,%esi
 5aa:	75 e4                	jne    590 <printint+0x70>
    putc(fd, buf[i]);
}
 5ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5bf:	eb 87                	jmp    548 <printint+0x28>
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	56                   	push   %esi
 5d9:	53                   	push   %ebx
 5da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 5e0:	0f b6 1e             	movzbl (%esi),%ebx
 5e3:	84 db                	test   %bl,%bl
 5e5:	0f 84 b4 00 00 00    	je     69f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 10             	lea    0x10(%ebp),%eax
 5ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f9:	eb 33                	jmp    62e <printf+0x5e>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
 600:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 603:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	74 17                	je     624 <printf+0x54>
  write(fd, &c, 1);
 60d:	83 ec 04             	sub    $0x4,%esp
 610:	88 5d e7             	mov    %bl,-0x19(%ebp)
 613:	6a 01                	push   $0x1
 615:	57                   	push   %edi
 616:	ff 75 08             	pushl  0x8(%ebp)
 619:	e8 6a fe ff ff       	call   488 <write>
 61e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 621:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 624:	0f b6 1e             	movzbl (%esi),%ebx
 627:	83 c6 01             	add    $0x1,%esi
 62a:	84 db                	test   %bl,%bl
 62c:	74 71                	je     69f <printf+0xcf>
    c = fmt[i] & 0xff;
 62e:	0f be cb             	movsbl %bl,%ecx
 631:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 634:	85 d2                	test   %edx,%edx
 636:	74 c8                	je     600 <printf+0x30>
      }
    } else if(state == '%'){
 638:	83 fa 25             	cmp    $0x25,%edx
 63b:	75 e7                	jne    624 <printf+0x54>
      if(c == 'd'){
 63d:	83 f8 64             	cmp    $0x64,%eax
 640:	0f 84 9a 00 00 00    	je     6e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 646:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 64c:	83 f9 70             	cmp    $0x70,%ecx
 64f:	74 5f                	je     6b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 651:	83 f8 73             	cmp    $0x73,%eax
 654:	0f 84 d6 00 00 00    	je     730 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65a:	83 f8 63             	cmp    $0x63,%eax
 65d:	0f 84 8d 00 00 00    	je     6f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 663:	83 f8 25             	cmp    $0x25,%eax
 666:	0f 84 b4 00 00 00    	je     720 <printf+0x150>
  write(fd, &c, 1);
 66c:	83 ec 04             	sub    $0x4,%esp
 66f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 673:	6a 01                	push   $0x1
 675:	57                   	push   %edi
 676:	ff 75 08             	pushl  0x8(%ebp)
 679:	e8 0a fe ff ff       	call   488 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 67e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 681:	83 c4 0c             	add    $0xc,%esp
 684:	6a 01                	push   $0x1
 686:	83 c6 01             	add    $0x1,%esi
 689:	57                   	push   %edi
 68a:	ff 75 08             	pushl  0x8(%ebp)
 68d:	e8 f6 fd ff ff       	call   488 <write>
  for(i = 0; fmt[i]; i++){
 692:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 696:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 699:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 69b:	84 db                	test   %bl,%bl
 69d:	75 8f                	jne    62e <printf+0x5e>
    }
  }
}
 69f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a2:	5b                   	pop    %ebx
 6a3:	5e                   	pop    %esi
 6a4:	5f                   	pop    %edi
 6a5:	5d                   	pop    %ebp
 6a6:	c3                   	ret    
 6a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b8:	6a 00                	push   $0x0
 6ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	8b 13                	mov    (%ebx),%edx
 6c2:	e8 59 fe ff ff       	call   520 <printint>
        ap++;
 6c7:	89 d8                	mov    %ebx,%eax
 6c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cc:	31 d2                	xor    %edx,%edx
        ap++;
 6ce:	83 c0 04             	add    $0x4,%eax
 6d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d4:	e9 4b ff ff ff       	jmp    624 <printf+0x54>
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	eb ce                	jmp    6ba <printf+0xea>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
        ap++;
 6fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6fd:	57                   	push   %edi
 6fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 701:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 704:	e8 7f fd ff ff       	call   488 <write>
        ap++;
 709:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 70c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 0e ff ff ff       	jmp    624 <printf+0x54>
 716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 720:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
 726:	e9 59 ff ff ff       	jmp    684 <printf+0xb4>
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
        s = (char*)*ap;
 730:	8b 45 d0             	mov    -0x30(%ebp),%eax
 733:	8b 18                	mov    (%eax),%ebx
        ap++;
 735:	83 c0 04             	add    $0x4,%eax
 738:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 73b:	85 db                	test   %ebx,%ebx
 73d:	74 17                	je     756 <printf+0x186>
        while(*s != 0){
 73f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 742:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 744:	84 c0                	test   %al,%al
 746:	0f 84 d8 fe ff ff    	je     624 <printf+0x54>
 74c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 74f:	89 de                	mov    %ebx,%esi
 751:	8b 5d 08             	mov    0x8(%ebp),%ebx
 754:	eb 1a                	jmp    770 <printf+0x1a0>
          s = "(null)";
 756:	bb 4c 09 00 00       	mov    $0x94c,%ebx
        while(*s != 0){
 75b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 75e:	b8 28 00 00 00       	mov    $0x28,%eax
 763:	89 de                	mov    %ebx,%esi
 765:	8b 5d 08             	mov    0x8(%ebp),%ebx
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
          s++;
 773:	83 c6 01             	add    $0x1,%esi
 776:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 779:	6a 01                	push   $0x1
 77b:	57                   	push   %edi
 77c:	53                   	push   %ebx
 77d:	e8 06 fd ff ff       	call   488 <write>
        while(*s != 0){
 782:	0f b6 06             	movzbl (%esi),%eax
 785:	83 c4 10             	add    $0x10,%esp
 788:	84 c0                	test   %al,%al
 78a:	75 e4                	jne    770 <printf+0x1a0>
 78c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 8e fe ff ff       	jmp    624 <printf+0x54>
 796:	66 90                	xchg   %ax,%ax
 798:	66 90                	xchg   %ax,%ax
 79a:	66 90                	xchg   %ax,%ax
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	f3 0f 1e fb          	endbr32 
 7a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a5:	a1 c0 0c 00 00       	mov    0xcc0,%eax
{
 7aa:	89 e5                	mov    %esp,%ebp
 7ac:	57                   	push   %edi
 7ad:	56                   	push   %esi
 7ae:	53                   	push   %ebx
 7af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b7:	39 c8                	cmp    %ecx,%eax
 7b9:	73 15                	jae    7d0 <free+0x30>
 7bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
 7c0:	39 d1                	cmp    %edx,%ecx
 7c2:	72 14                	jb     7d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	39 d0                	cmp    %edx,%eax
 7c6:	73 10                	jae    7d8 <free+0x38>
{
 7c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	39 c8                	cmp    %ecx,%eax
 7ce:	72 f0                	jb     7c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d0:	39 d0                	cmp    %edx,%eax
 7d2:	72 f4                	jb     7c8 <free+0x28>
 7d4:	39 d1                	cmp    %edx,%ecx
 7d6:	73 f0                	jae    7c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7de:	39 fa                	cmp    %edi,%edx
 7e0:	74 1e                	je     800 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e5:	8b 50 04             	mov    0x4(%eax),%edx
 7e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7eb:	39 f1                	cmp    %esi,%ecx
 7ed:	74 28                	je     817 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7f1:	5b                   	pop    %ebx
  freep = p;
 7f2:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 7f7:	5e                   	pop    %esi
 7f8:	5f                   	pop    %edi
 7f9:	5d                   	pop    %ebp
 7fa:	c3                   	ret    
 7fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 800:	03 72 04             	add    0x4(%edx),%esi
 803:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 806:	8b 10                	mov    (%eax),%edx
 808:	8b 12                	mov    (%edx),%edx
 80a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 80d:	8b 50 04             	mov    0x4(%eax),%edx
 810:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 813:	39 f1                	cmp    %esi,%ecx
 815:	75 d8                	jne    7ef <free+0x4f>
    p->s.size += bp->s.size;
 817:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 81a:	a3 c0 0c 00 00       	mov    %eax,0xcc0
    p->s.size += bp->s.size;
 81f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 822:	8b 53 f8             	mov    -0x8(%ebx),%edx
 825:	89 10                	mov    %edx,(%eax)
}
 827:	5b                   	pop    %ebx
 828:	5e                   	pop    %esi
 829:	5f                   	pop    %edi
 82a:	5d                   	pop    %ebp
 82b:	c3                   	ret    
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	f3 0f 1e fb          	endbr32 
 834:	55                   	push   %ebp
 835:	89 e5                	mov    %esp,%ebp
 837:	57                   	push   %edi
 838:	56                   	push   %esi
 839:	53                   	push   %ebx
 83a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 840:	8b 3d c0 0c 00 00    	mov    0xcc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 846:	8d 70 07             	lea    0x7(%eax),%esi
 849:	c1 ee 03             	shr    $0x3,%esi
 84c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 84f:	85 ff                	test   %edi,%edi
 851:	0f 84 a9 00 00 00    	je     900 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 857:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 859:	8b 48 04             	mov    0x4(%eax),%ecx
 85c:	39 f1                	cmp    %esi,%ecx
 85e:	73 6d                	jae    8cd <malloc+0x9d>
 860:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 866:	bb 00 10 00 00       	mov    $0x1000,%ebx
 86b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 86e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 875:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 878:	eb 17                	jmp    891 <malloc+0x61>
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 882:	8b 4a 04             	mov    0x4(%edx),%ecx
 885:	39 f1                	cmp    %esi,%ecx
 887:	73 4f                	jae    8d8 <malloc+0xa8>
 889:	8b 3d c0 0c 00 00    	mov    0xcc0,%edi
 88f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 891:	39 c7                	cmp    %eax,%edi
 893:	75 eb                	jne    880 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 895:	83 ec 0c             	sub    $0xc,%esp
 898:	ff 75 e4             	pushl  -0x1c(%ebp)
 89b:	e8 50 fc ff ff       	call   4f0 <sbrk>
  if(p == (char*)-1)
 8a0:	83 c4 10             	add    $0x10,%esp
 8a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a6:	74 1b                	je     8c3 <malloc+0x93>
  hp->s.size = nu;
 8a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8ab:	83 ec 0c             	sub    $0xc,%esp
 8ae:	83 c0 08             	add    $0x8,%eax
 8b1:	50                   	push   %eax
 8b2:	e8 e9 fe ff ff       	call   7a0 <free>
  return freep;
 8b7:	a1 c0 0c 00 00       	mov    0xcc0,%eax
      if((p = morecore(nunits)) == 0)
 8bc:	83 c4 10             	add    $0x10,%esp
 8bf:	85 c0                	test   %eax,%eax
 8c1:	75 bd                	jne    880 <malloc+0x50>
        return 0;
  }
}
 8c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8c6:	31 c0                	xor    %eax,%eax
}
 8c8:	5b                   	pop    %ebx
 8c9:	5e                   	pop    %esi
 8ca:	5f                   	pop    %edi
 8cb:	5d                   	pop    %ebp
 8cc:	c3                   	ret    
    if(p->s.size >= nunits){
 8cd:	89 c2                	mov    %eax,%edx
 8cf:	89 f8                	mov    %edi,%eax
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8d8:	39 ce                	cmp    %ecx,%esi
 8da:	74 54                	je     930 <malloc+0x100>
        p->s.size -= nunits;
 8dc:	29 f1                	sub    %esi,%ecx
 8de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 8e7:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 8ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8ef:	8d 42 08             	lea    0x8(%edx),%eax
}
 8f2:	5b                   	pop    %ebx
 8f3:	5e                   	pop    %esi
 8f4:	5f                   	pop    %edi
 8f5:	5d                   	pop    %ebp
 8f6:	c3                   	ret    
 8f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 900:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 907:	0c 00 00 
    base.s.size = 0;
 90a:	bf c4 0c 00 00       	mov    $0xcc4,%edi
    base.s.ptr = freep = prevp = &base;
 90f:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 916:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 919:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 91b:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 922:	00 00 00 
    if(p->s.size >= nunits){
 925:	e9 36 ff ff ff       	jmp    860 <malloc+0x30>
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 930:	8b 0a                	mov    (%edx),%ecx
 932:	89 08                	mov    %ecx,(%eax)
 934:	eb b1                	jmp    8e7 <malloc+0xb7>
