
_test_num_s:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

    printf(1, "%d\n", num_syscalls1);
    printf(1, "%d\n", num_syscalls2);
}

int main() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
    test_get_num_syscall();
   6:	e8 05 00 00 00       	call   10 <test_get_num_syscall>
    exit();
   b:	e8 f3 04 00 00       	call   503 <exit>

00000010 <test_get_num_syscall>:
void test_get_num_syscall() {
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	83 ec 30             	sub    $0x30,%esp
    int pid = getpid();
  18:	e8 66 05 00 00       	call   583 <getpid>
    int num_syscalls1 = get_num_syscall(pid);
  1d:	83 ec 0c             	sub    $0xc,%esp
  20:	50                   	push   %eax
  21:	e8 9d 05 00 00       	call   5c3 <get_num_syscall>
  26:	89 c6                	mov    %eax,%esi
    int childpid = fork();
  28:	e8 ce 04 00 00       	call   4fb <fork>
    if (childpid == 0) {
  2d:	83 c4 10             	add    $0x10,%esp
  30:	85 c0                	test   %eax,%eax
  32:	0f 85 e8 00 00 00    	jne    120 <test_get_num_syscall+0x110>
        pipe(fds);                        // SYS_pipe
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	8d 45 c8             	lea    -0x38(%ebp),%eax
  3e:	50                   	push   %eax
  3f:	e8 cf 04 00 00       	call   513 <pipe>
        write(fds[1], "x", 1);            // SYS_write
  44:	83 c4 0c             	add    $0xc,%esp
  47:	6a 01                	push   $0x1
  49:	68 88 09 00 00       	push   $0x988
  4e:	ff 75 cc             	push   -0x34(%ebp)
  51:	e8 cd 04 00 00       	call   523 <write>
        read(fds[0], buf, 1);             // SYS_read
  56:	83 c4 0c             	add    $0xc,%esp
  59:	8d 45 da             	lea    -0x26(%ebp),%eax
  5c:	6a 01                	push   $0x1
  5e:	50                   	push   %eax
  5f:	ff 75 c8             	push   -0x38(%ebp)
  62:	e8 b4 04 00 00       	call   51b <read>
        close(fds[0]);                    // SYS_close
  67:	5e                   	pop    %esi
  68:	ff 75 c8             	push   -0x38(%ebp)
  6b:	e8 bb 04 00 00       	call   52b <close>
        close(fds[1]);                    // SYS_close
  70:	58                   	pop    %eax
  71:	ff 75 cc             	push   -0x34(%ebp)
  74:	e8 b2 04 00 00       	call   52b <close>
        getpid();                         // SYS_getpid
  79:	e8 05 05 00 00       	call   583 <getpid>
        sleep(1);                         // SYS_sleep
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 09 05 00 00       	call   593 <sleep>
        uptime();                         // SYS_uptime
  8a:	e8 0c 05 00 00       	call   59b <uptime>
        int fd = open("test.txt", O_CREATE | O_WRONLY); // SYS_open
  8f:	58                   	pop    %eax
  90:	5a                   	pop    %edx
  91:	68 01 02 00 00       	push   $0x201
  96:	68 8a 09 00 00       	push   $0x98a
  9b:	e8 a3 04 00 00       	call   543 <open>
        write(fd, "hello", 5);           // SYS_write
  a0:	83 c4 0c             	add    $0xc,%esp
  a3:	6a 05                	push   $0x5
        int fd = open("test.txt", O_CREATE | O_WRONLY); // SYS_open
  a5:	89 c3                	mov    %eax,%ebx
        write(fd, "hello", 5);           // SYS_write
  a7:	68 93 09 00 00       	push   $0x993
  ac:	50                   	push   %eax
  ad:	e8 71 04 00 00       	call   523 <write>
        close(fd);                        // SYS_close
  b2:	89 1c 24             	mov    %ebx,(%esp)
  b5:	e8 71 04 00 00       	call   52b <close>
        unlink("test.txt");              // SYS_unlink
  ba:	c7 04 24 8a 09 00 00 	movl   $0x98a,(%esp)
  c1:	e8 8d 04 00 00       	call   553 <unlink>
        mkdir("testdir");                // SYS_mkdir
  c6:	c7 04 24 99 09 00 00 	movl   $0x999,(%esp)
  cd:	e8 99 04 00 00       	call   56b <mkdir>
        chdir("testdir");                // SYS_chdir
  d2:	c7 04 24 99 09 00 00 	movl   $0x999,(%esp)
  d9:	e8 95 04 00 00       	call   573 <chdir>
        chdir("..");                     // SYS_chdir
  de:	c7 04 24 a1 09 00 00 	movl   $0x9a1,(%esp)
  e5:	e8 89 04 00 00       	call   573 <chdir>
        unlink("testdir");               // SYS_unlink
  ea:	c7 04 24 99 09 00 00 	movl   $0x999,(%esp)
  f1:	e8 5d 04 00 00       	call   553 <unlink>
        sbrk(1);                          // SYS_sbrk
  f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fd:	e8 89 04 00 00       	call   58b <sbrk>
        dup(1);                           // SYS_dup
 102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 109:	e8 6d 04 00 00       	call   57b <dup>
        int pid2 = fork();                // SYS_fork
 10e:	e8 e8 03 00 00       	call   4fb <fork>
        if (pid2 == 0) {
 113:	83 c4 10             	add    $0x10,%esp
 116:	85 c0                	test   %eax,%eax
 118:	75 46                	jne    160 <test_get_num_syscall+0x150>
            exit();                      // SYS_exit
 11a:	e8 e4 03 00 00       	call   503 <exit>
 11f:	90                   	nop
 120:	89 c3                	mov    %eax,%ebx
    wait(); // wait for child to finish
 122:	e8 e4 03 00 00       	call   50b <wait>
    int num_syscalls2 = get_num_syscall(childpid);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	53                   	push   %ebx
 12b:	e8 93 04 00 00       	call   5c3 <get_num_syscall>
    printf(1, "%d\n", num_syscalls1);
 130:	83 c4 0c             	add    $0xc,%esp
 133:	56                   	push   %esi
    int num_syscalls2 = get_num_syscall(childpid);
 134:	89 c3                	mov    %eax,%ebx
    printf(1, "%d\n", num_syscalls1);
 136:	68 bd 09 00 00       	push   $0x9bd
 13b:	6a 01                	push   $0x1
 13d:	e8 3e 05 00 00       	call   680 <printf>
    printf(1, "%d\n", num_syscalls2);
 142:	83 c4 0c             	add    $0xc,%esp
 145:	53                   	push   %ebx
 146:	68 bd 09 00 00       	push   $0x9bd
 14b:	6a 01                	push   $0x1
 14d:	e8 2e 05 00 00       	call   680 <printf>
}
 152:	83 c4 10             	add    $0x10,%esp
 155:	8d 65 f8             	lea    -0x8(%ebp),%esp
 158:	5b                   	pop    %ebx
 159:	5e                   	pop    %esi
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        wait();                           // SYS_wait
 160:	e8 a6 03 00 00       	call   50b <wait>
        exec("nonexistent", args);       // SYS_exec
 165:	83 ec 08             	sub    $0x8,%esp
 168:	8d 45 d0             	lea    -0x30(%ebp),%eax
        char *args[] = { "nonexistent", 0 };
 16b:	c7 45 d0 a4 09 00 00 	movl   $0x9a4,-0x30(%ebp)
 172:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        exec("nonexistent", args);       // SYS_exec
 179:	50                   	push   %eax
 17a:	68 a4 09 00 00       	push   $0x9a4
 17f:	e8 b7 03 00 00       	call   53b <exec>
        fstat(1, &st);                   // SYS_fstat
 184:	58                   	pop    %eax
 185:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 188:	5a                   	pop    %edx
 189:	50                   	push   %eax
 18a:	6a 01                	push   $0x1
 18c:	e8 ca 03 00 00       	call   55b <fstat>
        mknod("nod", 1, 1);              // SYS_mknod
 191:	83 c4 0c             	add    $0xc,%esp
 194:	6a 01                	push   $0x1
 196:	6a 01                	push   $0x1
 198:	68 b0 09 00 00       	push   $0x9b0
 19d:	e8 a9 03 00 00       	call   54b <mknod>
        unlink("nod");                   // cleanup
 1a2:	c7 04 24 b0 09 00 00 	movl   $0x9b0,(%esp)
 1a9:	e8 a5 03 00 00       	call   553 <unlink>
        link("test.txt", "testlink");    // SYS_link (may fail if file doesn't exist)
 1ae:	59                   	pop    %ecx
 1af:	5b                   	pop    %ebx
 1b0:	68 b4 09 00 00       	push   $0x9b4
 1b5:	68 8a 09 00 00       	push   $0x98a
 1ba:	e8 a4 03 00 00       	call   563 <link>
        unlink("testlink");              // cleanup
 1bf:	c7 04 24 b4 09 00 00 	movl   $0x9b4,(%esp)
 1c6:	e8 88 03 00 00       	call   553 <unlink>
        exit();                           // SYS_exit
 1cb:	e8 33 03 00 00       	call   503 <exit>

000001d0 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d1:	31 c0                	xor    %eax,%eax
{
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	53                   	push   %ebx
 1d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f1:	89 c8                	mov    %ecx,%eax
 1f3:	c9                   	leave
 1f4:	c3                   	ret
 1f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fc:	00 
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 17                	jne    228 <strcmp+0x28>
 211:	eb 3a                	jmp    24d <strcmp+0x4d>
 213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 218:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 21c:	83 c2 01             	add    $0x1,%edx
 21f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 222:	84 c0                	test   %al,%al
 224:	74 1a                	je     240 <strcmp+0x40>
 226:	89 d9                	mov    %ebx,%ecx
 228:	0f b6 19             	movzbl (%ecx),%ebx
 22b:	38 c3                	cmp    %al,%bl
 22d:	74 e9                	je     218 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 22f:	29 d8                	sub    %ebx,%eax
}
 231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 234:	c9                   	leave
 235:	c3                   	ret
 236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23d:	00 
 23e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 240:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 244:	31 c0                	xor    %eax,%eax
 246:	29 d8                	sub    %ebx,%eax
}
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave
 24c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 24d:	0f b6 19             	movzbl (%ecx),%ebx
 250:	31 c0                	xor    %eax,%eax
 252:	eb db                	jmp    22f <strcmp+0x2f>
 254:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25b:	00 
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <strlen>:

uint
strlen(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 3a 00             	cmpb   $0x0,(%edx)
 269:	74 15                	je     280 <strlen+0x20>
 26b:	31 c0                	xor    %eax,%eax
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c0 01             	add    $0x1,%eax
 273:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 277:	89 c1                	mov    %eax,%ecx
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	89 c8                	mov    %ecx,%eax
 27d:	5d                   	pop    %ebp
 27e:	c3                   	ret
 27f:	90                   	nop
  for(n = 0; s[n]; n++)
 280:	31 c9                	xor    %ecx,%ecx
}
 282:	5d                   	pop    %ebp
 283:	89 c8                	mov    %ecx,%eax
 285:	c3                   	ret
 286:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28d:	00 
 28e:	66 90                	xchg   %ax,%ax

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a5:	89 d0                	mov    %edx,%eax
 2a7:	c9                   	leave
 2a8:	c3                   	ret
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	84 d2                	test   %dl,%dl
 2bf:	75 12                	jne    2d3 <strchr+0x23>
 2c1:	eb 1d                	jmp    2e0 <strchr+0x30>
 2c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	84 d2                	test   %dl,%dl
 2d1:	74 0d                	je     2e0 <strchr+0x30>
    if(*s == c)
 2d3:	38 d1                	cmp    %dl,%cl
 2d5:	75 f1                	jne    2c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2e0:	31 c0                	xor    %eax,%eax
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret
 2e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2eb:	00 
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	53                   	push   %ebx
 2f6:	83 ec 34             	sub    $0x34,%esp
  count++;
 2f9:	8b 15 00 0d 00 00    	mov    0xd00,%edx
 2ff:	8d 72 01             	lea    0x1(%edx),%esi
 302:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 305:	89 35 00 0d 00 00    	mov    %esi,0xd00
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 30b:	6a 00                	push   $0x0
 30d:	68 c1 09 00 00       	push   $0x9c1
 312:	e8 2c 02 00 00       	call   543 <open>
  if (fd < 0) {
 317:	83 c4 10             	add    $0x10,%esp
 31a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 31d:	85 c0                	test   %eax,%eax
 31f:	0f 88 82 00 00 00    	js     3a7 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 325:	0f 84 8e 00 00 00    	je     3b9 <gets+0xc9>
 32b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 32d:	85 f6                	test   %esi,%esi
 32f:	0f 84 ee 00 00 00    	je     423 <gets+0x133>
 335:	8d 76 00             	lea    0x0(%esi),%esi
 338:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 33b:	31 f6                	xor    %esi,%esi
 33d:	eb 2a                	jmp    369 <gets+0x79>
 33f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	8d 45 e7             	lea    -0x19(%ebp),%eax
 346:	6a 01                	push   $0x1
 348:	50                   	push   %eax
 349:	57                   	push   %edi
 34a:	e8 cc 01 00 00       	call   51b <read>
        if(cc < 1)
 34f:	83 c4 10             	add    $0x10,%esp
 352:	85 c0                	test   %eax,%eax
 354:	7e 1d                	jle    373 <gets+0x83>
          break;
        buf[i++] = c;
 356:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 35a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 361:	3c 0a                	cmp    $0xa,%al
 363:	74 3b                	je     3a0 <gets+0xb0>
 365:	3c 0d                	cmp    $0xd,%al
 367:	74 37                	je     3a0 <gets+0xb0>
      for(i=0; i+1 < max; ){
 369:	89 f3                	mov    %esi,%ebx
 36b:	83 c6 01             	add    $0x1,%esi
 36e:	3b 75 0c             	cmp    0xc(%ebp),%esi
 371:	7c cd                	jl     340 <gets+0x50>
 373:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 376:	83 ea 01             	sub    $0x1,%edx
 379:	73 bd                	jae    338 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 37e:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 381:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 385:	57                   	push   %edi
 386:	e8 a0 01 00 00       	call   52b <close>
 38b:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 38e:	85 db                	test   %ebx,%ebx
 390:	74 76                	je     408 <gets+0x118>

  return buf;
}
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 65 f4             	lea    -0xc(%ebp),%esp
 398:	5b                   	pop    %ebx
 399:	5e                   	pop    %esi
 39a:	5f                   	pop    %edi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3a3:	89 f3                	mov    %esi,%ebx
 3a5:	eb cf                	jmp    376 <gets+0x86>
      printf(1, "nooo\n");
 3a7:	83 ec 08             	sub    $0x8,%esp
 3aa:	68 cb 09 00 00       	push   $0x9cb
 3af:	6a 01                	push   $0x1
 3b1:	e8 ca 02 00 00       	call   680 <printf>
 3b6:	83 c4 10             	add    $0x10,%esp
{
 3b9:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 3bb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3be:	89 df                	mov    %ebx,%edi
 3c0:	eb 2d                	jmp    3ef <gets+0xff>
 3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3c8:	83 ec 04             	sub    $0x4,%esp
 3cb:	6a 01                	push   $0x1
 3cd:	56                   	push   %esi
 3ce:	6a 00                	push   $0x0
 3d0:	e8 46 01 00 00       	call   51b <read>
      if(cc < 1)
 3d5:	83 c4 10             	add    $0x10,%esp
 3d8:	85 c0                	test   %eax,%eax
 3da:	7e 1d                	jle    3f9 <gets+0x109>
      buf[i++] = c;
 3dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3e0:	8b 55 08             	mov    0x8(%ebp),%edx
 3e3:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 3e7:	3c 0a                	cmp    $0xa,%al
 3e9:	74 10                	je     3fb <gets+0x10b>
 3eb:	3c 0d                	cmp    $0xd,%al
 3ed:	74 0c                	je     3fb <gets+0x10b>
    for(i=0; i+1 < max; ){
 3ef:	89 fb                	mov    %edi,%ebx
 3f1:	83 c7 01             	add    $0x1,%edi
 3f4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 3f7:	7c cf                	jl     3c8 <gets+0xd8>
 3f9:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	89 fb                	mov    %edi,%ebx
 400:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 404:	85 db                	test   %ebx,%ebx
 406:	75 8a                	jne    392 <gets+0xa2>
 408:	83 ec 0c             	sub    $0xc,%esp
 40b:	68 c1 09 00 00       	push   $0x9c1
 410:	e8 3e 01 00 00       	call   553 <unlink>
}
 415:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 418:	83 c4 10             	add    $0x10,%esp
}
 41b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5f                   	pop    %edi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret
  buf[i] = '\0';
 423:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 426:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 429:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 42c:	57                   	push   %edi
 42d:	e8 f9 00 00 00       	call   52b <close>
 432:	83 c4 10             	add    $0x10,%esp
 435:	eb d1                	jmp    408 <gets+0x118>
 437:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43e:	00 
 43f:	90                   	nop

00000440 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	56                   	push   %esi
 444:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 445:	83 ec 08             	sub    $0x8,%esp
 448:	6a 00                	push   $0x0
 44a:	ff 75 08             	push   0x8(%ebp)
 44d:	e8 f1 00 00 00       	call   543 <open>
  if(fd < 0)
 452:	83 c4 10             	add    $0x10,%esp
 455:	85 c0                	test   %eax,%eax
 457:	78 27                	js     480 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 459:	83 ec 08             	sub    $0x8,%esp
 45c:	ff 75 0c             	push   0xc(%ebp)
 45f:	89 c3                	mov    %eax,%ebx
 461:	50                   	push   %eax
 462:	e8 f4 00 00 00       	call   55b <fstat>
  close(fd);
 467:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 46a:	89 c6                	mov    %eax,%esi
  close(fd);
 46c:	e8 ba 00 00 00       	call   52b <close>
  return r;
 471:	83 c4 10             	add    $0x10,%esp
}
 474:	8d 65 f8             	lea    -0x8(%ebp),%esp
 477:	89 f0                	mov    %esi,%eax
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 480:	be ff ff ff ff       	mov    $0xffffffff,%esi
 485:	eb ed                	jmp    474 <stat+0x34>
 487:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 48e:	00 
 48f:	90                   	nop

00000490 <atoi>:

int
atoi(const char *s)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 497:	0f be 02             	movsbl (%edx),%eax
 49a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 49d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4a5:	77 1e                	ja     4c5 <atoi+0x35>
 4a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ae:	00 
 4af:	90                   	nop
    n = n*10 + *s++ - '0';
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ba:	0f be 02             	movsbl (%edx),%eax
 4bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
  return n;
}
 4c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c8:	89 c8                	mov    %ecx,%eax
 4ca:	c9                   	leave
 4cb:	c3                   	ret
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	8b 45 10             	mov    0x10(%ebp),%eax
 4d7:	8b 55 08             	mov    0x8(%ebp),%edx
 4da:	56                   	push   %esi
 4db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4de:	85 c0                	test   %eax,%eax
 4e0:	7e 13                	jle    4f5 <memmove+0x25>
 4e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4e4:	89 d7                	mov    %edx,%edi
 4e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ed:	00 
 4ee:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4f1:	39 f8                	cmp    %edi,%eax
 4f3:	75 fb                	jne    4f0 <memmove+0x20>
  return vdst;
}
 4f5:	5e                   	pop    %esi
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret

000004fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fb:	b8 01 00 00 00       	mov    $0x1,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <exit>:
SYSCALL(exit)
 503:	b8 02 00 00 00       	mov    $0x2,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <wait>:
SYSCALL(wait)
 50b:	b8 03 00 00 00       	mov    $0x3,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret

00000513 <pipe>:
SYSCALL(pipe)
 513:	b8 04 00 00 00       	mov    $0x4,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret

0000051b <read>:
SYSCALL(read)
 51b:	b8 05 00 00 00       	mov    $0x5,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret

00000523 <write>:
SYSCALL(write)
 523:	b8 10 00 00 00       	mov    $0x10,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret

0000052b <close>:
SYSCALL(close)
 52b:	b8 15 00 00 00       	mov    $0x15,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret

00000533 <kill>:
SYSCALL(kill)
 533:	b8 06 00 00 00       	mov    $0x6,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret

0000053b <exec>:
SYSCALL(exec)
 53b:	b8 07 00 00 00       	mov    $0x7,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret

00000543 <open>:
SYSCALL(open)
 543:	b8 0f 00 00 00       	mov    $0xf,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret

0000054b <mknod>:
SYSCALL(mknod)
 54b:	b8 11 00 00 00       	mov    $0x11,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret

00000553 <unlink>:
SYSCALL(unlink)
 553:	b8 12 00 00 00       	mov    $0x12,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret

0000055b <fstat>:
SYSCALL(fstat)
 55b:	b8 08 00 00 00       	mov    $0x8,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret

00000563 <link>:
SYSCALL(link)
 563:	b8 13 00 00 00       	mov    $0x13,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret

0000056b <mkdir>:
SYSCALL(mkdir)
 56b:	b8 14 00 00 00       	mov    $0x14,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret

00000573 <chdir>:
SYSCALL(chdir)
 573:	b8 09 00 00 00       	mov    $0x9,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret

0000057b <dup>:
SYSCALL(dup)
 57b:	b8 0a 00 00 00       	mov    $0xa,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret

00000583 <getpid>:
SYSCALL(getpid)
 583:	b8 0b 00 00 00       	mov    $0xb,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret

0000058b <sbrk>:
SYSCALL(sbrk)
 58b:	b8 0c 00 00 00       	mov    $0xc,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret

00000593 <sleep>:
SYSCALL(sleep)
 593:	b8 0d 00 00 00       	mov    $0xd,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret

0000059b <uptime>:
SYSCALL(uptime)
 59b:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret

000005a3 <is_proc_valid>:
SYSCALL(is_proc_valid)
 5a3:	b8 16 00 00 00       	mov    $0x16,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret

000005ab <get_proc_state>:
SYSCALL(get_proc_state)
 5ab:	b8 17 00 00 00       	mov    $0x17,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret

000005b3 <fill_proc_name>:
SYSCALL(fill_proc_name)
 5b3:	b8 18 00 00 00       	mov    $0x18,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret

000005bb <get_proc_name>:
SYSCALL(get_proc_name)
 5bb:	b8 19 00 00 00       	mov    $0x19,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret

000005c3 <get_num_syscall>:
SYSCALL(get_num_syscall)
 5c3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret

000005cb <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 5cb:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret
 5d3:	66 90                	xchg   %ax,%ax
 5d5:	66 90                	xchg   %ax,%ax
 5d7:	66 90                	xchg   %ax,%ax
 5d9:	66 90                	xchg   %ax,%ax
 5db:	66 90                	xchg   %ax,%ax
 5dd:	66 90                	xchg   %ax,%ax
 5df:	90                   	nop

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5e8:	89 d1                	mov    %edx,%ecx
{
 5ea:	83 ec 3c             	sub    $0x3c,%esp
 5ed:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 5f0:	85 d2                	test   %edx,%edx
 5f2:	0f 89 80 00 00 00    	jns    678 <printint+0x98>
 5f8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5fc:	74 7a                	je     678 <printint+0x98>
    x = -xx;
 5fe:	f7 d9                	neg    %ecx
    neg = 1;
 600:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 605:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 608:	31 f6                	xor    %esi,%esi
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 610:	89 c8                	mov    %ecx,%eax
 612:	31 d2                	xor    %edx,%edx
 614:	89 f7                	mov    %esi,%edi
 616:	f7 f3                	div    %ebx
 618:	8d 76 01             	lea    0x1(%esi),%esi
 61b:	0f b6 92 30 0a 00 00 	movzbl 0xa30(%edx),%edx
 622:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 626:	89 ca                	mov    %ecx,%edx
 628:	89 c1                	mov    %eax,%ecx
 62a:	39 da                	cmp    %ebx,%edx
 62c:	73 e2                	jae    610 <printint+0x30>
  if(neg)
 62e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 631:	85 c0                	test   %eax,%eax
 633:	74 07                	je     63c <printint+0x5c>
    buf[i++] = '-';
 635:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 63a:	89 f7                	mov    %esi,%edi
 63c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 63f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 642:	01 df                	add    %ebx,%edi
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 648:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 64b:	83 ec 04             	sub    $0x4,%esp
 64e:	88 45 d7             	mov    %al,-0x29(%ebp)
 651:	8d 45 d7             	lea    -0x29(%ebp),%eax
 654:	6a 01                	push   $0x1
 656:	50                   	push   %eax
 657:	56                   	push   %esi
 658:	e8 c6 fe ff ff       	call   523 <write>
  while(--i >= 0)
 65d:	89 f8                	mov    %edi,%eax
 65f:	83 c4 10             	add    $0x10,%esp
 662:	83 ef 01             	sub    $0x1,%edi
 665:	39 c3                	cmp    %eax,%ebx
 667:	75 df                	jne    648 <printint+0x68>
}
 669:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 678:	31 c0                	xor    %eax,%eax
 67a:	eb 89                	jmp    605 <printint+0x25>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 689:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 68c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 68f:	0f b6 1e             	movzbl (%esi),%ebx
 692:	83 c6 01             	add    $0x1,%esi
 695:	84 db                	test   %bl,%bl
 697:	74 67                	je     700 <printf+0x80>
 699:	8d 4d 10             	lea    0x10(%ebp),%ecx
 69c:	31 d2                	xor    %edx,%edx
 69e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 6a1:	eb 34                	jmp    6d7 <printf+0x57>
 6a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 6a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6ab:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6b0:	83 f8 25             	cmp    $0x25,%eax
 6b3:	74 18                	je     6cd <printf+0x4d>
  write(fd, &c, 1);
 6b5:	83 ec 04             	sub    $0x4,%esp
 6b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6bb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6be:	6a 01                	push   $0x1
 6c0:	50                   	push   %eax
 6c1:	57                   	push   %edi
 6c2:	e8 5c fe ff ff       	call   523 <write>
 6c7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6ca:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6cd:	0f b6 1e             	movzbl (%esi),%ebx
 6d0:	83 c6 01             	add    $0x1,%esi
 6d3:	84 db                	test   %bl,%bl
 6d5:	74 29                	je     700 <printf+0x80>
    c = fmt[i] & 0xff;
 6d7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6da:	85 d2                	test   %edx,%edx
 6dc:	74 ca                	je     6a8 <printf+0x28>
      }
    } else if(state == '%'){
 6de:	83 fa 25             	cmp    $0x25,%edx
 6e1:	75 ea                	jne    6cd <printf+0x4d>
      if(c == 'd'){
 6e3:	83 f8 25             	cmp    $0x25,%eax
 6e6:	0f 84 04 01 00 00    	je     7f0 <printf+0x170>
 6ec:	83 e8 63             	sub    $0x63,%eax
 6ef:	83 f8 15             	cmp    $0x15,%eax
 6f2:	77 1c                	ja     710 <printf+0x90>
 6f4:	ff 24 85 d8 09 00 00 	jmp    *0x9d8(,%eax,4)
 6fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 700:	8d 65 f4             	lea    -0xc(%ebp),%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret
 708:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 70f:	00 
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	8d 55 e7             	lea    -0x19(%ebp),%edx
 716:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 71a:	6a 01                	push   $0x1
 71c:	52                   	push   %edx
 71d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 720:	57                   	push   %edi
 721:	e8 fd fd ff ff       	call   523 <write>
 726:	83 c4 0c             	add    $0xc,%esp
 729:	88 5d e7             	mov    %bl,-0x19(%ebp)
 72c:	6a 01                	push   $0x1
 72e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 731:	52                   	push   %edx
 732:	57                   	push   %edi
 733:	e8 eb fd ff ff       	call   523 <write>
        putc(fd, c);
 738:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73b:	31 d2                	xor    %edx,%edx
 73d:	eb 8e                	jmp    6cd <printf+0x4d>
 73f:	90                   	nop
        printint(fd, *ap, 16, 0);
 740:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	b9 10 00 00 00       	mov    $0x10,%ecx
 74b:	8b 13                	mov    (%ebx),%edx
 74d:	6a 00                	push   $0x0
 74f:	89 f8                	mov    %edi,%eax
        ap++;
 751:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 754:	e8 87 fe ff ff       	call   5e0 <printint>
        ap++;
 759:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 75c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75f:	31 d2                	xor    %edx,%edx
 761:	e9 67 ff ff ff       	jmp    6cd <printf+0x4d>
        s = (char*)*ap;
 766:	8b 45 d0             	mov    -0x30(%ebp),%eax
 769:	8b 18                	mov    (%eax),%ebx
        ap++;
 76b:	83 c0 04             	add    $0x4,%eax
 76e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 771:	85 db                	test   %ebx,%ebx
 773:	0f 84 87 00 00 00    	je     800 <printf+0x180>
        while(*s != 0){
 779:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 77c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 77e:	84 c0                	test   %al,%al
 780:	0f 84 47 ff ff ff    	je     6cd <printf+0x4d>
 786:	8d 55 e7             	lea    -0x19(%ebp),%edx
 789:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 78c:	89 de                	mov    %ebx,%esi
 78e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
 793:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 796:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	53                   	push   %ebx
 79c:	57                   	push   %edi
 79d:	e8 81 fd ff ff       	call   523 <write>
        while(*s != 0){
 7a2:	0f b6 06             	movzbl (%esi),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x110>
      state = 0;
 7ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 7af:	31 d2                	xor    %edx,%edx
 7b1:	e9 17 ff ff ff       	jmp    6cd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 7b6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7b9:	83 ec 0c             	sub    $0xc,%esp
 7bc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c1:	8b 13                	mov    (%ebx),%edx
 7c3:	6a 01                	push   $0x1
 7c5:	eb 88                	jmp    74f <printf+0xcf>
        putc(fd, *ap);
 7c7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7ca:	83 ec 04             	sub    $0x4,%esp
 7cd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 7d0:	8b 03                	mov    (%ebx),%eax
        ap++;
 7d2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 7d5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
 7da:	52                   	push   %edx
 7db:	57                   	push   %edi
 7dc:	e8 42 fd ff ff       	call   523 <write>
        ap++;
 7e1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e7:	31 d2                	xor    %edx,%edx
 7e9:	e9 df fe ff ff       	jmp    6cd <printf+0x4d>
 7ee:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
 7f3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7f6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 7f9:	6a 01                	push   $0x1
 7fb:	e9 31 ff ff ff       	jmp    731 <printf+0xb1>
 800:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 805:	bb d1 09 00 00       	mov    $0x9d1,%ebx
 80a:	e9 77 ff ff ff       	jmp    786 <printf+0x106>
 80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 04 0d 00 00       	mov    0xd04,%eax
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 81e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 828:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82a:	39 c8                	cmp    %ecx,%eax
 82c:	73 32                	jae    860 <free+0x50>
 82e:	39 d1                	cmp    %edx,%ecx
 830:	72 04                	jb     836 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 832:	39 d0                	cmp    %edx,%eax
 834:	72 32                	jb     868 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 836:	8b 73 fc             	mov    -0x4(%ebx),%esi
 839:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83c:	39 fa                	cmp    %edi,%edx
 83e:	74 30                	je     870 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 840:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 849:	39 f1                	cmp    %esi,%ecx
 84b:	74 3a                	je     887 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 84d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 84f:	5b                   	pop    %ebx
  freep = p;
 850:	a3 04 0d 00 00       	mov    %eax,0xd04
}
 855:	5e                   	pop    %esi
 856:	5f                   	pop    %edi
 857:	5d                   	pop    %ebp
 858:	c3                   	ret
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 d0                	cmp    %edx,%eax
 862:	72 04                	jb     868 <free+0x58>
 864:	39 d1                	cmp    %edx,%ecx
 866:	72 ce                	jb     836 <free+0x26>
{
 868:	89 d0                	mov    %edx,%eax
 86a:	eb bc                	jmp    828 <free+0x18>
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 870:	03 72 04             	add    0x4(%edx),%esi
 873:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 876:	8b 10                	mov    (%eax),%edx
 878:	8b 12                	mov    (%edx),%edx
 87a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87d:	8b 50 04             	mov    0x4(%eax),%edx
 880:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 883:	39 f1                	cmp    %esi,%ecx
 885:	75 c6                	jne    84d <free+0x3d>
    p->s.size += bp->s.size;
 887:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 88a:	a3 04 0d 00 00       	mov    %eax,0xd04
    p->s.size += bp->s.size;
 88f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 892:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 895:	89 08                	mov    %ecx,(%eax)
}
 897:	5b                   	pop    %ebx
 898:	5e                   	pop    %esi
 899:	5f                   	pop    %edi
 89a:	5d                   	pop    %ebp
 89b:	c3                   	ret
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 15 04 0d 00 00    	mov    0xd04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 78 07             	lea    0x7(%eax),%edi
 8b5:	c1 ef 03             	shr    $0x3,%edi
 8b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8bb:	85 d2                	test   %edx,%edx
 8bd:	0f 84 8d 00 00 00    	je     950 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
 8c8:	39 f9                	cmp    %edi,%ecx
 8ca:	73 64                	jae    930 <malloc+0x90>
  if(nu < 4096)
 8cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8d1:	39 df                	cmp    %ebx,%edi
 8d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 8d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8dd:	eb 0a                	jmp    8e9 <malloc+0x49>
 8df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8e2:	8b 48 04             	mov    0x4(%eax),%ecx
 8e5:	39 f9                	cmp    %edi,%ecx
 8e7:	73 47                	jae    930 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8e9:	89 c2                	mov    %eax,%edx
 8eb:	3b 05 04 0d 00 00    	cmp    0xd04,%eax
 8f1:	75 ed                	jne    8e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 8f3:	83 ec 0c             	sub    $0xc,%esp
 8f6:	56                   	push   %esi
 8f7:	e8 8f fc ff ff       	call   58b <sbrk>
  if(p == (char*)-1)
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 902:	74 1c                	je     920 <malloc+0x80>
  hp->s.size = nu;
 904:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 907:	83 ec 0c             	sub    $0xc,%esp
 90a:	83 c0 08             	add    $0x8,%eax
 90d:	50                   	push   %eax
 90e:	e8 fd fe ff ff       	call   810 <free>
  return freep;
 913:	8b 15 04 0d 00 00    	mov    0xd04,%edx
      if((p = morecore(nunits)) == 0)
 919:	83 c4 10             	add    $0x10,%esp
 91c:	85 d2                	test   %edx,%edx
 91e:	75 c0                	jne    8e0 <malloc+0x40>
        return 0;
  }
}
 920:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 923:	31 c0                	xor    %eax,%eax
}
 925:	5b                   	pop    %ebx
 926:	5e                   	pop    %esi
 927:	5f                   	pop    %edi
 928:	5d                   	pop    %ebp
 929:	c3                   	ret
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 930:	39 cf                	cmp    %ecx,%edi
 932:	74 4c                	je     980 <malloc+0xe0>
        p->s.size -= nunits;
 934:	29 f9                	sub    %edi,%ecx
 936:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 939:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 93c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 93f:	89 15 04 0d 00 00    	mov    %edx,0xd04
}
 945:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 948:	83 c0 08             	add    $0x8,%eax
}
 94b:	5b                   	pop    %ebx
 94c:	5e                   	pop    %esi
 94d:	5f                   	pop    %edi
 94e:	5d                   	pop    %ebp
 94f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 950:	c7 05 04 0d 00 00 08 	movl   $0xd08,0xd04
 957:	0d 00 00 
    base.s.size = 0;
 95a:	b8 08 0d 00 00       	mov    $0xd08,%eax
    base.s.ptr = freep = prevp = &base;
 95f:	c7 05 08 0d 00 00 08 	movl   $0xd08,0xd08
 966:	0d 00 00 
    base.s.size = 0;
 969:	c7 05 0c 0d 00 00 00 	movl   $0x0,0xd0c
 970:	00 00 00 
    if(p->s.size >= nunits){
 973:	e9 54 ff ff ff       	jmp    8cc <malloc+0x2c>
 978:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 97f:	00 
        prevp->s.ptr = p->s.ptr;
 980:	8b 08                	mov    (%eax),%ecx
 982:	89 0a                	mov    %ecx,(%edx)
 984:	eb b9                	jmp    93f <malloc+0x9f>
