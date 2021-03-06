
_grep:     file format elf32-i386


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
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 18             	sub    $0x18,%esp
  18:	8b 01                	mov    (%ecx),%eax
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
  1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  20:	83 f8 01             	cmp    $0x1,%eax
  23:	7e 6b                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  25:	8b 43 04             	mov    0x4(%ebx),%eax
  28:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  2b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2f:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  34:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  37:	75 29                	jne    62 <main+0x62>
  39:	eb 68                	jmp    a3 <main+0xa3>
  3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  3f:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	pushl  -0x20(%ebp)
  4d:	e8 de 01 00 00       	call   230 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 06 07 00 00       	call   760 <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	pushl  (%ebx)
  69:	e8 0a 07 00 00       	call   778 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	pushl  (%ebx)
  7a:	68 28 0c 00 00       	push   $0xc28
  7f:	6a 01                	push   $0x1
  81:	e8 1a 08 00 00       	call   8a0 <printf>
      exit();
  86:	e8 ad 06 00 00       	call   738 <exit>
  }
  exit();
  8b:	e8 a8 06 00 00       	call   738 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 08 0c 00 00       	push   $0xc08
  97:	6a 02                	push   $0x2
  99:	e8 02 08 00 00       	call   8a0 <printf>
    exit();
  9e:	e8 95 06 00 00       	call   738 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 83 01 00 00       	call   230 <grep>
    exit();
  ad:	e8 86 06 00 00       	call   738 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  c0:	f3 0f 1e fb          	endbr32 
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	57                   	push   %edi
  c8:	56                   	push   %esi
  c9:	53                   	push   %ebx
  ca:	83 ec 0c             	sub    $0xc,%esp
  cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  d0:	8b 75 0c             	mov    0xc(%ebp),%esi
  d3:	8b 7d 10             	mov    0x10(%ebp),%edi
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  e0:	83 ec 08             	sub    $0x8,%esp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	e8 36 00 00 00       	call   120 <matchhere>
  ea:	83 c4 10             	add    $0x10,%esp
  ed:	85 c0                	test   %eax,%eax
  ef:	75 1f                	jne    110 <matchstar+0x50>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  f1:	0f be 17             	movsbl (%edi),%edx
  f4:	84 d2                	test   %dl,%dl
  f6:	74 0c                	je     104 <matchstar+0x44>
  f8:	83 c7 01             	add    $0x1,%edi
  fb:	39 da                	cmp    %ebx,%edx
  fd:	74 e1                	je     e0 <matchstar+0x20>
  ff:	83 fb 2e             	cmp    $0x2e,%ebx
 102:	74 dc                	je     e0 <matchstar+0x20>
  return 0;
}
 104:	8d 65 f4             	lea    -0xc(%ebp),%esp
 107:	5b                   	pop    %ebx
 108:	5e                   	pop    %esi
 109:	5f                   	pop    %edi
 10a:	5d                   	pop    %ebp
 10b:	c3                   	ret    
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 113:	b8 01 00 00 00       	mov    $0x1,%eax
}
 118:	5b                   	pop    %ebx
 119:	5e                   	pop    %esi
 11a:	5f                   	pop    %edi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <matchhere>:
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
 12a:	83 ec 0c             	sub    $0xc,%esp
 12d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 130:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 133:	0f b6 01             	movzbl (%ecx),%eax
 136:	84 c0                	test   %al,%al
 138:	75 2b                	jne    165 <matchhere+0x45>
 13a:	eb 64                	jmp    1a0 <matchhere+0x80>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(re[0] == '$' && re[1] == '\0')
 140:	0f b6 37             	movzbl (%edi),%esi
 143:	80 fa 24             	cmp    $0x24,%dl
 146:	75 04                	jne    14c <matchhere+0x2c>
 148:	84 c0                	test   %al,%al
 14a:	74 61                	je     1ad <matchhere+0x8d>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 14c:	89 f3                	mov    %esi,%ebx
 14e:	84 db                	test   %bl,%bl
 150:	74 3e                	je     190 <matchhere+0x70>
 152:	80 fa 2e             	cmp    $0x2e,%dl
 155:	74 04                	je     15b <matchhere+0x3b>
 157:	38 d3                	cmp    %dl,%bl
 159:	75 35                	jne    190 <matchhere+0x70>
    return matchhere(re+1, text+1);
 15b:	83 c7 01             	add    $0x1,%edi
 15e:	83 c1 01             	add    $0x1,%ecx
  if(re[0] == '\0')
 161:	84 c0                	test   %al,%al
 163:	74 3b                	je     1a0 <matchhere+0x80>
  if(re[1] == '*')
 165:	0f be d0             	movsbl %al,%edx
 168:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 16c:	3c 2a                	cmp    $0x2a,%al
 16e:	75 d0                	jne    140 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	83 c1 02             	add    $0x2,%ecx
 176:	57                   	push   %edi
 177:	51                   	push   %ecx
 178:	52                   	push   %edx
 179:	e8 42 ff ff ff       	call   c0 <matchstar>
 17e:	83 c4 10             	add    $0x10,%esp
}
 181:	8d 65 f4             	lea    -0xc(%ebp),%esp
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5f                   	pop    %edi
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 193:	31 c0                	xor    %eax,%eax
}
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 1a3:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a8:	5b                   	pop    %ebx
 1a9:	5e                   	pop    %esi
 1aa:	5f                   	pop    %edi
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
    return *text == '\0';
 1ad:	89 f0                	mov    %esi,%eax
 1af:	84 c0                	test   %al,%al
 1b1:	0f 94 c0             	sete   %al
 1b4:	0f b6 c0             	movzbl %al,%eax
 1b7:	eb c8                	jmp    181 <matchhere+0x61>
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <match>:
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	56                   	push   %esi
 1c8:	53                   	push   %ebx
 1c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1cf:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1d2:	75 15                	jne    1e9 <match+0x29>
 1d4:	eb 3a                	jmp    210 <match+0x50>
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e0:	83 c6 01             	add    $0x1,%esi
 1e3:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1e7:	74 16                	je     1ff <match+0x3f>
    if(matchhere(re, text))
 1e9:	83 ec 08             	sub    $0x8,%esp
 1ec:	56                   	push   %esi
 1ed:	53                   	push   %ebx
 1ee:	e8 2d ff ff ff       	call   120 <matchhere>
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	85 c0                	test   %eax,%eax
 1f8:	74 e6                	je     1e0 <match+0x20>
      return 1;
 1fa:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 202:	5b                   	pop    %ebx
 203:	5e                   	pop    %esi
 204:	5d                   	pop    %ebp
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 210:	83 c3 01             	add    $0x1,%ebx
 213:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ff fe ff ff       	jmp    120 <matchhere>
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <grep>:
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
 239:	53                   	push   %ebx
 23a:	83 ec 1c             	sub    $0x1c,%esp
  m = 0;
 23d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
{
 244:	8b 75 08             	mov    0x8(%ebp),%esi
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 250:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 253:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 258:	83 ec 04             	sub    $0x4,%esp
 25b:	29 c8                	sub    %ecx,%eax
 25d:	50                   	push   %eax
 25e:	8d 81 c0 10 00 00    	lea    0x10c0(%ecx),%eax
 264:	50                   	push   %eax
 265:	ff 75 0c             	pushl  0xc(%ebp)
 268:	e8 e3 04 00 00       	call   750 <read>
 26d:	83 c4 10             	add    $0x10,%esp
 270:	85 c0                	test   %eax,%eax
 272:	0f 8e b8 00 00 00    	jle    330 <grep+0x100>
    m += n;
 278:	01 45 e4             	add    %eax,-0x1c(%ebp)
 27b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    p = buf;
 27e:	bb c0 10 00 00       	mov    $0x10c0,%ebx
    buf[m] = '\0';
 283:	c6 81 c0 10 00 00 00 	movb   $0x0,0x10c0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 290:	83 ec 08             	sub    $0x8,%esp
 293:	6a 0a                	push   $0xa
 295:	53                   	push   %ebx
 296:	e8 85 01 00 00       	call   420 <strchr>
 29b:	83 c4 10             	add    $0x10,%esp
 29e:	89 c7                	mov    %eax,%edi
 2a0:	85 c0                	test   %eax,%eax
 2a2:	74 3c                	je     2e0 <grep+0xb0>
      if(match(pattern, p)){
 2a4:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 2a7:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 2aa:	53                   	push   %ebx
 2ab:	56                   	push   %esi
 2ac:	e8 0f ff ff ff       	call   1c0 <match>
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	8d 57 01             	lea    0x1(%edi),%edx
 2b7:	85 c0                	test   %eax,%eax
 2b9:	75 05                	jne    2c0 <grep+0x90>
      p = q+1;
 2bb:	89 d3                	mov    %edx,%ebx
 2bd:	eb d1                	jmp    290 <grep+0x60>
 2bf:	90                   	nop
        write(1, p, q+1 - p);
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2c5:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)
 2cd:	50                   	push   %eax
 2ce:	53                   	push   %ebx
 2cf:	6a 01                	push   $0x1
 2d1:	e8 82 04 00 00       	call   758 <write>
 2d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2d9:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 2dc:	89 d3                	mov    %edx,%ebx
 2de:	eb b0                	jmp    290 <grep+0x60>
    if(p == buf)
 2e0:	81 fb c0 10 00 00    	cmp    $0x10c0,%ebx
 2e6:	74 38                	je     320 <grep+0xf0>
    if(m > 0){
 2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 2eb:	85 c9                	test   %ecx,%ecx
 2ed:	0f 8e 5d ff ff ff    	jle    250 <grep+0x20>
      m -= p - buf;
 2f3:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2f5:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f8:	2d c0 10 00 00       	sub    $0x10c0,%eax
 2fd:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2ff:	51                   	push   %ecx
 300:	53                   	push   %ebx
 301:	68 c0 10 00 00       	push   $0x10c0
      m -= p - buf;
 306:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 309:	e8 62 02 00 00       	call   570 <memmove>
 30e:	83 c4 10             	add    $0x10,%esp
 311:	e9 3a ff ff ff       	jmp    250 <grep+0x20>
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 0;
 320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 327:	e9 24 ff ff ff       	jmp    250 <grep+0x20>
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
    return val;
}

char*
strcpy(char *s, const char *t)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 345:	31 c0                	xor    %eax,%eax
{
 347:	89 e5                	mov    %esp,%ebp
 349:	53                   	push   %ebx
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
 37b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	0f b6 1a             	movzbl (%edx),%ebx
 384:	84 c0                	test   %al,%al
 386:	75 19                	jne    3a1 <strcmp+0x31>
 388:	eb 26                	jmp    3b0 <strcmp+0x40>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3ca:	80 3a 00             	cmpb   $0x0,(%edx)
 3cd:	74 21                	je     3f0 <strlen+0x30>
 3cf:	31 c0                	xor    %eax,%eax
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3df:	89 c1                	mov    %eax,%ecx
 3e1:	75 f5                	jne    3d8 <strlen+0x18>
    ;
  return n;
}
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 d7                	mov    %edx,%edi
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42e:	0f b6 10             	movzbl (%eax),%edx
 431:	84 d2                	test   %dl,%dl
 433:	75 16                	jne    44b <strchr+0x2b>
 435:	eb 21                	jmp    458 <strchr+0x38>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 444:	83 c0 01             	add    $0x1,%eax
 447:	84 d2                	test   %dl,%dl
 449:	74 0d                	je     458 <strchr+0x38>
    if(*s == c)
 44b:	38 d1                	cmp    %dl,%cl
 44d:	75 f1                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 458:	31 c0                	xor    %eax,%eax
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	31 f6                	xor    %esi,%esi
{
 46b:	53                   	push   %ebx
 46c:	89 f3                	mov    %esi,%ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 474:	eb 33                	jmp    4a9 <gets+0x49>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8d 45 e7             	lea    -0x19(%ebp),%eax
 486:	6a 01                	push   $0x1
 488:	50                   	push   %eax
 489:	6a 00                	push   $0x0
 48b:	e8 c0 02 00 00       	call   750 <read>
    if(cc < 1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	7e 1c                	jle    4b3 <gets+0x53>
      break;
    buf[i++] = c;
 497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49b:	83 c7 01             	add    $0x1,%edi
 49e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	74 23                	je     4c8 <gets+0x68>
 4a5:	3c 0d                	cmp    $0xd,%al
 4a7:	74 1f                	je     4c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	89 fe                	mov    %edi,%esi
 4ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b1:	7c cd                	jl     480 <gets+0x20>
 4b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	8b 75 08             	mov    0x8(%ebp),%esi
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	01 de                	add    %ebx,%esi
 4d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5f                   	pop    %edi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	6a 00                	push   $0x0
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 82 02 00 00       	call   778 <open>
  if(fd < 0)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 2b                	js     528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4fd:	83 ec 08             	sub    $0x8,%esp
 500:	ff 75 0c             	pushl  0xc(%ebp)
 503:	89 c3                	mov    %eax,%ebx
 505:	50                   	push   %eax
 506:	e8 85 02 00 00       	call   790 <fstat>
  close(fd);
 50b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50e:	89 c6                	mov    %eax,%esi
  close(fd);
 510:	e8 4b 02 00 00       	call   760 <close>
  return r;
 515:	83 c4 10             	add    $0x10,%esp
}
 518:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51b:	89 f0                	mov    %esi,%eax
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb e9                	jmp    518 <stat+0x38>
 52f:	90                   	nop

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	0f be 02             	movsbl (%edx),%eax
 53e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 549:	77 1a                	ja     565 <atoi+0x35>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	89 c8                	mov    %ecx,%eax
 567:	5b                   	pop    %ebx
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	8b 45 10             	mov    0x10(%ebp),%eax
 57b:	8b 55 08             	mov    0x8(%ebp),%edx
 57e:	56                   	push   %esi
 57f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	85 c0                	test   %eax,%eax
 584:	7e 0f                	jle    595 <memmove+0x25>
 586:	01 d0                	add    %edx,%eax
  dst = vdst;
 588:	89 d7                	mov    %edx,%edi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void* arg1, void* arg2)
{
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	53                   	push   %ebx
 5a8:	83 ec 10             	sub    $0x10,%esp
  void* freeptr = malloc(PGSIZE*2);
 5ab:	68 00 20 00 00       	push   $0x2000
 5b0:	e8 4b 05 00 00       	call   b00 <malloc>
  void* stack;
  if(freeptr == 0)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	85 c0                	test   %eax,%eax
 5ba:	74 6e                	je     62a <thread_create+0x8a>
    return -1;
  if((uint)freeptr % PGSIZE == 0)
 5bc:	89 c2                	mov    %eax,%edx
 5be:	89 c3                	mov    %eax,%ebx
 5c0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 5c6:	75 58                	jne    620 <thread_create+0x80>
    stack = freeptr;
  else
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
  for(int i = 0; i < MAX_PROC; i++){
 5c8:	b9 c0 14 00 00       	mov    $0x14c0,%ecx
 5cd:	31 d2                	xor    %edx,%edx
 5cf:	eb 12                	jmp    5e3 <thread_create+0x43>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	83 c2 01             	add    $0x1,%edx
 5db:	83 c1 0c             	add    $0xc,%ecx
 5de:	83 fa 40             	cmp    $0x40,%edx
 5e1:	74 21                	je     604 <thread_create+0x64>
    if(ptrs[i].busy == 0){
 5e3:	83 39 00             	cmpl   $0x0,(%ecx)
 5e6:	75 f0                	jne    5d8 <thread_create+0x38>
      ptrs[i].ptr = freeptr;
 5e8:	8d 14 52             	lea    (%edx,%edx,2),%edx
 5eb:	c1 e2 02             	shl    $0x2,%edx
 5ee:	89 82 c4 14 00 00    	mov    %eax,0x14c4(%edx)
      ptrs[i].stack = stack;
 5f4:	89 9a c8 14 00 00    	mov    %ebx,0x14c8(%edx)
      ptrs[i].busy = 1;
 5fa:	c7 82 c0 14 00 00 01 	movl   $0x1,0x14c0(%edx)
 601:	00 00 00 
      break;
    }
  }
  return clone(start_routine, arg1, arg2, stack);
 604:	53                   	push   %ebx
 605:	ff 75 10             	pushl  0x10(%ebp)
 608:	ff 75 0c             	pushl  0xc(%ebp)
 60b:	ff 75 08             	pushl  0x8(%ebp)
 60e:	e8 c5 01 00 00       	call   7d8 <clone>
 613:	83 c4 10             	add    $0x10,%esp
}
 616:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 619:	c9                   	leave  
 61a:	c3                   	ret    
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
    stack = freeptr + (PGSIZE - ((uint)freeptr % PGSIZE));
 620:	29 d3                	sub    %edx,%ebx
 622:	8d 9b 00 10 00 00    	lea    0x1000(%ebx),%ebx
 628:	eb 9e                	jmp    5c8 <thread_create+0x28>
    return -1;
 62a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 62f:	eb e5                	jmp    616 <thread_create+0x76>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop

00000640 <thread_join>:

int thread_join()
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 649:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 64c:	53                   	push   %ebx
 64d:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 650:	50                   	push   %eax
 651:	e8 8a 01 00 00       	call   7e0 <join>
 656:	ba c0 14 00 00       	mov    $0x14c0,%edx
 65b:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < MAX_PROC; i++){
 65e:	31 c9                	xor    %ecx,%ecx
  int ret = join(&stack);
 660:	89 c3                	mov    %eax,%ebx
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 662:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 665:	eb 14                	jmp    67b <thread_join+0x3b>
 667:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66e:	66 90                	xchg   %ax,%ax
  for(int i = 0; i < MAX_PROC; i++){
 670:	83 c1 01             	add    $0x1,%ecx
 673:	83 c2 0c             	add    $0xc,%edx
 676:	83 f9 40             	cmp    $0x40,%ecx
 679:	74 3f                	je     6ba <thread_join+0x7a>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 67b:	83 3a 01             	cmpl   $0x1,(%edx)
 67e:	75 f0                	jne    670 <thread_join+0x30>
 680:	39 42 08             	cmp    %eax,0x8(%edx)
 683:	75 eb                	jne    670 <thread_join+0x30>
      free(ptrs[i].ptr);
 685:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	c1 e6 02             	shl    $0x2,%esi
 68e:	ff b6 c4 14 00 00    	pushl  0x14c4(%esi)
 694:	e8 d7 03 00 00       	call   a70 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 699:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 69c:	c7 86 c8 14 00 00 00 	movl   $0x0,0x14c8(%esi)
 6a3:	00 00 00 
      ptrs[i].busy = 0;
 6a6:	c7 86 c0 14 00 00 00 	movl   $0x0,0x14c0(%esi)
 6ad:	00 00 00 
      ptrs[i].ptr = NULL;
 6b0:	c7 86 c4 14 00 00 00 	movl   $0x0,0x14c4(%esi)
 6b7:	00 00 00 
    }
  }
  return ret;  
}
 6ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bd:	89 d8                	mov    %ebx,%eax
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop

000006d0 <lock_init>:

void lock_init(lock_t *lock)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 6da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 6e0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 6e7:	5d                   	pop    %ebp
 6e8:	c3                   	ret    
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006f0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	55                   	push   %ebp
    __asm__ volatile
 6f5:	b9 01 00 00 00       	mov    $0x1,%ecx
void lock_acquire(lock_t *lock){
 6fa:	89 e5                	mov    %esp,%ebp
 6fc:	53                   	push   %ebx
 6fd:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile
 700:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 704:	31 db                	xor    %ebx,%ebx
 706:	83 c2 04             	add    $0x4,%edx
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 710:	89 d8                	mov    %ebx,%eax
 712:	f0 0f c1 02          	lock xadd %eax,(%edx)
  int turn = fetch_and_add(&lock->ticket, 1);
  while(fetch_and_add(&lock->turn, 0) != turn); // spin lock
 716:	39 c1                	cmp    %eax,%ecx
 718:	75 f6                	jne    710 <lock_acquire+0x20>
}
 71a:	5b                   	pop    %ebx
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret    
 71d:	8d 76 00             	lea    0x0(%esi),%esi

00000720 <lock_release>:

void lock_release(lock_t *lock){
 720:	f3 0f 1e fb          	endbr32 
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->turn = lock->turn + 1;
 72a:	83 40 04 01          	addl   $0x1,0x4(%eax)
}
 72e:	5d                   	pop    %ebp
 72f:	c3                   	ret    

