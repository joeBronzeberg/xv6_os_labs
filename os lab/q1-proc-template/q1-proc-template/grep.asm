
_grep:     file format elf32-i386


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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3e:	00 
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
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 9e 01 00 00       	call   1f0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 a1 06 00 00       	call   6fb <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 a5 06 00 00       	call   713 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 78 0b 00 00       	push   $0xb78
  7f:	6a 01                	push   $0x1
  81:	e8 ca 07 00 00       	call   850 <printf>
      exit();
  86:	e8 48 06 00 00       	call   6d3 <exit>
  }
  exit();
  8b:	e8 43 06 00 00       	call   6d3 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 58 0b 00 00       	push   $0xb58
  97:	6a 02                	push   $0x2
  99:	e8 b2 07 00 00       	call   850 <printf>
    exit();
  9e:	e8 30 06 00 00       	call   6d3 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 43 01 00 00       	call   1f0 <grep>
    exit();
  ad:	e8 21 06 00 00       	call   6d3 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 7d 08             	mov    0x8(%ebp),%edi
  cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  cf:	0f b6 0f             	movzbl (%edi),%ecx
  d2:	84 c9                	test   %cl,%cl
  d4:	0f 84 96 00 00 00    	je     170 <matchhere+0xb0>
    return 1;
  if(re[1] == '*')
  da:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  de:	3c 2a                	cmp    $0x2a,%al
  e0:	74 2d                	je     10f <matchhere+0x4f>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e8:	0f b6 33             	movzbl (%ebx),%esi
  if(re[0] == '$' && re[1] == '\0')
  eb:	80 f9 24             	cmp    $0x24,%cl
  ee:	74 50                	je     140 <matchhere+0x80>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  f0:	89 f2                	mov    %esi,%edx
  f2:	84 d2                	test   %dl,%dl
  f4:	74 6e                	je     164 <matchhere+0xa4>
  f6:	80 f9 2e             	cmp    $0x2e,%cl
  f9:	75 65                	jne    160 <matchhere+0xa0>
    return matchhere(re+1, text+1);
  fb:	83 c3 01             	add    $0x1,%ebx
  fe:	83 c7 01             	add    $0x1,%edi
  if(re[0] == '\0')
 101:	84 c0                	test   %al,%al
 103:	74 6b                	je     170 <matchhere+0xb0>
{
 105:	89 c1                	mov    %eax,%ecx
  if(re[1] == '*')
 107:	0f b6 47 01          	movzbl 0x1(%edi),%eax
 10b:	3c 2a                	cmp    $0x2a,%al
 10d:	75 d9                	jne    e8 <matchhere+0x28>
    return matchstar(re[0], re+2, text);
 10f:	8d 77 02             	lea    0x2(%edi),%esi
 112:	0f be f9             	movsbl %cl,%edi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 115:	8d 76 00             	lea    0x0(%esi),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	53                   	push   %ebx
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 47                	jne    170 <matchhere+0xb0>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 13             	movsbl (%ebx),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 45                	je     175 <matchhere+0xb5>
 130:	83 c3 01             	add    $0x1,%ebx
 133:	39 fa                	cmp    %edi,%edx
 135:	74 e1                	je     118 <matchhere+0x58>
 137:	83 ff 2e             	cmp    $0x2e,%edi
 13a:	74 dc                	je     118 <matchhere+0x58>
 13c:	eb 37                	jmp    175 <matchhere+0xb5>
 13e:	66 90                	xchg   %ax,%ax
  if(re[0] == '$' && re[1] == '\0')
 140:	84 c0                	test   %al,%al
 142:	74 39                	je     17d <matchhere+0xbd>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 144:	89 f2                	mov    %esi,%edx
 146:	84 d2                	test   %dl,%dl
 148:	74 1a                	je     164 <matchhere+0xa4>
 14a:	80 fa 24             	cmp    $0x24,%dl
 14d:	75 15                	jne    164 <matchhere+0xa4>
    return matchhere(re+1, text+1);
 14f:	83 c3 01             	add    $0x1,%ebx
 152:	83 c7 01             	add    $0x1,%edi
{
 155:	89 c1                	mov    %eax,%ecx
 157:	eb ae                	jmp    107 <matchhere+0x47>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 160:	38 ca                	cmp    %cl,%dl
 162:	74 97                	je     fb <matchhere+0x3b>
}
 164:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 167:	31 c0                	xor    %eax,%eax
}
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret
 16e:	66 90                	xchg   %ax,%ax
    return 1;
 170:	b8 01 00 00 00       	mov    $0x1,%eax
}
 175:	8d 65 f4             	lea    -0xc(%ebp),%esp
 178:	5b                   	pop    %ebx
 179:	5e                   	pop    %esi
 17a:	5f                   	pop    %edi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret
    return *text == '\0';
 17d:	89 f0                	mov    %esi,%eax
 17f:	84 c0                	test   %al,%al
 181:	0f 94 c0             	sete   %al
 184:	0f b6 c0             	movzbl %al,%eax
 187:	eb ec                	jmp    175 <matchhere+0xb5>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <match>:
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	8b 5d 08             	mov    0x8(%ebp),%ebx
 198:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 19b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 19e:	75 11                	jne    1b1 <match+0x21>
 1a0:	eb 2e                	jmp    1d0 <match+0x40>
 1a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1a8:	83 c6 01             	add    $0x1,%esi
 1ab:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1af:	74 16                	je     1c7 <match+0x37>
    if(matchhere(re, text))
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	e8 05 ff ff ff       	call   c0 <matchhere>
 1bb:	83 c4 10             	add    $0x10,%esp
 1be:	85 c0                	test   %eax,%eax
 1c0:	74 e6                	je     1a8 <match+0x18>
      return 1;
 1c2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1ca:	5b                   	pop    %ebx
 1cb:	5e                   	pop    %esi
 1cc:	5d                   	pop    %ebp
 1cd:	c3                   	ret
 1ce:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1d0:	83 c3 01             	add    $0x1,%ebx
 1d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1d9:	5b                   	pop    %ebx
 1da:	5e                   	pop    %esi
 1db:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1dc:	e9 df fe ff ff       	jmp    c0 <matchhere>
 1e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e8:	00 
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <grep>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
  m = 0;
 1f4:	31 ff                	xor    %edi,%edi
{
 1f6:	56                   	push   %esi
 1f7:	53                   	push   %ebx
 1f8:	83 ec 1c             	sub    $0x1c,%esp
 1fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1fe:	89 7d e0             	mov    %edi,-0x20(%ebp)
    return matchhere(re+1, text);
 201:	8d 43 01             	lea    0x1(%ebx),%eax
 204:	89 45 dc             	mov    %eax,-0x24(%ebp)
 207:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20e:	00 
 20f:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 210:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 213:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	29 c8                	sub    %ecx,%eax
 21d:	50                   	push   %eax
 21e:	8d 81 a0 0f 00 00    	lea    0xfa0(%ecx),%eax
 224:	50                   	push   %eax
 225:	ff 75 0c             	push   0xc(%ebp)
 228:	e8 be 04 00 00       	call   6eb <read>
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	0f 8e fd 00 00 00    	jle    335 <grep+0x145>
    m += n;
 238:	01 45 e0             	add    %eax,-0x20(%ebp)
 23b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    buf[m] = '\0';
 23e:	bf a0 0f 00 00       	mov    $0xfa0,%edi
 243:	89 de                	mov    %ebx,%esi
 245:	c6 81 a0 0f 00 00 00 	movb   $0x0,0xfa0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 250:	83 ec 08             	sub    $0x8,%esp
 253:	6a 0a                	push   $0xa
 255:	57                   	push   %edi
 256:	e8 25 02 00 00       	call   480 <strchr>
 25b:	83 c4 10             	add    $0x10,%esp
 25e:	89 c2                	mov    %eax,%edx
 260:	85 c0                	test   %eax,%eax
 262:	0f 84 88 00 00 00    	je     2f0 <grep+0x100>
      *q = 0;
 268:	c6 02 00             	movb   $0x0,(%edx)
  if(re[0] == '^')
 26b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 26e:	74 58                	je     2c8 <grep+0xd8>
 270:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 273:	89 d3                	mov    %edx,%ebx
 275:	eb 12                	jmp    289 <grep+0x99>
 277:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27e:	00 
 27f:	90                   	nop
  }while(*text++ != '\0');
 280:	83 c7 01             	add    $0x1,%edi
 283:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 287:	74 37                	je     2c0 <grep+0xd0>
    if(matchhere(re, text))
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	57                   	push   %edi
 28d:	56                   	push   %esi
 28e:	e8 2d fe ff ff       	call   c0 <matchhere>
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	74 e6                	je     280 <grep+0x90>
        write(1, p, q+1 - p);
 29a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 29d:	89 da                	mov    %ebx,%edx
 29f:	8d 5b 01             	lea    0x1(%ebx),%ebx
 2a2:	89 d8                	mov    %ebx,%eax
 2a4:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2a7:	c6 02 0a             	movb   $0xa,(%edx)
        write(1, p, q+1 - p);
 2aa:	29 f8                	sub    %edi,%eax
 2ac:	50                   	push   %eax
 2ad:	57                   	push   %edi
 2ae:	89 df                	mov    %ebx,%edi
 2b0:	6a 01                	push   $0x1
 2b2:	e8 3c 04 00 00       	call   6f3 <write>
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	eb 94                	jmp    250 <grep+0x60>
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c0:	8d 7b 01             	lea    0x1(%ebx),%edi
      p = q+1;
 2c3:	eb 8b                	jmp    250 <grep+0x60>
 2c5:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 2c8:	83 ec 08             	sub    $0x8,%esp
 2cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 2ce:	57                   	push   %edi
 2cf:	ff 75 dc             	push   -0x24(%ebp)
 2d2:	e8 e9 fd ff ff       	call   c0 <matchhere>
        write(1, p, q+1 - p);
 2d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    return matchhere(re+1, text);
 2da:	83 c4 10             	add    $0x10,%esp
        write(1, p, q+1 - p);
 2dd:	8d 5a 01             	lea    0x1(%edx),%ebx
      if(match(pattern, p)){
 2e0:	85 c0                	test   %eax,%eax
 2e2:	75 be                	jne    2a2 <grep+0xb2>
        write(1, p, q+1 - p);
 2e4:	89 df                	mov    %ebx,%edi
 2e6:	e9 65 ff ff ff       	jmp    250 <grep+0x60>
 2eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(p == buf)
 2f0:	89 f3                	mov    %esi,%ebx
 2f2:	81 ff a0 0f 00 00    	cmp    $0xfa0,%edi
 2f8:	74 2f                	je     329 <grep+0x139>
    if(m > 0){
 2fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
 2fd:	85 c0                	test   %eax,%eax
 2ff:	0f 8e 0b ff ff ff    	jle    210 <grep+0x20>
      m -= p - buf;
 305:	89 f8                	mov    %edi,%eax
      memmove(buf, p, m);
 307:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 30a:	2d a0 0f 00 00       	sub    $0xfa0,%eax
 30f:	29 45 e0             	sub    %eax,-0x20(%ebp)
 312:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      memmove(buf, p, m);
 315:	51                   	push   %ecx
 316:	57                   	push   %edi
 317:	68 a0 0f 00 00       	push   $0xfa0
 31c:	e8 7f 03 00 00       	call   6a0 <memmove>
 321:	83 c4 10             	add    $0x10,%esp
 324:	e9 e7 fe ff ff       	jmp    210 <grep+0x20>
      m = 0;
 329:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 330:	e9 db fe ff ff       	jmp    210 <grep+0x20>
}
 335:	8d 65 f4             	lea    -0xc(%ebp),%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <matchstar>:
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 0c             	sub    $0xc,%esp
 349:	8b 5d 08             	mov    0x8(%ebp),%ebx
 34c:	8b 75 0c             	mov    0xc(%ebp),%esi
 34f:	8b 7d 10             	mov    0x10(%ebp),%edi
 352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 358:	83 ec 08             	sub    $0x8,%esp
 35b:	57                   	push   %edi
 35c:	56                   	push   %esi
 35d:	e8 5e fd ff ff       	call   c0 <matchhere>
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	75 1f                	jne    388 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 369:	0f be 17             	movsbl (%edi),%edx
 36c:	84 d2                	test   %dl,%dl
 36e:	74 0c                	je     37c <matchstar+0x3c>
 370:	83 c7 01             	add    $0x1,%edi
 373:	83 fb 2e             	cmp    $0x2e,%ebx
 376:	74 e0                	je     358 <matchstar+0x18>
 378:	39 da                	cmp    %ebx,%edx
 37a:	74 dc                	je     358 <matchstar+0x18>
}
 37c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37f:	5b                   	pop    %ebx
 380:	5e                   	pop    %esi
 381:	5f                   	pop    %edi
 382:	5d                   	pop    %ebp
 383:	c3                   	ret
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 388:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 390:	5b                   	pop    %ebx
 391:	5e                   	pop    %esi
 392:	5f                   	pop    %edi
 393:	5d                   	pop    %ebp
 394:	c3                   	ret
 395:	66 90                	xchg   %ax,%ax
 397:	66 90                	xchg   %ax,%ax
 399:	66 90                	xchg   %ax,%ax
 39b:	66 90                	xchg   %ax,%ax
 39d:	66 90                	xchg   %ax,%ax
 39f:	90                   	nop

000003a0 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 3a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a1:	31 c0                	xor    %eax,%eax
{
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	53                   	push   %ebx
 3a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strcpy+0x10>
    ;
  return os;
}
 3be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c1:	89 c8                	mov    %ecx,%eax
 3c3:	c9                   	leave
 3c4:	c3                   	ret
 3c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3cc:	00 
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
 3d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3da:	0f b6 02             	movzbl (%edx),%eax
 3dd:	84 c0                	test   %al,%al
 3df:	75 17                	jne    3f8 <strcmp+0x28>
 3e1:	eb 3a                	jmp    41d <strcmp+0x4d>
 3e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3ec:	83 c2 01             	add    $0x1,%edx
 3ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3f2:	84 c0                	test   %al,%al
 3f4:	74 1a                	je     410 <strcmp+0x40>
 3f6:	89 d9                	mov    %ebx,%ecx
 3f8:	0f b6 19             	movzbl (%ecx),%ebx
 3fb:	38 c3                	cmp    %al,%bl
 3fd:	74 e9                	je     3e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3ff:	29 d8                	sub    %ebx,%eax
}
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave
 405:	c3                   	ret
 406:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40d:	00 
 40e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 410:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 414:	31 c0                	xor    %eax,%eax
 416:	29 d8                	sub    %ebx,%eax
}
 418:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 41b:	c9                   	leave
 41c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 41d:	0f b6 19             	movzbl (%ecx),%ebx
 420:	31 c0                	xor    %eax,%eax
 422:	eb db                	jmp    3ff <strcmp+0x2f>
 424:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 42b:	00 
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <strlen>:

uint
strlen(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 436:	80 3a 00             	cmpb   $0x0,(%edx)
 439:	74 15                	je     450 <strlen+0x20>
 43b:	31 c0                	xor    %eax,%eax
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	83 c0 01             	add    $0x1,%eax
 443:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 447:	89 c1                	mov    %eax,%ecx
 449:	75 f5                	jne    440 <strlen+0x10>
    ;
  return n;
}
 44b:	89 c8                	mov    %ecx,%eax
 44d:	5d                   	pop    %ebp
 44e:	c3                   	ret
 44f:	90                   	nop
  for(n = 0; s[n]; n++)
 450:	31 c9                	xor    %ecx,%ecx
}
 452:	5d                   	pop    %ebp
 453:	89 c8                	mov    %ecx,%eax
 455:	c3                   	ret
 456:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45d:	00 
 45e:	66 90                	xchg   %ax,%ax

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 467:	8b 4d 10             	mov    0x10(%ebp),%ecx
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	89 d7                	mov    %edx,%edi
 46f:	fc                   	cld
 470:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 472:	8b 7d fc             	mov    -0x4(%ebp),%edi
 475:	89 d0                	mov    %edx,%eax
 477:	c9                   	leave
 478:	c3                   	ret
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 48a:	0f b6 10             	movzbl (%eax),%edx
 48d:	84 d2                	test   %dl,%dl
 48f:	75 12                	jne    4a3 <strchr+0x23>
 491:	eb 1d                	jmp    4b0 <strchr+0x30>
 493:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 498:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 49c:	83 c0 01             	add    $0x1,%eax
 49f:	84 d2                	test   %dl,%dl
 4a1:	74 0d                	je     4b0 <strchr+0x30>
    if(*s == c)
 4a3:	38 d1                	cmp    %dl,%cl
 4a5:	75 f1                	jne    498 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4b0:	31 c0                	xor    %eax,%eax
}
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret
 4b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4bb:	00 
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 34             	sub    $0x34,%esp
  count++;
 4c9:	8b 15 a0 13 00 00    	mov    0x13a0,%edx
 4cf:	8d 72 01             	lea    0x1(%edx),%esi
 4d2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4d5:	89 35 a0 13 00 00    	mov    %esi,0x13a0
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 4db:	6a 00                	push   $0x0
 4dd:	68 8e 0b 00 00       	push   $0xb8e
 4e2:	e8 2c 02 00 00       	call   713 <open>
  if (fd < 0) {
 4e7:	83 c4 10             	add    $0x10,%esp
 4ea:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4ed:	85 c0                	test   %eax,%eax
 4ef:	0f 88 82 00 00 00    	js     577 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 4f5:	0f 84 8e 00 00 00    	je     589 <gets+0xc9>
 4fb:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 4fd:	85 f6                	test   %esi,%esi
 4ff:	0f 84 ee 00 00 00    	je     5f3 <gets+0x133>
 505:	8d 76 00             	lea    0x0(%esi),%esi
 508:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 50b:	31 f6                	xor    %esi,%esi
 50d:	eb 2a                	jmp    539 <gets+0x79>
 50f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	8d 45 e7             	lea    -0x19(%ebp),%eax
 516:	6a 01                	push   $0x1
 518:	50                   	push   %eax
 519:	57                   	push   %edi
 51a:	e8 cc 01 00 00       	call   6eb <read>
        if(cc < 1)
 51f:	83 c4 10             	add    $0x10,%esp
 522:	85 c0                	test   %eax,%eax
 524:	7e 1d                	jle    543 <gets+0x83>
          break;
        buf[i++] = c;
 526:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 52a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 52d:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 531:	3c 0a                	cmp    $0xa,%al
 533:	74 3b                	je     570 <gets+0xb0>
 535:	3c 0d                	cmp    $0xd,%al
 537:	74 37                	je     570 <gets+0xb0>
      for(i=0; i+1 < max; ){
 539:	89 f3                	mov    %esi,%ebx
 53b:	83 c6 01             	add    $0x1,%esi
 53e:	3b 75 0c             	cmp    0xc(%ebp),%esi
 541:	7c cd                	jl     510 <gets+0x50>
 543:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 546:	83 ea 01             	sub    $0x1,%edx
 549:	73 bd                	jae    508 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 54e:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 551:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 555:	57                   	push   %edi
 556:	e8 a0 01 00 00       	call   6fb <close>
 55b:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 55e:	85 db                	test   %ebx,%ebx
 560:	74 76                	je     5d8 <gets+0x118>

  return buf;
}
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	8d 65 f4             	lea    -0xc(%ebp),%esp
 568:	5b                   	pop    %ebx
 569:	5e                   	pop    %esi
 56a:	5f                   	pop    %edi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret
 56d:	8d 76 00             	lea    0x0(%esi),%esi
 570:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 573:	89 f3                	mov    %esi,%ebx
 575:	eb cf                	jmp    546 <gets+0x86>
      printf(1, "nooo\n");
 577:	83 ec 08             	sub    $0x8,%esp
 57a:	68 98 0b 00 00       	push   $0xb98
 57f:	6a 01                	push   $0x1
 581:	e8 ca 02 00 00       	call   850 <printf>
 586:	83 c4 10             	add    $0x10,%esp
{
 589:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 58b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 58e:	89 df                	mov    %ebx,%edi
 590:	eb 2d                	jmp    5bf <gets+0xff>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 598:	83 ec 04             	sub    $0x4,%esp
 59b:	6a 01                	push   $0x1
 59d:	56                   	push   %esi
 59e:	6a 00                	push   $0x0
 5a0:	e8 46 01 00 00       	call   6eb <read>
      if(cc < 1)
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	85 c0                	test   %eax,%eax
 5aa:	7e 1d                	jle    5c9 <gets+0x109>
      buf[i++] = c;
 5ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5b0:	8b 55 08             	mov    0x8(%ebp),%edx
 5b3:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 5b7:	3c 0a                	cmp    $0xa,%al
 5b9:	74 10                	je     5cb <gets+0x10b>
 5bb:	3c 0d                	cmp    $0xd,%al
 5bd:	74 0c                	je     5cb <gets+0x10b>
    for(i=0; i+1 < max; ){
 5bf:	89 fb                	mov    %edi,%ebx
 5c1:	83 c7 01             	add    $0x1,%edi
 5c4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 5c7:	7c cf                	jl     598 <gets+0xd8>
 5c9:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	89 fb                	mov    %edi,%ebx
 5d0:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 5d4:	85 db                	test   %ebx,%ebx
 5d6:	75 8a                	jne    562 <gets+0xa2>
 5d8:	83 ec 0c             	sub    $0xc,%esp
 5db:	68 8e 0b 00 00       	push   $0xb8e
 5e0:	e8 3e 01 00 00       	call   723 <unlink>
}
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 5e8:	83 c4 10             	add    $0x10,%esp
}
 5eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ee:	5b                   	pop    %ebx
 5ef:	5e                   	pop    %esi
 5f0:	5f                   	pop    %edi
 5f1:	5d                   	pop    %ebp
 5f2:	c3                   	ret
  buf[i] = '\0';
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 5f6:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 5f9:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 5fc:	57                   	push   %edi
 5fd:	e8 f9 00 00 00       	call   6fb <close>
 602:	83 c4 10             	add    $0x10,%esp
 605:	eb d1                	jmp    5d8 <gets+0x118>
 607:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 60e:	00 
 60f:	90                   	nop

00000610 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 615:	83 ec 08             	sub    $0x8,%esp
 618:	6a 00                	push   $0x0
 61a:	ff 75 08             	push   0x8(%ebp)
 61d:	e8 f1 00 00 00       	call   713 <open>
  if(fd < 0)
 622:	83 c4 10             	add    $0x10,%esp
 625:	85 c0                	test   %eax,%eax
 627:	78 27                	js     650 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 629:	83 ec 08             	sub    $0x8,%esp
 62c:	ff 75 0c             	push   0xc(%ebp)
 62f:	89 c3                	mov    %eax,%ebx
 631:	50                   	push   %eax
 632:	e8 f4 00 00 00       	call   72b <fstat>
  close(fd);
 637:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 63a:	89 c6                	mov    %eax,%esi
  close(fd);
 63c:	e8 ba 00 00 00       	call   6fb <close>
  return r;
 641:	83 c4 10             	add    $0x10,%esp
}
 644:	8d 65 f8             	lea    -0x8(%ebp),%esp
 647:	89 f0                	mov    %esi,%eax
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 650:	be ff ff ff ff       	mov    $0xffffffff,%esi
 655:	eb ed                	jmp    644 <stat+0x34>
 657:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 65e:	00 
 65f:	90                   	nop

00000660 <atoi>:

int
atoi(const char *s)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 667:	0f be 02             	movsbl (%edx),%eax
 66a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 66d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 670:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 675:	77 1e                	ja     695 <atoi+0x35>
 677:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67e:	00 
 67f:	90                   	nop
    n = n*10 + *s++ - '0';
 680:	83 c2 01             	add    $0x1,%edx
 683:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 686:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 68a:	0f be 02             	movsbl (%edx),%eax
 68d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 690:	80 fb 09             	cmp    $0x9,%bl
 693:	76 eb                	jbe    680 <atoi+0x20>
  return n;
}
 695:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 698:	89 c8                	mov    %ecx,%eax
 69a:	c9                   	leave
 69b:	c3                   	ret
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	8b 45 10             	mov    0x10(%ebp),%eax
 6a7:	8b 55 08             	mov    0x8(%ebp),%edx
 6aa:	56                   	push   %esi
 6ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ae:	85 c0                	test   %eax,%eax
 6b0:	7e 13                	jle    6c5 <memmove+0x25>
 6b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 6b4:	89 d7                	mov    %edx,%edi
 6b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6bd:	00 
 6be:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 6c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6c1:	39 f8                	cmp    %edi,%eax
 6c3:	75 fb                	jne    6c0 <memmove+0x20>
  return vdst;
}
 6c5:	5e                   	pop    %esi
 6c6:	89 d0                	mov    %edx,%eax
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret

000006cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6cb:	b8 01 00 00 00       	mov    $0x1,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret

000006d3 <exit>:
SYSCALL(exit)
 6d3:	b8 02 00 00 00       	mov    $0x2,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret

000006db <wait>:
SYSCALL(wait)
 6db:	b8 03 00 00 00       	mov    $0x3,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret

000006e3 <pipe>:
SYSCALL(pipe)
 6e3:	b8 04 00 00 00       	mov    $0x4,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret

000006eb <read>:
SYSCALL(read)
 6eb:	b8 05 00 00 00       	mov    $0x5,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret

000006f3 <write>:
SYSCALL(write)
 6f3:	b8 10 00 00 00       	mov    $0x10,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret

000006fb <close>:
SYSCALL(close)
 6fb:	b8 15 00 00 00       	mov    $0x15,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret

00000703 <kill>:
SYSCALL(kill)
 703:	b8 06 00 00 00       	mov    $0x6,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret

0000070b <exec>:
SYSCALL(exec)
 70b:	b8 07 00 00 00       	mov    $0x7,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret

00000713 <open>:
SYSCALL(open)
 713:	b8 0f 00 00 00       	mov    $0xf,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret

0000071b <mknod>:
SYSCALL(mknod)
 71b:	b8 11 00 00 00       	mov    $0x11,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret

00000723 <unlink>:
SYSCALL(unlink)
 723:	b8 12 00 00 00       	mov    $0x12,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret

0000072b <fstat>:
SYSCALL(fstat)
 72b:	b8 08 00 00 00       	mov    $0x8,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret

00000733 <link>:
SYSCALL(link)
 733:	b8 13 00 00 00       	mov    $0x13,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret

0000073b <mkdir>:
SYSCALL(mkdir)
 73b:	b8 14 00 00 00       	mov    $0x14,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret

00000743 <chdir>:
SYSCALL(chdir)
 743:	b8 09 00 00 00       	mov    $0x9,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret

0000074b <dup>:
SYSCALL(dup)
 74b:	b8 0a 00 00 00       	mov    $0xa,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret

00000753 <getpid>:
SYSCALL(getpid)
 753:	b8 0b 00 00 00       	mov    $0xb,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret

0000075b <sbrk>:
SYSCALL(sbrk)
 75b:	b8 0c 00 00 00       	mov    $0xc,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret

00000763 <sleep>:
SYSCALL(sleep)
 763:	b8 0d 00 00 00       	mov    $0xd,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret

0000076b <uptime>:
SYSCALL(uptime)
 76b:	b8 0e 00 00 00       	mov    $0xe,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret

00000773 <is_proc_valid>:
SYSCALL(is_proc_valid)
 773:	b8 16 00 00 00       	mov    $0x16,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret

0000077b <get_proc_state>:
SYSCALL(get_proc_state)
 77b:	b8 17 00 00 00       	mov    $0x17,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret

00000783 <fill_proc_name>:
SYSCALL(fill_proc_name)
 783:	b8 18 00 00 00       	mov    $0x18,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret

0000078b <get_proc_name>:
SYSCALL(get_proc_name)
 78b:	b8 19 00 00 00       	mov    $0x19,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret

00000793 <get_num_syscall>:
SYSCALL(get_num_syscall)
 793:	b8 1a 00 00 00       	mov    $0x1a,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret

0000079b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 79b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret
 7a3:	66 90                	xchg   %ax,%ax
 7a5:	66 90                	xchg   %ax,%ax
 7a7:	66 90                	xchg   %ax,%ax
 7a9:	66 90                	xchg   %ax,%ax
 7ab:	66 90                	xchg   %ax,%ax
 7ad:	66 90                	xchg   %ax,%ax
 7af:	90                   	nop

000007b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7b8:	89 d1                	mov    %edx,%ecx
{
 7ba:	83 ec 3c             	sub    $0x3c,%esp
 7bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 7c0:	85 d2                	test   %edx,%edx
 7c2:	0f 89 80 00 00 00    	jns    848 <printint+0x98>
 7c8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7cc:	74 7a                	je     848 <printint+0x98>
    x = -xx;
 7ce:	f7 d9                	neg    %ecx
    neg = 1;
 7d0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 7d5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 7d8:	31 f6                	xor    %esi,%esi
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7e0:	89 c8                	mov    %ecx,%eax
 7e2:	31 d2                	xor    %edx,%edx
 7e4:	89 f7                	mov    %esi,%edi
 7e6:	f7 f3                	div    %ebx
 7e8:	8d 76 01             	lea    0x1(%esi),%esi
 7eb:	0f b6 92 00 0c 00 00 	movzbl 0xc00(%edx),%edx
 7f2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 7f6:	89 ca                	mov    %ecx,%edx
 7f8:	89 c1                	mov    %eax,%ecx
 7fa:	39 da                	cmp    %ebx,%edx
 7fc:	73 e2                	jae    7e0 <printint+0x30>
  if(neg)
 7fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 801:	85 c0                	test   %eax,%eax
 803:	74 07                	je     80c <printint+0x5c>
    buf[i++] = '-';
 805:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 80a:	89 f7                	mov    %esi,%edi
 80c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 80f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 812:	01 df                	add    %ebx,%edi
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 818:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 81b:	83 ec 04             	sub    $0x4,%esp
 81e:	88 45 d7             	mov    %al,-0x29(%ebp)
 821:	8d 45 d7             	lea    -0x29(%ebp),%eax
 824:	6a 01                	push   $0x1
 826:	50                   	push   %eax
 827:	56                   	push   %esi
 828:	e8 c6 fe ff ff       	call   6f3 <write>
  while(--i >= 0)
 82d:	89 f8                	mov    %edi,%eax
 82f:	83 c4 10             	add    $0x10,%esp
 832:	83 ef 01             	sub    $0x1,%edi
 835:	39 c3                	cmp    %eax,%ebx
 837:	75 df                	jne    818 <printint+0x68>
}
 839:	8d 65 f4             	lea    -0xc(%ebp),%esp
 83c:	5b                   	pop    %ebx
 83d:	5e                   	pop    %esi
 83e:	5f                   	pop    %edi
 83f:	5d                   	pop    %ebp
 840:	c3                   	ret
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 848:	31 c0                	xor    %eax,%eax
 84a:	eb 89                	jmp    7d5 <printint+0x25>
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 859:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 85c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 85f:	0f b6 1e             	movzbl (%esi),%ebx
 862:	83 c6 01             	add    $0x1,%esi
 865:	84 db                	test   %bl,%bl
 867:	74 67                	je     8d0 <printf+0x80>
 869:	8d 4d 10             	lea    0x10(%ebp),%ecx
 86c:	31 d2                	xor    %edx,%edx
 86e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 871:	eb 34                	jmp    8a7 <printf+0x57>
 873:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 878:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 87b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 880:	83 f8 25             	cmp    $0x25,%eax
 883:	74 18                	je     89d <printf+0x4d>
  write(fd, &c, 1);
 885:	83 ec 04             	sub    $0x4,%esp
 888:	8d 45 e7             	lea    -0x19(%ebp),%eax
 88b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 88e:	6a 01                	push   $0x1
 890:	50                   	push   %eax
 891:	57                   	push   %edi
 892:	e8 5c fe ff ff       	call   6f3 <write>
 897:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 89a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 89d:	0f b6 1e             	movzbl (%esi),%ebx
 8a0:	83 c6 01             	add    $0x1,%esi
 8a3:	84 db                	test   %bl,%bl
 8a5:	74 29                	je     8d0 <printf+0x80>
    c = fmt[i] & 0xff;
 8a7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8aa:	85 d2                	test   %edx,%edx
 8ac:	74 ca                	je     878 <printf+0x28>
      }
    } else if(state == '%'){
 8ae:	83 fa 25             	cmp    $0x25,%edx
 8b1:	75 ea                	jne    89d <printf+0x4d>
      if(c == 'd'){
 8b3:	83 f8 25             	cmp    $0x25,%eax
 8b6:	0f 84 04 01 00 00    	je     9c0 <printf+0x170>
 8bc:	83 e8 63             	sub    $0x63,%eax
 8bf:	83 f8 15             	cmp    $0x15,%eax
 8c2:	77 1c                	ja     8e0 <printf+0x90>
 8c4:	ff 24 85 a8 0b 00 00 	jmp    *0xba8(,%eax,4)
 8cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d3:	5b                   	pop    %ebx
 8d4:	5e                   	pop    %esi
 8d5:	5f                   	pop    %edi
 8d6:	5d                   	pop    %ebp
 8d7:	c3                   	ret
 8d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8df:	00 
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
 8e3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8e6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8ea:	6a 01                	push   $0x1
 8ec:	52                   	push   %edx
 8ed:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 8f0:	57                   	push   %edi
 8f1:	e8 fd fd ff ff       	call   6f3 <write>
 8f6:	83 c4 0c             	add    $0xc,%esp
 8f9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 8fc:	6a 01                	push   $0x1
 8fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 901:	52                   	push   %edx
 902:	57                   	push   %edi
 903:	e8 eb fd ff ff       	call   6f3 <write>
        putc(fd, c);
 908:	83 c4 10             	add    $0x10,%esp
      state = 0;
 90b:	31 d2                	xor    %edx,%edx
 90d:	eb 8e                	jmp    89d <printf+0x4d>
 90f:	90                   	nop
        printint(fd, *ap, 16, 0);
 910:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 913:	83 ec 0c             	sub    $0xc,%esp
 916:	b9 10 00 00 00       	mov    $0x10,%ecx
 91b:	8b 13                	mov    (%ebx),%edx
 91d:	6a 00                	push   $0x0
 91f:	89 f8                	mov    %edi,%eax
        ap++;
 921:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 924:	e8 87 fe ff ff       	call   7b0 <printint>
        ap++;
 929:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 92c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92f:	31 d2                	xor    %edx,%edx
 931:	e9 67 ff ff ff       	jmp    89d <printf+0x4d>
        s = (char*)*ap;
 936:	8b 45 d0             	mov    -0x30(%ebp),%eax
 939:	8b 18                	mov    (%eax),%ebx
        ap++;
 93b:	83 c0 04             	add    $0x4,%eax
 93e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 941:	85 db                	test   %ebx,%ebx
 943:	0f 84 87 00 00 00    	je     9d0 <printf+0x180>
        while(*s != 0){
 949:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 94c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 94e:	84 c0                	test   %al,%al
 950:	0f 84 47 ff ff ff    	je     89d <printf+0x4d>
 956:	8d 55 e7             	lea    -0x19(%ebp),%edx
 959:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 95c:	89 de                	mov    %ebx,%esi
 95e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 960:	83 ec 04             	sub    $0x4,%esp
 963:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 966:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 969:	6a 01                	push   $0x1
 96b:	53                   	push   %ebx
 96c:	57                   	push   %edi
 96d:	e8 81 fd ff ff       	call   6f3 <write>
        while(*s != 0){
 972:	0f b6 06             	movzbl (%esi),%eax
 975:	83 c4 10             	add    $0x10,%esp
 978:	84 c0                	test   %al,%al
 97a:	75 e4                	jne    960 <printf+0x110>
      state = 0;
 97c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 97f:	31 d2                	xor    %edx,%edx
 981:	e9 17 ff ff ff       	jmp    89d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 986:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 989:	83 ec 0c             	sub    $0xc,%esp
 98c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 991:	8b 13                	mov    (%ebx),%edx
 993:	6a 01                	push   $0x1
 995:	eb 88                	jmp    91f <printf+0xcf>
        putc(fd, *ap);
 997:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 99a:	83 ec 04             	sub    $0x4,%esp
 99d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 9a0:	8b 03                	mov    (%ebx),%eax
        ap++;
 9a2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 9a5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9a8:	6a 01                	push   $0x1
 9aa:	52                   	push   %edx
 9ab:	57                   	push   %edi
 9ac:	e8 42 fd ff ff       	call   6f3 <write>
        ap++;
 9b1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 9b4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9b7:	31 d2                	xor    %edx,%edx
 9b9:	e9 df fe ff ff       	jmp    89d <printf+0x4d>
 9be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 9c0:	83 ec 04             	sub    $0x4,%esp
 9c3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 9c9:	6a 01                	push   $0x1
 9cb:	e9 31 ff ff ff       	jmp    901 <printf+0xb1>
 9d0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 9d5:	bb 9e 0b 00 00       	mov    $0xb9e,%ebx
 9da:	e9 77 ff ff ff       	jmp    956 <printf+0x106>
 9df:	90                   	nop

000009e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e1:	a1 a4 13 00 00       	mov    0x13a4,%eax
{
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	57                   	push   %edi
 9e9:	56                   	push   %esi
 9ea:	53                   	push   %ebx
 9eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9fa:	39 c8                	cmp    %ecx,%eax
 9fc:	73 32                	jae    a30 <free+0x50>
 9fe:	39 d1                	cmp    %edx,%ecx
 a00:	72 04                	jb     a06 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a02:	39 d0                	cmp    %edx,%eax
 a04:	72 32                	jb     a38 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a06:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a09:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a0c:	39 fa                	cmp    %edi,%edx
 a0e:	74 30                	je     a40 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a10:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a13:	8b 50 04             	mov    0x4(%eax),%edx
 a16:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a19:	39 f1                	cmp    %esi,%ecx
 a1b:	74 3a                	je     a57 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a1d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a1f:	5b                   	pop    %ebx
  freep = p;
 a20:	a3 a4 13 00 00       	mov    %eax,0x13a4
}
 a25:	5e                   	pop    %esi
 a26:	5f                   	pop    %edi
 a27:	5d                   	pop    %ebp
 a28:	c3                   	ret
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a30:	39 d0                	cmp    %edx,%eax
 a32:	72 04                	jb     a38 <free+0x58>
 a34:	39 d1                	cmp    %edx,%ecx
 a36:	72 ce                	jb     a06 <free+0x26>
{
 a38:	89 d0                	mov    %edx,%eax
 a3a:	eb bc                	jmp    9f8 <free+0x18>
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a40:	03 72 04             	add    0x4(%edx),%esi
 a43:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a46:	8b 10                	mov    (%eax),%edx
 a48:	8b 12                	mov    (%edx),%edx
 a4a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a4d:	8b 50 04             	mov    0x4(%eax),%edx
 a50:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a53:	39 f1                	cmp    %esi,%ecx
 a55:	75 c6                	jne    a1d <free+0x3d>
    p->s.size += bp->s.size;
 a57:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a5a:	a3 a4 13 00 00       	mov    %eax,0x13a4
    p->s.size += bp->s.size;
 a5f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a62:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a65:	89 08                	mov    %ecx,(%eax)
}
 a67:	5b                   	pop    %ebx
 a68:	5e                   	pop    %esi
 a69:	5f                   	pop    %edi
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	57                   	push   %edi
 a74:	56                   	push   %esi
 a75:	53                   	push   %ebx
 a76:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a7c:	8b 15 a4 13 00 00    	mov    0x13a4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a82:	8d 78 07             	lea    0x7(%eax),%edi
 a85:	c1 ef 03             	shr    $0x3,%edi
 a88:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a8b:	85 d2                	test   %edx,%edx
 a8d:	0f 84 8d 00 00 00    	je     b20 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a93:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a95:	8b 48 04             	mov    0x4(%eax),%ecx
 a98:	39 f9                	cmp    %edi,%ecx
 a9a:	73 64                	jae    b00 <malloc+0x90>
  if(nu < 4096)
 a9c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 aa1:	39 df                	cmp    %ebx,%edi
 aa3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 aa6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 aad:	eb 0a                	jmp    ab9 <malloc+0x49>
 aaf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ab2:	8b 48 04             	mov    0x4(%eax),%ecx
 ab5:	39 f9                	cmp    %edi,%ecx
 ab7:	73 47                	jae    b00 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab9:	89 c2                	mov    %eax,%edx
 abb:	3b 05 a4 13 00 00    	cmp    0x13a4,%eax
 ac1:	75 ed                	jne    ab0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 ac3:	83 ec 0c             	sub    $0xc,%esp
 ac6:	56                   	push   %esi
 ac7:	e8 8f fc ff ff       	call   75b <sbrk>
  if(p == (char*)-1)
 acc:	83 c4 10             	add    $0x10,%esp
 acf:	83 f8 ff             	cmp    $0xffffffff,%eax
 ad2:	74 1c                	je     af0 <malloc+0x80>
  hp->s.size = nu;
 ad4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ad7:	83 ec 0c             	sub    $0xc,%esp
 ada:	83 c0 08             	add    $0x8,%eax
 add:	50                   	push   %eax
 ade:	e8 fd fe ff ff       	call   9e0 <free>
  return freep;
 ae3:	8b 15 a4 13 00 00    	mov    0x13a4,%edx
      if((p = morecore(nunits)) == 0)
 ae9:	83 c4 10             	add    $0x10,%esp
 aec:	85 d2                	test   %edx,%edx
 aee:	75 c0                	jne    ab0 <malloc+0x40>
        return 0;
  }
}
 af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 af3:	31 c0                	xor    %eax,%eax
}
 af5:	5b                   	pop    %ebx
 af6:	5e                   	pop    %esi
 af7:	5f                   	pop    %edi
 af8:	5d                   	pop    %ebp
 af9:	c3                   	ret
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b00:	39 cf                	cmp    %ecx,%edi
 b02:	74 4c                	je     b50 <malloc+0xe0>
        p->s.size -= nunits;
 b04:	29 f9                	sub    %edi,%ecx
 b06:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b09:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b0c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b0f:	89 15 a4 13 00 00    	mov    %edx,0x13a4
}
 b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b18:	83 c0 08             	add    $0x8,%eax
}
 b1b:	5b                   	pop    %ebx
 b1c:	5e                   	pop    %esi
 b1d:	5f                   	pop    %edi
 b1e:	5d                   	pop    %ebp
 b1f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 b20:	c7 05 a4 13 00 00 a8 	movl   $0x13a8,0x13a4
 b27:	13 00 00 
    base.s.size = 0;
 b2a:	b8 a8 13 00 00       	mov    $0x13a8,%eax
    base.s.ptr = freep = prevp = &base;
 b2f:	c7 05 a8 13 00 00 a8 	movl   $0x13a8,0x13a8
 b36:	13 00 00 
    base.s.size = 0;
 b39:	c7 05 ac 13 00 00 00 	movl   $0x0,0x13ac
 b40:	00 00 00 
    if(p->s.size >= nunits){
 b43:	e9 54 ff ff ff       	jmp    a9c <malloc+0x2c>
 b48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 b4f:	00 
        prevp->s.ptr = p->s.ptr;
 b50:	8b 08                	mov    (%eax),%ecx
 b52:	89 0a                	mov    %ecx,(%edx)
 b54:	eb b9                	jmp    b0f <malloc+0x9f>
