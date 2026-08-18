
_test_state:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        printf(1, "%s", state);
    else
        printf(1, "Process not found\n");
}
int main()
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
    test_proc_state();
   6:	e8 05 00 00 00       	call   10 <test_proc_state>
    exit();
   b:	e8 73 04 00 00       	call   483 <exit>

00000010 <test_proc_state>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
    if (get_proc_state(1, state, sizeof(state)) > 0)
  15:	8d 5d e8             	lea    -0x18(%ebp),%ebx
{
  18:	83 ec 10             	sub    $0x10,%esp
    int pid = getpid();
  1b:	e8 e3 04 00 00       	call   503 <getpid>
    if (get_proc_state(1, state, sizeof(state)) > 0)
  20:	83 ec 04             	sub    $0x4,%esp
  23:	6a 10                	push   $0x10
    int pid = getpid();
  25:	89 c6                	mov    %eax,%esi
    if (get_proc_state(1, state, sizeof(state)) > 0)
  27:	53                   	push   %ebx
  28:	6a 01                	push   $0x1
  2a:	e8 fc 04 00 00       	call   52b <get_proc_state>
  2f:	83 c4 10             	add    $0x10,%esp
  32:	85 c0                	test   %eax,%eax
  34:	0f 8e 9e 00 00 00    	jle    d8 <test_proc_state+0xc8>
        printf(1, "%s", state);
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	53                   	push   %ebx
  3e:	68 08 09 00 00       	push   $0x908
  43:	6a 01                	push   $0x1
  45:	e8 b6 05 00 00       	call   600 <printf>
  4a:	83 c4 10             	add    $0x10,%esp
    if (get_proc_state(2, state, sizeof(state)) > 0)
  4d:	83 ec 04             	sub    $0x4,%esp
  50:	6a 10                	push   $0x10
  52:	53                   	push   %ebx
  53:	6a 02                	push   $0x2
  55:	e8 d1 04 00 00       	call   52b <get_proc_state>
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	85 c0                	test   %eax,%eax
  5f:	0f 8e cb 00 00 00    	jle    130 <test_proc_state+0x120>
        printf(1, "%s", state);
  65:	83 ec 04             	sub    $0x4,%esp
  68:	53                   	push   %ebx
  69:	68 08 09 00 00       	push   $0x908
  6e:	6a 01                	push   $0x1
  70:	e8 8b 05 00 00       	call   600 <printf>
  75:	83 c4 10             	add    $0x10,%esp
    if (get_proc_state(pid, state, sizeof(state)) > 0)
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	6a 10                	push   $0x10
  7d:	53                   	push   %ebx
  7e:	56                   	push   %esi
  7f:	e8 a7 04 00 00       	call   52b <get_proc_state>
  84:	83 c4 10             	add    $0x10,%esp
  87:	85 c0                	test   %eax,%eax
  89:	0f 8e 81 00 00 00    	jle    110 <test_proc_state+0x100>
        printf(1, "%s", state); 
  8f:	83 ec 04             	sub    $0x4,%esp
  92:	53                   	push   %ebx
  93:	68 08 09 00 00       	push   $0x908
  98:	6a 01                	push   $0x1
  9a:	e8 61 05 00 00       	call   600 <printf>
  9f:	83 c4 10             	add    $0x10,%esp
    if (get_proc_state(1200, state, sizeof(state)) > 0)
  a2:	83 ec 04             	sub    $0x4,%esp
  a5:	6a 10                	push   $0x10
  a7:	53                   	push   %ebx
  a8:	68 b0 04 00 00       	push   $0x4b0
  ad:	e8 79 04 00 00       	call   52b <get_proc_state>
  b2:	83 c4 10             	add    $0x10,%esp
  b5:	85 c0                	test   %eax,%eax
  b7:	7e 37                	jle    f0 <test_proc_state+0xe0>
        printf(1, "%s", state);
  b9:	83 ec 04             	sub    $0x4,%esp
  bc:	53                   	push   %ebx
  bd:	68 08 09 00 00       	push   $0x908
  c2:	6a 01                	push   $0x1
  c4:	e8 37 05 00 00       	call   600 <printf>
  c9:	83 c4 10             	add    $0x10,%esp
}
  cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  cf:	5b                   	pop    %ebx
  d0:	5e                   	pop    %esi
  d1:	5d                   	pop    %ebp
  d2:	c3                   	ret
  d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "Process not found\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 0b 09 00 00       	push   $0x90b
  e0:	6a 01                	push   $0x1
  e2:	e8 19 05 00 00       	call   600 <printf>
  e7:	83 c4 10             	add    $0x10,%esp
  ea:	e9 5e ff ff ff       	jmp    4d <test_proc_state+0x3d>
  ef:	90                   	nop
        printf(1, "Process not found\n");
  f0:	83 ec 08             	sub    $0x8,%esp
  f3:	68 0b 09 00 00       	push   $0x90b
  f8:	6a 01                	push   $0x1
  fa:	e8 01 05 00 00       	call   600 <printf>
  ff:	83 c4 10             	add    $0x10,%esp
}
 102:	8d 65 f8             	lea    -0x8(%ebp),%esp
 105:	5b                   	pop    %ebx
 106:	5e                   	pop    %esi
 107:	5d                   	pop    %ebp
 108:	c3                   	ret
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "Process not found\n");
 110:	83 ec 08             	sub    $0x8,%esp
 113:	68 0b 09 00 00       	push   $0x90b
 118:	6a 01                	push   $0x1
 11a:	e8 e1 04 00 00       	call   600 <printf>
 11f:	83 c4 10             	add    $0x10,%esp
 122:	e9 7b ff ff ff       	jmp    a2 <test_proc_state+0x92>
 127:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12e:	00 
 12f:	90                   	nop
        printf(1, "Process not found\n");
 130:	83 ec 08             	sub    $0x8,%esp
 133:	68 0b 09 00 00       	push   $0x90b
 138:	6a 01                	push   $0x1
 13a:	e8 c1 04 00 00       	call   600 <printf>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	e9 31 ff ff ff       	jmp    78 <test_proc_state+0x68>
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 150:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 151:	31 c0                	xor    %eax,%eax
{
 153:	89 e5                	mov    %esp,%ebp
 155:	53                   	push   %ebx
 156:	8b 4d 08             	mov    0x8(%ebp),%ecx
 159:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 171:	89 c8                	mov    %ecx,%eax
 173:	c9                   	leave
 174:	c3                   	ret
 175:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17c:	00 
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	84 c0                	test   %al,%al
 18f:	75 17                	jne    1a8 <strcmp+0x28>
 191:	eb 3a                	jmp    1cd <strcmp+0x4d>
 193:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 198:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 19c:	83 c2 01             	add    $0x1,%edx
 19f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1a2:	84 c0                	test   %al,%al
 1a4:	74 1a                	je     1c0 <strcmp+0x40>
 1a6:	89 d9                	mov    %ebx,%ecx
 1a8:	0f b6 19             	movzbl (%ecx),%ebx
 1ab:	38 c3                	cmp    %al,%bl
 1ad:	74 e9                	je     198 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1af:	29 d8                	sub    %ebx,%eax
}
 1b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b4:	c9                   	leave
 1b5:	c3                   	ret
 1b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bd:	00 
 1be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1c4:	31 c0                	xor    %eax,%eax
 1c6:	29 d8                	sub    %ebx,%eax
}
 1c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1cb:	c9                   	leave
 1cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1cd:	0f b6 19             	movzbl (%ecx),%ebx
 1d0:	31 c0                	xor    %eax,%eax
 1d2:	eb db                	jmp    1af <strcmp+0x2f>
 1d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1db:	00 
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1e6:	80 3a 00             	cmpb   $0x0,(%edx)
 1e9:	74 15                	je     200 <strlen+0x20>
 1eb:	31 c0                	xor    %eax,%eax
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1f7:	89 c1                	mov    %eax,%ecx
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	89 c8                	mov    %ecx,%eax
 1fd:	5d                   	pop    %ebp
 1fe:	c3                   	ret
 1ff:	90                   	nop
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret
 206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20d:	00 
 20e:	66 90                	xchg   %ax,%ax

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	8b 7d fc             	mov    -0x4(%ebp),%edi
 225:	89 d0                	mov    %edx,%eax
 227:	c9                   	leave
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23a:	0f b6 10             	movzbl (%eax),%edx
 23d:	84 d2                	test   %dl,%dl
 23f:	75 12                	jne    253 <strchr+0x23>
 241:	eb 1d                	jmp    260 <strchr+0x30>
 243:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 248:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 24c:	83 c0 01             	add    $0x1,%eax
 24f:	84 d2                	test   %dl,%dl
 251:	74 0d                	je     260 <strchr+0x30>
    if(*s == c)
 253:	38 d1                	cmp    %dl,%cl
 255:	75 f1                	jne    248 <strchr+0x18>
      return (char*)s;
  return 0;
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 260:	31 c0                	xor    %eax,%eax
}
 262:	5d                   	pop    %ebp
 263:	c3                   	ret
 264:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26b:	00 
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	83 ec 34             	sub    $0x34,%esp
  count++;
 279:	8b 15 6c 0c 00 00    	mov    0xc6c,%edx
 27f:	8d 72 01             	lea    0x1(%edx),%esi
 282:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 285:	89 35 6c 0c 00 00    	mov    %esi,0xc6c
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 28b:	6a 00                	push   $0x0
 28d:	68 1e 09 00 00       	push   $0x91e
 292:	e8 2c 02 00 00       	call   4c3 <open>
  if (fd < 0) {
 297:	83 c4 10             	add    $0x10,%esp
 29a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 29d:	85 c0                	test   %eax,%eax
 29f:	0f 88 82 00 00 00    	js     327 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 2a5:	0f 84 8e 00 00 00    	je     339 <gets+0xc9>
 2ab:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 2ad:	85 f6                	test   %esi,%esi
 2af:	0f 84 ee 00 00 00    	je     3a3 <gets+0x133>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
 2b8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 2bb:	31 f6                	xor    %esi,%esi
 2bd:	eb 2a                	jmp    2e9 <gets+0x79>
 2bf:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2c6:	6a 01                	push   $0x1
 2c8:	50                   	push   %eax
 2c9:	57                   	push   %edi
 2ca:	e8 cc 01 00 00       	call   49b <read>
        if(cc < 1)
 2cf:	83 c4 10             	add    $0x10,%esp
 2d2:	85 c0                	test   %eax,%eax
 2d4:	7e 1d                	jle    2f3 <gets+0x83>
          break;
        buf[i++] = c;
 2d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2da:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2dd:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 2e1:	3c 0a                	cmp    $0xa,%al
 2e3:	74 3b                	je     320 <gets+0xb0>
 2e5:	3c 0d                	cmp    $0xd,%al
 2e7:	74 37                	je     320 <gets+0xb0>
      for(i=0; i+1 < max; ){
 2e9:	89 f3                	mov    %esi,%ebx
 2eb:	83 c6 01             	add    $0x1,%esi
 2ee:	3b 75 0c             	cmp    0xc(%ebp),%esi
 2f1:	7c cd                	jl     2c0 <gets+0x50>
 2f3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 2f6:	83 ea 01             	sub    $0x1,%edx
 2f9:	73 bd                	jae    2b8 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 2fe:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 301:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 305:	57                   	push   %edi
 306:	e8 a0 01 00 00       	call   4ab <close>
 30b:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 30e:	85 db                	test   %ebx,%ebx
 310:	74 76                	je     388 <gets+0x118>

  return buf;
}
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	8d 65 f4             	lea    -0xc(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5f                   	pop    %edi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 323:	89 f3                	mov    %esi,%ebx
 325:	eb cf                	jmp    2f6 <gets+0x86>
      printf(1, "nooo\n");
 327:	83 ec 08             	sub    $0x8,%esp
 32a:	68 28 09 00 00       	push   $0x928
 32f:	6a 01                	push   $0x1
 331:	e8 ca 02 00 00       	call   600 <printf>
 336:	83 c4 10             	add    $0x10,%esp
{
 339:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 33b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 33e:	89 df                	mov    %ebx,%edi
 340:	eb 2d                	jmp    36f <gets+0xff>
 342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 348:	83 ec 04             	sub    $0x4,%esp
 34b:	6a 01                	push   $0x1
 34d:	56                   	push   %esi
 34e:	6a 00                	push   $0x0
 350:	e8 46 01 00 00       	call   49b <read>
      if(cc < 1)
 355:	83 c4 10             	add    $0x10,%esp
 358:	85 c0                	test   %eax,%eax
 35a:	7e 1d                	jle    379 <gets+0x109>
      buf[i++] = c;
 35c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 360:	8b 55 08             	mov    0x8(%ebp),%edx
 363:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 367:	3c 0a                	cmp    $0xa,%al
 369:	74 10                	je     37b <gets+0x10b>
 36b:	3c 0d                	cmp    $0xd,%al
 36d:	74 0c                	je     37b <gets+0x10b>
    for(i=0; i+1 < max; ){
 36f:	89 fb                	mov    %edi,%ebx
 371:	83 c7 01             	add    $0x1,%edi
 374:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 377:	7c cf                	jl     348 <gets+0xd8>
 379:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 fb                	mov    %edi,%ebx
 380:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 384:	85 db                	test   %ebx,%ebx
 386:	75 8a                	jne    312 <gets+0xa2>
 388:	83 ec 0c             	sub    $0xc,%esp
 38b:	68 1e 09 00 00       	push   $0x91e
 390:	e8 3e 01 00 00       	call   4d3 <unlink>
}
 395:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 398:	83 c4 10             	add    $0x10,%esp
}
 39b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39e:	5b                   	pop    %ebx
 39f:	5e                   	pop    %esi
 3a0:	5f                   	pop    %edi
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret
  buf[i] = '\0';
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 3a6:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 3a9:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 3ac:	57                   	push   %edi
 3ad:	e8 f9 00 00 00       	call   4ab <close>
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	eb d1                	jmp    388 <gets+0x118>
 3b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3be:	00 
 3bf:	90                   	nop

000003c0 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	push   0x8(%ebp)
 3cd:	e8 f1 00 00 00       	call   4c3 <open>
  if(fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 27                	js     400 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3d9:	83 ec 08             	sub    $0x8,%esp
 3dc:	ff 75 0c             	push   0xc(%ebp)
 3df:	89 c3                	mov    %eax,%ebx
 3e1:	50                   	push   %eax
 3e2:	e8 f4 00 00 00       	call   4db <fstat>
  close(fd);
 3e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ea:	89 c6                	mov    %eax,%esi
  close(fd);
 3ec:	e8 ba 00 00 00       	call   4ab <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 400:	be ff ff ff ff       	mov    $0xffffffff,%esi
 405:	eb ed                	jmp    3f4 <stat+0x34>
 407:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40e:	00 
 40f:	90                   	nop

00000410 <atoi>:

int
atoi(const char *s)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 417:	0f be 02             	movsbl (%edx),%eax
 41a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 41d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 420:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 425:	77 1e                	ja     445 <atoi+0x35>
 427:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 42e:	00 
 42f:	90                   	nop
    n = n*10 + *s++ - '0';
 430:	83 c2 01             	add    $0x1,%edx
 433:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 436:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 43a:	0f be 02             	movsbl (%edx),%eax
 43d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 440:	80 fb 09             	cmp    $0x9,%bl
 443:	76 eb                	jbe    430 <atoi+0x20>
  return n;
}
 445:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 448:	89 c8                	mov    %ecx,%eax
 44a:	c9                   	leave
 44b:	c3                   	ret
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 45 10             	mov    0x10(%ebp),%eax
 457:	8b 55 08             	mov    0x8(%ebp),%edx
 45a:	56                   	push   %esi
 45b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 45e:	85 c0                	test   %eax,%eax
 460:	7e 13                	jle    475 <memmove+0x25>
 462:	01 d0                	add    %edx,%eax
  dst = vdst;
 464:	89 d7                	mov    %edx,%edi
 466:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 46d:	00 
 46e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 470:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 471:	39 f8                	cmp    %edi,%eax
 473:	75 fb                	jne    470 <memmove+0x20>
  return vdst;
}
 475:	5e                   	pop    %esi
 476:	89 d0                	mov    %edx,%eax
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret

0000047b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47b:	b8 01 00 00 00       	mov    $0x1,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <exit>:
SYSCALL(exit)
 483:	b8 02 00 00 00       	mov    $0x2,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <wait>:
SYSCALL(wait)
 48b:	b8 03 00 00 00       	mov    $0x3,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <pipe>:
SYSCALL(pipe)
 493:	b8 04 00 00 00       	mov    $0x4,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <read>:
SYSCALL(read)
 49b:	b8 05 00 00 00       	mov    $0x5,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <write>:
SYSCALL(write)
 4a3:	b8 10 00 00 00       	mov    $0x10,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <close>:
SYSCALL(close)
 4ab:	b8 15 00 00 00       	mov    $0x15,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <kill>:
SYSCALL(kill)
 4b3:	b8 06 00 00 00       	mov    $0x6,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <exec>:
SYSCALL(exec)
 4bb:	b8 07 00 00 00       	mov    $0x7,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <open>:
SYSCALL(open)
 4c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <mknod>:
SYSCALL(mknod)
 4cb:	b8 11 00 00 00       	mov    $0x11,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <unlink>:
SYSCALL(unlink)
 4d3:	b8 12 00 00 00       	mov    $0x12,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <fstat>:
SYSCALL(fstat)
 4db:	b8 08 00 00 00       	mov    $0x8,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <link>:
SYSCALL(link)
 4e3:	b8 13 00 00 00       	mov    $0x13,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <mkdir>:
SYSCALL(mkdir)
 4eb:	b8 14 00 00 00       	mov    $0x14,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret

000004f3 <chdir>:
SYSCALL(chdir)
 4f3:	b8 09 00 00 00       	mov    $0x9,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret

000004fb <dup>:
SYSCALL(dup)
 4fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <getpid>:
SYSCALL(getpid)
 503:	b8 0b 00 00 00       	mov    $0xb,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <sbrk>:
SYSCALL(sbrk)
 50b:	b8 0c 00 00 00       	mov    $0xc,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret

00000513 <sleep>:
SYSCALL(sleep)
 513:	b8 0d 00 00 00       	mov    $0xd,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret

0000051b <uptime>:
SYSCALL(uptime)
 51b:	b8 0e 00 00 00       	mov    $0xe,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret

00000523 <is_proc_valid>:
SYSCALL(is_proc_valid)
 523:	b8 16 00 00 00       	mov    $0x16,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret

0000052b <get_proc_state>:
SYSCALL(get_proc_state)
 52b:	b8 17 00 00 00       	mov    $0x17,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret

00000533 <fill_proc_name>:
SYSCALL(fill_proc_name)
 533:	b8 18 00 00 00       	mov    $0x18,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret

0000053b <get_proc_name>:
SYSCALL(get_proc_name)
 53b:	b8 19 00 00 00       	mov    $0x19,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret

00000543 <get_num_syscall>:
SYSCALL(get_num_syscall)
 543:	b8 1a 00 00 00       	mov    $0x1a,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret

0000054b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 54b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret
 553:	66 90                	xchg   %ax,%ax
 555:	66 90                	xchg   %ax,%ax
 557:	66 90                	xchg   %ax,%ax
 559:	66 90                	xchg   %ax,%ax
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 568:	89 d1                	mov    %edx,%ecx
{
 56a:	83 ec 3c             	sub    $0x3c,%esp
 56d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 570:	85 d2                	test   %edx,%edx
 572:	0f 89 80 00 00 00    	jns    5f8 <printint+0x98>
 578:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 57c:	74 7a                	je     5f8 <printint+0x98>
    x = -xx;
 57e:	f7 d9                	neg    %ecx
    neg = 1;
 580:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 585:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 588:	31 f6                	xor    %esi,%esi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 c8                	mov    %ecx,%eax
 592:	31 d2                	xor    %edx,%edx
 594:	89 f7                	mov    %esi,%edi
 596:	f7 f3                	div    %ebx
 598:	8d 76 01             	lea    0x1(%esi),%esi
 59b:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
 5a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 5a6:	89 ca                	mov    %ecx,%edx
 5a8:	89 c1                	mov    %eax,%ecx
 5aa:	39 da                	cmp    %ebx,%edx
 5ac:	73 e2                	jae    590 <printint+0x30>
  if(neg)
 5ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5b1:	85 c0                	test   %eax,%eax
 5b3:	74 07                	je     5bc <printint+0x5c>
    buf[i++] = '-';
 5b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 5ba:	89 f7                	mov    %esi,%edi
 5bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5bf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 5c2:	01 df                	add    %ebx,%edi
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 5d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5d4:	6a 01                	push   $0x1
 5d6:	50                   	push   %eax
 5d7:	56                   	push   %esi
 5d8:	e8 c6 fe ff ff       	call   4a3 <write>
  while(--i >= 0)
 5dd:	89 f8                	mov    %edi,%eax
 5df:	83 c4 10             	add    $0x10,%esp
 5e2:	83 ef 01             	sub    $0x1,%edi
 5e5:	39 c3                	cmp    %eax,%ebx
 5e7:	75 df                	jne    5c8 <printint+0x68>
}
 5e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ec:	5b                   	pop    %ebx
 5ed:	5e                   	pop    %esi
 5ee:	5f                   	pop    %edi
 5ef:	5d                   	pop    %ebp
 5f0:	c3                   	ret
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f8:	31 c0                	xor    %eax,%eax
 5fa:	eb 89                	jmp    585 <printint+0x25>
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 60c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 60f:	0f b6 1e             	movzbl (%esi),%ebx
 612:	83 c6 01             	add    $0x1,%esi
 615:	84 db                	test   %bl,%bl
 617:	74 67                	je     680 <printf+0x80>
 619:	8d 4d 10             	lea    0x10(%ebp),%ecx
 61c:	31 d2                	xor    %edx,%edx
 61e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 621:	eb 34                	jmp    657 <printf+0x57>
 623:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 628:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 62b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 630:	83 f8 25             	cmp    $0x25,%eax
 633:	74 18                	je     64d <printf+0x4d>
  write(fd, &c, 1);
 635:	83 ec 04             	sub    $0x4,%esp
 638:	8d 45 e7             	lea    -0x19(%ebp),%eax
 63b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 63e:	6a 01                	push   $0x1
 640:	50                   	push   %eax
 641:	57                   	push   %edi
 642:	e8 5c fe ff ff       	call   4a3 <write>
 647:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 64a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 64d:	0f b6 1e             	movzbl (%esi),%ebx
 650:	83 c6 01             	add    $0x1,%esi
 653:	84 db                	test   %bl,%bl
 655:	74 29                	je     680 <printf+0x80>
    c = fmt[i] & 0xff;
 657:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 65a:	85 d2                	test   %edx,%edx
 65c:	74 ca                	je     628 <printf+0x28>
      }
    } else if(state == '%'){
 65e:	83 fa 25             	cmp    $0x25,%edx
 661:	75 ea                	jne    64d <printf+0x4d>
      if(c == 'd'){
 663:	83 f8 25             	cmp    $0x25,%eax
 666:	0f 84 04 01 00 00    	je     770 <printf+0x170>
 66c:	83 e8 63             	sub    $0x63,%eax
 66f:	83 f8 15             	cmp    $0x15,%eax
 672:	77 1c                	ja     690 <printf+0x90>
 674:	ff 24 85 38 09 00 00 	jmp    *0x938(,%eax,4)
 67b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret
 688:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 68f:	00 
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	8d 55 e7             	lea    -0x19(%ebp),%edx
 696:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69a:	6a 01                	push   $0x1
 69c:	52                   	push   %edx
 69d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 6a0:	57                   	push   %edi
 6a1:	e8 fd fd ff ff       	call   4a3 <write>
 6a6:	83 c4 0c             	add    $0xc,%esp
 6a9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6ac:	6a 01                	push   $0x1
 6ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6b1:	52                   	push   %edx
 6b2:	57                   	push   %edi
 6b3:	e8 eb fd ff ff       	call   4a3 <write>
        putc(fd, c);
 6b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bb:	31 d2                	xor    %edx,%edx
 6bd:	eb 8e                	jmp    64d <printf+0x4d>
 6bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 6c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6cb:	8b 13                	mov    (%ebx),%edx
 6cd:	6a 00                	push   $0x0
 6cf:	89 f8                	mov    %edi,%eax
        ap++;
 6d1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 6d4:	e8 87 fe ff ff       	call   560 <printint>
        ap++;
 6d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6df:	31 d2                	xor    %edx,%edx
 6e1:	e9 67 ff ff ff       	jmp    64d <printf+0x4d>
        s = (char*)*ap;
 6e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6e9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6eb:	83 c0 04             	add    $0x4,%eax
 6ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6f1:	85 db                	test   %ebx,%ebx
 6f3:	0f 84 87 00 00 00    	je     780 <printf+0x180>
        while(*s != 0){
 6f9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6fc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6fe:	84 c0                	test   %al,%al
 700:	0f 84 47 ff ff ff    	je     64d <printf+0x4d>
 706:	8d 55 e7             	lea    -0x19(%ebp),%edx
 709:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 70c:	89 de                	mov    %ebx,%esi
 70e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 716:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	53                   	push   %ebx
 71c:	57                   	push   %edi
 71d:	e8 81 fd ff ff       	call   4a3 <write>
        while(*s != 0){
 722:	0f b6 06             	movzbl (%esi),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x110>
      state = 0;
 72c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 17 ff ff ff       	jmp    64d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 736:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 739:	83 ec 0c             	sub    $0xc,%esp
 73c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 741:	8b 13                	mov    (%ebx),%edx
 743:	6a 01                	push   $0x1
 745:	eb 88                	jmp    6cf <printf+0xcf>
        putc(fd, *ap);
 747:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 74a:	83 ec 04             	sub    $0x4,%esp
 74d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 750:	8b 03                	mov    (%ebx),%eax
        ap++;
 752:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 755:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
 75a:	52                   	push   %edx
 75b:	57                   	push   %edi
 75c:	e8 42 fd ff ff       	call   4a3 <write>
        ap++;
 761:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 764:	83 c4 10             	add    $0x10,%esp
      state = 0;
 767:	31 d2                	xor    %edx,%edx
 769:	e9 df fe ff ff       	jmp    64d <printf+0x4d>
 76e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	88 5d e7             	mov    %bl,-0x19(%ebp)
 776:	8d 55 e7             	lea    -0x19(%ebp),%edx
 779:	6a 01                	push   $0x1
 77b:	e9 31 ff ff ff       	jmp    6b1 <printf+0xb1>
 780:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 785:	bb 2e 09 00 00       	mov    $0x92e,%ebx
 78a:	e9 77 ff ff ff       	jmp    706 <printf+0x106>
 78f:	90                   	nop

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 70 0c 00 00       	mov    0xc70,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	39 c8                	cmp    %ecx,%eax
 7ac:	73 32                	jae    7e0 <free+0x50>
 7ae:	39 d1                	cmp    %edx,%ecx
 7b0:	72 04                	jb     7b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b2:	39 d0                	cmp    %edx,%eax
 7b4:	72 32                	jb     7e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bc:	39 fa                	cmp    %edi,%edx
 7be:	74 30                	je     7f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7c3:	8b 50 04             	mov    0x4(%eax),%edx
 7c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c9:	39 f1                	cmp    %esi,%ecx
 7cb:	74 3a                	je     807 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7cd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7cf:	5b                   	pop    %ebx
  freep = p;
 7d0:	a3 70 0c 00 00       	mov    %eax,0xc70
}
 7d5:	5e                   	pop    %esi
 7d6:	5f                   	pop    %edi
 7d7:	5d                   	pop    %ebp
 7d8:	c3                   	ret
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 04                	jb     7e8 <free+0x58>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	72 ce                	jb     7b6 <free+0x26>
{
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb bc                	jmp    7a8 <free+0x18>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7f0:	03 72 04             	add    0x4(%edx),%esi
 7f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 10                	mov    (%eax),%edx
 7f8:	8b 12                	mov    (%edx),%edx
 7fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 803:	39 f1                	cmp    %esi,%ecx
 805:	75 c6                	jne    7cd <free+0x3d>
    p->s.size += bp->s.size;
 807:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 80a:	a3 70 0c 00 00       	mov    %eax,0xc70
    p->s.size += bp->s.size;
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 812:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 815:	89 08                	mov    %ecx,(%eax)
}
 817:	5b                   	pop    %ebx
 818:	5e                   	pop    %esi
 819:	5f                   	pop    %edi
 81a:	5d                   	pop    %ebp
 81b:	c3                   	ret
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 15 70 0c 00 00    	mov    0xc70,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 78 07             	lea    0x7(%eax),%edi
 835:	c1 ef 03             	shr    $0x3,%edi
 838:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 83b:	85 d2                	test   %edx,%edx
 83d:	0f 84 8d 00 00 00    	je     8d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 843:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 845:	8b 48 04             	mov    0x4(%eax),%ecx
 848:	39 f9                	cmp    %edi,%ecx
 84a:	73 64                	jae    8b0 <malloc+0x90>
  if(nu < 4096)
 84c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 851:	39 df                	cmp    %ebx,%edi
 853:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 856:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 85d:	eb 0a                	jmp    869 <malloc+0x49>
 85f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 862:	8b 48 04             	mov    0x4(%eax),%ecx
 865:	39 f9                	cmp    %edi,%ecx
 867:	73 47                	jae    8b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 869:	89 c2                	mov    %eax,%edx
 86b:	3b 05 70 0c 00 00    	cmp    0xc70,%eax
 871:	75 ed                	jne    860 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	56                   	push   %esi
 877:	e8 8f fc ff ff       	call   50b <sbrk>
  if(p == (char*)-1)
 87c:	83 c4 10             	add    $0x10,%esp
 87f:	83 f8 ff             	cmp    $0xffffffff,%eax
 882:	74 1c                	je     8a0 <malloc+0x80>
  hp->s.size = nu;
 884:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 887:	83 ec 0c             	sub    $0xc,%esp
 88a:	83 c0 08             	add    $0x8,%eax
 88d:	50                   	push   %eax
 88e:	e8 fd fe ff ff       	call   790 <free>
  return freep;
 893:	8b 15 70 0c 00 00    	mov    0xc70,%edx
      if((p = morecore(nunits)) == 0)
 899:	83 c4 10             	add    $0x10,%esp
 89c:	85 d2                	test   %edx,%edx
 89e:	75 c0                	jne    860 <malloc+0x40>
        return 0;
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8a3:	31 c0                	xor    %eax,%eax
}
 8a5:	5b                   	pop    %ebx
 8a6:	5e                   	pop    %esi
 8a7:	5f                   	pop    %edi
 8a8:	5d                   	pop    %ebp
 8a9:	c3                   	ret
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b0:	39 cf                	cmp    %ecx,%edi
 8b2:	74 4c                	je     900 <malloc+0xe0>
        p->s.size -= nunits;
 8b4:	29 f9                	sub    %edi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8bf:	89 15 70 0c 00 00    	mov    %edx,0xc70
}
 8c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
}
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 70 0c 00 00 74 	movl   $0xc74,0xc70
 8d7:	0c 00 00 
    base.s.size = 0;
 8da:	b8 74 0c 00 00       	mov    $0xc74,%eax
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 74 0c 00 00 74 	movl   $0xc74,0xc74
 8e6:	0c 00 00 
    base.s.size = 0;
 8e9:	c7 05 78 0c 00 00 00 	movl   $0x0,0xc78
 8f0:	00 00 00 
    if(p->s.size >= nunits){
 8f3:	e9 54 ff ff ff       	jmp    84c <malloc+0x2c>
 8f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8ff:	00 
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b9                	jmp    8bf <malloc+0x9f>
