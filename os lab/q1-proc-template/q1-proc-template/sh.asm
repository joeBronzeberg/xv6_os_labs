
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 87 00 00 00    	jg     a8 <main+0xa8>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 f6 13 00 00       	push   $0x13f6
      2b:	e8 e3 0e 00 00       	call   f13 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d a2 1a 00 00 20 	cmpb   $0x20,0x1aa2
      47:	0f 84 7e 00 00 00    	je     cb <main+0xcb>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 76 0e 00 00       	call   ecb <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 b2 00 00 00    	je     110 <main+0x110>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 54                	je     b6 <main+0xb6>
    wait();
      62:	e8 74 0e 00 00       	call   edb <wait>
  memset(buf, 0, nbuf);
      67:	83 ec 04             	sub    $0x4,%esp
      6a:	6a 64                	push   $0x64
      6c:	6a 00                	push   $0x0
      6e:	68 a0 1a 00 00       	push   $0x1aa0
      73:	e8 e8 0b 00 00       	call   c60 <memset>
  gets(buf, nbuf);
      78:	58                   	pop    %eax
      79:	5a                   	pop    %edx
      7a:	6a 64                	push   $0x64
      7c:	68 a0 1a 00 00       	push   $0x1aa0
      81:	e8 3a 0c 00 00       	call   cc0 <gets>
  if(buf[0] == 0) // EOF
      86:	0f b6 05 a0 1a 00 00 	movzbl 0x1aa0,%eax
      8d:	83 c4 10             	add    $0x10,%esp
      90:	84 c0                	test   %al,%al
      92:	74 0f                	je     a3 <main+0xa3>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      94:	3c 63                	cmp    $0x63,%al
      96:	75 b8                	jne    50 <main+0x50>
      98:	80 3d a1 1a 00 00 64 	cmpb   $0x64,0x1aa1
      9f:	75 af                	jne    50 <main+0x50>
      a1:	eb 9d                	jmp    40 <main+0x40>
  exit();
      a3:	e8 2b 0e 00 00       	call   ed3 <exit>
      close(fd);
      a8:	83 ec 0c             	sub    $0xc,%esp
      ab:	50                   	push   %eax
      ac:	e8 4a 0e 00 00       	call   efb <close>
      break;
      b1:	83 c4 10             	add    $0x10,%esp
      b4:	eb b1                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      b6:	83 ec 0c             	sub    $0xc,%esp
      b9:	68 a0 1a 00 00       	push   $0x1aa0
      be:	e8 6d 0a 00 00       	call   b30 <parsecmd>
      c3:	89 04 24             	mov    %eax,(%esp)
      c6:	e8 c5 00 00 00       	call   190 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      cb:	83 ec 0c             	sub    $0xc,%esp
      ce:	68 a0 1a 00 00       	push   $0x1aa0
      d3:	e8 58 0b 00 00       	call   c30 <strlen>
      if(chdir(buf+3) < 0)
      d8:	c7 04 24 a3 1a 00 00 	movl   $0x1aa3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      df:	c6 80 9f 1a 00 00 00 	movb   $0x0,0x1a9f(%eax)
      if(chdir(buf+3) < 0)
      e6:	e8 58 0e 00 00       	call   f43 <chdir>
      eb:	83 c4 10             	add    $0x10,%esp
      ee:	85 c0                	test   %eax,%eax
      f0:	0f 89 71 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
      f6:	51                   	push   %ecx
      f7:	68 a3 1a 00 00       	push   $0x1aa3
      fc:	68 fe 13 00 00       	push   $0x13fe
     101:	6a 02                	push   $0x2
     103:	e8 48 0f 00 00       	call   1050 <printf>
     108:	83 c4 10             	add    $0x10,%esp
     10b:	e9 57 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     110:	83 ec 0c             	sub    $0xc,%esp
     113:	68 58 13 00 00       	push   $0x1358
     118:	e8 33 00 00 00       	call   150 <panic>
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <getcmd>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	56                   	push   %esi
     124:	53                   	push   %ebx
     125:	8b 5d 08             	mov    0x8(%ebp),%ebx
     128:	8b 75 0c             	mov    0xc(%ebp),%esi
  memset(buf, 0, nbuf);
     12b:	83 ec 04             	sub    $0x4,%esp
     12e:	56                   	push   %esi
     12f:	6a 00                	push   $0x0
     131:	53                   	push   %ebx
     132:	e8 29 0b 00 00       	call   c60 <memset>
  gets(buf, nbuf);
     137:	58                   	pop    %eax
     138:	5a                   	pop    %edx
     139:	56                   	push   %esi
     13a:	53                   	push   %ebx
     13b:	e8 80 0b 00 00       	call   cc0 <gets>
  if(buf[0] == 0) // EOF
     140:	83 c4 10             	add    $0x10,%esp
     143:	80 3b 01             	cmpb   $0x1,(%ebx)
     146:	19 c0                	sbb    %eax,%eax
}
     148:	8d 65 f8             	lea    -0x8(%ebp),%esp
     14b:	5b                   	pop    %ebx
     14c:	5e                   	pop    %esi
     14d:	5d                   	pop    %ebp
     14e:	c3                   	ret
     14f:	90                   	nop

00000150 <panic>:
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     156:	ff 75 08             	push   0x8(%ebp)
     159:	68 f2 13 00 00       	push   $0x13f2
     15e:	6a 02                	push   $0x2
     160:	e8 eb 0e 00 00       	call   1050 <printf>
  exit();
     165:	e8 69 0d 00 00       	call   ed3 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <fork1>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     176:	e8 50 0d 00 00       	call   ecb <fork>
  if(pid == -1)
     17b:	83 f8 ff             	cmp    $0xffffffff,%eax
     17e:	74 02                	je     182 <fork1+0x12>
  return pid;
}
     180:	c9                   	leave
     181:	c3                   	ret
    panic("fork");
     182:	83 ec 0c             	sub    $0xc,%esp
     185:	68 58 13 00 00       	push   $0x1358
     18a:	e8 c1 ff ff ff       	call   150 <panic>
     18f:	90                   	nop

