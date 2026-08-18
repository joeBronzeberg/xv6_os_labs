
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7f 26                	jg     4f <main+0x4f>
  29:	eb 52                	jmp    7d <main+0x7d>
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  30:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  33:	83 c6 01             	add    $0x1,%esi
  36:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  39:	50                   	push   %eax
  3a:	e8 51 00 00 00       	call   90 <cat>
    close(fd);
  3f:	89 3c 24             	mov    %edi,(%esp)
  42:	e8 24 04 00 00       	call   46b <close>
  for(i = 1; i < argc; i++){
  47:	83 c4 10             	add    $0x10,%esp
  4a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4d:	74 29                	je     78 <main+0x78>
    if((fd = open(argv[i], 0)) < 0){
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	6a 00                	push   $0x0
  54:	ff 33                	push   (%ebx)
  56:	e8 28 04 00 00       	call   483 <open>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	89 c7                	mov    %eax,%edi
  60:	85 c0                	test   %eax,%eax
  62:	79 cc                	jns    30 <main+0x30>
      printf(1, "cat: cannot open %s\n", argv[i]);
  64:	50                   	push   %eax
  65:	ff 33                	push   (%ebx)
  67:	68 eb 08 00 00       	push   $0x8eb
  6c:	6a 01                	push   $0x1
  6e:	e8 4d 05 00 00       	call   5c0 <printf>
      exit();
  73:	e8 cb 03 00 00       	call   443 <exit>
  }
  exit();
  78:	e8 c6 03 00 00       	call   443 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 b7 03 00 00       	call   443 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 60 0c 00 00       	push   $0xc60
  a9:	6a 01                	push   $0x1
  ab:	e8 b3 03 00 00       	call   463 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 60 0c 00 00       	push   $0xc60
  c4:	56                   	push   %esi
  c5:	e8 91 03 00 00       	call   45b <read>
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
  df:	68 c8 08 00 00       	push   $0x8c8
  e4:	6a 01                	push   $0x1
  e6:	e8 d5 04 00 00       	call   5c0 <printf>
      exit();
  eb:	e8 53 03 00 00       	call   443 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 da 08 00 00       	push   $0x8da
  f7:	6a 01                	push   $0x1
  f9:	e8 c2 04 00 00       	call   5c0 <printf>
    exit();
  fe:	e8 40 03 00 00       	call   443 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	89 c8                	mov    %ecx,%eax
 133:	c9                   	leave
 134:	c3                   	ret
 135:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13c:	00 
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 17                	jne    168 <strcmp+0x28>
 151:	eb 3a                	jmp    18d <strcmp+0x4d>
 153:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 15c:	83 c2 01             	add    $0x1,%edx
 15f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 162:	84 c0                	test   %al,%al
 164:	74 1a                	je     180 <strcmp+0x40>
 166:	89 d9                	mov    %ebx,%ecx
 168:	0f b6 19             	movzbl (%ecx),%ebx
 16b:	38 c3                	cmp    %al,%bl
 16d:	74 e9                	je     158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 16f:	29 d8                	sub    %ebx,%eax
}
 171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 174:	c9                   	leave
 175:	c3                   	ret
 176:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17d:	00 
 17e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave
 18c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb db                	jmp    16f <strcmp+0x2f>
 194:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19b:	00 
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret
 1c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cd:	00 
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret
 224:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22b:	00 
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
 236:	83 ec 34             	sub    $0x34,%esp
  count++;
 239:	8b 15 60 0e 00 00    	mov    0xe60,%edx
 23f:	8d 72 01             	lea    0x1(%edx),%esi
 242:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 245:	89 35 60 0e 00 00    	mov    %esi,0xe60
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 24b:	6a 00                	push   $0x0
 24d:	68 00 09 00 00       	push   $0x900
 252:	e8 2c 02 00 00       	call   483 <open>
  if (fd < 0) {
 257:	83 c4 10             	add    $0x10,%esp
 25a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 25d:	85 c0                	test   %eax,%eax
 25f:	0f 88 82 00 00 00    	js     2e7 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 265:	0f 84 8e 00 00 00    	je     2f9 <gets+0xc9>
 26b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 26d:	85 f6                	test   %esi,%esi
 26f:	0f 84 ee 00 00 00    	je     363 <gets+0x133>
 275:	8d 76 00             	lea    0x0(%esi),%esi
 278:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 27b:	31 f6                	xor    %esi,%esi
 27d:	eb 2a                	jmp    2a9 <gets+0x79>
 27f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	8d 45 e7             	lea    -0x19(%ebp),%eax
 286:	6a 01                	push   $0x1
 288:	50                   	push   %eax
 289:	57                   	push   %edi
 28a:	e8 cc 01 00 00       	call   45b <read>
        if(cc < 1)
 28f:	83 c4 10             	add    $0x10,%esp
 292:	85 c0                	test   %eax,%eax
 294:	7e 1d                	jle    2b3 <gets+0x83>
          break;
        buf[i++] = c;
 296:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 29d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 3b                	je     2e0 <gets+0xb0>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 37                	je     2e0 <gets+0xb0>
      for(i=0; i+1 < max; ){
 2a9:	89 f3                	mov    %esi,%ebx
 2ab:	83 c6 01             	add    $0x1,%esi
 2ae:	3b 75 0c             	cmp    0xc(%ebp),%esi
 2b1:	7c cd                	jl     280 <gets+0x50>
 2b3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 2b6:	83 ea 01             	sub    $0x1,%edx
 2b9:	73 bd                	jae    278 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 2be:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 2c1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 2c5:	57                   	push   %edi
 2c6:	e8 a0 01 00 00       	call   46b <close>
 2cb:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 2ce:	85 db                	test   %ebx,%ebx
 2d0:	74 76                	je     348 <gets+0x118>

  return buf;
}
 2d2:	8b 45 08             	mov    0x8(%ebp),%eax
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 2e3:	89 f3                	mov    %esi,%ebx
 2e5:	eb cf                	jmp    2b6 <gets+0x86>
      printf(1, "nooo\n");
 2e7:	83 ec 08             	sub    $0x8,%esp
 2ea:	68 0a 09 00 00       	push   $0x90a
 2ef:	6a 01                	push   $0x1
 2f1:	e8 ca 02 00 00       	call   5c0 <printf>
 2f6:	83 c4 10             	add    $0x10,%esp
{
 2f9:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 2fb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 2fe:	89 df                	mov    %ebx,%edi
 300:	eb 2d                	jmp    32f <gets+0xff>
 302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 308:	83 ec 04             	sub    $0x4,%esp
 30b:	6a 01                	push   $0x1
 30d:	56                   	push   %esi
 30e:	6a 00                	push   $0x0
 310:	e8 46 01 00 00       	call   45b <read>
      if(cc < 1)
 315:	83 c4 10             	add    $0x10,%esp
 318:	85 c0                	test   %eax,%eax
 31a:	7e 1d                	jle    339 <gets+0x109>
      buf[i++] = c;
 31c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 320:	8b 55 08             	mov    0x8(%ebp),%edx
 323:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 327:	3c 0a                	cmp    $0xa,%al
 329:	74 10                	je     33b <gets+0x10b>
 32b:	3c 0d                	cmp    $0xd,%al
 32d:	74 0c                	je     33b <gets+0x10b>
    for(i=0; i+1 < max; ){
 32f:	89 fb                	mov    %edi,%ebx
 331:	83 c7 01             	add    $0x1,%edi
 334:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 337:	7c cf                	jl     308 <gets+0xd8>
 339:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	89 fb                	mov    %edi,%ebx
 340:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 344:	85 db                	test   %ebx,%ebx
 346:	75 8a                	jne    2d2 <gets+0xa2>
 348:	83 ec 0c             	sub    $0xc,%esp
 34b:	68 00 09 00 00       	push   $0x900
 350:	e8 3e 01 00 00       	call   493 <unlink>
}
 355:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 358:	83 c4 10             	add    $0x10,%esp
}
 35b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35e:	5b                   	pop    %ebx
 35f:	5e                   	pop    %esi
 360:	5f                   	pop    %edi
 361:	5d                   	pop    %ebp
 362:	c3                   	ret
  buf[i] = '\0';
 363:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 366:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 369:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 36c:	57                   	push   %edi
 36d:	e8 f9 00 00 00       	call   46b <close>
 372:	83 c4 10             	add    $0x10,%esp
 375:	eb d1                	jmp    348 <gets+0x118>
 377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37e:	00 
 37f:	90                   	nop

00000380 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 385:	83 ec 08             	sub    $0x8,%esp
 388:	6a 00                	push   $0x0
 38a:	ff 75 08             	push   0x8(%ebp)
 38d:	e8 f1 00 00 00       	call   483 <open>
  if(fd < 0)
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	78 27                	js     3c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	ff 75 0c             	push   0xc(%ebp)
 39f:	89 c3                	mov    %eax,%ebx
 3a1:	50                   	push   %eax
 3a2:	e8 f4 00 00 00       	call   49b <fstat>
  close(fd);
 3a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3aa:	89 c6                	mov    %eax,%esi
  close(fd);
 3ac:	e8 ba 00 00 00       	call   46b <close>
  return r;
 3b1:	83 c4 10             	add    $0x10,%esp
}
 3b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3c5:	eb ed                	jmp    3b4 <stat+0x34>
 3c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ce:	00 
 3cf:	90                   	nop

000003d0 <atoi>:

int
atoi(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3d7:	0f be 02             	movsbl (%edx),%eax
 3da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3e5:	77 1e                	ja     405 <atoi+0x35>
 3e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ee:	00 
 3ef:	90                   	nop
    n = n*10 + *s++ - '0';
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3fa:	0f be 02             	movsbl (%edx),%eax
 3fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 400:	80 fb 09             	cmp    $0x9,%bl
 403:	76 eb                	jbe    3f0 <atoi+0x20>
  return n;
}
 405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 408:	89 c8                	mov    %ecx,%eax
 40a:	c9                   	leave
 40b:	c3                   	ret
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	8b 55 08             	mov    0x8(%ebp),%edx
 41a:	56                   	push   %esi
 41b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 41e:	85 c0                	test   %eax,%eax
 420:	7e 13                	jle    435 <memmove+0x25>
 422:	01 d0                	add    %edx,%eax
  dst = vdst;
 424:	89 d7                	mov    %edx,%edi
 426:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 42d:	00 
 42e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 430:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 431:	39 f8                	cmp    %edi,%eax
 433:	75 fb                	jne    430 <memmove+0x20>
  return vdst;
}
 435:	5e                   	pop    %esi
 436:	89 d0                	mov    %edx,%eax
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret

0000043b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43b:	b8 01 00 00 00       	mov    $0x1,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret

00000443 <exit>:
SYSCALL(exit)
 443:	b8 02 00 00 00       	mov    $0x2,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret

0000044b <wait>:
SYSCALL(wait)
 44b:	b8 03 00 00 00       	mov    $0x3,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <pipe>:
SYSCALL(pipe)
 453:	b8 04 00 00 00       	mov    $0x4,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <read>:
SYSCALL(read)
 45b:	b8 05 00 00 00       	mov    $0x5,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <write>:
SYSCALL(write)
 463:	b8 10 00 00 00       	mov    $0x10,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <close>:
SYSCALL(close)
 46b:	b8 15 00 00 00       	mov    $0x15,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <kill>:
SYSCALL(kill)
 473:	b8 06 00 00 00       	mov    $0x6,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret

0000047b <exec>:
SYSCALL(exec)
 47b:	b8 07 00 00 00       	mov    $0x7,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <open>:
SYSCALL(open)
 483:	b8 0f 00 00 00       	mov    $0xf,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <mknod>:
SYSCALL(mknod)
 48b:	b8 11 00 00 00       	mov    $0x11,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <unlink>:
SYSCALL(unlink)
 493:	b8 12 00 00 00       	mov    $0x12,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <fstat>:
SYSCALL(fstat)
 49b:	b8 08 00 00 00       	mov    $0x8,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <link>:
SYSCALL(link)
 4a3:	b8 13 00 00 00       	mov    $0x13,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <mkdir>:
SYSCALL(mkdir)
 4ab:	b8 14 00 00 00       	mov    $0x14,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <chdir>:
SYSCALL(chdir)
 4b3:	b8 09 00 00 00       	mov    $0x9,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <dup>:
SYSCALL(dup)
 4bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <getpid>:
SYSCALL(getpid)
 4c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <sbrk>:
SYSCALL(sbrk)
 4cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <sleep>:
SYSCALL(sleep)
 4d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <uptime>:
SYSCALL(uptime)
 4db:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <is_proc_valid>:
SYSCALL(is_proc_valid)
 4e3:	b8 16 00 00 00       	mov    $0x16,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <get_proc_state>:
