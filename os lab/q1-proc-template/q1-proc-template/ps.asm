
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp

    int e_flag = 0;
    if (argc > 1 && strcmp(argv[1], "-e") == 0) {
  14:	83 39 01             	cmpl   $0x1,(%ecx)
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
    if (argc > 1 && strcmp(argv[1], "-e") == 0) {
  1a:	7e 16                	jle    32 <main+0x32>
  1c:	52                   	push   %edx
  1d:	52                   	push   %edx
  1e:	68 d8 08 00 00       	push   $0x8d8
  23:	ff 70 04             	push   0x4(%eax)
  26:	e8 25 01 00 00       	call   150 <strcmp>
  2b:	83 c4 10             	add    $0x10,%esp
  2e:	85 c0                	test   %eax,%eax
  30:	74 75                	je     a7 <main+0xa7>
        e_flag = 1;
    }   
    if (!e_flag)
    {
        printf(1, "PID\tNAME\tSTATE\tSYS\tINT\n");
  32:	83 ec 08             	sub    $0x8,%esp

    int pid = getpid(); 
    char name[16];
    char state[16];
    if(get_proc_state(pid, state, sizeof(state)) > 0){
  35:	8d 75 d8             	lea    -0x28(%ebp),%esi
        printf(1, "PID\tNAME\tSTATE\tSYS\tINT\n");
  38:	68 ee 08 00 00       	push   $0x8ee
  3d:	6a 01                	push   $0x1
  3f:	e8 8c 05 00 00       	call   5d0 <printf>
    int pid = getpid(); 
  44:	e8 8a 04 00 00       	call   4d3 <getpid>
    if(get_proc_state(pid, state, sizeof(state)) > 0){
  49:	83 c4 0c             	add    $0xc,%esp
  4c:	6a 10                	push   $0x10
    int pid = getpid(); 
  4e:	89 c3                	mov    %eax,%ebx
    if(get_proc_state(pid, state, sizeof(state)) > 0){
  50:	56                   	push   %esi
  51:	50                   	push   %eax
  52:	e8 a4 04 00 00       	call   4fb <get_proc_state>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	85 c0                	test   %eax,%eax
  5c:	7f 05                	jg     63 <main+0x63>
                
            }
        }
        }
    }
    exit();
  5e:	e8 f0 03 00 00       	call   453 <exit>
        if (get_proc_name(pid, name, sizeof(name)) > 0){
  63:	57                   	push   %edi
  64:	8d 7d c8             	lea    -0x38(%ebp),%edi
  67:	6a 10                	push   $0x10
  69:	57                   	push   %edi
  6a:	53                   	push   %ebx
  6b:	e8 9b 04 00 00       	call   50b <get_proc_name>
  70:	83 c4 10             	add    $0x10,%esp
  73:	85 c0                	test   %eax,%eax
  75:	7e e7                	jle    5e <main+0x5e>
            scnt = get_num_syscall(pid);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	53                   	push   %ebx
  7b:	e8 93 04 00 00       	call   513 <get_num_syscall>
            icnt = get_num_timer_interrupts(pid);
  80:	89 1c 24             	mov    %ebx,(%esp)
            scnt = get_num_syscall(pid);
  83:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            icnt = get_num_timer_interrupts(pid);
  86:	e8 90 04 00 00       	call   51b <get_num_timer_interrupts>
            printf(1, "%d\t%s\t%s\t%d\t%d\n", pid, name, state, scnt, icnt);
  8b:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  8e:	83 c4 0c             	add    $0xc,%esp
  91:	50                   	push   %eax
  92:	52                   	push   %edx
  93:	56                   	push   %esi
  94:	57                   	push   %edi
  95:	53                   	push   %ebx
  96:	68 06 09 00 00       	push   $0x906
  9b:	6a 01                	push   $0x1
  9d:	e8 2e 05 00 00       	call   5d0 <printf>
  a2:	83 c4 20             	add    $0x20,%esp
  a5:	eb b7                	jmp    5e <main+0x5e>
        printf(1, "PID\tSTATE\tSYS\tINT\n");
  a7:	50                   	push   %eax
        for(int pid=1; pid<=64; pid++){
  a8:	bb 01 00 00 00       	mov    $0x1,%ebx
            if(get_proc_state(pid, state, sizeof(state)) > 0){
  ad:	8d 75 d8             	lea    -0x28(%ebp),%esi
        printf(1, "PID\tSTATE\tSYS\tINT\n");
  b0:	50                   	push   %eax
  b1:	68 db 08 00 00       	push   $0x8db
  b6:	6a 01                	push   $0x1
  b8:	e8 13 05 00 00       	call   5d0 <printf>
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	eb 0e                	jmp    d0 <main+0xd0>
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        for(int pid=1; pid<=64; pid++){
  c8:	83 c3 01             	add    $0x1,%ebx
  cb:	83 fb 41             	cmp    $0x41,%ebx
  ce:	74 8e                	je     5e <main+0x5e>
        if(is_proc_valid(pid)==1){
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	53                   	push   %ebx
  d4:	e8 1a 04 00 00       	call   4f3 <is_proc_valid>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	83 f8 01             	cmp    $0x1,%eax
  df:	75 e7                	jne    c8 <main+0xc8>
            if(get_proc_state(pid, state, sizeof(state)) > 0){
  e1:	83 ec 04             	sub    $0x4,%esp
  e4:	6a 10                	push   $0x10
  e6:	56                   	push   %esi
  e7:	53                   	push   %ebx
  e8:	e8 0e 04 00 00       	call   4fb <get_proc_state>
  ed:	83 c4 10             	add    $0x10,%esp
  f0:	85 c0                	test   %eax,%eax
  f2:	7e d4                	jle    c8 <main+0xc8>
                    scnt = get_num_syscall(pid);
  f4:	83 ec 0c             	sub    $0xc,%esp
  f7:	53                   	push   %ebx
  f8:	e8 16 04 00 00       	call   513 <get_num_syscall>
                    icnt = get_num_timer_interrupts(pid);
  fd:	89 1c 24             	mov    %ebx,(%esp)
                    scnt = get_num_syscall(pid);
 100:	89 c7                	mov    %eax,%edi
                    icnt = get_num_timer_interrupts(pid);
 102:	e8 14 04 00 00       	call   51b <get_num_timer_interrupts>
                    printf(1, "%d\t%s\t%d\t%d\n", pid, state, scnt, icnt);
 107:	5a                   	pop    %edx
 108:	59                   	pop    %ecx
 109:	50                   	push   %eax
 10a:	57                   	push   %edi
 10b:	56                   	push   %esi
 10c:	53                   	push   %ebx
 10d:	68 16 09 00 00       	push   $0x916
 112:	6a 01                	push   $0x1
 114:	e8 b7 04 00 00       	call   5d0 <printf>
 119:	83 c4 20             	add    $0x20,%esp
 11c:	eb aa                	jmp    c8 <main+0xc8>
 11e:	66 90                	xchg   %ax,%ax

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
 249:	8b 15 4c 0c 00 00    	mov    0xc4c,%edx
 24f:	8d 72 01             	lea    0x1(%edx),%esi
 252:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 255:	89 35 4c 0c 00 00    	mov    %esi,0xc4c
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 25b:	6a 00                	push   $0x0
 25d:	68 23 09 00 00       	push   $0x923
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
 2fa:	68 2d 09 00 00       	push   $0x92d
 2ff:	6a 01                	push   $0x1
 301:	e8 ca 02 00 00       	call   5d0 <printf>
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
 35b:	68 23 09 00 00       	push   $0x923
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
 523:	66 90                	xchg   %ax,%ax
 525:	66 90                	xchg   %ax,%ax
 527:	66 90                	xchg   %ax,%ax
 529:	66 90                	xchg   %ax,%ax
 52b:	66 90                	xchg   %ax,%ax
 52d:	66 90                	xchg   %ax,%ax
 52f:	90                   	nop

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 538:	89 d1                	mov    %edx,%ecx
{
 53a:	83 ec 3c             	sub    $0x3c,%esp
 53d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 540:	85 d2                	test   %edx,%edx
 542:	0f 89 80 00 00 00    	jns    5c8 <printint+0x98>
 548:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 54c:	74 7a                	je     5c8 <printint+0x98>
    x = -xx;
 54e:	f7 d9                	neg    %ecx
    neg = 1;
 550:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 555:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 558:	31 f6                	xor    %esi,%esi
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 560:	89 c8                	mov    %ecx,%eax
 562:	31 d2                	xor    %edx,%edx
 564:	89 f7                	mov    %esi,%edi
 566:	f7 f3                	div    %ebx
 568:	8d 76 01             	lea    0x1(%esi),%esi
 56b:	0f b6 92 94 09 00 00 	movzbl 0x994(%edx),%edx
 572:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 576:	89 ca                	mov    %ecx,%edx
 578:	89 c1                	mov    %eax,%ecx
 57a:	39 da                	cmp    %ebx,%edx
 57c:	73 e2                	jae    560 <printint+0x30>
  if(neg)
 57e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 581:	85 c0                	test   %eax,%eax
 583:	74 07                	je     58c <printint+0x5c>
    buf[i++] = '-';
 585:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 58a:	89 f7                	mov    %esi,%edi
 58c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 58f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 592:	01 df                	add    %ebx,%edi
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 598:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	88 45 d7             	mov    %al,-0x29(%ebp)
 5a1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5a4:	6a 01                	push   $0x1
 5a6:	50                   	push   %eax
 5a7:	56                   	push   %esi
 5a8:	e8 c6 fe ff ff       	call   473 <write>
  while(--i >= 0)
 5ad:	89 f8                	mov    %edi,%eax
 5af:	83 c4 10             	add    $0x10,%esp
 5b2:	83 ef 01             	sub    $0x1,%edi
 5b5:	39 c3                	cmp    %eax,%ebx
 5b7:	75 df                	jne    598 <printint+0x68>
}
 5b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bc:	5b                   	pop    %ebx
 5bd:	5e                   	pop    %esi
 5be:	5f                   	pop    %edi
 5bf:	5d                   	pop    %ebp
 5c0:	c3                   	ret
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5c8:	31 c0                	xor    %eax,%eax
 5ca:	eb 89                	jmp    555 <printint+0x25>
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5dc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 1e             	movzbl (%esi),%ebx
 5e2:	83 c6 01             	add    $0x1,%esi
 5e5:	84 db                	test   %bl,%bl
 5e7:	74 67                	je     650 <printf+0x80>
 5e9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5ec:	31 d2                	xor    %edx,%edx
 5ee:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5f1:	eb 34                	jmp    627 <printf+0x57>
 5f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5f8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5fb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 600:	83 f8 25             	cmp    $0x25,%eax
 603:	74 18                	je     61d <printf+0x4d>
  write(fd, &c, 1);
 605:	83 ec 04             	sub    $0x4,%esp
 608:	8d 45 e7             	lea    -0x19(%ebp),%eax
 60b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 60e:	6a 01                	push   $0x1
 610:	50                   	push   %eax
 611:	57                   	push   %edi
 612:	e8 5c fe ff ff       	call   473 <write>
 617:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 61a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 61d:	0f b6 1e             	movzbl (%esi),%ebx
 620:	83 c6 01             	add    $0x1,%esi
 623:	84 db                	test   %bl,%bl
 625:	74 29                	je     650 <printf+0x80>
    c = fmt[i] & 0xff;
 627:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 62a:	85 d2                	test   %edx,%edx
 62c:	74 ca                	je     5f8 <printf+0x28>
      }
    } else if(state == '%'){
 62e:	83 fa 25             	cmp    $0x25,%edx
 631:	75 ea                	jne    61d <printf+0x4d>
      if(c == 'd'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	0f 84 04 01 00 00    	je     740 <printf+0x170>
 63c:	83 e8 63             	sub    $0x63,%eax
 63f:	83 f8 15             	cmp    $0x15,%eax
 642:	77 1c                	ja     660 <printf+0x90>
 644:	ff 24 85 3c 09 00 00 	jmp    *0x93c(,%eax,4)
 64b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 650:	8d 65 f4             	lea    -0xc(%ebp),%esp
 653:	5b                   	pop    %ebx
 654:	5e                   	pop    %esi
 655:	5f                   	pop    %edi
 656:	5d                   	pop    %ebp
 657:	c3                   	ret
 658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 65f:	00 
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	8d 55 e7             	lea    -0x19(%ebp),%edx
 666:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 66a:	6a 01                	push   $0x1
 66c:	52                   	push   %edx
 66d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 670:	57                   	push   %edi
 671:	e8 fd fd ff ff       	call   473 <write>
 676:	83 c4 0c             	add    $0xc,%esp
 679:	88 5d e7             	mov    %bl,-0x19(%ebp)
 67c:	6a 01                	push   $0x1
 67e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 681:	52                   	push   %edx
 682:	57                   	push   %edi
 683:	e8 eb fd ff ff       	call   473 <write>
        putc(fd, c);
 688:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68b:	31 d2                	xor    %edx,%edx
 68d:	eb 8e                	jmp    61d <printf+0x4d>
 68f:	90                   	nop
        printint(fd, *ap, 16, 0);
 690:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	b9 10 00 00 00       	mov    $0x10,%ecx
 69b:	8b 13                	mov    (%ebx),%edx
 69d:	6a 00                	push   $0x0
 69f:	89 f8                	mov    %edi,%eax
        ap++;
 6a1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 6a4:	e8 87 fe ff ff       	call   530 <printint>
        ap++;
 6a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 67 ff ff ff       	jmp    61d <printf+0x4d>
        s = (char*)*ap;
 6b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6b9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6bb:	83 c0 04             	add    $0x4,%eax
 6be:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6c1:	85 db                	test   %ebx,%ebx
 6c3:	0f 84 87 00 00 00    	je     750 <printf+0x180>
        while(*s != 0){
 6c9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6cc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6ce:	84 c0                	test   %al,%al
 6d0:	0f 84 47 ff ff ff    	je     61d <printf+0x4d>
 6d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6d9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6dc:	89 de                	mov    %ebx,%esi
 6de:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6e9:	6a 01                	push   $0x1
 6eb:	53                   	push   %ebx
 6ec:	57                   	push   %edi
 6ed:	e8 81 fd ff ff       	call   473 <write>
        while(*s != 0){
 6f2:	0f b6 06             	movzbl (%esi),%eax
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	84 c0                	test   %al,%al
 6fa:	75 e4                	jne    6e0 <printf+0x110>
      state = 0;
 6fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6ff:	31 d2                	xor    %edx,%edx
 701:	e9 17 ff ff ff       	jmp    61d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 706:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 709:	83 ec 0c             	sub    $0xc,%esp
 70c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 711:	8b 13                	mov    (%ebx),%edx
 713:	6a 01                	push   $0x1
 715:	eb 88                	jmp    69f <printf+0xcf>
        putc(fd, *ap);
 717:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 71a:	83 ec 04             	sub    $0x4,%esp
 71d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 720:	8b 03                	mov    (%ebx),%eax
        ap++;
 722:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 725:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
 72a:	52                   	push   %edx
 72b:	57                   	push   %edi
 72c:	e8 42 fd ff ff       	call   473 <write>
        ap++;
 731:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 734:	83 c4 10             	add    $0x10,%esp
      state = 0;
 737:	31 d2                	xor    %edx,%edx
 739:	e9 df fe ff ff       	jmp    61d <printf+0x4d>
 73e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 5d e7             	mov    %bl,-0x19(%ebp)
 746:	8d 55 e7             	lea    -0x19(%ebp),%edx
 749:	6a 01                	push   $0x1
 74b:	e9 31 ff ff ff       	jmp    681 <printf+0xb1>
 750:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 755:	bb 33 09 00 00       	mov    $0x933,%ebx
 75a:	e9 77 ff ff ff       	jmp    6d6 <printf+0x106>
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 50 0c 00 00       	mov    0xc50,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	39 c8                	cmp    %ecx,%eax
 77c:	73 32                	jae    7b0 <free+0x50>
 77e:	39 d1                	cmp    %edx,%ecx
 780:	72 04                	jb     786 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 782:	39 d0                	cmp    %edx,%eax
 784:	72 32                	jb     7b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 786:	8b 73 fc             	mov    -0x4(%ebx),%esi
 789:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78c:	39 fa                	cmp    %edi,%edx
 78e:	74 30                	je     7c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 799:	39 f1                	cmp    %esi,%ecx
 79b:	74 3a                	je     7d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 79f:	5b                   	pop    %ebx
  freep = p;
 7a0:	a3 50 0c 00 00       	mov    %eax,0xc50
}
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 04                	jb     7b8 <free+0x58>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	72 ce                	jb     786 <free+0x26>
{
 7b8:	89 d0                	mov    %edx,%eax
 7ba:	eb bc                	jmp    778 <free+0x18>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 c6                	jne    79d <free+0x3d>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7da:	a3 50 0c 00 00       	mov    %eax,0xc50
    p->s.size += bp->s.size;
 7df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e5:	89 08                	mov    %ecx,(%eax)
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 50 0c 00 00    	mov    0xc50,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 8d 00 00 00    	je     8a0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 815:	8b 48 04             	mov    0x4(%eax),%ecx
 818:	39 f9                	cmp    %edi,%ecx
 81a:	73 64                	jae    880 <malloc+0x90>
  if(nu < 4096)
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 df                	cmp    %ebx,%edi
 823:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 82d:	eb 0a                	jmp    839 <malloc+0x49>
 82f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 832:	8b 48 04             	mov    0x4(%eax),%ecx
 835:	39 f9                	cmp    %edi,%ecx
 837:	73 47                	jae    880 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 839:	89 c2                	mov    %eax,%edx
 83b:	3b 05 50 0c 00 00    	cmp    0xc50,%eax
 841:	75 ed                	jne    830 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	56                   	push   %esi
 847:	e8 8f fc ff ff       	call   4db <sbrk>
  if(p == (char*)-1)
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	83 f8 ff             	cmp    $0xffffffff,%eax
 852:	74 1c                	je     870 <malloc+0x80>
  hp->s.size = nu;
 854:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	83 c0 08             	add    $0x8,%eax
 85d:	50                   	push   %eax
 85e:	e8 fd fe ff ff       	call   760 <free>
  return freep;
 863:	8b 15 50 0c 00 00    	mov    0xc50,%edx
      if((p = morecore(nunits)) == 0)
 869:	83 c4 10             	add    $0x10,%esp
 86c:	85 d2                	test   %edx,%edx
 86e:	75 c0                	jne    830 <malloc+0x40>
        return 0;
  }
}
 870:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 873:	31 c0                	xor    %eax,%eax
}
 875:	5b                   	pop    %ebx
 876:	5e                   	pop    %esi
 877:	5f                   	pop    %edi
 878:	5d                   	pop    %ebp
 879:	c3                   	ret
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 880:	39 cf                	cmp    %ecx,%edi
 882:	74 4c                	je     8d0 <malloc+0xe0>
        p->s.size -= nunits;
 884:	29 f9                	sub    %edi,%ecx
 886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 88c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 88f:	89 15 50 0c 00 00    	mov    %edx,0xc50
}
 895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 898:	83 c0 08             	add    $0x8,%eax
}
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 50 0c 00 00 54 	movl   $0xc54,0xc50
 8a7:	0c 00 00 
    base.s.size = 0;
 8aa:	b8 54 0c 00 00       	mov    $0xc54,%eax
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 54 0c 00 00 54 	movl   $0xc54,0xc54
 8b6:	0c 00 00 
    base.s.size = 0;
 8b9:	c7 05 58 0c 00 00 00 	movl   $0x0,0xc58
 8c0:	00 00 00 
    if(p->s.size >= nunits){
 8c3:	e9 54 ff ff ff       	jmp    81c <malloc+0x2c>
 8c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8cf:	00 
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b9                	jmp    88f <malloc+0x9f>
