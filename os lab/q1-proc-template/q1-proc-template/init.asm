
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 a8 08 00 00       	push   $0x8a8
  19:	e8 45 04 00 00       	call   463 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9b 00 00 00    	js     c4 <main+0xc4>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 68 04 00 00       	call   49b <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 5c 04 00 00       	call   49b <dup>

  // for(;;){
    printf(1, "init: starting sh\n");
  3f:	58                   	pop    %eax
  40:	5a                   	pop    %edx
  41:	68 b0 08 00 00       	push   $0x8b0
  46:	6a 01                	push   $0x1
  48:	e8 53 05 00 00       	call   5a0 <printf>
    pid = fork();
  4d:	e8 c9 03 00 00       	call   41b <fork>
    if(pid < 0){
  52:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  55:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  57:	85 c0                	test   %eax,%eax
  59:	78 56                	js     b1 <main+0xb1>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  5b:	75 41                	jne    9e <main+0x9e>
      exec("sh", argv);
  5d:	50                   	push   %eax
  5e:	50                   	push   %eax
  5f:	68 18 0c 00 00       	push   $0xc18
  64:	68 d6 08 00 00       	push   $0x8d6
  69:	e8 ed 03 00 00       	call   45b <exec>
      printf(1, "init: exec sh failed\n");
  6e:	5a                   	pop    %edx
  6f:	59                   	pop    %ecx
  70:	68 d9 08 00 00       	push   $0x8d9
  75:	6a 01                	push   $0x1
  77:	e8 24 05 00 00       	call   5a0 <printf>
      exit();
  7c:	e8 a2 03 00 00       	call   423 <exit>
  81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  88:	85 c0                	test   %eax,%eax
  8a:	78 1b                	js     a7 <main+0xa7>
      printf(1, "zombie!\n");
  8c:	83 ec 08             	sub    $0x8,%esp
  8f:	68 ef 08 00 00       	push   $0x8ef
  94:	6a 01                	push   $0x1
  96:	e8 05 05 00 00       	call   5a0 <printf>
  9b:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  9e:	e8 88 03 00 00       	call   42b <wait>
  a3:	39 c3                	cmp    %eax,%ebx
  a5:	75 e1                	jne    88 <main+0x88>
  // }
  wait();
  a7:	e8 7f 03 00 00       	call   42b <wait>
  exit();
  ac:	e8 72 03 00 00       	call   423 <exit>
      printf(1, "init: fork failed\n");
  b1:	53                   	push   %ebx
  b2:	53                   	push   %ebx
  b3:	68 c3 08 00 00       	push   $0x8c3
  b8:	6a 01                	push   $0x1
  ba:	e8 e1 04 00 00       	call   5a0 <printf>
      exit();
  bf:	e8 5f 03 00 00       	call   423 <exit>
    mknod("console", 1, 1);
  c4:	51                   	push   %ecx
  c5:	6a 01                	push   $0x1
  c7:	6a 01                	push   $0x1
  c9:	68 a8 08 00 00       	push   $0x8a8
  ce:	e8 98 03 00 00       	call   46b <mknod>
    open("console", O_RDWR);
  d3:	5b                   	pop    %ebx
  d4:	58                   	pop    %eax
  d5:	6a 02                	push   $0x2
  d7:	68 a8 08 00 00       	push   $0x8a8
  dc:	e8 82 03 00 00       	call   463 <open>
  e1:	83 c4 10             	add    $0x10,%esp
  e4:	e9 40 ff ff ff       	jmp    29 <main+0x29>
  e9:	66 90                	xchg   %ax,%ax
  eb:	66 90                	xchg   %ax,%ax
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave
 114:	c3                   	ret
 115:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11c:	00 
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
 146:	89 d9                	mov    %ebx,%ecx
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave
 155:	c3                   	ret
 156:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15d:	00 
 15e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave
 16c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17b:	00 
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret
 1a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ad:	00 
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
 216:	83 ec 34             	sub    $0x34,%esp
  count++;
 219:	8b 15 20 0c 00 00    	mov    0xc20,%edx
 21f:	8d 72 01             	lea    0x1(%edx),%esi
 222:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 225:	89 35 20 0c 00 00    	mov    %esi,0xc20
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 22b:	6a 00                	push   $0x0
 22d:	68 f8 08 00 00       	push   $0x8f8
 232:	e8 2c 02 00 00       	call   463 <open>
  if (fd < 0) {
 237:	83 c4 10             	add    $0x10,%esp
 23a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 23d:	85 c0                	test   %eax,%eax
 23f:	0f 88 82 00 00 00    	js     2c7 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 245:	0f 84 8e 00 00 00    	je     2d9 <gets+0xc9>
 24b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 24d:	85 f6                	test   %esi,%esi
 24f:	0f 84 ee 00 00 00    	je     343 <gets+0x133>
 255:	8d 76 00             	lea    0x0(%esi),%esi
 258:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 25b:	31 f6                	xor    %esi,%esi
 25d:	eb 2a                	jmp    289 <gets+0x79>
 25f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 260:	83 ec 04             	sub    $0x4,%esp
 263:	8d 45 e7             	lea    -0x19(%ebp),%eax
 266:	6a 01                	push   $0x1
 268:	50                   	push   %eax
 269:	57                   	push   %edi
 26a:	e8 cc 01 00 00       	call   43b <read>
        if(cc < 1)
 26f:	83 c4 10             	add    $0x10,%esp
 272:	85 c0                	test   %eax,%eax
 274:	7e 1d                	jle    293 <gets+0x83>
          break;
        buf[i++] = c;
 276:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 27d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 281:	3c 0a                	cmp    $0xa,%al
 283:	74 3b                	je     2c0 <gets+0xb0>
 285:	3c 0d                	cmp    $0xd,%al
 287:	74 37                	je     2c0 <gets+0xb0>
      for(i=0; i+1 < max; ){
 289:	89 f3                	mov    %esi,%ebx
 28b:	83 c6 01             	add    $0x1,%esi
 28e:	3b 75 0c             	cmp    0xc(%ebp),%esi
 291:	7c cd                	jl     260 <gets+0x50>
 293:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 296:	83 ea 01             	sub    $0x1,%edx
 299:	73 bd                	jae    258 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 29e:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 2a1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 2a5:	57                   	push   %edi
 2a6:	e8 a0 01 00 00       	call   44b <close>
 2ab:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	74 76                	je     328 <gets+0x118>

  return buf;
}
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b8:	5b                   	pop    %ebx
 2b9:	5e                   	pop    %esi
 2ba:	5f                   	pop    %edi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
 2c0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 2c3:	89 f3                	mov    %esi,%ebx
 2c5:	eb cf                	jmp    296 <gets+0x86>
      printf(1, "nooo\n");
 2c7:	83 ec 08             	sub    $0x8,%esp
 2ca:	68 02 09 00 00       	push   $0x902
 2cf:	6a 01                	push   $0x1
 2d1:	e8 ca 02 00 00       	call   5a0 <printf>
 2d6:	83 c4 10             	add    $0x10,%esp
{
 2d9:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 2db:	8d 75 e7             	lea    -0x19(%ebp),%esi
 2de:	89 df                	mov    %ebx,%edi
 2e0:	eb 2d                	jmp    30f <gets+0xff>
 2e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2e8:	83 ec 04             	sub    $0x4,%esp
 2eb:	6a 01                	push   $0x1
 2ed:	56                   	push   %esi
 2ee:	6a 00                	push   $0x0
 2f0:	e8 46 01 00 00       	call   43b <read>
      if(cc < 1)
 2f5:	83 c4 10             	add    $0x10,%esp
 2f8:	85 c0                	test   %eax,%eax
 2fa:	7e 1d                	jle    319 <gets+0x109>
      buf[i++] = c;
 2fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 300:	8b 55 08             	mov    0x8(%ebp),%edx
 303:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 307:	3c 0a                	cmp    $0xa,%al
 309:	74 10                	je     31b <gets+0x10b>
 30b:	3c 0d                	cmp    $0xd,%al
 30d:	74 0c                	je     31b <gets+0x10b>
    for(i=0; i+1 < max; ){
 30f:	89 fb                	mov    %edi,%ebx
 311:	83 c7 01             	add    $0x1,%edi
 314:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 317:	7c cf                	jl     2e8 <gets+0xd8>
 319:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	89 fb                	mov    %edi,%ebx
 320:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 324:	85 db                	test   %ebx,%ebx
 326:	75 8a                	jne    2b2 <gets+0xa2>
 328:	83 ec 0c             	sub    $0xc,%esp
 32b:	68 f8 08 00 00       	push   $0x8f8
 330:	e8 3e 01 00 00       	call   473 <unlink>
}
 335:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 338:	83 c4 10             	add    $0x10,%esp
}
 33b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33e:	5b                   	pop    %ebx
 33f:	5e                   	pop    %esi
 340:	5f                   	pop    %edi
 341:	5d                   	pop    %ebp
 342:	c3                   	ret
  buf[i] = '\0';
 343:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 346:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 349:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 34c:	57                   	push   %edi
 34d:	e8 f9 00 00 00       	call   44b <close>
 352:	83 c4 10             	add    $0x10,%esp
 355:	eb d1                	jmp    328 <gets+0x118>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop

00000360 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	push   0x8(%ebp)
 36d:	e8 f1 00 00 00       	call   463 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	push   0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f4 00 00 00       	call   47b <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 ba 00 00 00       	call   44b <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ae:	00 
 3af:	90                   	nop

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 02             	movsbl (%edx),%eax
 3ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3c5:	77 1e                	ja     3e5 <atoi+0x35>
 3c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ce:	00 
 3cf:	90                   	nop
    n = n*10 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3da:	0f be 02             	movsbl (%edx),%eax
 3dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	c9                   	leave
 3eb:	c3                   	ret
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 45 10             	mov    0x10(%ebp),%eax
 3f7:	8b 55 08             	mov    0x8(%ebp),%edx
 3fa:	56                   	push   %esi
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 c0                	test   %eax,%eax
 400:	7e 13                	jle    415 <memmove+0x25>
 402:	01 d0                	add    %edx,%eax
  dst = vdst;
 404:	89 d7                	mov    %edx,%edi
 406:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40d:	00 
 40e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 411:	39 f8                	cmp    %edi,%eax
 413:	75 fb                	jne    410 <memmove+0x20>
  return vdst;
}
 415:	5e                   	pop    %esi
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret

0000041b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41b:	b8 01 00 00 00       	mov    $0x1,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <exit>:
SYSCALL(exit)
 423:	b8 02 00 00 00       	mov    $0x2,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <wait>:
SYSCALL(wait)
 42b:	b8 03 00 00 00       	mov    $0x3,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret

00000433 <pipe>:
SYSCALL(pipe)
 433:	b8 04 00 00 00       	mov    $0x4,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret

0000043b <read>:
SYSCALL(read)
 43b:	b8 05 00 00 00       	mov    $0x5,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret

00000443 <write>:
SYSCALL(write)
 443:	b8 10 00 00 00       	mov    $0x10,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret

0000044b <close>:
SYSCALL(close)
 44b:	b8 15 00 00 00       	mov    $0x15,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <kill>:
SYSCALL(kill)
 453:	b8 06 00 00 00       	mov    $0x6,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <exec>:
SYSCALL(exec)
 45b:	b8 07 00 00 00       	mov    $0x7,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <open>:
SYSCALL(open)
 463:	b8 0f 00 00 00       	mov    $0xf,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <mknod>:
SYSCALL(mknod)
 46b:	b8 11 00 00 00       	mov    $0x11,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <unlink>:
SYSCALL(unlink)
 473:	b8 12 00 00 00       	mov    $0x12,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret

0000047b <fstat>:
SYSCALL(fstat)
 47b:	b8 08 00 00 00       	mov    $0x8,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <link>:
SYSCALL(link)
 483:	b8 13 00 00 00       	mov    $0x13,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <mkdir>:
SYSCALL(mkdir)
 48b:	b8 14 00 00 00       	mov    $0x14,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <chdir>:
SYSCALL(chdir)
 493:	b8 09 00 00 00       	mov    $0x9,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <dup>:
SYSCALL(dup)
 49b:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <getpid>:
SYSCALL(getpid)
 4a3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <sbrk>:
SYSCALL(sbrk)
 4ab:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <sleep>:
SYSCALL(sleep)
 4b3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <uptime>:
SYSCALL(uptime)
 4bb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <is_proc_valid>:
SYSCALL(is_proc_valid)
 4c3:	b8 16 00 00 00       	mov    $0x16,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <get_proc_state>:
SYSCALL(get_proc_state)
 4cb:	b8 17 00 00 00       	mov    $0x17,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <fill_proc_name>:
SYSCALL(fill_proc_name)
 4d3:	b8 18 00 00 00       	mov    $0x18,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <get_proc_name>:
SYSCALL(get_proc_name)
 4db:	b8 19 00 00 00       	mov    $0x19,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <get_num_syscall>:
SYSCALL(get_num_syscall)
 4e3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 4eb:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret
 4f3:	66 90                	xchg   %ax,%ax
 4f5:	66 90                	xchg   %ax,%ax
 4f7:	66 90                	xchg   %ax,%ax
 4f9:	66 90                	xchg   %ax,%ax
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 508:	89 d1                	mov    %edx,%ecx
{
 50a:	83 ec 3c             	sub    $0x3c,%esp
 50d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 510:	85 d2                	test   %edx,%edx
 512:	0f 89 80 00 00 00    	jns    598 <printint+0x98>
 518:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51c:	74 7a                	je     598 <printint+0x98>
    x = -xx;
 51e:	f7 d9                	neg    %ecx
    neg = 1;
 520:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 525:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 528:	31 f6                	xor    %esi,%esi
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 f7                	mov    %esi,%edi
 536:	f7 f3                	div    %ebx
 538:	8d 76 01             	lea    0x1(%esi),%esi
 53b:	0f b6 92 68 09 00 00 	movzbl 0x968(%edx),%edx
 542:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 546:	89 ca                	mov    %ecx,%edx
 548:	89 c1                	mov    %eax,%ecx
 54a:	39 da                	cmp    %ebx,%edx
 54c:	73 e2                	jae    530 <printint+0x30>
  if(neg)
 54e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 551:	85 c0                	test   %eax,%eax
 553:	74 07                	je     55c <printint+0x5c>
    buf[i++] = '-';
 555:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 55a:	89 f7                	mov    %esi,%edi
 55c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 55f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 562:	01 df                	add    %ebx,%edi
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 568:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 56b:	83 ec 04             	sub    $0x4,%esp
 56e:	88 45 d7             	mov    %al,-0x29(%ebp)
 571:	8d 45 d7             	lea    -0x29(%ebp),%eax
 574:	6a 01                	push   $0x1
 576:	50                   	push   %eax
 577:	56                   	push   %esi
 578:	e8 c6 fe ff ff       	call   443 <write>
  while(--i >= 0)
 57d:	89 f8                	mov    %edi,%eax
 57f:	83 c4 10             	add    $0x10,%esp
 582:	83 ef 01             	sub    $0x1,%edi
 585:	39 c3                	cmp    %eax,%ebx
 587:	75 df                	jne    568 <printint+0x68>
}
 589:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5f                   	pop    %edi
 58f:	5d                   	pop    %ebp
 590:	c3                   	ret
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	31 c0                	xor    %eax,%eax
 59a:	eb 89                	jmp    525 <printint+0x25>
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 1e             	movzbl (%esi),%ebx
 5b2:	83 c6 01             	add    $0x1,%esi
 5b5:	84 db                	test   %bl,%bl
 5b7:	74 67                	je     620 <printf+0x80>
 5b9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5bc:	31 d2                	xor    %edx,%edx
 5be:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5c1:	eb 34                	jmp    5f7 <printf+0x57>
 5c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5c8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5cb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5d0:	83 f8 25             	cmp    $0x25,%eax
 5d3:	74 18                	je     5ed <printf+0x4d>
  write(fd, &c, 1);
 5d5:	83 ec 04             	sub    $0x4,%esp
 5d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5db:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5de:	6a 01                	push   $0x1
 5e0:	50                   	push   %eax
 5e1:	57                   	push   %edi
 5e2:	e8 5c fe ff ff       	call   443 <write>
 5e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ea:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5ed:	0f b6 1e             	movzbl (%esi),%ebx
 5f0:	83 c6 01             	add    $0x1,%esi
 5f3:	84 db                	test   %bl,%bl
 5f5:	74 29                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5f7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5fa:	85 d2                	test   %edx,%edx
 5fc:	74 ca                	je     5c8 <printf+0x28>
      }
    } else if(state == '%'){
 5fe:	83 fa 25             	cmp    $0x25,%edx
 601:	75 ea                	jne    5ed <printf+0x4d>
      if(c == 'd'){
 603:	83 f8 25             	cmp    $0x25,%eax
 606:	0f 84 04 01 00 00    	je     710 <printf+0x170>
 60c:	83 e8 63             	sub    $0x63,%eax
 60f:	83 f8 15             	cmp    $0x15,%eax
 612:	77 1c                	ja     630 <printf+0x90>
 614:	ff 24 85 10 09 00 00 	jmp    *0x910(,%eax,4)
 61b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret
 628:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 62f:	00 
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	8d 55 e7             	lea    -0x19(%ebp),%edx
 636:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63a:	6a 01                	push   $0x1
 63c:	52                   	push   %edx
 63d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 640:	57                   	push   %edi
 641:	e8 fd fd ff ff       	call   443 <write>
 646:	83 c4 0c             	add    $0xc,%esp
 649:	88 5d e7             	mov    %bl,-0x19(%ebp)
 64c:	6a 01                	push   $0x1
 64e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 651:	52                   	push   %edx
 652:	57                   	push   %edi
 653:	e8 eb fd ff ff       	call   443 <write>
        putc(fd, c);
 658:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65b:	31 d2                	xor    %edx,%edx
 65d:	eb 8e                	jmp    5ed <printf+0x4d>
 65f:	90                   	nop
        printint(fd, *ap, 16, 0);
 660:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 663:	83 ec 0c             	sub    $0xc,%esp
 666:	b9 10 00 00 00       	mov    $0x10,%ecx
 66b:	8b 13                	mov    (%ebx),%edx
 66d:	6a 00                	push   $0x0
 66f:	89 f8                	mov    %edi,%eax
        ap++;
 671:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 674:	e8 87 fe ff ff       	call   500 <printint>
        ap++;
 679:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 67c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67f:	31 d2                	xor    %edx,%edx
 681:	e9 67 ff ff ff       	jmp    5ed <printf+0x4d>
        s = (char*)*ap;
 686:	8b 45 d0             	mov    -0x30(%ebp),%eax
 689:	8b 18                	mov    (%eax),%ebx
        ap++;
 68b:	83 c0 04             	add    $0x4,%eax
 68e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 691:	85 db                	test   %ebx,%ebx
 693:	0f 84 87 00 00 00    	je     720 <printf+0x180>
        while(*s != 0){
 699:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 69c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 69e:	84 c0                	test   %al,%al
 6a0:	0f 84 47 ff ff ff    	je     5ed <printf+0x4d>
 6a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6a9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ac:	89 de                	mov    %ebx,%esi
 6ae:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6b6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	53                   	push   %ebx
 6bc:	57                   	push   %edi
 6bd:	e8 81 fd ff ff       	call   443 <write>
        while(*s != 0){
 6c2:	0f b6 06             	movzbl (%esi),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6cf:	31 d2                	xor    %edx,%edx
 6d1:	e9 17 ff ff ff       	jmp    5ed <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6d6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6d9:	83 ec 0c             	sub    $0xc,%esp
 6dc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e1:	8b 13                	mov    (%ebx),%edx
 6e3:	6a 01                	push   $0x1
 6e5:	eb 88                	jmp    66f <printf+0xcf>
        putc(fd, *ap);
 6e7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ea:	83 ec 04             	sub    $0x4,%esp
 6ed:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6f0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6f2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6f5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	52                   	push   %edx
 6fb:	57                   	push   %edi
 6fc:	e8 42 fd ff ff       	call   443 <write>
        ap++;
 701:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 704:	83 c4 10             	add    $0x10,%esp
      state = 0;
 707:	31 d2                	xor    %edx,%edx
 709:	e9 df fe ff ff       	jmp    5ed <printf+0x4d>
 70e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 5d e7             	mov    %bl,-0x19(%ebp)
 716:	8d 55 e7             	lea    -0x19(%ebp),%edx
 719:	6a 01                	push   $0x1
 71b:	e9 31 ff ff ff       	jmp    651 <printf+0xb1>
 720:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 725:	bb 08 09 00 00       	mov    $0x908,%ebx
 72a:	e9 77 ff ff ff       	jmp    6a6 <printf+0x106>
 72f:	90                   	nop

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 24 0c 00 00       	mov    0xc24,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 748:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74a:	39 c8                	cmp    %ecx,%eax
 74c:	73 32                	jae    780 <free+0x50>
 74e:	39 d1                	cmp    %edx,%ecx
 750:	72 04                	jb     756 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	39 d0                	cmp    %edx,%eax
 754:	72 32                	jb     788 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 756:	8b 73 fc             	mov    -0x4(%ebx),%esi
 759:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75c:	39 fa                	cmp    %edi,%edx
 75e:	74 30                	je     790 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 760:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 763:	8b 50 04             	mov    0x4(%eax),%edx
 766:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 769:	39 f1                	cmp    %esi,%ecx
 76b:	74 3a                	je     7a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 76d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 76f:	5b                   	pop    %ebx
  freep = p;
 770:	a3 24 0c 00 00       	mov    %eax,0xc24
}
 775:	5e                   	pop    %esi
 776:	5f                   	pop    %edi
 777:	5d                   	pop    %ebp
 778:	c3                   	ret
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 04                	jb     788 <free+0x58>
 784:	39 d1                	cmp    %edx,%ecx
 786:	72 ce                	jb     756 <free+0x26>
{
 788:	89 d0                	mov    %edx,%eax
 78a:	eb bc                	jmp    748 <free+0x18>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 790:	03 72 04             	add    0x4(%edx),%esi
 793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 12                	mov    (%edx),%edx
 79a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 79d:	8b 50 04             	mov    0x4(%eax),%edx
 7a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a3:	39 f1                	cmp    %esi,%ecx
 7a5:	75 c6                	jne    76d <free+0x3d>
    p->s.size += bp->s.size;
 7a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7aa:	a3 24 0c 00 00       	mov    %eax,0xc24
    p->s.size += bp->s.size;
 7af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b5:	89 08                	mov    %ecx,(%eax)
}
 7b7:	5b                   	pop    %ebx
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 24 0c 00 00    	mov    0xc24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 78 07             	lea    0x7(%eax),%edi
 7d5:	c1 ef 03             	shr    $0x3,%edi
 7d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7db:	85 d2                	test   %edx,%edx
 7dd:	0f 84 8d 00 00 00    	je     870 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
 7e8:	39 f9                	cmp    %edi,%ecx
 7ea:	73 64                	jae    850 <malloc+0x90>
  if(nu < 4096)
 7ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f1:	39 df                	cmp    %ebx,%edi
 7f3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7fd:	eb 0a                	jmp    809 <malloc+0x49>
 7ff:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 802:	8b 48 04             	mov    0x4(%eax),%ecx
 805:	39 f9                	cmp    %edi,%ecx
 807:	73 47                	jae    850 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 809:	89 c2                	mov    %eax,%edx
 80b:	3b 05 24 0c 00 00    	cmp    0xc24,%eax
 811:	75 ed                	jne    800 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	56                   	push   %esi
 817:	e8 8f fc ff ff       	call   4ab <sbrk>
  if(p == (char*)-1)
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 1c                	je     840 <malloc+0x80>
  hp->s.size = nu;
 824:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 ec 0c             	sub    $0xc,%esp
 82a:	83 c0 08             	add    $0x8,%eax
 82d:	50                   	push   %eax
 82e:	e8 fd fe ff ff       	call   730 <free>
  return freep;
 833:	8b 15 24 0c 00 00    	mov    0xc24,%edx
      if((p = morecore(nunits)) == 0)
 839:	83 c4 10             	add    $0x10,%esp
 83c:	85 d2                	test   %edx,%edx
 83e:	75 c0                	jne    800 <malloc+0x40>
        return 0;
  }
}
 840:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 843:	31 c0                	xor    %eax,%eax
}
 845:	5b                   	pop    %ebx
 846:	5e                   	pop    %esi
 847:	5f                   	pop    %edi
 848:	5d                   	pop    %ebp
 849:	c3                   	ret
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 850:	39 cf                	cmp    %ecx,%edi
 852:	74 4c                	je     8a0 <malloc+0xe0>
        p->s.size -= nunits;
 854:	29 f9                	sub    %edi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 85f:	89 15 24 0c 00 00    	mov    %edx,0xc24
}
 865:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
}
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 870:	c7 05 24 0c 00 00 28 	movl   $0xc28,0xc24
 877:	0c 00 00 
    base.s.size = 0;
 87a:	b8 28 0c 00 00       	mov    $0xc28,%eax
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 28 0c 00 00 28 	movl   $0xc28,0xc28
 886:	0c 00 00 
    base.s.size = 0;
 889:	c7 05 2c 0c 00 00 00 	movl   $0x0,0xc2c
 890:	00 00 00 
    if(p->s.size >= nunits){
 893:	e9 54 ff ff ff       	jmp    7ec <malloc+0x2c>
 898:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 89f:	00 
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 08                	mov    (%eax),%ecx
 8a2:	89 0a                	mov    %ecx,(%edx)
 8a4:	eb b9                	jmp    85f <malloc+0x9f>