SYSCALL(get_proc_state)
 4eb:	b8 17 00 00 00       	mov    $0x17,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret

000004f3 <fill_proc_name>:
SYSCALL(fill_proc_name)
 4f3:	b8 18 00 00 00       	mov    $0x18,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret

000004fb <get_proc_name>:
SYSCALL(get_proc_name)
 4fb:	b8 19 00 00 00       	mov    $0x19,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <get_num_syscall>:
SYSCALL(get_num_syscall)
 503:	b8 1a 00 00 00       	mov    $0x1a,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 50b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret
 513:	66 90                	xchg   %ax,%ax
 515:	66 90                	xchg   %ax,%ax
 517:	66 90                	xchg   %ax,%ax
 519:	66 90                	xchg   %ax,%ax
 51b:	66 90                	xchg   %ax,%ax
 51d:	66 90                	xchg   %ax,%ax
 51f:	90                   	nop

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
 526:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 528:	89 d1                	mov    %edx,%ecx
{
 52a:	83 ec 3c             	sub    $0x3c,%esp
 52d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 530:	85 d2                	test   %edx,%edx
 532:	0f 89 80 00 00 00    	jns    5b8 <printint+0x98>
 538:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 53c:	74 7a                	je     5b8 <printint+0x98>
    x = -xx;
 53e:	f7 d9                	neg    %ecx
    neg = 1;
 540:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 545:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 548:	31 f6                	xor    %esi,%esi
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 c8                	mov    %ecx,%eax
 552:	31 d2                	xor    %edx,%edx
 554:	89 f7                	mov    %esi,%edi
 556:	f7 f3                	div    %ebx
 558:	8d 76 01             	lea    0x1(%esi),%esi
 55b:	0f b6 92 70 09 00 00 	movzbl 0x970(%edx),%edx
 562:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 566:	89 ca                	mov    %ecx,%edx
 568:	89 c1                	mov    %eax,%ecx
 56a:	39 da                	cmp    %ebx,%edx
 56c:	73 e2                	jae    550 <printint+0x30>
  if(neg)
 56e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 571:	85 c0                	test   %eax,%eax
 573:	74 07                	je     57c <printint+0x5c>
    buf[i++] = '-';
 575:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 57a:	89 f7                	mov    %esi,%edi
 57c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 57f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 582:	01 df                	add    %ebx,%edi
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 588:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	88 45 d7             	mov    %al,-0x29(%ebp)
 591:	8d 45 d7             	lea    -0x29(%ebp),%eax
 594:	6a 01                	push   $0x1
 596:	50                   	push   %eax
 597:	56                   	push   %esi
 598:	e8 c6 fe ff ff       	call   463 <write>
  while(--i >= 0)
 59d:	89 f8                	mov    %edi,%eax
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	83 ef 01             	sub    $0x1,%edi
 5a5:	39 c3                	cmp    %eax,%ebx
 5a7:	75 df                	jne    588 <printint+0x68>
}
 5a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ac:	5b                   	pop    %ebx
 5ad:	5e                   	pop    %esi
 5ae:	5f                   	pop    %edi
 5af:	5d                   	pop    %ebp
 5b0:	c3                   	ret
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b8:	31 c0                	xor    %eax,%eax
 5ba:	eb 89                	jmp    545 <printint+0x25>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 1e             	movzbl (%esi),%ebx
 5d2:	83 c6 01             	add    $0x1,%esi
 5d5:	84 db                	test   %bl,%bl
 5d7:	74 67                	je     640 <printf+0x80>
 5d9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5dc:	31 d2                	xor    %edx,%edx
 5de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5e1:	eb 34                	jmp    617 <printf+0x57>
 5e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5eb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5f0:	83 f8 25             	cmp    $0x25,%eax
 5f3:	74 18                	je     60d <printf+0x4d>
  write(fd, &c, 1);
 5f5:	83 ec 04             	sub    $0x4,%esp
 5f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5fe:	6a 01                	push   $0x1
 600:	50                   	push   %eax
 601:	57                   	push   %edi
 602:	e8 5c fe ff ff       	call   463 <write>
 607:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 60a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 60d:	0f b6 1e             	movzbl (%esi),%ebx
 610:	83 c6 01             	add    $0x1,%esi
 613:	84 db                	test   %bl,%bl
 615:	74 29                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 617:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 61a:	85 d2                	test   %edx,%edx
 61c:	74 ca                	je     5e8 <printf+0x28>
      }
    } else if(state == '%'){
 61e:	83 fa 25             	cmp    $0x25,%edx
 621:	75 ea                	jne    60d <printf+0x4d>
      if(c == 'd'){
 623:	83 f8 25             	cmp    $0x25,%eax
 626:	0f 84 04 01 00 00    	je     730 <printf+0x170>
 62c:	83 e8 63             	sub    $0x63,%eax
 62f:	83 f8 15             	cmp    $0x15,%eax
 632:	77 1c                	ja     650 <printf+0x90>
 634:	ff 24 85 18 09 00 00 	jmp    *0x918(,%eax,4)
 63b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret
 648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 64f:	00 
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	8d 55 e7             	lea    -0x19(%ebp),%edx
 656:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65a:	6a 01                	push   $0x1
 65c:	52                   	push   %edx
 65d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 660:	57                   	push   %edi
 661:	e8 fd fd ff ff       	call   463 <write>
 666:	83 c4 0c             	add    $0xc,%esp
 669:	88 5d e7             	mov    %bl,-0x19(%ebp)
 66c:	6a 01                	push   $0x1
 66e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 671:	52                   	push   %edx
 672:	57                   	push   %edi
 673:	e8 eb fd ff ff       	call   463 <write>
        putc(fd, c);
 678:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67b:	31 d2                	xor    %edx,%edx
 67d:	eb 8e                	jmp    60d <printf+0x4d>
 67f:	90                   	nop
        printint(fd, *ap, 16, 0);
 680:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	b9 10 00 00 00       	mov    $0x10,%ecx
 68b:	8b 13                	mov    (%ebx),%edx
 68d:	6a 00                	push   $0x0
 68f:	89 f8                	mov    %edi,%eax
        ap++;
 691:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 694:	e8 87 fe ff ff       	call   520 <printint>
        ap++;
 699:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 69c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 67 ff ff ff       	jmp    60d <printf+0x4d>
        s = (char*)*ap;
 6a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6a9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6ab:	83 c0 04             	add    $0x4,%eax
 6ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b1:	85 db                	test   %ebx,%ebx
 6b3:	0f 84 87 00 00 00    	je     740 <printf+0x180>
        while(*s != 0){
 6b9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6bc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6be:	84 c0                	test   %al,%al
 6c0:	0f 84 47 ff ff ff    	je     60d <printf+0x4d>
 6c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6c9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6cc:	89 de                	mov    %ebx,%esi
 6ce:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6d6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	53                   	push   %ebx
 6dc:	57                   	push   %edi
 6dd:	e8 81 fd ff ff       	call   463 <write>
        while(*s != 0){
 6e2:	0f b6 06             	movzbl (%esi),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 17 ff ff ff       	jmp    60d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6f6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 701:	8b 13                	mov    (%ebx),%edx
 703:	6a 01                	push   $0x1
 705:	eb 88                	jmp    68f <printf+0xcf>
        putc(fd, *ap);
 707:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 70a:	83 ec 04             	sub    $0x4,%esp
 70d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 710:	8b 03                	mov    (%ebx),%eax
        ap++;
 712:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 715:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	52                   	push   %edx
 71b:	57                   	push   %edi
 71c:	e8 42 fd ff ff       	call   463 <write>
        ap++;
 721:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 724:	83 c4 10             	add    $0x10,%esp
      state = 0;
 727:	31 d2                	xor    %edx,%edx
 729:	e9 df fe ff ff       	jmp    60d <printf+0x4d>
 72e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	88 5d e7             	mov    %bl,-0x19(%ebp)
 736:	8d 55 e7             	lea    -0x19(%ebp),%edx
 739:	6a 01                	push   $0x1
 73b:	e9 31 ff ff ff       	jmp    671 <printf+0xb1>
 740:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 745:	bb 10 09 00 00       	mov    $0x910,%ebx
 74a:	e9 77 ff ff ff       	jmp    6c6 <printf+0x106>
 74f:	90                   	nop

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 64 0e 00 00       	mov    0xe64,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 768:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76a:	39 c8                	cmp    %ecx,%eax
 76c:	73 32                	jae    7a0 <free+0x50>
 76e:	39 d1                	cmp    %edx,%ecx
 770:	72 04                	jb     776 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	39 d0                	cmp    %edx,%eax
 774:	72 32                	jb     7a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 776:	8b 73 fc             	mov    -0x4(%ebx),%esi
 779:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77c:	39 fa                	cmp    %edi,%edx
 77e:	74 30                	je     7b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 783:	8b 50 04             	mov    0x4(%eax),%edx
 786:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 789:	39 f1                	cmp    %esi,%ecx
 78b:	74 3a                	je     7c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 78f:	5b                   	pop    %ebx
  freep = p;
 790:	a3 64 0e 00 00       	mov    %eax,0xe64
}
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 04                	jb     7a8 <free+0x58>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	72 ce                	jb     776 <free+0x26>
{
 7a8:	89 d0                	mov    %edx,%eax
 7aa:	eb bc                	jmp    768 <free+0x18>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7b0:	03 72 04             	add    0x4(%edx),%esi
 7b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 12                	mov    (%edx),%edx
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	75 c6                	jne    78d <free+0x3d>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ca:	a3 64 0e 00 00       	mov    %eax,0xe64
    p->s.size += bp->s.size;
 7cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d5:	89 08                	mov    %ecx,(%eax)
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 15 64 0e 00 00    	mov    0xe64,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 78 07             	lea    0x7(%eax),%edi
 7f5:	c1 ef 03             	shr    $0x3,%edi
 7f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7fb:	85 d2                	test   %edx,%edx
 7fd:	0f 84 8d 00 00 00    	je     890 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 805:	8b 48 04             	mov    0x4(%eax),%ecx
 808:	39 f9                	cmp    %edi,%ecx
 80a:	73 64                	jae    870 <malloc+0x90>
  if(nu < 4096)
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 811:	39 df                	cmp    %ebx,%edi
 813:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 816:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 81d:	eb 0a                	jmp    829 <malloc+0x49>
 81f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 822:	8b 48 04             	mov    0x4(%eax),%ecx
 825:	39 f9                	cmp    %edi,%ecx
 827:	73 47                	jae    870 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 829:	89 c2                	mov    %eax,%edx
 82b:	3b 05 64 0e 00 00    	cmp    0xe64,%eax
 831:	75 ed                	jne    820 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	56                   	push   %esi
 837:	e8 8f fc ff ff       	call   4cb <sbrk>
  if(p == (char*)-1)
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	83 f8 ff             	cmp    $0xffffffff,%eax
 842:	74 1c                	je     860 <malloc+0x80>
  hp->s.size = nu;
 844:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 847:	83 ec 0c             	sub    $0xc,%esp
 84a:	83 c0 08             	add    $0x8,%eax
 84d:	50                   	push   %eax
 84e:	e8 fd fe ff ff       	call   750 <free>
  return freep;
 853:	8b 15 64 0e 00 00    	mov    0xe64,%edx
      if((p = morecore(nunits)) == 0)
 859:	83 c4 10             	add    $0x10,%esp
 85c:	85 d2                	test   %edx,%edx
 85e:	75 c0                	jne    820 <malloc+0x40>
        return 0;
  }
}
 860:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 863:	31 c0                	xor    %eax,%eax
}
 865:	5b                   	pop    %ebx
 866:	5e                   	pop    %esi
 867:	5f                   	pop    %edi
 868:	5d                   	pop    %ebp
 869:	c3                   	ret
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 870:	39 cf                	cmp    %ecx,%edi
 872:	74 4c                	je     8c0 <malloc+0xe0>
        p->s.size -= nunits;
 874:	29 f9                	sub    %edi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 87f:	89 15 64 0e 00 00    	mov    %edx,0xe64
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 64 0e 00 00 68 	movl   $0xe68,0xe64
 897:	0e 00 00 
    base.s.size = 0;
 89a:	b8 68 0e 00 00       	mov    $0xe68,%eax
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 68 0e 00 00 68 	movl   $0xe68,0xe68
 8a6:	0e 00 00 
    base.s.size = 0;
 8a9:	c7 05 6c 0e 00 00 00 	movl   $0x0,0xe6c
 8b0:	00 00 00 
    if(p->s.size >= nunits){
 8b3:	e9 54 ff ff ff       	jmp    80c <malloc+0x2c>
 8b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8bf:	00 
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b9                	jmp    87f <malloc+0x9f>