00000190 <runcmd>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	53                   	push   %ebx
     194:	83 ec 14             	sub    $0x14,%esp
     197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     19a:	85 db                	test   %ebx,%ebx
     19c:	74 3a                	je     1d8 <runcmd+0x48>
  switch(cmd->type){
     19e:	83 3b 05             	cmpl   $0x5,(%ebx)
     1a1:	0f 87 e6 00 00 00    	ja     28d <runcmd+0xfd>
     1a7:	8b 03                	mov    (%ebx),%eax
     1a9:	ff 24 85 24 14 00 00 	jmp    *0x1424(,%eax,4)
    if(ecmd->argv[0] == 0)
     1b0:	8b 43 04             	mov    0x4(%ebx),%eax
     1b3:	85 c0                	test   %eax,%eax
     1b5:	74 21                	je     1d8 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     1b7:	8d 53 04             	lea    0x4(%ebx),%edx
     1ba:	51                   	push   %ecx
     1bb:	51                   	push   %ecx
     1bc:	52                   	push   %edx
     1bd:	50                   	push   %eax
     1be:	e8 48 0d 00 00       	call   f0b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1c3:	83 c4 0c             	add    $0xc,%esp
     1c6:	ff 73 04             	push   0x4(%ebx)
     1c9:	68 64 13 00 00       	push   $0x1364
     1ce:	6a 02                	push   $0x2
     1d0:	e8 7b 0e 00 00       	call   1050 <printf>
    break;
     1d5:	83 c4 10             	add    $0x10,%esp
    exit();
     1d8:	e8 f6 0c 00 00       	call   ed3 <exit>
    if(fork1() == 0)
     1dd:	e8 8e ff ff ff       	call   170 <fork1>
     1e2:	85 c0                	test   %eax,%eax
     1e4:	75 f2                	jne    1d8 <runcmd+0x48>
     1e6:	e9 97 00 00 00       	jmp    282 <runcmd+0xf2>
    if(pipe(p) < 0)
     1eb:	83 ec 0c             	sub    $0xc,%esp
     1ee:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1f1:	50                   	push   %eax
     1f2:	e8 ec 0c 00 00       	call   ee3 <pipe>
     1f7:	83 c4 10             	add    $0x10,%esp
     1fa:	85 c0                	test   %eax,%eax
     1fc:	0f 88 ad 00 00 00    	js     2af <runcmd+0x11f>
    if(fork1() == 0){
     202:	e8 69 ff ff ff       	call   170 <fork1>
     207:	85 c0                	test   %eax,%eax
     209:	0f 84 ad 00 00 00    	je     2bc <runcmd+0x12c>
    if(fork1() == 0){
     20f:	e8 5c ff ff ff       	call   170 <fork1>
     214:	85 c0                	test   %eax,%eax
     216:	0f 85 ce 00 00 00    	jne    2ea <runcmd+0x15a>
      close(0);
     21c:	83 ec 0c             	sub    $0xc,%esp
     21f:	6a 00                	push   $0x0
     221:	e8 d5 0c 00 00       	call   efb <close>
      dup(p[0]);
     226:	5a                   	pop    %edx
     227:	ff 75 f0             	push   -0x10(%ebp)
     22a:	e8 1c 0d 00 00       	call   f4b <dup>
      close(p[0]);
     22f:	59                   	pop    %ecx
     230:	ff 75 f0             	push   -0x10(%ebp)
     233:	e8 c3 0c 00 00       	call   efb <close>
      close(p[1]);
     238:	58                   	pop    %eax
     239:	ff 75 f4             	push   -0xc(%ebp)
     23c:	e8 ba 0c 00 00       	call   efb <close>
      runcmd(pcmd->right);
     241:	58                   	pop    %eax
     242:	ff 73 08             	push   0x8(%ebx)
     245:	e8 46 ff ff ff       	call   190 <runcmd>
    if(fork1() == 0)
     24a:	e8 21 ff ff ff       	call   170 <fork1>
     24f:	85 c0                	test   %eax,%eax
     251:	74 2f                	je     282 <runcmd+0xf2>
    wait();
     253:	e8 83 0c 00 00       	call   edb <wait>
    runcmd(lcmd->right);
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	ff 73 08             	push   0x8(%ebx)
     25e:	e8 2d ff ff ff       	call   190 <runcmd>
    close(rcmd->fd);
     263:	83 ec 0c             	sub    $0xc,%esp
     266:	ff 73 14             	push   0x14(%ebx)
     269:	e8 8d 0c 00 00       	call   efb <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     26e:	58                   	pop    %eax
     26f:	5a                   	pop    %edx
     270:	ff 73 10             	push   0x10(%ebx)
     273:	ff 73 08             	push   0x8(%ebx)
     276:	e8 98 0c 00 00       	call   f13 <open>
     27b:	83 c4 10             	add    $0x10,%esp
     27e:	85 c0                	test   %eax,%eax
     280:	78 18                	js     29a <runcmd+0x10a>
      runcmd(bcmd->cmd);
     282:	83 ec 0c             	sub    $0xc,%esp
     285:	ff 73 04             	push   0x4(%ebx)
     288:	e8 03 ff ff ff       	call   190 <runcmd>
    panic("runcmd");
     28d:	83 ec 0c             	sub    $0xc,%esp
     290:	68 5d 13 00 00       	push   $0x135d
     295:	e8 b6 fe ff ff       	call   150 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     29a:	51                   	push   %ecx
     29b:	ff 73 08             	push   0x8(%ebx)
     29e:	68 74 13 00 00       	push   $0x1374
     2a3:	6a 02                	push   $0x2
     2a5:	e8 a6 0d 00 00       	call   1050 <printf>
      exit();
     2aa:	e8 24 0c 00 00       	call   ed3 <exit>
      panic("pipe");
     2af:	83 ec 0c             	sub    $0xc,%esp
     2b2:	68 84 13 00 00       	push   $0x1384
     2b7:	e8 94 fe ff ff       	call   150 <panic>
      close(1);
     2bc:	83 ec 0c             	sub    $0xc,%esp
     2bf:	6a 01                	push   $0x1
     2c1:	e8 35 0c 00 00       	call   efb <close>
      dup(p[1]);
     2c6:	58                   	pop    %eax
     2c7:	ff 75 f4             	push   -0xc(%ebp)
     2ca:	e8 7c 0c 00 00       	call   f4b <dup>
      close(p[0]);
     2cf:	58                   	pop    %eax
     2d0:	ff 75 f0             	push   -0x10(%ebp)
     2d3:	e8 23 0c 00 00       	call   efb <close>
      close(p[1]);
     2d8:	58                   	pop    %eax
     2d9:	ff 75 f4             	push   -0xc(%ebp)
     2dc:	e8 1a 0c 00 00       	call   efb <close>
      runcmd(pcmd->left);
     2e1:	5a                   	pop    %edx
     2e2:	ff 73 04             	push   0x4(%ebx)
     2e5:	e8 a6 fe ff ff       	call   190 <runcmd>
    close(p[0]);
     2ea:	83 ec 0c             	sub    $0xc,%esp
     2ed:	ff 75 f0             	push   -0x10(%ebp)
     2f0:	e8 06 0c 00 00       	call   efb <close>
    close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	push   -0xc(%ebp)
     2f9:	e8 fd 0b 00 00       	call   efb <close>
    wait();
     2fe:	e8 d8 0b 00 00       	call   edb <wait>
    wait();
     303:	e8 d3 0b 00 00       	call   edb <wait>
    break;
     308:	83 c4 10             	add    $0x10,%esp
     30b:	e9 c8 fe ff ff       	jmp    1d8 <runcmd+0x48>

00000310 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     317:	6a 54                	push   $0x54
     319:	e8 52 0f 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     31e:	83 c4 0c             	add    $0xc,%esp
     321:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     323:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     325:	6a 00                	push   $0x0
     327:	50                   	push   %eax
     328:	e8 33 09 00 00       	call   c60 <memset>
  cmd->type = EXEC;
     32d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     333:	89 d8                	mov    %ebx,%eax
     335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     338:	c9                   	leave
     339:	c3                   	ret
     33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 18                	push   $0x18
     349:	e8 22 0f 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 03 09 00 00       	call   c60 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     360:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     366:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     369:	8b 45 0c             	mov    0xc(%ebp),%eax
     36c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     36f:	8b 45 10             	mov    0x10(%ebp),%eax
     372:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     375:	8b 45 14             	mov    0x14(%ebp),%eax
     378:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     37b:	8b 45 18             	mov    0x18(%ebp),%eax
     37e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     381:	89 d8                	mov    %ebx,%eax
     383:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     386:	c9                   	leave
     387:	c3                   	ret
     388:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     38f:	00 

00000390 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	53                   	push   %ebx
     394:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     397:	6a 0c                	push   $0xc
     399:	e8 d2 0e 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     39e:	83 c4 0c             	add    $0xc,%esp
     3a1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3a5:	6a 00                	push   $0x0
     3a7:	50                   	push   %eax
     3a8:	e8 b3 08 00 00       	call   c60 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3ad:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3b0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3b6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3bf:	89 d8                	mov    %ebx,%eax
     3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c4:	c9                   	leave
     3c5:	c3                   	ret
     3c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3cd:	00 
     3ce:	66 90                	xchg   %ax,%ax

000003d0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	6a 0c                	push   $0xc
     3d9:	e8 92 0e 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
     3e1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3e3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 73 08 00 00       	call   c60 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     3f0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ff:	89 d8                	mov    %ebx,%eax
     401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     404:	c9                   	leave
     405:	c3                   	ret
     406:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     40d:	00 
     40e:	66 90                	xchg   %ax,%ax

00000410 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	6a 08                	push   $0x8
     419:	e8 52 0e 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
     421:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     423:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 33 08 00 00       	call   c60 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     430:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     439:	89 d8                	mov    %ebx,%eax
     43b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     43e:	c9                   	leave
     43f:	c3                   	ret

00000440 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	57                   	push   %edi
     444:	56                   	push   %esi
     445:	53                   	push   %ebx
     446:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     449:	8b 45 08             	mov    0x8(%ebp),%eax
{
     44c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     44f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     452:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     454:	39 df                	cmp    %ebx,%edi
     456:	72 0f                	jb     467 <gettoken+0x27>
     458:	eb 25                	jmp    47f <gettoken+0x3f>
     45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     460:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     463:	39 fb                	cmp    %edi,%ebx
     465:	74 18                	je     47f <gettoken+0x3f>
     467:	0f be 07             	movsbl (%edi),%eax
     46a:	83 ec 08             	sub    $0x8,%esp
     46d:	50                   	push   %eax
     46e:	68 8c 1a 00 00       	push   $0x1a8c
     473:	e8 08 08 00 00       	call   c80 <strchr>
     478:	83 c4 10             	add    $0x10,%esp
     47b:	85 c0                	test   %eax,%eax
     47d:	75 e1                	jne    460 <gettoken+0x20>
  if(q)
     47f:	85 f6                	test   %esi,%esi
     481:	74 02                	je     485 <gettoken+0x45>
    *q = s;
     483:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     485:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     488:	3c 3c                	cmp    $0x3c,%al
     48a:	0f 8f c8 00 00 00    	jg     558 <gettoken+0x118>
     490:	3c 3a                	cmp    $0x3a,%al
     492:	7f 5a                	jg     4ee <gettoken+0xae>
     494:	84 c0                	test   %al,%al
     496:	75 48                	jne    4e0 <gettoken+0xa0>
     498:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     49a:	8b 4d 14             	mov    0x14(%ebp),%ecx
     49d:	85 c9                	test   %ecx,%ecx
     49f:	74 05                	je     4a6 <gettoken+0x66>
    *eq = s;
     4a1:	8b 45 14             	mov    0x14(%ebp),%eax
     4a4:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4a6:	39 df                	cmp    %ebx,%edi
     4a8:	72 0d                	jb     4b7 <gettoken+0x77>
     4aa:	eb 23                	jmp    4cf <gettoken+0x8f>
     4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4b0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4b3:	39 fb                	cmp    %edi,%ebx
     4b5:	74 18                	je     4cf <gettoken+0x8f>
     4b7:	0f be 07             	movsbl (%edi),%eax
     4ba:	83 ec 08             	sub    $0x8,%esp
     4bd:	50                   	push   %eax
     4be:	68 8c 1a 00 00       	push   $0x1a8c
     4c3:	e8 b8 07 00 00       	call   c80 <strchr>
     4c8:	83 c4 10             	add    $0x10,%esp
     4cb:	85 c0                	test   %eax,%eax
     4cd:	75 e1                	jne    4b0 <gettoken+0x70>
  *ps = s;
     4cf:	8b 45 08             	mov    0x8(%ebp),%eax
     4d2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4d7:	89 f0                	mov    %esi,%eax
     4d9:	5b                   	pop    %ebx
     4da:	5e                   	pop    %esi
     4db:	5f                   	pop    %edi
     4dc:	5d                   	pop    %ebp
     4dd:	c3                   	ret
     4de:	66 90                	xchg   %ax,%ax
  switch(*s){
     4e0:	78 22                	js     504 <gettoken+0xc4>
     4e2:	3c 26                	cmp    $0x26,%al
     4e4:	74 08                	je     4ee <gettoken+0xae>
     4e6:	8d 48 d8             	lea    -0x28(%eax),%ecx
     4e9:	80 f9 01             	cmp    $0x1,%cl
     4ec:	77 16                	ja     504 <gettoken+0xc4>
  ret = *s;
     4ee:	0f be f0             	movsbl %al,%esi
    s++;
     4f1:	83 c7 01             	add    $0x1,%edi
    break;
     4f4:	eb a4                	jmp    49a <gettoken+0x5a>
     4f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     4fd:	00 
     4fe:	66 90                	xchg   %ax,%ax
  switch(*s){
     500:	3c 7c                	cmp    $0x7c,%al
     502:	74 ea                	je     4ee <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     504:	39 df                	cmp    %ebx,%edi
     506:	72 27                	jb     52f <gettoken+0xef>
     508:	e9 87 00 00 00       	jmp    594 <gettoken+0x154>
     50d:	8d 76 00             	lea    0x0(%esi),%esi
     510:	0f be 07             	movsbl (%edi),%eax
     513:	83 ec 08             	sub    $0x8,%esp
     516:	50                   	push   %eax
     517:	68 84 1a 00 00       	push   $0x1a84
     51c:	e8 5f 07 00 00       	call   c80 <strchr>
     521:	83 c4 10             	add    $0x10,%esp
     524:	85 c0                	test   %eax,%eax
     526:	75 1f                	jne    547 <gettoken+0x107>
      s++;
     528:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     52b:	39 fb                	cmp    %edi,%ebx
     52d:	74 4d                	je     57c <gettoken+0x13c>
     52f:	0f be 07             	movsbl (%edi),%eax
     532:	83 ec 08             	sub    $0x8,%esp
     535:	50                   	push   %eax
     536:	68 8c 1a 00 00       	push   $0x1a8c
     53b:	e8 40 07 00 00       	call   c80 <strchr>
     540:	83 c4 10             	add    $0x10,%esp
     543:	85 c0                	test   %eax,%eax
     545:	74 c9                	je     510 <gettoken+0xd0>
    ret = 'a';
     547:	be 61 00 00 00       	mov    $0x61,%esi
     54c:	e9 49 ff ff ff       	jmp    49a <gettoken+0x5a>
     551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     558:	3c 3e                	cmp    $0x3e,%al
     55a:	75 a4                	jne    500 <gettoken+0xc0>
    if(*s == '>'){
     55c:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     560:	74 0d                	je     56f <gettoken+0x12f>
    s++;
     562:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     565:	be 3e 00 00 00       	mov    $0x3e,%esi
     56a:	e9 2b ff ff ff       	jmp    49a <gettoken+0x5a>
      s++;
     56f:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     572:	be 2b 00 00 00       	mov    $0x2b,%esi
     577:	e9 1e ff ff ff       	jmp    49a <gettoken+0x5a>
  if(eq)
     57c:	8b 45 14             	mov    0x14(%ebp),%eax
     57f:	85 c0                	test   %eax,%eax
     581:	74 05                	je     588 <gettoken+0x148>
    *eq = s;
     583:	8b 45 14             	mov    0x14(%ebp),%eax
     586:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     588:	89 df                	mov    %ebx,%edi
    ret = 'a';
     58a:	be 61 00 00 00       	mov    $0x61,%esi
     58f:	e9 3b ff ff ff       	jmp    4cf <gettoken+0x8f>
  if(eq)
     594:	8b 55 14             	mov    0x14(%ebp),%edx
     597:	85 d2                	test   %edx,%edx
     599:	74 ef                	je     58a <gettoken+0x14a>
    *eq = s;
     59b:	8b 45 14             	mov    0x14(%ebp),%eax
     59e:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     5a0:	eb e8                	jmp    58a <gettoken+0x14a>
     5a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5a9:	00 
     5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005b0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5b0:	55                   	push   %ebp
     5b1:	89 e5                	mov    %esp,%ebp
     5b3:	57                   	push   %edi
     5b4:	56                   	push   %esi
     5b5:	53                   	push   %ebx
     5b6:	83 ec 0c             	sub    $0xc,%esp
     5b9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5bf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5c1:	39 f3                	cmp    %esi,%ebx
     5c3:	72 12                	jb     5d7 <peek+0x27>
     5c5:	eb 28                	jmp    5ef <peek+0x3f>
     5c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5ce:	00 
     5cf:	90                   	nop
    s++;
     5d0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5d3:	39 de                	cmp    %ebx,%esi
     5d5:	74 18                	je     5ef <peek+0x3f>
     5d7:	0f be 03             	movsbl (%ebx),%eax
     5da:	83 ec 08             	sub    $0x8,%esp
     5dd:	50                   	push   %eax
     5de:	68 8c 1a 00 00       	push   $0x1a8c
     5e3:	e8 98 06 00 00       	call   c80 <strchr>
     5e8:	83 c4 10             	add    $0x10,%esp
     5eb:	85 c0                	test   %eax,%eax
     5ed:	75 e1                	jne    5d0 <peek+0x20>
  *ps = s;
     5ef:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5f1:	0f be 03             	movsbl (%ebx),%eax
     5f4:	31 d2                	xor    %edx,%edx
     5f6:	84 c0                	test   %al,%al
     5f8:	75 0e                	jne    608 <peek+0x58>
}
     5fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5fd:	89 d0                	mov    %edx,%eax
     5ff:	5b                   	pop    %ebx
     600:	5e                   	pop    %esi
     601:	5f                   	pop    %edi
     602:	5d                   	pop    %ebp
     603:	c3                   	ret
     604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     608:	83 ec 08             	sub    $0x8,%esp
     60b:	50                   	push   %eax
     60c:	ff 75 10             	push   0x10(%ebp)
     60f:	e8 6c 06 00 00       	call   c80 <strchr>
     614:	83 c4 10             	add    $0x10,%esp
     617:	31 d2                	xor    %edx,%edx
     619:	85 c0                	test   %eax,%eax
     61b:	0f 95 c2             	setne  %dl
}
     61e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     621:	5b                   	pop    %ebx
     622:	89 d0                	mov    %edx,%eax
     624:	5e                   	pop    %esi
     625:	5f                   	pop    %edi
     626:	5d                   	pop    %ebp
     627:	c3                   	ret
     628:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     62f:	00 

00000630 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 2c             	sub    $0x2c,%esp
     639:	8b 75 0c             	mov    0xc(%ebp),%esi
     63c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     63f:	90                   	nop
     640:	83 ec 04             	sub    $0x4,%esp
     643:	68 a6 13 00 00       	push   $0x13a6
     648:	53                   	push   %ebx
     649:	56                   	push   %esi
     64a:	e8 61 ff ff ff       	call   5b0 <peek>
     64f:	83 c4 10             	add    $0x10,%esp
     652:	85 c0                	test   %eax,%eax
     654:	0f 84 f6 00 00 00    	je     750 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     65a:	6a 00                	push   $0x0
     65c:	6a 00                	push   $0x0
     65e:	53                   	push   %ebx
     65f:	56                   	push   %esi
     660:	e8 db fd ff ff       	call   440 <gettoken>
     665:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     667:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     66a:	50                   	push   %eax
     66b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     66e:	50                   	push   %eax
     66f:	53                   	push   %ebx
     670:	56                   	push   %esi
     671:	e8 ca fd ff ff       	call   440 <gettoken>
     676:	83 c4 20             	add    $0x20,%esp
     679:	83 f8 61             	cmp    $0x61,%eax
     67c:	0f 85 d9 00 00 00    	jne    75b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     682:	83 ff 3c             	cmp    $0x3c,%edi
     685:	74 69                	je     6f0 <parseredirs+0xc0>
     687:	83 ff 3e             	cmp    $0x3e,%edi
     68a:	74 05                	je     691 <parseredirs+0x61>
     68c:	83 ff 2b             	cmp    $0x2b,%edi
     68f:	75 af                	jne    640 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     691:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     694:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     697:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     69a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     69d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6a0:	6a 18                	push   $0x18
     6a2:	e8 c9 0b 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6a7:	83 c4 0c             	add    $0xc,%esp
     6aa:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6ac:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ae:	6a 00                	push   $0x0
     6b0:	50                   	push   %eax
     6b1:	e8 aa 05 00 00       	call   c60 <memset>
  cmd->type = REDIR;
     6b6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6bc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6bf:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6c2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6c5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6c8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6cb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ce:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6d5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6d8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6df:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     6e2:	e9 59 ff ff ff       	jmp    640 <parseredirs+0x10>
     6e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     6ee:	00 
     6ef:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6f0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6f3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6f6:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6f9:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6fc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6ff:	6a 18                	push   $0x18
     701:	e8 6a 0b 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     706:	83 c4 0c             	add    $0xc,%esp
     709:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     70b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     70d:	6a 00                	push   $0x0
     70f:	50                   	push   %eax
     710:	e8 4b 05 00 00       	call   c60 <memset>
  cmd->cmd = subcmd;
     715:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     718:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     71b:	83 c4 10             	add    $0x10,%esp
  cmd->efile = efile;
     71e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     721:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     727:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     72a:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     72d:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     730:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     737:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     73e:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     741:	e9 fa fe ff ff       	jmp    640 <parseredirs+0x10>
     746:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     74d:	00 
     74e:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     750:	8b 45 08             	mov    0x8(%ebp),%eax
     753:	8d 65 f4             	lea    -0xc(%ebp),%esp
     756:	5b                   	pop    %ebx
     757:	5e                   	pop    %esi
     758:	5f                   	pop    %edi
     759:	5d                   	pop    %ebp
     75a:	c3                   	ret
      panic("missing file for redirection");
     75b:	83 ec 0c             	sub    $0xc,%esp
     75e:	68 89 13 00 00       	push   $0x1389
     763:	e8 e8 f9 ff ff       	call   150 <panic>
     768:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     76f:	00 

00000770 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     770:	55                   	push   %ebp
     771:	89 e5                	mov    %esp,%ebp
     773:	57                   	push   %edi
     774:	56                   	push   %esi
     775:	53                   	push   %ebx
     776:	83 ec 30             	sub    $0x30,%esp
     779:	8b 5d 08             	mov    0x8(%ebp),%ebx
     77c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     77f:	68 a9 13 00 00       	push   $0x13a9
     784:	56                   	push   %esi
     785:	53                   	push   %ebx
     786:	e8 25 fe ff ff       	call   5b0 <peek>
     78b:	83 c4 10             	add    $0x10,%esp
     78e:	85 c0                	test   %eax,%eax
     790:	0f 85 aa 00 00 00    	jne    840 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     796:	83 ec 0c             	sub    $0xc,%esp
     799:	89 c7                	mov    %eax,%edi
     79b:	6a 54                	push   $0x54
     79d:	e8 ce 0a 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7a2:	83 c4 0c             	add    $0xc,%esp
     7a5:	6a 54                	push   $0x54
     7a7:	6a 00                	push   $0x0
     7a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7ac:	50                   	push   %eax
     7ad:	e8 ae 04 00 00       	call   c60 <memset>
  cmd->type = EXEC;
     7b2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7b5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7b8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7be:	56                   	push   %esi
     7bf:	53                   	push   %ebx
     7c0:	50                   	push   %eax
     7c1:	e8 6a fe ff ff       	call   630 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7c6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7cc:	eb 15                	jmp    7e3 <parseexec+0x73>
     7ce:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7d0:	83 ec 04             	sub    $0x4,%esp
     7d3:	56                   	push   %esi
     7d4:	53                   	push   %ebx
     7d5:	ff 75 d4             	push   -0x2c(%ebp)
     7d8:	e8 53 fe ff ff       	call   630 <parseredirs>
     7dd:	83 c4 10             	add    $0x10,%esp
     7e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7e3:	83 ec 04             	sub    $0x4,%esp
     7e6:	68 c0 13 00 00       	push   $0x13c0
     7eb:	56                   	push   %esi
     7ec:	53                   	push   %ebx
     7ed:	e8 be fd ff ff       	call   5b0 <peek>
     7f2:	83 c4 10             	add    $0x10,%esp
     7f5:	85 c0                	test   %eax,%eax
     7f7:	75 5f                	jne    858 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7fc:	50                   	push   %eax
     7fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     800:	50                   	push   %eax
     801:	56                   	push   %esi
     802:	53                   	push   %ebx
     803:	e8 38 fc ff ff       	call   440 <gettoken>
     808:	83 c4 10             	add    $0x10,%esp
     80b:	85 c0                	test   %eax,%eax
     80d:	74 49                	je     858 <parseexec+0xe8>
    if(tok != 'a')
     80f:	83 f8 61             	cmp    $0x61,%eax
     812:	75 62                	jne    876 <parseexec+0x106>
    cmd->argv[argc] = q;
     814:	8b 45 e0             	mov    -0x20(%ebp),%eax
     817:	8b 55 d0             	mov    -0x30(%ebp),%edx
     81a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     81e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     821:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     825:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     828:	83 ff 0a             	cmp    $0xa,%edi
     82b:	75 a3                	jne    7d0 <parseexec+0x60>
      panic("too many args");
     82d:	83 ec 0c             	sub    $0xc,%esp
     830:	68 b2 13 00 00       	push   $0x13b2
     835:	e8 16 f9 ff ff       	call   150 <panic>
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     840:	89 75 0c             	mov    %esi,0xc(%ebp)
     843:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     846:	8d 65 f4             	lea    -0xc(%ebp),%esp
     849:	5b                   	pop    %ebx
     84a:	5e                   	pop    %esi
     84b:	5f                   	pop    %edi
     84c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     84d:	e9 ae 01 00 00       	jmp    a00 <parseblock>
     852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     858:	8b 45 d0             	mov    -0x30(%ebp),%eax
     85b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     862:	00 
  cmd->eargv[argc] = 0;
     863:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     86a:	00 
}
     86b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     86e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     871:	5b                   	pop    %ebx
     872:	5e                   	pop    %esi
     873:	5f                   	pop    %edi
     874:	5d                   	pop    %ebp
     875:	c3                   	ret
      panic("syntax");
     876:	83 ec 0c             	sub    $0xc,%esp
     879:	68 ab 13 00 00       	push   $0x13ab
     87e:	e8 cd f8 ff ff       	call   150 <panic>
     883:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     88a:	00 
     88b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000890 <parsepipe>:
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 14             	sub    $0x14,%esp
     899:	8b 75 08             	mov    0x8(%ebp),%esi
     89c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     89f:	57                   	push   %edi
     8a0:	56                   	push   %esi
     8a1:	e8 ca fe ff ff       	call   770 <parseexec>
  if(peek(ps, es, "|")){
     8a6:	83 c4 0c             	add    $0xc,%esp
     8a9:	68 c5 13 00 00       	push   $0x13c5
  cmd = parseexec(ps, es);
     8ae:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8b0:	57                   	push   %edi
     8b1:	56                   	push   %esi
     8b2:	e8 f9 fc ff ff       	call   5b0 <peek>
     8b7:	83 c4 10             	add    $0x10,%esp
     8ba:	85 c0                	test   %eax,%eax
     8bc:	75 12                	jne    8d0 <parsepipe+0x40>
}
     8be:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8c1:	89 d8                	mov    %ebx,%eax
     8c3:	5b                   	pop    %ebx
     8c4:	5e                   	pop    %esi
     8c5:	5f                   	pop    %edi
     8c6:	5d                   	pop    %ebp
     8c7:	c3                   	ret
     8c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8cf:	00 
    gettoken(ps, es, 0, 0);
     8d0:	6a 00                	push   $0x0
     8d2:	6a 00                	push   $0x0
     8d4:	57                   	push   %edi
     8d5:	56                   	push   %esi
     8d6:	e8 65 fb ff ff       	call   440 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8db:	58                   	pop    %eax
     8dc:	5a                   	pop    %edx
     8dd:	57                   	push   %edi
     8de:	56                   	push   %esi
     8df:	e8 ac ff ff ff       	call   890 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8ed:	e8 7e 09 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8f2:	83 c4 0c             	add    $0xc,%esp
     8f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     8f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     8f9:	6a 00                	push   $0x0
     8fb:	50                   	push   %eax
     8fc:	e8 5f 03 00 00       	call   c60 <memset>
  cmd->left = left;
     901:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     904:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     907:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     909:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     90f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     911:	89 7e 08             	mov    %edi,0x8(%esi)
}
     914:	8d 65 f4             	lea    -0xc(%ebp),%esp
     917:	5b                   	pop    %ebx
     918:	5e                   	pop    %esi
     919:	5f                   	pop    %edi
     91a:	5d                   	pop    %ebp
     91b:	c3                   	ret
     91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000920 <parseline>:
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	57                   	push   %edi
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	83 ec 24             	sub    $0x24,%esp
     929:	8b 75 08             	mov    0x8(%ebp),%esi
     92c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     92f:	57                   	push   %edi
     930:	56                   	push   %esi
     931:	e8 5a ff ff ff       	call   890 <parsepipe>
  while(peek(ps, es, "&")){
     936:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     939:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     93b:	eb 3b                	jmp    978 <parseline+0x58>
     93d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     940:	6a 00                	push   $0x0
     942:	6a 00                	push   $0x0
     944:	57                   	push   %edi
     945:	56                   	push   %esi
     946:	e8 f5 fa ff ff       	call   440 <gettoken>
  cmd = malloc(sizeof(*cmd));
     94b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     952:	e8 19 09 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     957:	83 c4 0c             	add    $0xc,%esp
     95a:	6a 08                	push   $0x8
     95c:	6a 00                	push   $0x0
     95e:	50                   	push   %eax
     95f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     962:	e8 f9 02 00 00       	call   c60 <memset>
  cmd->type = BACK;
     967:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     96a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     96d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     973:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     976:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     978:	83 ec 04             	sub    $0x4,%esp
     97b:	68 c7 13 00 00       	push   $0x13c7
     980:	57                   	push   %edi
     981:	56                   	push   %esi
     982:	e8 29 fc ff ff       	call   5b0 <peek>
     987:	83 c4 10             	add    $0x10,%esp
     98a:	85 c0                	test   %eax,%eax
     98c:	75 b2                	jne    940 <parseline+0x20>
  if(peek(ps, es, ";")){
     98e:	83 ec 04             	sub    $0x4,%esp
     991:	68 c3 13 00 00       	push   $0x13c3
     996:	57                   	push   %edi
     997:	56                   	push   %esi
     998:	e8 13 fc ff ff       	call   5b0 <peek>
     99d:	83 c4 10             	add    $0x10,%esp
     9a0:	85 c0                	test   %eax,%eax
     9a2:	75 0c                	jne    9b0 <parseline+0x90>
}
     9a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a7:	89 d8                	mov    %ebx,%eax
     9a9:	5b                   	pop    %ebx
     9aa:	5e                   	pop    %esi
     9ab:	5f                   	pop    %edi
     9ac:	5d                   	pop    %ebp
     9ad:	c3                   	ret
     9ae:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9b0:	6a 00                	push   $0x0
     9b2:	6a 00                	push   $0x0
     9b4:	57                   	push   %edi
     9b5:	56                   	push   %esi
     9b6:	e8 85 fa ff ff       	call   440 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9bb:	58                   	pop    %eax
     9bc:	5a                   	pop    %edx
     9bd:	57                   	push   %edi
     9be:	56                   	push   %esi
     9bf:	e8 5c ff ff ff       	call   920 <parseline>
  cmd = malloc(sizeof(*cmd));
     9c4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9cb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9cd:	e8 9e 08 00 00       	call   1270 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9d2:	83 c4 0c             	add    $0xc,%esp
     9d5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9d7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9d9:	6a 00                	push   $0x0
     9db:	50                   	push   %eax
     9dc:	e8 7f 02 00 00       	call   c60 <memset>
  cmd->left = left;
     9e1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9e4:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     9e7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9e9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9ef:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     9f1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     9f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9f7:	5b                   	pop    %ebx
     9f8:	5e                   	pop    %esi
     9f9:	5f                   	pop    %edi
     9fa:	5d                   	pop    %ebp
     9fb:	c3                   	ret
     9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <parseblock>:
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	57                   	push   %edi
     a04:	56                   	push   %esi
     a05:	53                   	push   %ebx
     a06:	83 ec 10             	sub    $0x10,%esp
     a09:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a0c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a0f:	68 a9 13 00 00       	push   $0x13a9
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	e8 95 fb ff ff       	call   5b0 <peek>
     a1b:	83 c4 10             	add    $0x10,%esp
     a1e:	85 c0                	test   %eax,%eax
     a20:	74 4a                	je     a6c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a22:	6a 00                	push   $0x0
     a24:	6a 00                	push   $0x0
     a26:	56                   	push   %esi
     a27:	53                   	push   %ebx
     a28:	e8 13 fa ff ff       	call   440 <gettoken>
  cmd = parseline(ps, es);
     a2d:	58                   	pop    %eax
     a2e:	5a                   	pop    %edx
     a2f:	56                   	push   %esi
     a30:	53                   	push   %ebx
     a31:	e8 ea fe ff ff       	call   920 <parseline>
  if(!peek(ps, es, ")"))
     a36:	83 c4 0c             	add    $0xc,%esp
     a39:	68 e5 13 00 00       	push   $0x13e5
  cmd = parseline(ps, es);
     a3e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a40:	56                   	push   %esi
     a41:	53                   	push   %ebx
     a42:	e8 69 fb ff ff       	call   5b0 <peek>
     a47:	83 c4 10             	add    $0x10,%esp
     a4a:	85 c0                	test   %eax,%eax
     a4c:	74 2b                	je     a79 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a4e:	6a 00                	push   $0x0
     a50:	6a 00                	push   $0x0
     a52:	56                   	push   %esi
     a53:	53                   	push   %ebx
     a54:	e8 e7 f9 ff ff       	call   440 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a59:	83 c4 0c             	add    $0xc,%esp
     a5c:	56                   	push   %esi
     a5d:	53                   	push   %ebx
     a5e:	57                   	push   %edi
     a5f:	e8 cc fb ff ff       	call   630 <parseredirs>
}
     a64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a67:	5b                   	pop    %ebx
     a68:	5e                   	pop    %esi
     a69:	5f                   	pop    %edi
     a6a:	5d                   	pop    %ebp
     a6b:	c3                   	ret
    panic("parseblock");
     a6c:	83 ec 0c             	sub    $0xc,%esp
     a6f:	68 c9 13 00 00       	push   $0x13c9
     a74:	e8 d7 f6 ff ff       	call   150 <panic>
    panic("syntax - missing )");
     a79:	83 ec 0c             	sub    $0xc,%esp
     a7c:	68 d4 13 00 00       	push   $0x13d4
     a81:	e8 ca f6 ff ff       	call   150 <panic>
     a86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a8d:	00 
     a8e:	66 90                	xchg   %ax,%ax

00000a90 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a90:	55                   	push   %ebp
     a91:	89 e5                	mov    %esp,%ebp
     a93:	53                   	push   %ebx
     a94:	83 ec 04             	sub    $0x4,%esp
     a97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a9a:	85 db                	test   %ebx,%ebx
     a9c:	74 29                	je     ac7 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     a9e:	83 3b 05             	cmpl   $0x5,(%ebx)
     aa1:	77 24                	ja     ac7 <nulterminate+0x37>
     aa3:	8b 03                	mov    (%ebx),%eax
     aa5:	ff 24 85 3c 14 00 00 	jmp    *0x143c(,%eax,4)
     aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ab0:	83 ec 0c             	sub    $0xc,%esp
     ab3:	ff 73 04             	push   0x4(%ebx)
     ab6:	e8 d5 ff ff ff       	call   a90 <nulterminate>
    nulterminate(lcmd->right);
     abb:	58                   	pop    %eax
     abc:	ff 73 08             	push   0x8(%ebx)
     abf:	e8 cc ff ff ff       	call   a90 <nulterminate>
    break;
     ac4:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ac7:	89 d8                	mov    %ebx,%eax
     ac9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     acc:	c9                   	leave
     acd:	c3                   	ret
     ace:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 b5 ff ff ff       	call   a90 <nulterminate>
}
     adb:	89 d8                	mov    %ebx,%eax
    break;
     add:	83 c4 10             	add    $0x10,%esp
}
     ae0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ae3:	c9                   	leave
     ae4:	c3                   	ret
     ae5:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     ae8:	8b 4b 04             	mov    0x4(%ebx),%ecx
     aeb:	85 c9                	test   %ecx,%ecx
     aed:	74 d8                	je     ac7 <nulterminate+0x37>
     aef:	8d 43 08             	lea    0x8(%ebx),%eax
     af2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     af8:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     afb:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     afe:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b01:	8b 50 fc             	mov    -0x4(%eax),%edx
     b04:	85 d2                	test   %edx,%edx
     b06:	75 f0                	jne    af8 <nulterminate+0x68>
}
     b08:	89 d8                	mov    %ebx,%eax
     b0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b0d:	c9                   	leave
     b0e:	c3                   	ret
     b0f:	90                   	nop
    nulterminate(rcmd->cmd);
     b10:	83 ec 0c             	sub    $0xc,%esp
     b13:	ff 73 04             	push   0x4(%ebx)
     b16:	e8 75 ff ff ff       	call   a90 <nulterminate>
    *rcmd->efile = 0;
     b1b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b1e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b21:	c6 00 00             	movb   $0x0,(%eax)
}
     b24:	89 d8                	mov    %ebx,%eax
     b26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b29:	c9                   	leave
     b2a:	c3                   	ret
     b2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000b30 <parsecmd>:
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
  cmd = parseline(&s, es);
     b35:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b38:	53                   	push   %ebx
     b39:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b3f:	53                   	push   %ebx
     b40:	e8 eb 00 00 00       	call   c30 <strlen>
  cmd = parseline(&s, es);
     b45:	59                   	pop    %ecx
     b46:	5e                   	pop    %esi
  es = s + strlen(s);
     b47:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b49:	53                   	push   %ebx
     b4a:	57                   	push   %edi
     b4b:	e8 d0 fd ff ff       	call   920 <parseline>
  peek(&s, es, "");
     b50:	83 c4 0c             	add    $0xc,%esp
     b53:	68 73 13 00 00       	push   $0x1373
  cmd = parseline(&s, es);
     b58:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b5a:	53                   	push   %ebx
     b5b:	57                   	push   %edi
     b5c:	e8 4f fa ff ff       	call   5b0 <peek>
  if(s != es){
     b61:	8b 45 08             	mov    0x8(%ebp),%eax
     b64:	83 c4 10             	add    $0x10,%esp
     b67:	39 d8                	cmp    %ebx,%eax
     b69:	75 13                	jne    b7e <parsecmd+0x4e>
  nulterminate(cmd);
     b6b:	83 ec 0c             	sub    $0xc,%esp
     b6e:	56                   	push   %esi
     b6f:	e8 1c ff ff ff       	call   a90 <nulterminate>
}
     b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b77:	89 f0                	mov    %esi,%eax
     b79:	5b                   	pop    %ebx
     b7a:	5e                   	pop    %esi
     b7b:	5f                   	pop    %edi
     b7c:	5d                   	pop    %ebp
     b7d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b7e:	52                   	push   %edx
     b7f:	50                   	push   %eax
     b80:	68 e7 13 00 00       	push   $0x13e7
     b85:	6a 02                	push   $0x2
     b87:	e8 c4 04 00 00       	call   1050 <printf>
    panic("syntax");
     b8c:	c7 04 24 ab 13 00 00 	movl   $0x13ab,(%esp)
     b93:	e8 b8 f5 ff ff       	call   150 <panic>
     b98:	66 90                	xchg   %ax,%ax
     b9a:	66 90                	xchg   %ax,%ax
     b9c:	66 90                	xchg   %ax,%ax
     b9e:	66 90                	xchg   %ax,%ax

