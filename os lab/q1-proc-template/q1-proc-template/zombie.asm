
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 45 03 00 00       	call   35b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 cf 03 00 00       	call   3f3 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 37 03 00 00       	call   363 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave
  54:	c3                   	ret
  55:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  5c:	00 
  5d:	8d 76 00             	lea    0x0(%esi),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
  86:	89 d9                	mov    %ebx,%ecx
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave
  95:	c3                   	ret
  96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9d:	00 
  9e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave
  ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bb:	00 
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret
  e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ed:	00 
  ee:	66 90                	xchg   %ax,%ax

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave
 108:	c3                   	ret
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret
 144:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14b:	00 
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	83 ec 34             	sub    $0x34,%esp
  count++;
 159:	8b 15 04 0b 00 00    	mov    0xb04,%edx
 15f:	8d 72 01             	lea    0x1(%edx),%esi
 162:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 165:	89 35 04 0b 00 00    	mov    %esi,0xb04
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 16b:	6a 00                	push   $0x0
 16d:	68 e8 07 00 00       	push   $0x7e8
 172:	e8 2c 02 00 00       	call   3a3 <open>
  if (fd < 0) {
 177:	83 c4 10             	add    $0x10,%esp
 17a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 17d:	85 c0                	test   %eax,%eax
 17f:	0f 88 82 00 00 00    	js     207 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 185:	0f 84 8e 00 00 00    	je     219 <gets+0xc9>
 18b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 18d:	85 f6                	test   %esi,%esi
 18f:	0f 84 ee 00 00 00    	je     283 <gets+0x133>
 195:	8d 76 00             	lea    0x0(%esi),%esi
 198:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 19b:	31 f6                	xor    %esi,%esi
 19d:	eb 2a                	jmp    1c9 <gets+0x79>
 19f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a6:	6a 01                	push   $0x1
 1a8:	50                   	push   %eax
 1a9:	57                   	push   %edi
 1aa:	e8 cc 01 00 00       	call   37b <read>
        if(cc < 1)
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	85 c0                	test   %eax,%eax
 1b4:	7e 1d                	jle    1d3 <gets+0x83>
          break;
        buf[i++] = c;
 1b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bd:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 1c1:	3c 0a                	cmp    $0xa,%al
 1c3:	74 3b                	je     200 <gets+0xb0>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 37                	je     200 <gets+0xb0>
      for(i=0; i+1 < max; ){
 1c9:	89 f3                	mov    %esi,%ebx
 1cb:	83 c6 01             	add    $0x1,%esi
 1ce:	3b 75 0c             	cmp    0xc(%ebp),%esi
 1d1:	7c cd                	jl     1a0 <gets+0x50>
 1d3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 1d6:	83 ea 01             	sub    $0x1,%edx
 1d9:	73 bd                	jae    198 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 1de:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 1e1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 1e5:	57                   	push   %edi
 1e6:	e8 a0 01 00 00       	call   38b <close>
 1eb:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 1ee:	85 db                	test   %ebx,%ebx
 1f0:	74 76                	je     268 <gets+0x118>

  return buf;
}
 1f2:	8b 45 08             	mov    0x8(%ebp),%eax
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 203:	89 f3                	mov    %esi,%ebx
 205:	eb cf                	jmp    1d6 <gets+0x86>
      printf(1, "nooo\n");
 207:	83 ec 08             	sub    $0x8,%esp
 20a:	68 f2 07 00 00       	push   $0x7f2
 20f:	6a 01                	push   $0x1
 211:	e8 ca 02 00 00       	call   4e0 <printf>
 216:	83 c4 10             	add    $0x10,%esp
{
 219:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 21b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 21e:	89 df                	mov    %ebx,%edi
 220:	eb 2d                	jmp    24f <gets+0xff>
 222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	6a 01                	push   $0x1
 22d:	56                   	push   %esi
 22e:	6a 00                	push   $0x0
 230:	e8 46 01 00 00       	call   37b <read>
      if(cc < 1)
 235:	83 c4 10             	add    $0x10,%esp
 238:	85 c0                	test   %eax,%eax
 23a:	7e 1d                	jle    259 <gets+0x109>
      buf[i++] = c;
 23c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 240:	8b 55 08             	mov    0x8(%ebp),%edx
 243:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 247:	3c 0a                	cmp    $0xa,%al
 249:	74 10                	je     25b <gets+0x10b>
 24b:	3c 0d                	cmp    $0xd,%al
 24d:	74 0c                	je     25b <gets+0x10b>
    for(i=0; i+1 < max; ){
 24f:	89 fb                	mov    %edi,%ebx
 251:	83 c7 01             	add    $0x1,%edi
 254:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 257:	7c cf                	jl     228 <gets+0xd8>
 259:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	89 fb                	mov    %edi,%ebx
 260:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 264:	85 db                	test   %ebx,%ebx
 266:	75 8a                	jne    1f2 <gets+0xa2>
 268:	83 ec 0c             	sub    $0xc,%esp
 26b:	68 e8 07 00 00       	push   $0x7e8
 270:	e8 3e 01 00 00       	call   3b3 <unlink>
}
 275:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 278:	83 c4 10             	add    $0x10,%esp
}
 27b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5f                   	pop    %edi
 281:	5d                   	pop    %ebp
 282:	c3                   	ret
  buf[i] = '\0';
 283:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 286:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 289:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 28c:	57                   	push   %edi
 28d:	e8 f9 00 00 00       	call   38b <close>
 292:	83 c4 10             	add    $0x10,%esp
 295:	eb d1                	jmp    268 <gets+0x118>
 297:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29e:	00 
 29f:	90                   	nop

000002a0 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 f1 00 00 00       	call   3a3 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f4 00 00 00       	call   3bb <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 ba 00 00 00       	call   38b <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 30e:	00 
 30f:	90                   	nop
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave
 32b:	c3                   	ret
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34d:	00 
 34e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret

0000035b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <exit>:
SYSCALL(exit)
 363:	b8 02 00 00 00       	mov    $0x2,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <wait>:
SYSCALL(wait)
 36b:	b8 03 00 00 00       	mov    $0x3,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <pipe>:
SYSCALL(pipe)
 373:	b8 04 00 00 00       	mov    $0x4,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <read>:
SYSCALL(read)
 37b:	b8 05 00 00 00       	mov    $0x5,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <write>:
SYSCALL(write)
 383:	b8 10 00 00 00       	mov    $0x10,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <close>:
SYSCALL(close)
 38b:	b8 15 00 00 00       	mov    $0x15,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <kill>:
SYSCALL(kill)
 393:	b8 06 00 00 00       	mov    $0x6,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <exec>:
SYSCALL(exec)
 39b:	b8 07 00 00 00       	mov    $0x7,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <open>:
SYSCALL(open)
 3a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <mknod>:
SYSCALL(mknod)
 3ab:	b8 11 00 00 00       	mov    $0x11,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <unlink>:
SYSCALL(unlink)
 3b3:	b8 12 00 00 00       	mov    $0x12,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <fstat>:
SYSCALL(fstat)
 3bb:	b8 08 00 00 00       	mov    $0x8,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <link>:
SYSCALL(link)
 3c3:	b8 13 00 00 00       	mov    $0x13,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <mkdir>:
SYSCALL(mkdir)
 3cb:	b8 14 00 00 00       	mov    $0x14,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <chdir>:
SYSCALL(chdir)
 3d3:	b8 09 00 00 00       	mov    $0x9,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <dup>:
SYSCALL(dup)
 3db:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <getpid>:
SYSCALL(getpid)
 3e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <sbrk>:
SYSCALL(sbrk)
 3eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <sleep>:
SYSCALL(sleep)
 3f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <uptime>:
SYSCALL(uptime)
 3fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret

00000403 <is_proc_valid>:
SYSCALL(is_proc_valid)
 403:	b8 16 00 00 00       	mov    $0x16,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret

0000040b <get_proc_state>:
SYSCALL(get_proc_state)
 40b:	b8 17 00 00 00       	mov    $0x17,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret

00000413 <fill_proc_name>:
SYSCALL(fill_proc_name)
 413:	b8 18 00 00 00       	mov    $0x18,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret

0000041b <get_proc_name>:
SYSCALL(get_proc_name)
 41b:	b8 19 00 00 00       	mov    $0x19,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <get_num_syscall>:
SYSCALL(get_num_syscall)
 423:	b8 1a 00 00 00       	mov    $0x1a,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 42b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret
 433:	66 90                	xchg   %ax,%ax
 435:	66 90                	xchg   %ax,%ax
 437:	66 90                	xchg   %ax,%ax
 439:	66 90                	xchg   %ax,%ax
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 448:	89 d1                	mov    %edx,%ecx
{
 44a:	83 ec 3c             	sub    $0x3c,%esp
 44d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 450:	85 d2                	test   %edx,%edx
 452:	0f 89 80 00 00 00    	jns    4d8 <printint+0x98>
 458:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45c:	74 7a                	je     4d8 <printint+0x98>
    x = -xx;
 45e:	f7 d9                	neg    %ecx
    neg = 1;
 460:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 465:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 468:	31 f6                	xor    %esi,%esi
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 c8                	mov    %ecx,%eax
 472:	31 d2                	xor    %edx,%edx
 474:	89 f7                	mov    %esi,%edi
 476:	f7 f3                	div    %ebx
 478:	8d 76 01             	lea    0x1(%esi),%esi
 47b:	0f b6 92 58 08 00 00 	movzbl 0x858(%edx),%edx
 482:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 486:	89 ca                	mov    %ecx,%edx
 488:	89 c1                	mov    %eax,%ecx
 48a:	39 da                	cmp    %ebx,%edx
 48c:	73 e2                	jae    470 <printint+0x30>
  if(neg)
 48e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 491:	85 c0                	test   %eax,%eax
 493:	74 07                	je     49c <printint+0x5c>
    buf[i++] = '-';
 495:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 49a:	89 f7                	mov    %esi,%edi
 49c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 49f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4a2:	01 df                	add    %ebx,%edi
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4ab:	83 ec 04             	sub    $0x4,%esp
 4ae:	88 45 d7             	mov    %al,-0x29(%ebp)
 4b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4b4:	6a 01                	push   $0x1
 4b6:	50                   	push   %eax
 4b7:	56                   	push   %esi
 4b8:	e8 c6 fe ff ff       	call   383 <write>
  while(--i >= 0)
 4bd:	89 f8                	mov    %edi,%eax
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	83 ef 01             	sub    $0x1,%edi
 4c5:	39 c3                	cmp    %eax,%ebx
 4c7:	75 df                	jne    4a8 <printint+0x68>
}
 4c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cc:	5b                   	pop    %ebx
 4cd:	5e                   	pop    %esi
 4ce:	5f                   	pop    %edi
 4cf:	5d                   	pop    %ebp
 4d0:	c3                   	ret
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d8:	31 c0                	xor    %eax,%eax
 4da:	eb 89                	jmp    465 <printint+0x25>
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4ef:	0f b6 1e             	movzbl (%esi),%ebx
 4f2:	83 c6 01             	add    $0x1,%esi
 4f5:	84 db                	test   %bl,%bl
 4f7:	74 67                	je     560 <printf+0x80>
 4f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4fc:	31 d2                	xor    %edx,%edx
 4fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 501:	eb 34                	jmp    537 <printf+0x57>
 503:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 508:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 50b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 510:	83 f8 25             	cmp    $0x25,%eax
 513:	74 18                	je     52d <printf+0x4d>
  write(fd, &c, 1);
 515:	83 ec 04             	sub    $0x4,%esp
 518:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 51e:	6a 01                	push   $0x1
 520:	50                   	push   %eax
 521:	57                   	push   %edi
 522:	e8 5c fe ff ff       	call   383 <write>
 527:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 52a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 52d:	0f b6 1e             	movzbl (%esi),%ebx
 530:	83 c6 01             	add    $0x1,%esi
 533:	84 db                	test   %bl,%bl
 535:	74 29                	je     560 <printf+0x80>
    c = fmt[i] & 0xff;
 537:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 53a:	85 d2                	test   %edx,%edx
 53c:	74 ca                	je     508 <printf+0x28>
      }
    } else if(state == '%'){
 53e:	83 fa 25             	cmp    $0x25,%edx
 541:	75 ea                	jne    52d <printf+0x4d>
      if(c == 'd'){
 543:	83 f8 25             	cmp    $0x25,%eax
 546:	0f 84 04 01 00 00    	je     650 <printf+0x170>
 54c:	83 e8 63             	sub    $0x63,%eax
 54f:	83 f8 15             	cmp    $0x15,%eax
 552:	77 1c                	ja     570 <printf+0x90>
 554:	ff 24 85 00 08 00 00 	jmp    *0x800(,%eax,4)
 55b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 560:	8d 65 f4             	lea    -0xc(%ebp),%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret
 568:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 56f:	00 
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	8d 55 e7             	lea    -0x19(%ebp),%edx
 576:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57a:	6a 01                	push   $0x1
 57c:	52                   	push   %edx
 57d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 580:	57                   	push   %edi
 581:	e8 fd fd ff ff       	call   383 <write>
 586:	83 c4 0c             	add    $0xc,%esp
 589:	88 5d e7             	mov    %bl,-0x19(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 591:	52                   	push   %edx
 592:	57                   	push   %edi
 593:	e8 eb fd ff ff       	call   383 <write>
        putc(fd, c);
 598:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59b:	31 d2                	xor    %edx,%edx
 59d:	eb 8e                	jmp    52d <printf+0x4d>
 59f:	90                   	nop
        printint(fd, *ap, 16, 0);
 5a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5a3:	83 ec 0c             	sub    $0xc,%esp
 5a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ab:	8b 13                	mov    (%ebx),%edx
 5ad:	6a 00                	push   $0x0
 5af:	89 f8                	mov    %edi,%eax
        ap++;
 5b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 5b4:	e8 87 fe ff ff       	call   440 <printint>
        ap++;
 5b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bf:	31 d2                	xor    %edx,%edx
 5c1:	e9 67 ff ff ff       	jmp    52d <printf+0x4d>
        s = (char*)*ap;
 5c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5c9:	8b 18                	mov    (%eax),%ebx
        ap++;
 5cb:	83 c0 04             	add    $0x4,%eax
 5ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5d1:	85 db                	test   %ebx,%ebx
 5d3:	0f 84 87 00 00 00    	je     660 <printf+0x180>
        while(*s != 0){
 5d9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5dc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5de:	84 c0                	test   %al,%al
 5e0:	0f 84 47 ff ff ff    	je     52d <printf+0x4d>
 5e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5e9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ec:	89 de                	mov    %ebx,%esi
 5ee:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 5f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
 5fb:	53                   	push   %ebx
 5fc:	57                   	push   %edi
 5fd:	e8 81 fd ff ff       	call   383 <write>
        while(*s != 0){
 602:	0f b6 06             	movzbl (%esi),%eax
 605:	83 c4 10             	add    $0x10,%esp
 608:	84 c0                	test   %al,%al
 60a:	75 e4                	jne    5f0 <printf+0x110>
      state = 0;
 60c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 60f:	31 d2                	xor    %edx,%edx
 611:	e9 17 ff ff ff       	jmp    52d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 616:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 619:	83 ec 0c             	sub    $0xc,%esp
 61c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 621:	8b 13                	mov    (%ebx),%edx
 623:	6a 01                	push   $0x1
 625:	eb 88                	jmp    5af <printf+0xcf>
        putc(fd, *ap);
 627:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 62a:	83 ec 04             	sub    $0x4,%esp
 62d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 630:	8b 03                	mov    (%ebx),%eax
        ap++;
 632:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 635:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 638:	6a 01                	push   $0x1
 63a:	52                   	push   %edx
 63b:	57                   	push   %edi
 63c:	e8 42 fd ff ff       	call   383 <write>
        ap++;
 641:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 644:	83 c4 10             	add    $0x10,%esp
      state = 0;
 647:	31 d2                	xor    %edx,%edx
 649:	e9 df fe ff ff       	jmp    52d <printf+0x4d>
 64e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 5d e7             	mov    %bl,-0x19(%ebp)
 656:	8d 55 e7             	lea    -0x19(%ebp),%edx
 659:	6a 01                	push   $0x1
 65b:	e9 31 ff ff ff       	jmp    591 <printf+0xb1>
 660:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 665:	bb f8 07 00 00       	mov    $0x7f8,%ebx
 66a:	e9 77 ff ff ff       	jmp    5e6 <printf+0x106>
 66f:	90                   	nop

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 08 0b 00 00       	mov    0xb08,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 67e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 688:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68a:	39 c8                	cmp    %ecx,%eax
 68c:	73 32                	jae    6c0 <free+0x50>
 68e:	39 d1                	cmp    %edx,%ecx
 690:	72 04                	jb     696 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 692:	39 d0                	cmp    %edx,%eax
 694:	72 32                	jb     6c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 696:	8b 73 fc             	mov    -0x4(%ebx),%esi
 699:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69c:	39 fa                	cmp    %edi,%edx
 69e:	74 30                	je     6d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6a3:	8b 50 04             	mov    0x4(%eax),%edx
 6a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6a9:	39 f1                	cmp    %esi,%ecx
 6ab:	74 3a                	je     6e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6ad:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6af:	5b                   	pop    %ebx
  freep = p;
 6b0:	a3 08 0b 00 00       	mov    %eax,0xb08
}
 6b5:	5e                   	pop    %esi
 6b6:	5f                   	pop    %edi
 6b7:	5d                   	pop    %ebp
 6b8:	c3                   	ret
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c0:	39 d0                	cmp    %edx,%eax
 6c2:	72 04                	jb     6c8 <free+0x58>
 6c4:	39 d1                	cmp    %edx,%ecx
 6c6:	72 ce                	jb     696 <free+0x26>
{
 6c8:	89 d0                	mov    %edx,%eax
 6ca:	eb bc                	jmp    688 <free+0x18>
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6d0:	03 72 04             	add    0x4(%edx),%esi
 6d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	8b 12                	mov    (%edx),%edx
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	75 c6                	jne    6ad <free+0x3d>
    p->s.size += bp->s.size;
 6e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ea:	a3 08 0b 00 00       	mov    %eax,0xb08
    p->s.size += bp->s.size;
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6f5:	89 08                	mov    %ecx,(%eax)
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 15 08 0b 00 00    	mov    0xb08,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 78 07             	lea    0x7(%eax),%edi
 715:	c1 ef 03             	shr    $0x3,%edi
 718:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 71b:	85 d2                	test   %edx,%edx
 71d:	0f 84 8d 00 00 00    	je     7b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 723:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 725:	8b 48 04             	mov    0x4(%eax),%ecx
 728:	39 f9                	cmp    %edi,%ecx
 72a:	73 64                	jae    790 <malloc+0x90>
  if(nu < 4096)
 72c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 731:	39 df                	cmp    %ebx,%edi
 733:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 736:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 73d:	eb 0a                	jmp    749 <malloc+0x49>
 73f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 740:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 742:	8b 48 04             	mov    0x4(%eax),%ecx
 745:	39 f9                	cmp    %edi,%ecx
 747:	73 47                	jae    790 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 749:	89 c2                	mov    %eax,%edx
 74b:	3b 05 08 0b 00 00    	cmp    0xb08,%eax
 751:	75 ed                	jne    740 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 753:	83 ec 0c             	sub    $0xc,%esp
 756:	56                   	push   %esi
 757:	e8 8f fc ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 75c:	83 c4 10             	add    $0x10,%esp
 75f:	83 f8 ff             	cmp    $0xffffffff,%eax
 762:	74 1c                	je     780 <malloc+0x80>
  hp->s.size = nu;
 764:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 767:	83 ec 0c             	sub    $0xc,%esp
 76a:	83 c0 08             	add    $0x8,%eax
 76d:	50                   	push   %eax
 76e:	e8 fd fe ff ff       	call   670 <free>
  return freep;
 773:	8b 15 08 0b 00 00    	mov    0xb08,%edx
      if((p = morecore(nunits)) == 0)
 779:	83 c4 10             	add    $0x10,%esp
 77c:	85 d2                	test   %edx,%edx
 77e:	75 c0                	jne    740 <malloc+0x40>
        return 0;
  }
}
 780:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 783:	31 c0                	xor    %eax,%eax
}
 785:	5b                   	pop    %ebx
 786:	5e                   	pop    %esi
 787:	5f                   	pop    %edi
 788:	5d                   	pop    %ebp
 789:	c3                   	ret
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 790:	39 cf                	cmp    %ecx,%edi
 792:	74 4c                	je     7e0 <malloc+0xe0>
        p->s.size -= nunits;
 794:	29 f9                	sub    %edi,%ecx
 796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 79c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 79f:	89 15 08 0b 00 00    	mov    %edx,0xb08
}
 7a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7a8:	83 c0 08             	add    $0x8,%eax
}
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 08 0b 00 00 0c 	movl   $0xb0c,0xb08
 7b7:	0b 00 00 
    base.s.size = 0;
 7ba:	b8 0c 0b 00 00       	mov    $0xb0c,%eax
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 0c 0b 00 00 0c 	movl   $0xb0c,0xb0c
 7c6:	0b 00 00 
    base.s.size = 0;
 7c9:	c7 05 10 0b 00 00 00 	movl   $0x0,0xb10
 7d0:	00 00 00 
    if(p->s.size >= nunits){
 7d3:	e9 54 ff ff ff       	jmp    72c <malloc+0x2c>
 7d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7df:	00 
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb b9                	jmp    79f <malloc+0x9f>
