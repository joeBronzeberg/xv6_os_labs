
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 43 04 00 00       	call   453 <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 90 01 00 00       	call   1b0 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	push   0x8(%ebp)
  28:	e8 46 04 00 00       	call   473 <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave
  34:	c3                   	ret
  35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3c:	00 
  3d:	8d 76 00             	lea    0x0(%esi),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 24 05 00 00       	push   $0x524
  4e:	e8 5d 01 00 00       	call   1b0 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 24 05 00 00       	push   $0x524
  5c:	6a 01                	push   $0x1
  5e:	e8 10 04 00 00       	call   473 <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6f:	00 
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 c5 03 00 00       	call   44b <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 c6 03 00 00       	call   45b <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 b8 03 00 00       	call   45b <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 56 05 00 00       	push   $0x556
  b0:	e8 fb 00 00 00       	call   1b0 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 56 05 00 00       	push   $0x556
  be:	6a 01                	push   $0x1
  c0:	e8 ae 03 00 00       	call   473 <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave
  c9:	c3                   	ret
      exit();
  ca:	e8 84 03 00 00       	call   453 <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 2f 05 00 00       	push   $0x52f
  d7:	e8 d4 00 00 00       	call   1b0 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 2f 05 00 00       	push   $0x52f
  e5:	6a 01                	push   $0x1
  e7:	e8 87 03 00 00       	call   473 <write>
      exit();
  ec:	e8 62 03 00 00       	call   453 <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 43 05 00 00       	push   $0x543
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 4f 03 00 00       	call   453 <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 74 05 00 00       	push   $0x574
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 38 03 00 00       	call   453 <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14c:	00 
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
 176:	89 d9                	mov    %ebx,%ecx
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave
 185:	c3                   	ret
 186:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18d:	00 
 18e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave
 19c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ab:	00 
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	89 c1                	mov    %eax,%ecx
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret
 1d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dd:	00 
 1de:	66 90                	xchg   %ax,%ax

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c9                   	leave
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 12                	jne    223 <strchr+0x23>
 211:	eb 1d                	jmp    230 <strchr+0x30>
 213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	84 d2                	test   %dl,%dl
 221:	74 0d                	je     230 <strchr+0x30>
    if(*s == c)
 223:	38 d1                	cmp    %dl,%cl
 225:	75 f1                	jne    218 <strchr+0x18>
      return (char*)s;
  return 0;
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret
 234:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23b:	00 
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
 246:	83 ec 34             	sub    $0x34,%esp
  count++;
 249:	8b 15 94 07 00 00    	mov    0x794,%edx
 24f:	8d 72 01             	lea    0x1(%edx),%esi
 252:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 255:	89 35 94 07 00 00    	mov    %esi,0x794
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 25b:	6a 00                	push   $0x0
 25d:	68 64 05 00 00       	push   $0x564
 262:	e8 2c 02 00 00       	call   493 <open>
  if (fd < 0) {
 267:	83 c4 10             	add    $0x10,%esp
 26a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 26d:	85 c0                	test   %eax,%eax
 26f:	0f 88 82 00 00 00    	js     2f7 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 275:	0f 84 8e 00 00 00    	je     309 <gets+0xc9>
 27b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 27d:	85 f6                	test   %esi,%esi
 27f:	0f 84 ee 00 00 00    	je     373 <gets+0x133>
 285:	8d 76 00             	lea    0x0(%esi),%esi
 288:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 28b:	31 f6                	xor    %esi,%esi
 28d:	eb 2a                	jmp    2b9 <gets+0x79>
 28f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	57                   	push   %edi
 29a:	e8 cc 01 00 00       	call   46b <read>
        if(cc < 1)
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 1d                	jle    2c3 <gets+0x83>
          break;
        buf[i++] = c;
 2a6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ad:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 3b                	je     2f0 <gets+0xb0>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 37                	je     2f0 <gets+0xb0>
      for(i=0; i+1 < max; ){
 2b9:	89 f3                	mov    %esi,%ebx
 2bb:	83 c6 01             	add    $0x1,%esi
 2be:	3b 75 0c             	cmp    0xc(%ebp),%esi
 2c1:	7c cd                	jl     290 <gets+0x50>
 2c3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 2c6:	83 ea 01             	sub    $0x1,%edx
 2c9:	73 bd                	jae    288 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 2ce:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 2d1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 2d5:	57                   	push   %edi
 2d6:	e8 a0 01 00 00       	call   47b <close>
 2db:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 2de:	85 db                	test   %ebx,%ebx
 2e0:	74 76                	je     358 <gets+0x118>

  return buf;
}
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
 2f0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 2f3:	89 f3                	mov    %esi,%ebx
 2f5:	eb cf                	jmp    2c6 <gets+0x86>
      printf(1, "nooo\n");
 2f7:	83 ec 08             	sub    $0x8,%esp
 2fa:	68 6e 05 00 00       	push   $0x56e
 2ff:	6a 01                	push   $0x1
 301:	e8 0a fd ff ff       	call   10 <printf>
 306:	83 c4 10             	add    $0x10,%esp
{
 309:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 30b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 30e:	89 df                	mov    %ebx,%edi
 310:	eb 2d                	jmp    33f <gets+0xff>
 312:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	6a 01                	push   $0x1
 31d:	56                   	push   %esi
 31e:	6a 00                	push   $0x0
 320:	e8 46 01 00 00       	call   46b <read>
      if(cc < 1)
 325:	83 c4 10             	add    $0x10,%esp
 328:	85 c0                	test   %eax,%eax
 32a:	7e 1d                	jle    349 <gets+0x109>
      buf[i++] = c;
 32c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 330:	8b 55 08             	mov    0x8(%ebp),%edx
 333:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 337:	3c 0a                	cmp    $0xa,%al
 339:	74 10                	je     34b <gets+0x10b>
 33b:	3c 0d                	cmp    $0xd,%al
 33d:	74 0c                	je     34b <gets+0x10b>
    for(i=0; i+1 < max; ){
 33f:	89 fb                	mov    %edi,%ebx
 341:	83 c7 01             	add    $0x1,%edi
 344:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 347:	7c cf                	jl     318 <gets+0xd8>
 349:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	89 fb                	mov    %edi,%ebx
 350:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 354:	85 db                	test   %ebx,%ebx
 356:	75 8a                	jne    2e2 <gets+0xa2>
 358:	83 ec 0c             	sub    $0xc,%esp
 35b:	68 64 05 00 00       	push   $0x564
 360:	e8 3e 01 00 00       	call   4a3 <unlink>
}
 365:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 368:	83 c4 10             	add    $0x10,%esp
}
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret
  buf[i] = '\0';
 373:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 376:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 379:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 37c:	57                   	push   %edi
 37d:	e8 f9 00 00 00       	call   47b <close>
 382:	83 c4 10             	add    $0x10,%esp
 385:	eb d1                	jmp    358 <gets+0x118>
 387:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38e:	00 
 38f:	90                   	nop

00000390 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	6a 00                	push   $0x0
 39a:	ff 75 08             	push   0x8(%ebp)
 39d:	e8 f1 00 00 00       	call   493 <open>
  if(fd < 0)
 3a2:	83 c4 10             	add    $0x10,%esp
 3a5:	85 c0                	test   %eax,%eax
 3a7:	78 27                	js     3d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	ff 75 0c             	push   0xc(%ebp)
 3af:	89 c3                	mov    %eax,%ebx
 3b1:	50                   	push   %eax
 3b2:	e8 f4 00 00 00       	call   4ab <fstat>
  close(fd);
 3b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ba:	89 c6                	mov    %eax,%esi
  close(fd);
 3bc:	e8 ba 00 00 00       	call   47b <close>
  return r;
 3c1:	83 c4 10             	add    $0x10,%esp
}
 3c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c7:	89 f0                	mov    %esi,%eax
 3c9:	5b                   	pop    %ebx
 3ca:	5e                   	pop    %esi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d5:	eb ed                	jmp    3c4 <stat+0x34>
 3d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3de:	00 
 3df:	90                   	nop