00000ba0 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
     ba0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     ba1:	31 c0                	xor    %eax,%eax
{
     ba3:	89 e5                	mov    %esp,%ebp
     ba5:	53                   	push   %ebx
     ba6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ba9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     bb0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     bb4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     bb7:	83 c0 01             	add    $0x1,%eax
     bba:	84 d2                	test   %dl,%dl
     bbc:	75 f2                	jne    bb0 <strcpy+0x10>
    ;
  return os;
}
     bbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bc1:	89 c8                	mov    %ecx,%eax
     bc3:	c9                   	leave
     bc4:	c3                   	ret
     bc5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     bcc:	00 
     bcd:	8d 76 00             	lea    0x0(%esi),%esi

00000bd0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	53                   	push   %ebx
     bd4:	8b 55 08             	mov    0x8(%ebp),%edx
     bd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     bda:	0f b6 02             	movzbl (%edx),%eax
     bdd:	84 c0                	test   %al,%al
     bdf:	75 17                	jne    bf8 <strcmp+0x28>
     be1:	eb 3a                	jmp    c1d <strcmp+0x4d>
     be3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     be8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     bec:	83 c2 01             	add    $0x1,%edx
     bef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     bf2:	84 c0                	test   %al,%al
     bf4:	74 1a                	je     c10 <strcmp+0x40>
     bf6:	89 d9                	mov    %ebx,%ecx
     bf8:	0f b6 19             	movzbl (%ecx),%ebx
     bfb:	38 c3                	cmp    %al,%bl
     bfd:	74 e9                	je     be8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     bff:	29 d8                	sub    %ebx,%eax
}
     c01:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c04:	c9                   	leave
     c05:	c3                   	ret
     c06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c0d:	00 
     c0e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     c10:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c14:	31 c0                	xor    %eax,%eax
     c16:	29 d8                	sub    %ebx,%eax
}
     c18:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c1b:	c9                   	leave
     c1c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     c1d:	0f b6 19             	movzbl (%ecx),%ebx
     c20:	31 c0                	xor    %eax,%eax
     c22:	eb db                	jmp    bff <strcmp+0x2f>
     c24:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c2b:	00 
     c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c30 <strlen>:

uint
strlen(const char *s)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c36:	80 3a 00             	cmpb   $0x0,(%edx)
     c39:	74 15                	je     c50 <strlen+0x20>
     c3b:	31 c0                	xor    %eax,%eax
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
     c40:	83 c0 01             	add    $0x1,%eax
     c43:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c47:	89 c1                	mov    %eax,%ecx
     c49:	75 f5                	jne    c40 <strlen+0x10>
    ;
  return n;
}
     c4b:	89 c8                	mov    %ecx,%eax
     c4d:	5d                   	pop    %ebp
     c4e:	c3                   	ret
     c4f:	90                   	nop
  for(n = 0; s[n]; n++)
     c50:	31 c9                	xor    %ecx,%ecx
}
     c52:	5d                   	pop    %ebp
     c53:	89 c8                	mov    %ecx,%eax
     c55:	c3                   	ret
     c56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c5d:	00 
     c5e:	66 90                	xchg   %ax,%ax

00000c60 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	57                   	push   %edi
     c64:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c67:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6d:	89 d7                	mov    %edx,%edi
     c6f:	fc                   	cld
     c70:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c72:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c75:	89 d0                	mov    %edx,%eax
     c77:	c9                   	leave
     c78:	c3                   	ret
     c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c80 <strchr>:

char*
strchr(const char *s, char c)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	8b 45 08             	mov    0x8(%ebp),%eax
     c86:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     c8a:	0f b6 10             	movzbl (%eax),%edx
     c8d:	84 d2                	test   %dl,%dl
     c8f:	75 12                	jne    ca3 <strchr+0x23>
     c91:	eb 1d                	jmp    cb0 <strchr+0x30>
     c93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     c98:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     c9c:	83 c0 01             	add    $0x1,%eax
     c9f:	84 d2                	test   %dl,%dl
     ca1:	74 0d                	je     cb0 <strchr+0x30>
    if(*s == c)
     ca3:	38 d1                	cmp    %dl,%cl
     ca5:	75 f1                	jne    c98 <strchr+0x18>
      return (char*)s;
  return 0;
}
     ca7:	5d                   	pop    %ebp
     ca8:	c3                   	ret
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     cb0:	31 c0                	xor    %eax,%eax
}
     cb2:	5d                   	pop    %ebp
     cb3:	c3                   	ret
     cb4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cbb:	00 
     cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <gets>:

char*
gets(char *buf, int max)
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	57                   	push   %edi
     cc4:	56                   	push   %esi
     cc5:	53                   	push   %ebx
     cc6:	83 ec 34             	sub    $0x34,%esp
  count++;
     cc9:	8b 15 04 1b 00 00    	mov    0x1b04,%edx
     ccf:	8d 72 01             	lea    0x1(%edx),%esi
     cd2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     cd5:	89 35 04 1b 00 00    	mov    %esi,0x1b04
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
     cdb:	6a 00                	push   $0x0
     cdd:	68 0c 14 00 00       	push   $0x140c
     ce2:	e8 2c 02 00 00       	call   f13 <open>
  if (fd < 0) {
     ce7:	83 c4 10             	add    $0x10,%esp
     cea:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     ced:	85 c0                	test   %eax,%eax
     cef:	0f 88 82 00 00 00    	js     d77 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
     cf5:	0f 84 8e 00 00 00    	je     d89 <gets+0xc9>
     cfb:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
     cfd:	85 f6                	test   %esi,%esi
     cff:	0f 84 ee 00 00 00    	je     df3 <gets+0x133>
     d05:	8d 76 00             	lea    0x0(%esi),%esi
     d08:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     d0b:	31 f6                	xor    %esi,%esi
     d0d:	eb 2a                	jmp    d39 <gets+0x79>
     d0f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
     d10:	83 ec 04             	sub    $0x4,%esp
     d13:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d16:	6a 01                	push   $0x1
     d18:	50                   	push   %eax
     d19:	57                   	push   %edi
     d1a:	e8 cc 01 00 00       	call   eeb <read>
        if(cc < 1)
     d1f:	83 c4 10             	add    $0x10,%esp
     d22:	85 c0                	test   %eax,%eax
     d24:	7e 1d                	jle    d43 <gets+0x83>
          break;
        buf[i++] = c;
     d26:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d2a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d2d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
     d31:	3c 0a                	cmp    $0xa,%al
     d33:	74 3b                	je     d70 <gets+0xb0>
     d35:	3c 0d                	cmp    $0xd,%al
     d37:	74 37                	je     d70 <gets+0xb0>
      for(i=0; i+1 < max; ){
     d39:	89 f3                	mov    %esi,%ebx
     d3b:	83 c6 01             	add    $0x1,%esi
     d3e:	3b 75 0c             	cmp    0xc(%ebp),%esi
     d41:	7c cd                	jl     d10 <gets+0x50>
     d43:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
     d46:	83 ea 01             	sub    $0x1,%edx
     d49:	73 bd                	jae    d08 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
     d4b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
     d4e:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
     d51:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
     d55:	57                   	push   %edi
     d56:	e8 a0 01 00 00       	call   efb <close>
     d5b:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
     d5e:	85 db                	test   %ebx,%ebx
     d60:	74 76                	je     dd8 <gets+0x118>

  return buf;
}
     d62:	8b 45 08             	mov    0x8(%ebp),%eax
     d65:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d68:	5b                   	pop    %ebx
     d69:	5e                   	pop    %esi
     d6a:	5f                   	pop    %edi
     d6b:	5d                   	pop    %ebp
     d6c:	c3                   	ret
     d6d:	8d 76 00             	lea    0x0(%esi),%esi
     d70:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     d73:	89 f3                	mov    %esi,%ebx
     d75:	eb cf                	jmp    d46 <gets+0x86>
      printf(1, "nooo\n");
     d77:	83 ec 08             	sub    $0x8,%esp
     d7a:	68 16 14 00 00       	push   $0x1416
     d7f:	6a 01                	push   $0x1
     d81:	e8 ca 02 00 00       	call   1050 <printf>
     d86:	83 c4 10             	add    $0x10,%esp
{
     d89:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
     d8b:	8d 75 e7             	lea    -0x19(%ebp),%esi
     d8e:	89 df                	mov    %ebx,%edi
     d90:	eb 2d                	jmp    dbf <gets+0xff>
     d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d98:	83 ec 04             	sub    $0x4,%esp
     d9b:	6a 01                	push   $0x1
     d9d:	56                   	push   %esi
     d9e:	6a 00                	push   $0x0
     da0:	e8 46 01 00 00       	call   eeb <read>
      if(cc < 1)
     da5:	83 c4 10             	add    $0x10,%esp
     da8:	85 c0                	test   %eax,%eax
     daa:	7e 1d                	jle    dc9 <gets+0x109>
      buf[i++] = c;
     dac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     db0:	8b 55 08             	mov    0x8(%ebp),%edx
     db3:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
     db7:	3c 0a                	cmp    $0xa,%al
     db9:	74 10                	je     dcb <gets+0x10b>
     dbb:	3c 0d                	cmp    $0xd,%al
     dbd:	74 0c                	je     dcb <gets+0x10b>
    for(i=0; i+1 < max; ){
     dbf:	89 fb                	mov    %edi,%ebx
     dc1:	83 c7 01             	add    $0x1,%edi
     dc4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
     dc7:	7c cf                	jl     d98 <gets+0xd8>
     dc9:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
     dcb:	8b 45 08             	mov    0x8(%ebp),%eax
     dce:	89 fb                	mov    %edi,%ebx
     dd0:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
     dd4:	85 db                	test   %ebx,%ebx
     dd6:	75 8a                	jne    d62 <gets+0xa2>
     dd8:	83 ec 0c             	sub    $0xc,%esp
     ddb:	68 0c 14 00 00       	push   $0x140c
     de0:	e8 3e 01 00 00       	call   f23 <unlink>
}
     de5:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
     de8:	83 c4 10             	add    $0x10,%esp
}
     deb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dee:	5b                   	pop    %ebx
     def:	5e                   	pop    %esi
     df0:	5f                   	pop    %edi
     df1:	5d                   	pop    %ebp
     df2:	c3                   	ret
  buf[i] = '\0';
     df3:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
     df6:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
     df9:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
     dfc:	57                   	push   %edi
     dfd:	e8 f9 00 00 00       	call   efb <close>
     e02:	83 c4 10             	add    $0x10,%esp
     e05:	eb d1                	jmp    dd8 <gets+0x118>
     e07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e0e:	00 
     e0f:	90                   	nop

00000e10 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	56                   	push   %esi
     e14:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e15:	83 ec 08             	sub    $0x8,%esp
     e18:	6a 00                	push   $0x0
     e1a:	ff 75 08             	push   0x8(%ebp)
     e1d:	e8 f1 00 00 00       	call   f13 <open>
  if(fd < 0)
     e22:	83 c4 10             	add    $0x10,%esp
     e25:	85 c0                	test   %eax,%eax
     e27:	78 27                	js     e50 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     e29:	83 ec 08             	sub    $0x8,%esp
     e2c:	ff 75 0c             	push   0xc(%ebp)
     e2f:	89 c3                	mov    %eax,%ebx
     e31:	50                   	push   %eax
     e32:	e8 f4 00 00 00       	call   f2b <fstat>
  close(fd);
     e37:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     e3a:	89 c6                	mov    %eax,%esi
  close(fd);
     e3c:	e8 ba 00 00 00       	call   efb <close>
  return r;
     e41:	83 c4 10             	add    $0x10,%esp
}
     e44:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e47:	89 f0                	mov    %esi,%eax
     e49:	5b                   	pop    %ebx
     e4a:	5e                   	pop    %esi
     e4b:	5d                   	pop    %ebp
     e4c:	c3                   	ret
     e4d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     e50:	be ff ff ff ff       	mov    $0xffffffff,%esi
     e55:	eb ed                	jmp    e44 <stat+0x34>
     e57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e5e:	00 
     e5f:	90                   	nop