00000730 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 730:	b8 01 00 00 00       	mov    $0x1,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <exit>:
SYSCALL(exit)
 738:	b8 02 00 00 00       	mov    $0x2,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <wait>:
SYSCALL(wait)
 740:	b8 03 00 00 00       	mov    $0x3,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <pipe>:
SYSCALL(pipe)
 748:	b8 04 00 00 00       	mov    $0x4,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <read>:
SYSCALL(read)
 750:	b8 06 00 00 00       	mov    $0x6,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <write>:
SYSCALL(write)
 758:	b8 05 00 00 00       	mov    $0x5,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <close>:
SYSCALL(close)
 760:	b8 07 00 00 00       	mov    $0x7,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <kill>:
SYSCALL(kill)
 768:	b8 08 00 00 00       	mov    $0x8,%eax
 76d:	cd 40                	int    $0x40
 76f:	c3                   	ret    

00000770 <exec>:
SYSCALL(exec)
 770:	b8 09 00 00 00       	mov    $0x9,%eax
 775:	cd 40                	int    $0x40
 777:	c3                   	ret    

00000778 <open>:
SYSCALL(open)
 778:	b8 0a 00 00 00       	mov    $0xa,%eax
 77d:	cd 40                	int    $0x40
 77f:	c3                   	ret    