000003e0 <atoi>:

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 02             	movsbl (%edx),%eax
 3ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3f5:	77 1e                	ja     415 <atoi+0x35>
 3f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3fe:	00 
 3ff:	90                   	nop
    n = n*10 + *s++ - '0';
 400:	83 c2 01             	add    $0x1,%edx
 403:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 406:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 40a:	0f be 02             	movsbl (%edx),%eax
 40d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
  return n;
}
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	89 c8                	mov    %ecx,%eax
 41a:	c9                   	leave
 41b:	c3                   	ret
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	8b 45 10             	mov    0x10(%ebp),%eax
 427:	8b 55 08             	mov    0x8(%ebp),%edx
 42a:	56                   	push   %esi
 42b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42e:	85 c0                	test   %eax,%eax
 430:	7e 13                	jle    445 <memmove+0x25>
 432:	01 d0                	add    %edx,%eax
  dst = vdst;
 434:	89 d7                	mov    %edx,%edi
 436:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43d:	00 
 43e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 440:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 441:	39 f8                	cmp    %edi,%eax
 443:	75 fb                	jne    440 <memmove+0x20>
  return vdst;
}
 445:	5e                   	pop    %esi
 446:	89 d0                	mov    %edx,%eax
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret

0000044b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44b:	b8 01 00 00 00       	mov    $0x1,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <exit>:
SYSCALL(exit)
 453:	b8 02 00 00 00       	mov    $0x2,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <wait>:
SYSCALL(wait)
 45b:	b8 03 00 00 00       	mov    $0x3,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <pipe>:
SYSCALL(pipe)
 463:	b8 04 00 00 00       	mov    $0x4,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <read>:
SYSCALL(read)
 46b:	b8 05 00 00 00       	mov    $0x5,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <write>:
SYSCALL(write)
 473:	b8 10 00 00 00       	mov    $0x10,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret

0000047b <close>:
SYSCALL(close)
 47b:	b8 15 00 00 00       	mov    $0x15,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <kill>:
SYSCALL(kill)
 483:	b8 06 00 00 00       	mov    $0x6,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <exec>:
SYSCALL(exec)
 48b:	b8 07 00 00 00       	mov    $0x7,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <open>:
SYSCALL(open)
 493:	b8 0f 00 00 00       	mov    $0xf,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <mknod>:
SYSCALL(mknod)
 49b:	b8 11 00 00 00       	mov    $0x11,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <unlink>:
SYSCALL(unlink)
 4a3:	b8 12 00 00 00       	mov    $0x12,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <fstat>:
SYSCALL(fstat)
 4ab:	b8 08 00 00 00       	mov    $0x8,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <link>:
SYSCALL(link)
 4b3:	b8 13 00 00 00       	mov    $0x13,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <mkdir>:
SYSCALL(mkdir)
 4bb:	b8 14 00 00 00       	mov    $0x14,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <chdir>:
SYSCALL(chdir)
 4c3:	b8 09 00 00 00       	mov    $0x9,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <dup>:
SYSCALL(dup)
 4cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <getpid>:
SYSCALL(getpid)
 4d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <sbrk>:
SYSCALL(sbrk)
 4db:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <sleep>:
SYSCALL(sleep)
 4e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <uptime>:
SYSCALL(uptime)
 4eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret

000004f3 <is_proc_valid>:
SYSCALL(is_proc_valid)
 4f3:	b8 16 00 00 00       	mov    $0x16,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret

000004fb <get_proc_state>:
SYSCALL(get_proc_state)
 4fb:	b8 17 00 00 00       	mov    $0x17,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <fill_proc_name>:
SYSCALL(fill_proc_name)
 503:	b8 18 00 00 00       	mov    $0x18,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <get_proc_name>:
SYSCALL(get_proc_name)
 50b:	b8 19 00 00 00       	mov    $0x19,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret

00000513 <get_num_syscall>:
SYSCALL(get_num_syscall)
 513:	b8 1a 00 00 00       	mov    $0x1a,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret

0000051b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 51b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret
