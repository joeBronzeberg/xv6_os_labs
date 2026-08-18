
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  27:	7f 28                	jg     51 <main+0x51>
  29:	eb 54                	jmp    7f <main+0x7f>
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  30:	83 ec 08             	sub    $0x8,%esp
  33:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  35:	83 c6 01             	add    $0x1,%esi
  38:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  3b:	50                   	push   %eax
  3c:	e8 5f 00 00 00       	call   a0 <wc>
    close(fd);
  41:	89 3c 24             	mov    %edi,(%esp)
  44:	e8 92 04 00 00       	call   4db <close>
  for(i = 1; i < argc; i++){
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4f:	74 29                	je     7a <main+0x7a>
    if((fd = open(argv[i], 0)) < 0){
  51:	83 ec 08             	sub    $0x8,%esp
  54:	6a 00                	push   $0x0
  56:	ff 33                	push   (%ebx)
  58:	e8 96 04 00 00       	call   4f3 <open>
  5d:	83 c4 10             	add    $0x10,%esp
  60:	89 c7                	mov    %eax,%edi
  62:	85 c0                	test   %eax,%eax
  64:	79 ca                	jns    30 <main+0x30>
      printf(1, "wc: cannot open %s\n", argv[i]);
  66:	50                   	push   %eax
  67:	ff 33                	push   (%ebx)
  69:	68 5b 09 00 00       	push   $0x95b
  6e:	6a 01                	push   $0x1
  70:	e8 bb 05 00 00       	call   630 <printf>
      exit();
  75:	e8 39 04 00 00       	call   4b3 <exit>
  }
  exit();
  7a:	e8 34 04 00 00       	call   4b3 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 7e 09 00 00       	push   $0x97e
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 21 04 00 00       	call   4b3 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  l = w = c = 0;
  a1:	31 d2                	xor    %edx,%edx
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	57                   	push   %edi
  a6:	56                   	push   %esi
  inword = 0;
  a7:	31 f6                	xor    %esi,%esi
{
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 e0 0c 00 00       	push   $0xce0
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 f6 03 00 00       	call   4cb <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c1                	mov    %eax,%ecx
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  e1:	31 ff                	xor    %edi,%edi
  e3:	eb 0d                	jmp    f2 <wc+0x52>
  e5:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3e                	je     130 <wc+0x90>
      if(buf[i] == '\n')
  f2:	0f be 87 e0 0c 00 00 	movsbl 0xce0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 38 09 00 00       	push   $0x938
 10b:	e8 50 01 00 00       	call   260 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 11f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 124:	83 c7 01             	add    $0x1,%edi
 127:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 133:	01 4d dc             	add    %ecx,-0x24(%ebp)
 136:	eb 88                	jmp    c0 <wc+0x20>
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 4e 09 00 00       	push   $0x94e
 155:	6a 01                	push   $0x1
 157:	e8 d4 04 00 00       	call   630 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 3e 09 00 00       	push   $0x93e
 16e:	6a 01                	push   $0x1
 170:	e8 bb 04 00 00       	call   630 <printf>
    exit();
 175:	e8 39 03 00 00       	call   4b3 <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
 1d6:	89 d9                	mov    %ebx,%ecx
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave
 1e5:	c3                   	ret
 1e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ed:	00 
 1ee:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave
 1fc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20b:	00 
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret
 236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23d:	00 
 23e:	66 90                	xchg   %ax,%ax

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave
 258:	c3                   	ret
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret
 294:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29b:	00 
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
 2a6:	83 ec 34             	sub    $0x34,%esp
  count++;
 2a9:	8b 15 e0 0e 00 00    	mov    0xee0,%edx
 2af:	8d 72 01             	lea    0x1(%edx),%esi
 2b2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2b5:	89 35 e0 0e 00 00    	mov    %esi,0xee0
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 2bb:	6a 00                	push   $0x0
 2bd:	68 6f 09 00 00       	push   $0x96f
 2c2:	e8 2c 02 00 00       	call   4f3 <open>
  if (fd < 0) {
 2c7:	83 c4 10             	add    $0x10,%esp
 2ca:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 2cd:	85 c0                	test   %eax,%eax
 2cf:	0f 88 82 00 00 00    	js     357 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 2d5:	0f 84 8e 00 00 00    	je     369 <gets+0xc9>
 2db:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 2dd:	85 f6                	test   %esi,%esi
 2df:	0f 84 ee 00 00 00    	je     3d3 <gets+0x133>
 2e5:	8d 76 00             	lea    0x0(%esi),%esi
 2e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2eb:	31 f6                	xor    %esi,%esi
 2ed:	eb 2a                	jmp    319 <gets+0x79>
 2ef:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2f6:	6a 01                	push   $0x1
 2f8:	50                   	push   %eax
 2f9:	57                   	push   %edi
 2fa:	e8 cc 01 00 00       	call   4cb <read>
        if(cc < 1)
 2ff:	83 c4 10             	add    $0x10,%esp
 302:	85 c0                	test   %eax,%eax
 304:	7e 1d                	jle    323 <gets+0x83>
          break;
        buf[i++] = c;
 306:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 30a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 30d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 311:	3c 0a                	cmp    $0xa,%al
 313:	74 3b                	je     350 <gets+0xb0>
 315:	3c 0d                	cmp    $0xd,%al
 317:	74 37                	je     350 <gets+0xb0>
      for(i=0; i+1 < max; ){
 319:	89 f3                	mov    %esi,%ebx
 31b:	83 c6 01             	add    $0x1,%esi
 31e:	3b 75 0c             	cmp    0xc(%ebp),%esi
 321:	7c cd                	jl     2f0 <gets+0x50>
 323:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 326:	83 ea 01             	sub    $0x1,%edx
 329:	73 bd                	jae    2e8 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 32e:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 331:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 335:	57                   	push   %edi
 336:	e8 a0 01 00 00       	call   4db <close>
 33b:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 33e:	85 db                	test   %ebx,%ebx
 340:	74 76                	je     3b8 <gets+0x118>

  return buf;
}
 342:	8b 45 08             	mov    0x8(%ebp),%eax
 345:	8d 65 f4             	lea    -0xc(%ebp),%esp
 348:	5b                   	pop    %ebx
 349:	5e                   	pop    %esi
 34a:	5f                   	pop    %edi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret
 34d:	8d 76 00             	lea    0x0(%esi),%esi
 350:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 353:	89 f3                	mov    %esi,%ebx
 355:	eb cf                	jmp    326 <gets+0x86>
      printf(1, "nooo\n");
 357:	83 ec 08             	sub    $0x8,%esp
 35a:	68 79 09 00 00       	push   $0x979
 35f:	6a 01                	push   $0x1
 361:	e8 ca 02 00 00       	call   630 <printf>
 366:	83 c4 10             	add    $0x10,%esp
{
 369:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 36b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 36e:	89 df                	mov    %ebx,%edi
 370:	eb 2d                	jmp    39f <gets+0xff>
 372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 378:	83 ec 04             	sub    $0x4,%esp
 37b:	6a 01                	push   $0x1
 37d:	56                   	push   %esi
 37e:	6a 00                	push   $0x0
 380:	e8 46 01 00 00       	call   4cb <read>
      if(cc < 1)
 385:	83 c4 10             	add    $0x10,%esp
 388:	85 c0                	test   %eax,%eax
 38a:	7e 1d                	jle    3a9 <gets+0x109>
      buf[i++] = c;
 38c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 390:	8b 55 08             	mov    0x8(%ebp),%edx
 393:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 397:	3c 0a                	cmp    $0xa,%al
 399:	74 10                	je     3ab <gets+0x10b>
 39b:	3c 0d                	cmp    $0xd,%al
 39d:	74 0c                	je     3ab <gets+0x10b>
    for(i=0; i+1 < max; ){
 39f:	89 fb                	mov    %edi,%ebx
 3a1:	83 c7 01             	add    $0x1,%edi
 3a4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 3a7:	7c cf                	jl     378 <gets+0xd8>
 3a9:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	89 fb                	mov    %edi,%ebx
 3b0:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 3b4:	85 db                	test   %ebx,%ebx
 3b6:	75 8a                	jne    342 <gets+0xa2>
 3b8:	83 ec 0c             	sub    $0xc,%esp
 3bb:	68 6f 09 00 00       	push   $0x96f
 3c0:	e8 3e 01 00 00       	call   503 <unlink>
}
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 3c8:	83 c4 10             	add    $0x10,%esp
}
 3cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ce:	5b                   	pop    %ebx
 3cf:	5e                   	pop    %esi
 3d0:	5f                   	pop    %edi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret
  buf[i] = '\0';
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 3d6:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 3d9:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 3dc:	57                   	push   %edi
 3dd:	e8 f9 00 00 00       	call   4db <close>
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	eb d1                	jmp    3b8 <gets+0x118>
 3e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ee:	00 
 3ef:	90                   	nop

000003f0 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f5:	83 ec 08             	sub    $0x8,%esp
 3f8:	6a 00                	push   $0x0
 3fa:	ff 75 08             	push   0x8(%ebp)
 3fd:	e8 f1 00 00 00       	call   4f3 <open>
  if(fd < 0)
 402:	83 c4 10             	add    $0x10,%esp
 405:	85 c0                	test   %eax,%eax
 407:	78 27                	js     430 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 409:	83 ec 08             	sub    $0x8,%esp
 40c:	ff 75 0c             	push   0xc(%ebp)
 40f:	89 c3                	mov    %eax,%ebx
 411:	50                   	push   %eax
 412:	e8 f4 00 00 00       	call   50b <fstat>
  close(fd);
 417:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 41a:	89 c6                	mov    %eax,%esi
  close(fd);
 41c:	e8 ba 00 00 00       	call   4db <close>
  return r;
 421:	83 c4 10             	add    $0x10,%esp
}
 424:	8d 65 f8             	lea    -0x8(%ebp),%esp
 427:	89 f0                	mov    %esi,%eax
 429:	5b                   	pop    %ebx
 42a:	5e                   	pop    %esi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret
 42d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 430:	be ff ff ff ff       	mov    $0xffffffff,%esi
 435:	eb ed                	jmp    424 <stat+0x34>
 437:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43e:	00 
 43f:	90                   	nop

00000440 <atoi>:

int
atoi(const char *s)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
 444:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 447:	0f be 02             	movsbl (%edx),%eax
 44a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 44d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 450:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 455:	77 1e                	ja     475 <atoi+0x35>
 457:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45e:	00 
 45f:	90                   	nop
    n = n*10 + *s++ - '0';
 460:	83 c2 01             	add    $0x1,%edx
 463:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 466:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 46a:	0f be 02             	movsbl (%edx),%eax
 46d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 470:	80 fb 09             	cmp    $0x9,%bl
 473:	76 eb                	jbe    460 <atoi+0x20>
  return n;
}
 475:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 478:	89 c8                	mov    %ecx,%eax
 47a:	c9                   	leave
 47b:	c3                   	ret
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000480 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	8b 45 10             	mov    0x10(%ebp),%eax
 487:	8b 55 08             	mov    0x8(%ebp),%edx
 48a:	56                   	push   %esi
 48b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 48e:	85 c0                	test   %eax,%eax
 490:	7e 13                	jle    4a5 <memmove+0x25>
 492:	01 d0                	add    %edx,%eax
  dst = vdst;
 494:	89 d7                	mov    %edx,%edi
 496:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49d:	00 
 49e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 4a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4a1:	39 f8                	cmp    %edi,%eax
 4a3:	75 fb                	jne    4a0 <memmove+0x20>
  return vdst;
}
 4a5:	5e                   	pop    %esi
 4a6:	89 d0                	mov    %edx,%eax
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret

000004ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ab:	b8 01 00 00 00       	mov    $0x1,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <exit>:
SYSCALL(exit)
 4b3:	b8 02 00 00 00       	mov    $0x2,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <wait>:
SYSCALL(wait)
 4bb:	b8 03 00 00 00       	mov    $0x3,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <pipe>:
SYSCALL(pipe)
 4c3:	b8 04 00 00 00       	mov    $0x4,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <read>:
SYSCALL(read)
 4cb:	b8 05 00 00 00       	mov    $0x5,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <write>:
SYSCALL(write)
 4d3:	b8 10 00 00 00       	mov    $0x10,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <close>:
SYSCALL(close)
 4db:	b8 15 00 00 00       	mov    $0x15,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <kill>:
SYSCALL(kill)
 4e3:	b8 06 00 00 00       	mov    $0x6,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <exec>:
SYSCALL(exec)
 4eb:	b8 07 00 00 00       	mov    $0x7,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret

000004f3 <open>:
SYSCALL(open)
 4f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret

000004fb <mknod>:
SYSCALL(mknod)
 4fb:	b8 11 00 00 00       	mov    $0x11,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <unlink>:
SYSCALL(unlink)
 503:	b8 12 00 00 00       	mov    $0x12,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <fstat>:
SYSCALL(fstat)
 50b:	b8 08 00 00 00       	mov    $0x8,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret

00000513 <link>:
SYSCALL(link)
 513:	b8 13 00 00 00       	mov    $0x13,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret

0000051b <mkdir>:
SYSCALL(mkdir)
 51b:	b8 14 00 00 00       	mov    $0x14,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret

00000523 <chdir>:
SYSCALL(chdir)
 523:	b8 09 00 00 00       	mov    $0x9,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret

0000052b <dup>:
SYSCALL(dup)
 52b:	b8 0a 00 00 00       	mov    $0xa,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret

00000533 <getpid>:
SYSCALL(getpid)
 533:	b8 0b 00 00 00       	mov    $0xb,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret

0000053b <sbrk>:
SYSCALL(sbrk)
 53b:	b8 0c 00 00 00       	mov    $0xc,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret

00000543 <sleep>:
SYSCALL(sleep)
 543:	b8 0d 00 00 00       	mov    $0xd,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret

0000054b <uptime>:
SYSCALL(uptime)
 54b:	b8 0e 00 00 00       	mov    $0xe,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret

00000553 <is_proc_valid>:
SYSCALL(is_proc_valid)
 553:	b8 16 00 00 00       	mov    $0x16,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret

0000055b <get_proc_state>:
SYSCALL(get_proc_state)
 55b:	b8 17 00 00 00       	mov    $0x17,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret

00000563 <fill_proc_name>:
SYSCALL(fill_proc_name)
 563:	b8 18 00 00 00       	mov    $0x18,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret

0000056b <get_proc_name>:
SYSCALL(get_proc_name)
 56b:	b8 19 00 00 00       	mov    $0x19,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret

00000573 <get_num_syscall>:
SYSCALL(get_num_syscall)
 573:	b8 1a 00 00 00       	mov    $0x1a,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret

0000057b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 57b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret
 583:	66 90                	xchg   %ax,%ax
 585:	66 90                	xchg   %ax,%ax
 587:	66 90                	xchg   %ax,%ax
 589:	66 90                	xchg   %ax,%ax
 58b:	66 90                	xchg   %ax,%ax
 58d:	66 90                	xchg   %ax,%ax
 58f:	90                   	nop

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 598:	89 d1                	mov    %edx,%ecx
{
 59a:	83 ec 3c             	sub    $0x3c,%esp
 59d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 5a0:	85 d2                	test   %edx,%edx
 5a2:	0f 89 80 00 00 00    	jns    628 <printint+0x98>
 5a8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ac:	74 7a                	je     628 <printint+0x98>
    x = -xx;
 5ae:	f7 d9                	neg    %ecx
    neg = 1;
 5b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 5b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 5b8:	31 f6                	xor    %esi,%esi
 5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5c0:	89 c8                	mov    %ecx,%eax
 5c2:	31 d2                	xor    %edx,%edx
 5c4:	89 f7                	mov    %esi,%edi
 5c6:	f7 f3                	div    %ebx
 5c8:	8d 76 01             	lea    0x1(%esi),%esi
 5cb:	0f b6 92 e0 09 00 00 	movzbl 0x9e0(%edx),%edx
 5d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 5d6:	89 ca                	mov    %ecx,%edx
 5d8:	89 c1                	mov    %eax,%ecx
 5da:	39 da                	cmp    %ebx,%edx
 5dc:	73 e2                	jae    5c0 <printint+0x30>
  if(neg)
 5de:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5e1:	85 c0                	test   %eax,%eax
 5e3:	74 07                	je     5ec <printint+0x5c>
    buf[i++] = '-';
 5e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 5ea:	89 f7                	mov    %esi,%edi
 5ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5ef:	8b 75 c0             	mov    -0x40(%ebp),%esi
 5f2:	01 df                	add    %ebx,%edi
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5f8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5fb:	83 ec 04             	sub    $0x4,%esp
 5fe:	88 45 d7             	mov    %al,-0x29(%ebp)
 601:	8d 45 d7             	lea    -0x29(%ebp),%eax
 604:	6a 01                	push   $0x1
 606:	50                   	push   %eax
 607:	56                   	push   %esi
 608:	e8 c6 fe ff ff       	call   4d3 <write>
  while(--i >= 0)
 60d:	89 f8                	mov    %edi,%eax
 60f:	83 c4 10             	add    $0x10,%esp
 612:	83 ef 01             	sub    $0x1,%edi
 615:	39 c3                	cmp    %eax,%ebx
 617:	75 df                	jne    5f8 <printint+0x68>
}
 619:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61c:	5b                   	pop    %ebx
 61d:	5e                   	pop    %esi
 61e:	5f                   	pop    %edi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 628:	31 c0                	xor    %eax,%eax
 62a:	eb 89                	jmp    5b5 <printint+0x25>
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 639:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 63c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 63f:	0f b6 1e             	movzbl (%esi),%ebx
 642:	83 c6 01             	add    $0x1,%esi
 645:	84 db                	test   %bl,%bl
 647:	74 67                	je     6b0 <printf+0x80>
 649:	8d 4d 10             	lea    0x10(%ebp),%ecx
 64c:	31 d2                	xor    %edx,%edx
 64e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 651:	eb 34                	jmp    687 <printf+0x57>
 653:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 658:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 65b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 660:	83 f8 25             	cmp    $0x25,%eax
 663:	74 18                	je     67d <printf+0x4d>
  write(fd, &c, 1);
 665:	83 ec 04             	sub    $0x4,%esp
 668:	8d 45 e7             	lea    -0x19(%ebp),%eax
 66b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 66e:	6a 01                	push   $0x1
 670:	50                   	push   %eax
 671:	57                   	push   %edi
 672:	e8 5c fe ff ff       	call   4d3 <write>
 677:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 67a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 67d:	0f b6 1e             	movzbl (%esi),%ebx
 680:	83 c6 01             	add    $0x1,%esi
 683:	84 db                	test   %bl,%bl
 685:	74 29                	je     6b0 <printf+0x80>
    c = fmt[i] & 0xff;
 687:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 68a:	85 d2                	test   %edx,%edx
 68c:	74 ca                	je     658 <printf+0x28>
      }
    } else if(state == '%'){
 68e:	83 fa 25             	cmp    $0x25,%edx
 691:	75 ea                	jne    67d <printf+0x4d>
      if(c == 'd'){
 693:	83 f8 25             	cmp    $0x25,%eax
 696:	0f 84 04 01 00 00    	je     7a0 <printf+0x170>
 69c:	83 e8 63             	sub    $0x63,%eax
 69f:	83 f8 15             	cmp    $0x15,%eax
 6a2:	77 1c                	ja     6c0 <printf+0x90>
 6a4:	ff 24 85 88 09 00 00 	jmp    *0x988(,%eax,4)
 6ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b3:	5b                   	pop    %ebx
 6b4:	5e                   	pop    %esi
 6b5:	5f                   	pop    %edi
 6b6:	5d                   	pop    %ebp
 6b7:	c3                   	ret
 6b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6bf:	00 
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6c6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ca:	6a 01                	push   $0x1
 6cc:	52                   	push   %edx
 6cd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 6d0:	57                   	push   %edi
 6d1:	e8 fd fd ff ff       	call   4d3 <write>
 6d6:	83 c4 0c             	add    $0xc,%esp
 6d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6dc:	6a 01                	push   $0x1
 6de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6e1:	52                   	push   %edx
 6e2:	57                   	push   %edi
 6e3:	e8 eb fd ff ff       	call   4d3 <write>
        putc(fd, c);
 6e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6eb:	31 d2                	xor    %edx,%edx
 6ed:	eb 8e                	jmp    67d <printf+0x4d>
 6ef:	90                   	nop
        printint(fd, *ap, 16, 0);
 6f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6f3:	83 ec 0c             	sub    $0xc,%esp
 6f6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6fb:	8b 13                	mov    (%ebx),%edx
 6fd:	6a 00                	push   $0x0
 6ff:	89 f8                	mov    %edi,%eax
        ap++;
 701:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 704:	e8 87 fe ff ff       	call   590 <printint>
        ap++;
 709:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 70c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 67 ff ff ff       	jmp    67d <printf+0x4d>
        s = (char*)*ap;
 716:	8b 45 d0             	mov    -0x30(%ebp),%eax
 719:	8b 18                	mov    (%eax),%ebx
        ap++;
 71b:	83 c0 04             	add    $0x4,%eax
 71e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 721:	85 db                	test   %ebx,%ebx
 723:	0f 84 87 00 00 00    	je     7b0 <printf+0x180>
        while(*s != 0){
 729:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 72c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 72e:	84 c0                	test   %al,%al
 730:	0f 84 47 ff ff ff    	je     67d <printf+0x4d>
 736:	8d 55 e7             	lea    -0x19(%ebp),%edx
 739:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 73c:	89 de                	mov    %ebx,%esi
 73e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 746:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 749:	6a 01                	push   $0x1
 74b:	53                   	push   %ebx
 74c:	57                   	push   %edi
 74d:	e8 81 fd ff ff       	call   4d3 <write>
        while(*s != 0){
 752:	0f b6 06             	movzbl (%esi),%eax
 755:	83 c4 10             	add    $0x10,%esp
 758:	84 c0                	test   %al,%al
 75a:	75 e4                	jne    740 <printf+0x110>
      state = 0;
 75c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 75f:	31 d2                	xor    %edx,%edx
 761:	e9 17 ff ff ff       	jmp    67d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 766:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 769:	83 ec 0c             	sub    $0xc,%esp
 76c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 771:	8b 13                	mov    (%ebx),%edx
 773:	6a 01                	push   $0x1
 775:	eb 88                	jmp    6ff <printf+0xcf>
        putc(fd, *ap);
 777:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 77a:	83 ec 04             	sub    $0x4,%esp
 77d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 780:	8b 03                	mov    (%ebx),%eax
        ap++;
 782:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 785:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 788:	6a 01                	push   $0x1
 78a:	52                   	push   %edx
 78b:	57                   	push   %edi
 78c:	e8 42 fd ff ff       	call   4d3 <write>
        ap++;
 791:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 794:	83 c4 10             	add    $0x10,%esp
      state = 0;
 797:	31 d2                	xor    %edx,%edx
 799:	e9 df fe ff ff       	jmp    67d <printf+0x4d>
 79e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
 7a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 7a9:	6a 01                	push   $0x1
 7ab:	e9 31 ff ff ff       	jmp    6e1 <printf+0xb1>
 7b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 7b5:	bb 7f 09 00 00       	mov    $0x97f,%ebx
 7ba:	e9 77 ff ff ff       	jmp    736 <printf+0x106>
 7bf:	90                   	nop

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	a1 e4 0e 00 00       	mov    0xee4,%eax
{
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7da:	39 c8                	cmp    %ecx,%eax
 7dc:	73 32                	jae    810 <free+0x50>
 7de:	39 d1                	cmp    %edx,%ecx
 7e0:	72 04                	jb     7e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e2:	39 d0                	cmp    %edx,%eax
 7e4:	72 32                	jb     818 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ec:	39 fa                	cmp    %edi,%edx
 7ee:	74 30                	je     820 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7f3:	8b 50 04             	mov    0x4(%eax),%edx
 7f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f9:	39 f1                	cmp    %esi,%ecx
 7fb:	74 3a                	je     837 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7fd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7ff:	5b                   	pop    %ebx
  freep = p;
 800:	a3 e4 0e 00 00       	mov    %eax,0xee4
}
 805:	5e                   	pop    %esi
 806:	5f                   	pop    %edi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 d0                	cmp    %edx,%eax
 812:	72 04                	jb     818 <free+0x58>
 814:	39 d1                	cmp    %edx,%ecx
 816:	72 ce                	jb     7e6 <free+0x26>
{
 818:	89 d0                	mov    %edx,%eax
 81a:	eb bc                	jmp    7d8 <free+0x18>
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 820:	03 72 04             	add    0x4(%edx),%esi
 823:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 826:	8b 10                	mov    (%eax),%edx
 828:	8b 12                	mov    (%edx),%edx
 82a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82d:	8b 50 04             	mov    0x4(%eax),%edx
 830:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 833:	39 f1                	cmp    %esi,%ecx
 835:	75 c6                	jne    7fd <free+0x3d>
    p->s.size += bp->s.size;
 837:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 83a:	a3 e4 0e 00 00       	mov    %eax,0xee4
    p->s.size += bp->s.size;
 83f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 842:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 845:	89 08                	mov    %ecx,(%eax)
}
 847:	5b                   	pop    %ebx
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 15 e4 0e 00 00    	mov    0xee4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	8d 78 07             	lea    0x7(%eax),%edi
 865:	c1 ef 03             	shr    $0x3,%edi
 868:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 86b:	85 d2                	test   %edx,%edx
 86d:	0f 84 8d 00 00 00    	je     900 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 873:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 875:	8b 48 04             	mov    0x4(%eax),%ecx
 878:	39 f9                	cmp    %edi,%ecx
 87a:	73 64                	jae    8e0 <malloc+0x90>
  if(nu < 4096)
 87c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 881:	39 df                	cmp    %ebx,%edi
 883:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 886:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 88d:	eb 0a                	jmp    899 <malloc+0x49>
 88f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 892:	8b 48 04             	mov    0x4(%eax),%ecx
 895:	39 f9                	cmp    %edi,%ecx
 897:	73 47                	jae    8e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 899:	89 c2                	mov    %eax,%edx
 89b:	3b 05 e4 0e 00 00    	cmp    0xee4,%eax
 8a1:	75 ed                	jne    890 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	56                   	push   %esi
 8a7:	e8 8f fc ff ff       	call   53b <sbrk>
  if(p == (char*)-1)
 8ac:	83 c4 10             	add    $0x10,%esp
 8af:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b2:	74 1c                	je     8d0 <malloc+0x80>
  hp->s.size = nu;
 8b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b7:	83 ec 0c             	sub    $0xc,%esp
 8ba:	83 c0 08             	add    $0x8,%eax
 8bd:	50                   	push   %eax
 8be:	e8 fd fe ff ff       	call   7c0 <free>
  return freep;
 8c3:	8b 15 e4 0e 00 00    	mov    0xee4,%edx
      if((p = morecore(nunits)) == 0)
 8c9:	83 c4 10             	add    $0x10,%esp
 8cc:	85 d2                	test   %edx,%edx
 8ce:	75 c0                	jne    890 <malloc+0x40>
        return 0;
  }
}
 8d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8d3:	31 c0                	xor    %eax,%eax
}
 8d5:	5b                   	pop    %ebx
 8d6:	5e                   	pop    %esi
 8d7:	5f                   	pop    %edi
 8d8:	5d                   	pop    %ebp
 8d9:	c3                   	ret
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8e0:	39 cf                	cmp    %ecx,%edi
 8e2:	74 4c                	je     930 <malloc+0xe0>
        p->s.size -= nunits;
 8e4:	29 f9                	sub    %edi,%ecx
 8e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8ef:	89 15 e4 0e 00 00    	mov    %edx,0xee4
}
 8f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8f8:	83 c0 08             	add    $0x8,%eax
}
 8fb:	5b                   	pop    %ebx
 8fc:	5e                   	pop    %esi
 8fd:	5f                   	pop    %edi
 8fe:	5d                   	pop    %ebp
 8ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 900:	c7 05 e4 0e 00 00 e8 	movl   $0xee8,0xee4
 907:	0e 00 00 
    base.s.size = 0;
 90a:	b8 e8 0e 00 00       	mov    $0xee8,%eax
    base.s.ptr = freep = prevp = &base;
 90f:	c7 05 e8 0e 00 00 e8 	movl   $0xee8,0xee8
 916:	0e 00 00 
    base.s.size = 0;
 919:	c7 05 ec 0e 00 00 00 	movl   $0x0,0xeec
 920:	00 00 00 
    if(p->s.size >= nunits){
 923:	e9 54 ff ff ff       	jmp    87c <malloc+0x2c>
 928:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 92f:	00 
        prevp->s.ptr = p->s.ptr;
 930:	8b 08                	mov    (%eax),%ecx
 932:	89 0a                	mov    %ecx,(%edx)
 934:	eb b9                	jmp    8ef <malloc+0x9f>