00000780 <mknod>:
SYSCALL(mknod)
 780:	b8 0b 00 00 00       	mov    $0xb,%eax
 785:	cd 40                	int    $0x40
 787:	c3                   	ret    

00000788 <unlink>:
SYSCALL(unlink)
 788:	b8 0c 00 00 00       	mov    $0xc,%eax
 78d:	cd 40                	int    $0x40
 78f:	c3                   	ret    

00000790 <fstat>:
SYSCALL(fstat)
 790:	b8 0d 00 00 00       	mov    $0xd,%eax
 795:	cd 40                	int    $0x40
 797:	c3                   	ret    

00000798 <link>:
SYSCALL(link)
 798:	b8 0e 00 00 00       	mov    $0xe,%eax
 79d:	cd 40                	int    $0x40
 79f:	c3                   	ret    

000007a0 <mkdir>:
SYSCALL(mkdir)
 7a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 7a5:	cd 40                	int    $0x40
 7a7:	c3                   	ret    

000007a8 <chdir>:
SYSCALL(chdir)
 7a8:	b8 10 00 00 00       	mov    $0x10,%eax
 7ad:	cd 40                	int    $0x40
 7af:	c3                   	ret    

000007b0 <dup>:
SYSCALL(dup)
 7b0:	b8 11 00 00 00       	mov    $0x11,%eax
 7b5:	cd 40                	int    $0x40
 7b7:	c3                   	ret    

000007b8 <getpid>:
SYSCALL(getpid)
 7b8:	b8 12 00 00 00       	mov    $0x12,%eax
 7bd:	cd 40                	int    $0x40
 7bf:	c3                   	ret    

000007c0 <sbrk>:
SYSCALL(sbrk)
 7c0:	b8 13 00 00 00       	mov    $0x13,%eax
 7c5:	cd 40                	int    $0x40
 7c7:	c3                   	ret    

000007c8 <sleep>:
SYSCALL(sleep)
 7c8:	b8 14 00 00 00       	mov    $0x14,%eax
 7cd:	cd 40                	int    $0x40
 7cf:	c3                   	ret    

000007d0 <uptime>:
SYSCALL(uptime)
 7d0:	b8 15 00 00 00       	mov    $0x15,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <clone>:
SYSCALL(clone)
 7d8:	b8 16 00 00 00       	mov    $0x16,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <join>:
SYSCALL(join) 
 7e0:	b8 17 00 00 00       	mov    $0x17,%eax
 7e5:	cd 40                	int    $0x40
 7e7:	c3                   	ret    
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 3c             	sub    $0x3c,%esp
 7f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7fc:	89 d1                	mov    %edx,%ecx
{
 7fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 801:	85 d2                	test   %edx,%edx
 803:	0f 89 7f 00 00 00    	jns    888 <printint+0x98>
 809:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 80d:	74 79                	je     888 <printint+0x98>
    neg = 1;
 80f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 816:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 818:	31 db                	xor    %ebx,%ebx
 81a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 820:	89 c8                	mov    %ecx,%eax
 822:	31 d2                	xor    %edx,%edx
 824:	89 cf                	mov    %ecx,%edi
 826:	f7 75 c4             	divl   -0x3c(%ebp)
 829:	0f b6 92 48 0c 00 00 	movzbl 0xc48(%edx),%edx
 830:	89 45 c0             	mov    %eax,-0x40(%ebp)
 833:	89 d8                	mov    %ebx,%eax
 835:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 838:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 83b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 83e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 841:	76 dd                	jbe    820 <printint+0x30>
  if(neg)
 843:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 846:	85 c9                	test   %ecx,%ecx
 848:	74 0c                	je     856 <printint+0x66>
    buf[i++] = '-';
 84a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 84f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 851:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 856:	8b 7d b8             	mov    -0x48(%ebp),%edi
 859:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 85d:	eb 07                	jmp    866 <printint+0x76>
 85f:	90                   	nop
 860:	0f b6 13             	movzbl (%ebx),%edx
 863:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 866:	83 ec 04             	sub    $0x4,%esp
 869:	88 55 d7             	mov    %dl,-0x29(%ebp)
 86c:	6a 01                	push   $0x1
 86e:	56                   	push   %esi
 86f:	57                   	push   %edi
 870:	e8 e3 fe ff ff       	call   758 <write>
  while(--i >= 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	39 de                	cmp    %ebx,%esi
 87a:	75 e4                	jne    860 <printint+0x70>
    putc(fd, buf[i]);
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87f:	5b                   	pop    %ebx
 880:	5e                   	pop    %esi
 881:	5f                   	pop    %edi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret    
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 888:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 88f:	eb 87                	jmp    818 <printint+0x28>
 891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop

000008a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8a0:	f3 0f 1e fb          	endbr32 
 8a4:	55                   	push   %ebp
 8a5:	89 e5                	mov    %esp,%ebp
 8a7:	57                   	push   %edi
 8a8:	56                   	push   %esi
 8a9:	53                   	push   %ebx
 8aa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ad:	8b 75 0c             	mov    0xc(%ebp),%esi
 8b0:	0f b6 1e             	movzbl (%esi),%ebx
 8b3:	84 db                	test   %bl,%bl
 8b5:	0f 84 b4 00 00 00    	je     96f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 8bb:	8d 45 10             	lea    0x10(%ebp),%eax
 8be:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 8c4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 8c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8c9:	eb 33                	jmp    8fe <printf+0x5e>
 8cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
 8d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 8d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 8d8:	83 f8 25             	cmp    $0x25,%eax
 8db:	74 17                	je     8f4 <printf+0x54>
  write(fd, &c, 1);
 8dd:	83 ec 04             	sub    $0x4,%esp
 8e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 8e3:	6a 01                	push   $0x1
 8e5:	57                   	push   %edi
 8e6:	ff 75 08             	pushl  0x8(%ebp)
 8e9:	e8 6a fe ff ff       	call   758 <write>
 8ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 8f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 8f4:	0f b6 1e             	movzbl (%esi),%ebx
 8f7:	83 c6 01             	add    $0x1,%esi
 8fa:	84 db                	test   %bl,%bl
 8fc:	74 71                	je     96f <printf+0xcf>
    c = fmt[i] & 0xff;
 8fe:	0f be cb             	movsbl %bl,%ecx
 901:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 904:	85 d2                	test   %edx,%edx
 906:	74 c8                	je     8d0 <printf+0x30>
      }
    } else if(state == '%'){
 908:	83 fa 25             	cmp    $0x25,%edx
 90b:	75 e7                	jne    8f4 <printf+0x54>
      if(c == 'd'){
 90d:	83 f8 64             	cmp    $0x64,%eax
 910:	0f 84 9a 00 00 00    	je     9b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 916:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 91c:	83 f9 70             	cmp    $0x70,%ecx
 91f:	74 5f                	je     980 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 921:	83 f8 73             	cmp    $0x73,%eax
 924:	0f 84 d6 00 00 00    	je     a00 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 92a:	83 f8 63             	cmp    $0x63,%eax
 92d:	0f 84 8d 00 00 00    	je     9c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 933:	83 f8 25             	cmp    $0x25,%eax
 936:	0f 84 b4 00 00 00    	je     9f0 <printf+0x150>
  write(fd, &c, 1);
 93c:	83 ec 04             	sub    $0x4,%esp
 93f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 943:	6a 01                	push   $0x1
 945:	57                   	push   %edi
 946:	ff 75 08             	pushl  0x8(%ebp)
 949:	e8 0a fe ff ff       	call   758 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 94e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 951:	83 c4 0c             	add    $0xc,%esp
 954:	6a 01                	push   $0x1
 956:	83 c6 01             	add    $0x1,%esi
 959:	57                   	push   %edi
 95a:	ff 75 08             	pushl  0x8(%ebp)
 95d:	e8 f6 fd ff ff       	call   758 <write>
  for(i = 0; fmt[i]; i++){
 962:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 966:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 969:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 96b:	84 db                	test   %bl,%bl
 96d:	75 8f                	jne    8fe <printf+0x5e>
    }
  }
}
 96f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
 977:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	b9 10 00 00 00       	mov    $0x10,%ecx
 988:	6a 00                	push   $0x0
 98a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	8b 13                	mov    (%ebx),%edx
 992:	e8 59 fe ff ff       	call   7f0 <printint>
        ap++;
 997:	89 d8                	mov    %ebx,%eax
 999:	83 c4 10             	add    $0x10,%esp
      state = 0;
 99c:	31 d2                	xor    %edx,%edx
        ap++;
 99e:	83 c0 04             	add    $0x4,%eax
 9a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9a4:	e9 4b ff ff ff       	jmp    8f4 <printf+0x54>
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 9b0:	83 ec 0c             	sub    $0xc,%esp
 9b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9b8:	6a 01                	push   $0x1
 9ba:	eb ce                	jmp    98a <printf+0xea>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 9c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 9c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 9c8:	6a 01                	push   $0x1
        ap++;
 9ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 9cd:	57                   	push   %edi
 9ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 9d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9d4:	e8 7f fd ff ff       	call   758 <write>
        ap++;
 9d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 9dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9df:	31 d2                	xor    %edx,%edx
 9e1:	e9 0e ff ff ff       	jmp    8f4 <printf+0x54>
 9e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 9f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 9f3:	83 ec 04             	sub    $0x4,%esp
 9f6:	e9 59 ff ff ff       	jmp    954 <printf+0xb4>
 9fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9ff:	90                   	nop
        s = (char*)*ap;
 a00:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a03:	8b 18                	mov    (%eax),%ebx
        ap++;
 a05:	83 c0 04             	add    $0x4,%eax
 a08:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a0b:	85 db                	test   %ebx,%ebx
 a0d:	74 17                	je     a26 <printf+0x186>
        while(*s != 0){
 a0f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 a12:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 a14:	84 c0                	test   %al,%al
 a16:	0f 84 d8 fe ff ff    	je     8f4 <printf+0x54>
 a1c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a1f:	89 de                	mov    %ebx,%esi
 a21:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a24:	eb 1a                	jmp    a40 <printf+0x1a0>
          s = "(null)";
 a26:	bb 3e 0c 00 00       	mov    $0xc3e,%ebx
        while(*s != 0){
 a2b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 a2e:	b8 28 00 00 00       	mov    $0x28,%eax
 a33:	89 de                	mov    %ebx,%esi
 a35:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3f:	90                   	nop
  write(fd, &c, 1);
 a40:	83 ec 04             	sub    $0x4,%esp
          s++;
 a43:	83 c6 01             	add    $0x1,%esi
 a46:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a49:	6a 01                	push   $0x1
 a4b:	57                   	push   %edi
 a4c:	53                   	push   %ebx
 a4d:	e8 06 fd ff ff       	call   758 <write>
        while(*s != 0){
 a52:	0f b6 06             	movzbl (%esi),%eax
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	84 c0                	test   %al,%al
 a5a:	75 e4                	jne    a40 <printf+0x1a0>
 a5c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 a5f:	31 d2                	xor    %edx,%edx
 a61:	e9 8e fe ff ff       	jmp    8f4 <printf+0x54>
 a66:	66 90                	xchg   %ax,%ax
 a68:	66 90                	xchg   %ax,%ax
 a6a:	66 90                	xchg   %ax,%ax
 a6c:	66 90                	xchg   %ax,%ax
 a6e:	66 90                	xchg   %ax,%ax

00000a70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a70:	f3 0f 1e fb          	endbr32 
 a74:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a75:	a1 a0 10 00 00       	mov    0x10a0,%eax
{
 a7a:	89 e5                	mov    %esp,%ebp
 a7c:	57                   	push   %edi
 a7d:	56                   	push   %esi
 a7e:	53                   	push   %ebx
 a7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a82:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 a84:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a87:	39 c8                	cmp    %ecx,%eax
 a89:	73 15                	jae    aa0 <free+0x30>
 a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
 a90:	39 d1                	cmp    %edx,%ecx
 a92:	72 14                	jb     aa8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a94:	39 d0                	cmp    %edx,%eax
 a96:	73 10                	jae    aa8 <free+0x38>
{
 a98:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a9a:	8b 10                	mov    (%eax),%edx
 a9c:	39 c8                	cmp    %ecx,%eax
 a9e:	72 f0                	jb     a90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa0:	39 d0                	cmp    %edx,%eax
 aa2:	72 f4                	jb     a98 <free+0x28>
 aa4:	39 d1                	cmp    %edx,%ecx
 aa6:	73 f0                	jae    a98 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aa8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aae:	39 fa                	cmp    %edi,%edx
 ab0:	74 1e                	je     ad0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ab2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ab5:	8b 50 04             	mov    0x4(%eax),%edx
 ab8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 abb:	39 f1                	cmp    %esi,%ecx
 abd:	74 28                	je     ae7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 abf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 ac1:	5b                   	pop    %ebx
  freep = p;
 ac2:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 ac7:	5e                   	pop    %esi
 ac8:	5f                   	pop    %edi
 ac9:	5d                   	pop    %ebp
 aca:	c3                   	ret    
 acb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 ad0:	03 72 04             	add    0x4(%edx),%esi
 ad3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ad6:	8b 10                	mov    (%eax),%edx
 ad8:	8b 12                	mov    (%edx),%edx
 ada:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 add:	8b 50 04             	mov    0x4(%eax),%edx
 ae0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ae3:	39 f1                	cmp    %esi,%ecx
 ae5:	75 d8                	jne    abf <free+0x4f>
    p->s.size += bp->s.size;
 ae7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 aea:	a3 a0 10 00 00       	mov    %eax,0x10a0
    p->s.size += bp->s.size;
 aef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 af2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 af5:	89 10                	mov    %edx,(%eax)
}
 af7:	5b                   	pop    %ebx
 af8:	5e                   	pop    %esi
 af9:	5f                   	pop    %edi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b00:	f3 0f 1e fb          	endbr32 
 b04:	55                   	push   %ebp
 b05:	89 e5                	mov    %esp,%ebp
 b07:	57                   	push   %edi
 b08:	56                   	push   %esi
 b09:	53                   	push   %ebx
 b0a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b10:	8b 3d a0 10 00 00    	mov    0x10a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b16:	8d 70 07             	lea    0x7(%eax),%esi
 b19:	c1 ee 03             	shr    $0x3,%esi
 b1c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b1f:	85 ff                	test   %edi,%edi
 b21:	0f 84 a9 00 00 00    	je     bd0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b27:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 b29:	8b 48 04             	mov    0x4(%eax),%ecx
 b2c:	39 f1                	cmp    %esi,%ecx
 b2e:	73 6d                	jae    b9d <malloc+0x9d>
 b30:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b36:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b3b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b3e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 b45:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 b48:	eb 17                	jmp    b61 <malloc+0x61>
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b50:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 b52:	8b 4a 04             	mov    0x4(%edx),%ecx
 b55:	39 f1                	cmp    %esi,%ecx
 b57:	73 4f                	jae    ba8 <malloc+0xa8>
 b59:	8b 3d a0 10 00 00    	mov    0x10a0,%edi
 b5f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b61:	39 c7                	cmp    %eax,%edi
 b63:	75 eb                	jne    b50 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 b65:	83 ec 0c             	sub    $0xc,%esp
 b68:	ff 75 e4             	pushl  -0x1c(%ebp)
 b6b:	e8 50 fc ff ff       	call   7c0 <sbrk>
  if(p == (char*)-1)
 b70:	83 c4 10             	add    $0x10,%esp
 b73:	83 f8 ff             	cmp    $0xffffffff,%eax
 b76:	74 1b                	je     b93 <malloc+0x93>
  hp->s.size = nu;
 b78:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b7b:	83 ec 0c             	sub    $0xc,%esp
 b7e:	83 c0 08             	add    $0x8,%eax
 b81:	50                   	push   %eax
 b82:	e8 e9 fe ff ff       	call   a70 <free>
  return freep;
 b87:	a1 a0 10 00 00       	mov    0x10a0,%eax
      if((p = morecore(nunits)) == 0)
 b8c:	83 c4 10             	add    $0x10,%esp
 b8f:	85 c0                	test   %eax,%eax
 b91:	75 bd                	jne    b50 <malloc+0x50>
        return 0;
  }
}
 b93:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b96:	31 c0                	xor    %eax,%eax
}
 b98:	5b                   	pop    %ebx
 b99:	5e                   	pop    %esi
 b9a:	5f                   	pop    %edi
 b9b:	5d                   	pop    %ebp
 b9c:	c3                   	ret    
    if(p->s.size >= nunits){
 b9d:	89 c2                	mov    %eax,%edx
 b9f:	89 f8                	mov    %edi,%eax
 ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ba8:	39 ce                	cmp    %ecx,%esi
 baa:	74 54                	je     c00 <malloc+0x100>
        p->s.size -= nunits;
 bac:	29 f1                	sub    %esi,%ecx
 bae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 bb1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 bb4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 bb7:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 bbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bbf:	8d 42 08             	lea    0x8(%edx),%eax
}
 bc2:	5b                   	pop    %ebx
 bc3:	5e                   	pop    %esi
 bc4:	5f                   	pop    %edi
 bc5:	5d                   	pop    %ebp
 bc6:	c3                   	ret    
 bc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 bd0:	c7 05 a0 10 00 00 a4 	movl   $0x10a4,0x10a0
 bd7:	10 00 00 
    base.s.size = 0;
 bda:	bf a4 10 00 00       	mov    $0x10a4,%edi
    base.s.ptr = freep = prevp = &base;
 bdf:	c7 05 a4 10 00 00 a4 	movl   $0x10a4,0x10a4
 be6:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 beb:	c7 05 a8 10 00 00 00 	movl   $0x0,0x10a8
 bf2:	00 00 00 
    if(p->s.size >= nunits){
 bf5:	e9 36 ff ff ff       	jmp    b30 <malloc+0x30>
 bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c00:	8b 0a                	mov    (%edx),%ecx
 c02:	89 08                	mov    %ecx,(%eax)
 c04:	eb b1                	jmp    bb7 <malloc+0xb7>