00000e60 <atoi>:

int
atoi(const char *s)
{
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	53                   	push   %ebx
     e64:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e67:	0f be 02             	movsbl (%edx),%eax
     e6a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     e6d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     e70:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     e75:	77 1e                	ja     e95 <atoi+0x35>
     e77:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e7e:	00 
     e7f:	90                   	nop
    n = n*10 + *s++ - '0';
     e80:	83 c2 01             	add    $0x1,%edx
     e83:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     e86:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     e8a:	0f be 02             	movsbl (%edx),%eax
     e8d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     e90:	80 fb 09             	cmp    $0x9,%bl
     e93:	76 eb                	jbe    e80 <atoi+0x20>
  return n;
}
     e95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e98:	89 c8                	mov    %ecx,%eax
     e9a:	c9                   	leave
     e9b:	c3                   	ret
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ea0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	8b 45 10             	mov    0x10(%ebp),%eax
     ea7:	8b 55 08             	mov    0x8(%ebp),%edx
     eaa:	56                   	push   %esi
     eab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     eae:	85 c0                	test   %eax,%eax
     eb0:	7e 13                	jle    ec5 <memmove+0x25>
     eb2:	01 d0                	add    %edx,%eax
  dst = vdst;
     eb4:	89 d7                	mov    %edx,%edi
     eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ebd:	00 
     ebe:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     ec0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     ec1:	39 f8                	cmp    %edi,%eax
     ec3:	75 fb                	jne    ec0 <memmove+0x20>
  return vdst;
}
     ec5:	5e                   	pop    %esi
     ec6:	89 d0                	mov    %edx,%eax
     ec8:	5f                   	pop    %edi
     ec9:	5d                   	pop    %ebp
     eca:	c3                   	ret

00000ecb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     ecb:	b8 01 00 00 00       	mov    $0x1,%eax
     ed0:	cd 40                	int    $0x40
     ed2:	c3                   	ret

00000ed3 <exit>:
SYSCALL(exit)
     ed3:	b8 02 00 00 00       	mov    $0x2,%eax
     ed8:	cd 40                	int    $0x40
     eda:	c3                   	ret

00000edb <wait>:
SYSCALL(wait)
     edb:	b8 03 00 00 00       	mov    $0x3,%eax
     ee0:	cd 40                	int    $0x40
     ee2:	c3                   	ret

00000ee3 <pipe>:
SYSCALL(pipe)
     ee3:	b8 04 00 00 00       	mov    $0x4,%eax
     ee8:	cd 40                	int    $0x40
     eea:	c3                   	ret

00000eeb <read>:
SYSCALL(read)
     eeb:	b8 05 00 00 00       	mov    $0x5,%eax
     ef0:	cd 40                	int    $0x40
     ef2:	c3                   	ret

00000ef3 <write>:
SYSCALL(write)
     ef3:	b8 10 00 00 00       	mov    $0x10,%eax
     ef8:	cd 40                	int    $0x40
     efa:	c3                   	ret

00000efb <close>:
SYSCALL(close)
     efb:	b8 15 00 00 00       	mov    $0x15,%eax
     f00:	cd 40                	int    $0x40
     f02:	c3                   	ret

00000f03 <kill>:
SYSCALL(kill)
     f03:	b8 06 00 00 00       	mov    $0x6,%eax
     f08:	cd 40                	int    $0x40
     f0a:	c3                   	ret

00000f0b <exec>:
SYSCALL(exec)
     f0b:	b8 07 00 00 00       	mov    $0x7,%eax
     f10:	cd 40                	int    $0x40
     f12:	c3                   	ret

00000f13 <open>:
SYSCALL(open)
     f13:	b8 0f 00 00 00       	mov    $0xf,%eax
     f18:	cd 40                	int    $0x40
     f1a:	c3                   	ret

00000f1b <mknod>:
SYSCALL(mknod)
     f1b:	b8 11 00 00 00       	mov    $0x11,%eax
     f20:	cd 40                	int    $0x40
     f22:	c3                   	ret

00000f23 <unlink>:
SYSCALL(unlink)
     f23:	b8 12 00 00 00       	mov    $0x12,%eax
     f28:	cd 40                	int    $0x40
     f2a:	c3                   	ret

00000f2b <fstat>:
SYSCALL(fstat)
     f2b:	b8 08 00 00 00       	mov    $0x8,%eax
     f30:	cd 40                	int    $0x40
     f32:	c3                   	ret

00000f33 <link>:
SYSCALL(link)
     f33:	b8 13 00 00 00       	mov    $0x13,%eax
     f38:	cd 40                	int    $0x40
     f3a:	c3                   	ret

00000f3b <mkdir>:
SYSCALL(mkdir)
     f3b:	b8 14 00 00 00       	mov    $0x14,%eax
     f40:	cd 40                	int    $0x40
     f42:	c3                   	ret

00000f43 <chdir>:
SYSCALL(chdir)
     f43:	b8 09 00 00 00       	mov    $0x9,%eax
     f48:	cd 40                	int    $0x40
     f4a:	c3                   	ret

00000f4b <dup>:
SYSCALL(dup)
     f4b:	b8 0a 00 00 00       	mov    $0xa,%eax
     f50:	cd 40                	int    $0x40
     f52:	c3                   	ret

00000f53 <getpid>:
SYSCALL(getpid)
     f53:	b8 0b 00 00 00       	mov    $0xb,%eax
     f58:	cd 40                	int    $0x40
     f5a:	c3                   	ret

00000f5b <sbrk>:
SYSCALL(sbrk)
     f5b:	b8 0c 00 00 00       	mov    $0xc,%eax
     f60:	cd 40                	int    $0x40
     f62:	c3                   	ret

00000f63 <sleep>:
SYSCALL(sleep)
     f63:	b8 0d 00 00 00       	mov    $0xd,%eax
     f68:	cd 40                	int    $0x40
     f6a:	c3                   	ret

00000f6b <uptime>:
SYSCALL(uptime)
     f6b:	b8 0e 00 00 00       	mov    $0xe,%eax
     f70:	cd 40                	int    $0x40
     f72:	c3                   	ret

00000f73 <is_proc_valid>:
SYSCALL(is_proc_valid)
     f73:	b8 16 00 00 00       	mov    $0x16,%eax
     f78:	cd 40                	int    $0x40
     f7a:	c3                   	ret

00000f7b <get_proc_state>:
SYSCALL(get_proc_state)
     f7b:	b8 17 00 00 00       	mov    $0x17,%eax
     f80:	cd 40                	int    $0x40
     f82:	c3                   	ret

00000f83 <fill_proc_name>:
SYSCALL(fill_proc_name)
     f83:	b8 18 00 00 00       	mov    $0x18,%eax
     f88:	cd 40                	int    $0x40
     f8a:	c3                   	ret

00000f8b <get_proc_name>:
SYSCALL(get_proc_name)
     f8b:	b8 19 00 00 00       	mov    $0x19,%eax
     f90:	cd 40                	int    $0x40
     f92:	c3                   	ret

00000f93 <get_num_syscall>:
SYSCALL(get_num_syscall)
     f93:	b8 1a 00 00 00       	mov    $0x1a,%eax
     f98:	cd 40                	int    $0x40
     f9a:	c3                   	ret

00000f9b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
     f9b:	b8 1b 00 00 00       	mov    $0x1b,%eax
     fa0:	cd 40                	int    $0x40
     fa2:	c3                   	ret
     fa3:	66 90                	xchg   %ax,%ax
     fa5:	66 90                	xchg   %ax,%ax
     fa7:	66 90                	xchg   %ax,%ax
     fa9:	66 90                	xchg   %ax,%ax
     fab:	66 90                	xchg   %ax,%ax
     fad:	66 90                	xchg   %ax,%ax
     faf:	90                   	nop

00000fb0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	57                   	push   %edi
     fb4:	56                   	push   %esi
     fb5:	53                   	push   %ebx
     fb6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fb8:	89 d1                	mov    %edx,%ecx
{
     fba:	83 ec 3c             	sub    $0x3c,%esp
     fbd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     fc0:	85 d2                	test   %edx,%edx
     fc2:	0f 89 80 00 00 00    	jns    1048 <printint+0x98>
     fc8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     fcc:	74 7a                	je     1048 <printint+0x98>
    x = -xx;
     fce:	f7 d9                	neg    %ecx
    neg = 1;
     fd0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     fd5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     fd8:	31 f6                	xor    %esi,%esi
     fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     fe0:	89 c8                	mov    %ecx,%eax
     fe2:	31 d2                	xor    %edx,%edx
     fe4:	89 f7                	mov    %esi,%edi
     fe6:	f7 f3                	div    %ebx
     fe8:	8d 76 01             	lea    0x1(%esi),%esi
     feb:	0f b6 92 ac 14 00 00 	movzbl 0x14ac(%edx),%edx
     ff2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     ff6:	89 ca                	mov    %ecx,%edx
     ff8:	89 c1                	mov    %eax,%ecx
     ffa:	39 da                	cmp    %ebx,%edx
     ffc:	73 e2                	jae    fe0 <printint+0x30>
  if(neg)
     ffe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1001:	85 c0                	test   %eax,%eax
    1003:	74 07                	je     100c <printint+0x5c>
    buf[i++] = '-';
    1005:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    100a:	89 f7                	mov    %esi,%edi
    100c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    100f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1012:	01 df                	add    %ebx,%edi
    1014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    1018:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    101b:	83 ec 04             	sub    $0x4,%esp
    101e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1021:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1024:	6a 01                	push   $0x1
    1026:	50                   	push   %eax
    1027:	56                   	push   %esi
    1028:	e8 c6 fe ff ff       	call   ef3 <write>
  while(--i >= 0)
    102d:	89 f8                	mov    %edi,%eax
    102f:	83 c4 10             	add    $0x10,%esp
    1032:	83 ef 01             	sub    $0x1,%edi
    1035:	39 c3                	cmp    %eax,%ebx
    1037:	75 df                	jne    1018 <printint+0x68>
}
    1039:	8d 65 f4             	lea    -0xc(%ebp),%esp
    103c:	5b                   	pop    %ebx
    103d:	5e                   	pop    %esi
    103e:	5f                   	pop    %edi
    103f:	5d                   	pop    %ebp
    1040:	c3                   	ret
    1041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1048:	31 c0                	xor    %eax,%eax
    104a:	eb 89                	jmp    fd5 <printint+0x25>
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001050 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	53                   	push   %ebx
    1056:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1059:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    105c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    105f:	0f b6 1e             	movzbl (%esi),%ebx
    1062:	83 c6 01             	add    $0x1,%esi
    1065:	84 db                	test   %bl,%bl
    1067:	74 67                	je     10d0 <printf+0x80>
    1069:	8d 4d 10             	lea    0x10(%ebp),%ecx
    106c:	31 d2                	xor    %edx,%edx
    106e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1071:	eb 34                	jmp    10a7 <printf+0x57>
    1073:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1078:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    107b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1080:	83 f8 25             	cmp    $0x25,%eax
    1083:	74 18                	je     109d <printf+0x4d>
  write(fd, &c, 1);
    1085:	83 ec 04             	sub    $0x4,%esp
    1088:	8d 45 e7             	lea    -0x19(%ebp),%eax
    108b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    108e:	6a 01                	push   $0x1
    1090:	50                   	push   %eax
    1091:	57                   	push   %edi
    1092:	e8 5c fe ff ff       	call   ef3 <write>
    1097:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    109a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    109d:	0f b6 1e             	movzbl (%esi),%ebx
    10a0:	83 c6 01             	add    $0x1,%esi
    10a3:	84 db                	test   %bl,%bl
    10a5:	74 29                	je     10d0 <printf+0x80>
    c = fmt[i] & 0xff;
    10a7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10aa:	85 d2                	test   %edx,%edx
    10ac:	74 ca                	je     1078 <printf+0x28>
      }
    } else if(state == '%'){
    10ae:	83 fa 25             	cmp    $0x25,%edx
    10b1:	75 ea                	jne    109d <printf+0x4d>
      if(c == 'd'){
    10b3:	83 f8 25             	cmp    $0x25,%eax
    10b6:	0f 84 04 01 00 00    	je     11c0 <printf+0x170>
    10bc:	83 e8 63             	sub    $0x63,%eax
    10bf:	83 f8 15             	cmp    $0x15,%eax
    10c2:	77 1c                	ja     10e0 <printf+0x90>
    10c4:	ff 24 85 54 14 00 00 	jmp    *0x1454(,%eax,4)
    10cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    10d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10d3:	5b                   	pop    %ebx
    10d4:	5e                   	pop    %esi
    10d5:	5f                   	pop    %edi
    10d6:	5d                   	pop    %ebp
    10d7:	c3                   	ret
    10d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10df:	00 
  write(fd, &c, 1);
    10e0:	83 ec 04             	sub    $0x4,%esp
    10e3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    10e6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10ea:	6a 01                	push   $0x1
    10ec:	52                   	push   %edx
    10ed:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    10f0:	57                   	push   %edi
    10f1:	e8 fd fd ff ff       	call   ef3 <write>
    10f6:	83 c4 0c             	add    $0xc,%esp
    10f9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    10fc:	6a 01                	push   $0x1
    10fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1101:	52                   	push   %edx
    1102:	57                   	push   %edi
    1103:	e8 eb fd ff ff       	call   ef3 <write>
        putc(fd, c);
    1108:	83 c4 10             	add    $0x10,%esp
      state = 0;
    110b:	31 d2                	xor    %edx,%edx
    110d:	eb 8e                	jmp    109d <printf+0x4d>
    110f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1110:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1113:	83 ec 0c             	sub    $0xc,%esp
    1116:	b9 10 00 00 00       	mov    $0x10,%ecx
    111b:	8b 13                	mov    (%ebx),%edx
    111d:	6a 00                	push   $0x0
    111f:	89 f8                	mov    %edi,%eax
        ap++;
    1121:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1124:	e8 87 fe ff ff       	call   fb0 <printint>
        ap++;
    1129:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    112c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    112f:	31 d2                	xor    %edx,%edx
    1131:	e9 67 ff ff ff       	jmp    109d <printf+0x4d>
        s = (char*)*ap;
    1136:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1139:	8b 18                	mov    (%eax),%ebx
        ap++;
    113b:	83 c0 04             	add    $0x4,%eax
    113e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1141:	85 db                	test   %ebx,%ebx
    1143:	0f 84 87 00 00 00    	je     11d0 <printf+0x180>
        while(*s != 0){
    1149:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    114c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    114e:	84 c0                	test   %al,%al
    1150:	0f 84 47 ff ff ff    	je     109d <printf+0x4d>
    1156:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1159:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    115c:	89 de                	mov    %ebx,%esi
    115e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1166:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1169:	6a 01                	push   $0x1
    116b:	53                   	push   %ebx
    116c:	57                   	push   %edi
    116d:	e8 81 fd ff ff       	call   ef3 <write>
        while(*s != 0){
    1172:	0f b6 06             	movzbl (%esi),%eax
    1175:	83 c4 10             	add    $0x10,%esp
    1178:	84 c0                	test   %al,%al
    117a:	75 e4                	jne    1160 <printf+0x110>
      state = 0;
    117c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    117f:	31 d2                	xor    %edx,%edx
    1181:	e9 17 ff ff ff       	jmp    109d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1186:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1189:	83 ec 0c             	sub    $0xc,%esp
    118c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1191:	8b 13                	mov    (%ebx),%edx
    1193:	6a 01                	push   $0x1
    1195:	eb 88                	jmp    111f <printf+0xcf>
        putc(fd, *ap);
    1197:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    119a:	83 ec 04             	sub    $0x4,%esp
    119d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    11a0:	8b 03                	mov    (%ebx),%eax
        ap++;
    11a2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    11a5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11a8:	6a 01                	push   $0x1
    11aa:	52                   	push   %edx
    11ab:	57                   	push   %edi
    11ac:	e8 42 fd ff ff       	call   ef3 <write>
        ap++;
    11b1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    11b4:	83 c4 10             	add    $0x10,%esp
      state = 0;
    11b7:	31 d2                	xor    %edx,%edx
    11b9:	e9 df fe ff ff       	jmp    109d <printf+0x4d>
    11be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    11c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    11c9:	6a 01                	push   $0x1
    11cb:	e9 31 ff ff ff       	jmp    1101 <printf+0xb1>
    11d0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    11d5:	bb 1c 14 00 00       	mov    $0x141c,%ebx
    11da:	e9 77 ff ff ff       	jmp    1156 <printf+0x106>
    11df:	90                   	nop

000011e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11e1:	a1 08 1b 00 00       	mov    0x1b08,%eax
{
    11e6:	89 e5                	mov    %esp,%ebp
    11e8:	57                   	push   %edi
    11e9:	56                   	push   %esi
    11ea:	53                   	push   %ebx
    11eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    11ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11f8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11fa:	39 c8                	cmp    %ecx,%eax
    11fc:	73 32                	jae    1230 <free+0x50>
    11fe:	39 d1                	cmp    %edx,%ecx
    1200:	72 04                	jb     1206 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1202:	39 d0                	cmp    %edx,%eax
    1204:	72 32                	jb     1238 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1206:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1209:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    120c:	39 fa                	cmp    %edi,%edx
    120e:	74 30                	je     1240 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1210:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1213:	8b 50 04             	mov    0x4(%eax),%edx
    1216:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1219:	39 f1                	cmp    %esi,%ecx
    121b:	74 3a                	je     1257 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    121d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    121f:	5b                   	pop    %ebx
  freep = p;
    1220:	a3 08 1b 00 00       	mov    %eax,0x1b08
}
    1225:	5e                   	pop    %esi
    1226:	5f                   	pop    %edi
    1227:	5d                   	pop    %ebp
    1228:	c3                   	ret
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1230:	39 d0                	cmp    %edx,%eax
    1232:	72 04                	jb     1238 <free+0x58>
    1234:	39 d1                	cmp    %edx,%ecx
    1236:	72 ce                	jb     1206 <free+0x26>
{
    1238:	89 d0                	mov    %edx,%eax
    123a:	eb bc                	jmp    11f8 <free+0x18>
    123c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1240:	03 72 04             	add    0x4(%edx),%esi
    1243:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1246:	8b 10                	mov    (%eax),%edx
    1248:	8b 12                	mov    (%edx),%edx
    124a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    124d:	8b 50 04             	mov    0x4(%eax),%edx
    1250:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1253:	39 f1                	cmp    %esi,%ecx
    1255:	75 c6                	jne    121d <free+0x3d>
    p->s.size += bp->s.size;
    1257:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    125a:	a3 08 1b 00 00       	mov    %eax,0x1b08
    p->s.size += bp->s.size;
    125f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1262:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1265:	89 08                	mov    %ecx,(%eax)
}
    1267:	5b                   	pop    %ebx
    1268:	5e                   	pop    %esi
    1269:	5f                   	pop    %edi
    126a:	5d                   	pop    %ebp
    126b:	c3                   	ret
    126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001270 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	57                   	push   %edi
    1274:	56                   	push   %esi
    1275:	53                   	push   %ebx
    1276:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1279:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    127c:	8b 15 08 1b 00 00    	mov    0x1b08,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1282:	8d 78 07             	lea    0x7(%eax),%edi
    1285:	c1 ef 03             	shr    $0x3,%edi
    1288:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    128b:	85 d2                	test   %edx,%edx
    128d:	0f 84 8d 00 00 00    	je     1320 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1293:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1295:	8b 48 04             	mov    0x4(%eax),%ecx
    1298:	39 f9                	cmp    %edi,%ecx
    129a:	73 64                	jae    1300 <malloc+0x90>
  if(nu < 4096)
    129c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    12a1:	39 df                	cmp    %ebx,%edi
    12a3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    12a6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    12ad:	eb 0a                	jmp    12b9 <malloc+0x49>
    12af:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12b2:	8b 48 04             	mov    0x4(%eax),%ecx
    12b5:	39 f9                	cmp    %edi,%ecx
    12b7:	73 47                	jae    1300 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12b9:	89 c2                	mov    %eax,%edx
    12bb:	3b 05 08 1b 00 00    	cmp    0x1b08,%eax
    12c1:	75 ed                	jne    12b0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    12c3:	83 ec 0c             	sub    $0xc,%esp
    12c6:	56                   	push   %esi
    12c7:	e8 8f fc ff ff       	call   f5b <sbrk>
  if(p == (char*)-1)
    12cc:	83 c4 10             	add    $0x10,%esp
    12cf:	83 f8 ff             	cmp    $0xffffffff,%eax
    12d2:	74 1c                	je     12f0 <malloc+0x80>
  hp->s.size = nu;
    12d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12d7:	83 ec 0c             	sub    $0xc,%esp
    12da:	83 c0 08             	add    $0x8,%eax
    12dd:	50                   	push   %eax
    12de:	e8 fd fe ff ff       	call   11e0 <free>
  return freep;
    12e3:	8b 15 08 1b 00 00    	mov    0x1b08,%edx
      if((p = morecore(nunits)) == 0)
    12e9:	83 c4 10             	add    $0x10,%esp
    12ec:	85 d2                	test   %edx,%edx
    12ee:	75 c0                	jne    12b0 <malloc+0x40>
        return 0;
  }
}
    12f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    12f3:	31 c0                	xor    %eax,%eax
}
    12f5:	5b                   	pop    %ebx
    12f6:	5e                   	pop    %esi
    12f7:	5f                   	pop    %edi
    12f8:	5d                   	pop    %ebp
    12f9:	c3                   	ret
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1300:	39 cf                	cmp    %ecx,%edi
    1302:	74 4c                	je     1350 <malloc+0xe0>
        p->s.size -= nunits;
    1304:	29 f9                	sub    %edi,%ecx
    1306:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1309:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    130c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    130f:	89 15 08 1b 00 00    	mov    %edx,0x1b08
}
    1315:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1318:	83 c0 08             	add    $0x8,%eax
}
    131b:	5b                   	pop    %ebx
    131c:	5e                   	pop    %esi
    131d:	5f                   	pop    %edi
    131e:	5d                   	pop    %ebp
    131f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1320:	c7 05 08 1b 00 00 0c 	movl   $0x1b0c,0x1b08
    1327:	1b 00 00 
    base.s.size = 0;
    132a:	b8 0c 1b 00 00       	mov    $0x1b0c,%eax
    base.s.ptr = freep = prevp = &base;
    132f:	c7 05 0c 1b 00 00 0c 	movl   $0x1b0c,0x1b0c
    1336:	1b 00 00 
    base.s.size = 0;
    1339:	c7 05 10 1b 00 00 00 	movl   $0x0,0x1b10
    1340:	00 00 00 
    if(p->s.size >= nunits){
    1343:	e9 54 ff ff ff       	jmp    129c <malloc+0x2c>
    1348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    134f:	00 
        prevp->s.ptr = p->s.ptr;
    1350:	8b 08                	mov    (%eax),%ecx
    1352:	89 0a                	mov    %ecx,(%edx)
    1354:	eb b9                	jmp    130f <malloc+0x9f>
