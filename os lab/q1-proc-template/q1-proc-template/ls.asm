
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 21 06 00 00       	call   663 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 30 0b 00 00       	push   $0xb30
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 0f 06 00 00       	call   663 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 4f 03 00 00       	call   3c0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 d8 0e 00 00       	push   $0xed8
  b5:	e8 76 05 00 00       	call   630 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb d8 0e 00 00       	mov    $0xed8,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 d8 0e 00 00       	add    $0xed8,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 07 03 00 00       	call   3f0 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret
  f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fc:	00 
  fd:	8d 76 00             	lea    0x0(%esi),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 8c 05 00 00       	call   6a3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 8e 01 00 00    	js     2b0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 87 05 00 00       	call   6bb <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 b1 01 00 00    	js     2f0 <ls+0x1f0>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 54                	je     1a0 <ls+0xa0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	75 37                	jne    189 <ls+0x89>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 158:	83 ec 0c             	sub    $0xc,%esp
 15b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 161:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 167:	57                   	push   %edi
 168:	e8 f3 fe ff ff       	call   60 <fmtname>
 16d:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 173:	59                   	pop    %ecx
 174:	5f                   	pop    %edi
 175:	52                   	push   %edx
 176:	56                   	push   %esi
 177:	6a 02                	push   $0x2
 179:	50                   	push   %eax
 17a:	68 10 0b 00 00       	push   $0xb10
 17f:	6a 01                	push   $0x1
 181:	e8 5a 06 00 00       	call   7e0 <printf>
    break;
 186:	83 c4 20             	add    $0x20,%esp
  close(fd);
 189:	83 ec 0c             	sub    $0xc,%esp
 18c:	53                   	push   %ebx
 18d:	e8 f9 04 00 00       	call   68b <close>
 192:	83 c4 10             	add    $0x10,%esp
}
 195:	8d 65 f4             	lea    -0xc(%ebp),%esp
 198:	5b                   	pop    %ebx
 199:	5e                   	pop    %esi
 19a:	5f                   	pop    %edi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a0:	83 ec 0c             	sub    $0xc,%esp
 1a3:	57                   	push   %edi
 1a4:	e8 17 02 00 00       	call   3c0 <strlen>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	83 c0 10             	add    $0x10,%eax
 1af:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b4:	0f 87 16 01 00 00    	ja     2d0 <ls+0x1d0>
    strcpy(buf, path);
 1ba:	83 ec 08             	sub    $0x8,%esp
 1bd:	57                   	push   %edi
 1be:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1c4:	57                   	push   %edi
 1c5:	e8 66 01 00 00       	call   330 <strcpy>
    p = buf+strlen(buf);
 1ca:	89 3c 24             	mov    %edi,(%esp)
 1cd:	e8 ee 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1d2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1d7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1da:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1e0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1e6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1f9:	6a 10                	push   $0x10
 1fb:	50                   	push   %eax
 1fc:	53                   	push   %ebx
 1fd:	e8 79 04 00 00       	call   67b <read>
 202:	83 c4 10             	add    $0x10,%esp
 205:	83 f8 10             	cmp    $0x10,%eax
 208:	0f 85 7b ff ff ff    	jne    189 <ls+0x89>
      if(de.inum == 0)
 20e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 215:	00 
 216:	74 d8                	je     1f0 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 221:	6a 0e                	push   $0xe
 223:	50                   	push   %eax
 224:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 22a:	e8 01 04 00 00       	call   630 <memmove>
      p[DIRSIZ] = 0;
 22f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 235:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 239:	58                   	pop    %eax
 23a:	5a                   	pop    %edx
 23b:	56                   	push   %esi
 23c:	57                   	push   %edi
 23d:	e8 5e 03 00 00       	call   5a0 <stat>
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	0f 88 cb 00 00 00    	js     318 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 24d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 253:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 259:	83 ec 0c             	sub    $0xc,%esp
 25c:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 263:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 269:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 26f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 275:	57                   	push   %edi
 276:	e8 e5 fd ff ff       	call   60 <fmtname>
 27b:	5a                   	pop    %edx
 27c:	59                   	pop    %ecx
 27d:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 283:	51                   	push   %ecx
 284:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 28a:	52                   	push   %edx
 28b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 291:	50                   	push   %eax
 292:	68 10 0b 00 00       	push   $0xb10
 297:	6a 01                	push   $0x1
 299:	e8 42 05 00 00       	call   7e0 <printf>
 29e:	83 c4 20             	add    $0x20,%esp
 2a1:	e9 4a ff ff ff       	jmp    1f0 <ls+0xf0>
 2a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ad:	00 
 2ae:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	57                   	push   %edi
 2b4:	68 e8 0a 00 00       	push   $0xae8
 2b9:	6a 02                	push   $0x2
 2bb:	e8 20 05 00 00       	call   7e0 <printf>
    return;
 2c0:	83 c4 10             	add    $0x10,%esp
}
 2c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret
 2cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	68 1d 0b 00 00       	push   $0xb1d
 2d8:	6a 01                	push   $0x1
 2da:	e8 01 05 00 00       	call   7e0 <printf>
      break;
 2df:	83 c4 10             	add    $0x10,%esp
 2e2:	e9 a2 fe ff ff       	jmp    189 <ls+0x89>
 2e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2ee:	00 
 2ef:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	57                   	push   %edi
 2f4:	68 fc 0a 00 00       	push   $0xafc
 2f9:	6a 02                	push   $0x2
 2fb:	e8 e0 04 00 00       	call   7e0 <printf>
    close(fd);
 300:	89 1c 24             	mov    %ebx,(%esp)
 303:	e8 83 03 00 00       	call   68b <close>
    return;
 308:	83 c4 10             	add    $0x10,%esp
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret
 313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 318:	83 ec 04             	sub    $0x4,%esp
 31b:	57                   	push   %edi
 31c:	68 fc 0a 00 00       	push   $0xafc
 321:	6a 01                	push   $0x1
 323:	e8 b8 04 00 00       	call   7e0 <printf>
        continue;
 328:	83 c4 10             	add    $0x10,%esp
 32b:	e9 c0 fe ff ff       	jmp    1f0 <ls+0xf0>

00000330 <strcpy>:

static int count = 0;

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 331:	31 c0                	xor    %eax,%eax
{
 333:	89 e5                	mov    %esp,%ebp
 335:	53                   	push   %ebx
 336:	8b 4d 08             	mov    0x8(%ebp),%ecx
 339:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 340:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 344:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 347:	83 c0 01             	add    $0x1,%eax
 34a:	84 d2                	test   %dl,%dl
 34c:	75 f2                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 34e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 351:	89 c8                	mov    %ecx,%eax
 353:	c9                   	leave
 354:	c3                   	ret
 355:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35c:	00 
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	84 c0                	test   %al,%al
 36f:	75 17                	jne    388 <strcmp+0x28>
 371:	eb 3a                	jmp    3ad <strcmp+0x4d>
 373:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 378:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 37c:	83 c2 01             	add    $0x1,%edx
 37f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 382:	84 c0                	test   %al,%al
 384:	74 1a                	je     3a0 <strcmp+0x40>
 386:	89 d9                	mov    %ebx,%ecx
 388:	0f b6 19             	movzbl (%ecx),%ebx
 38b:	38 c3                	cmp    %al,%bl
 38d:	74 e9                	je     378 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 38f:	29 d8                	sub    %ebx,%eax
}
 391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 394:	c9                   	leave
 395:	c3                   	ret
 396:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39d:	00 
 39e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 3a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3a4:	31 c0                	xor    %eax,%eax
 3a6:	29 d8                	sub    %ebx,%eax
}
 3a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ab:	c9                   	leave
 3ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 3ad:	0f b6 19             	movzbl (%ecx),%ebx
 3b0:	31 c0                	xor    %eax,%eax
 3b2:	eb db                	jmp    38f <strcmp+0x2f>
 3b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bb:	00 
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3c6:	80 3a 00             	cmpb   $0x0,(%edx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c0 01             	add    $0x1,%eax
 3d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	89 c8                	mov    %ecx,%eax
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret
 3df:	90                   	nop
  for(n = 0; s[n]; n++)
 3e0:	31 c9                	xor    %ecx,%ecx
}
 3e2:	5d                   	pop    %ebp
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	c3                   	ret
 3e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ed:	00 
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	8b 7d fc             	mov    -0x4(%ebp),%edi
 405:	89 d0                	mov    %edx,%eax
 407:	c9                   	leave
 408:	c3                   	ret
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	84 d2                	test   %dl,%dl
 431:	74 0d                	je     440 <strchr+0x30>
    if(*s == c)
 433:	38 d1                	cmp    %dl,%cl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char*)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret
 444:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 44b:	00 
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 34             	sub    $0x34,%esp
  count++;
 459:	8b 15 e8 0e 00 00    	mov    0xee8,%edx
 45f:	8d 72 01             	lea    0x1(%edx),%esi
 462:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 465:	89 35 e8 0e 00 00    	mov    %esi,0xee8
  int i=0, cc, temp = count;
  char c;

  int fd = open("input.txt", O_RDONLY);
 46b:	6a 00                	push   $0x0
 46d:	68 32 0b 00 00       	push   $0xb32
 472:	e8 2c 02 00 00       	call   6a3 <open>
  if (fd < 0) {
 477:	83 c4 10             	add    $0x10,%esp
 47a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 47d:	85 c0                	test   %eax,%eax
 47f:	0f 88 82 00 00 00    	js     507 <gets+0xb7>
      printf(1, "nooo\n");
      fd = 0;
  }

  if(fd == 0){
 485:	0f 84 8e 00 00 00    	je     519 <gets+0xc9>
 48b:	89 c7                	mov    %eax,%edi
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
  } else {
    while(temp--){
 48d:	85 f6                	test   %esi,%esi
 48f:	0f 84 ee 00 00 00    	je     583 <gets+0x133>
 495:	8d 76 00             	lea    0x0(%esi),%esi
 498:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 49b:	31 f6                	xor    %esi,%esi
 49d:	eb 2a                	jmp    4c9 <gets+0x79>
 49f:	90                   	nop
      for(i=0; i+1 < max; ){
        cc = read(fd, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a6:	6a 01                	push   $0x1
 4a8:	50                   	push   %eax
 4a9:	57                   	push   %edi
 4aa:	e8 cc 01 00 00       	call   67b <read>
        if(cc < 1)
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	85 c0                	test   %eax,%eax
 4b4:	7e 1d                	jle    4d3 <gets+0x83>
          break;
        buf[i++] = c;
 4b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4bd:	88 44 31 ff          	mov    %al,-0x1(%ecx,%esi,1)
        if(c == '\n' || c == '\r')
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 3b                	je     500 <gets+0xb0>
 4c5:	3c 0d                	cmp    $0xd,%al
 4c7:	74 37                	je     500 <gets+0xb0>
      for(i=0; i+1 < max; ){
 4c9:	89 f3                	mov    %esi,%ebx
 4cb:	83 c6 01             	add    $0x1,%esi
 4ce:	3b 75 0c             	cmp    0xc(%ebp),%esi
 4d1:	7c cd                	jl     4a0 <gets+0x50>
 4d3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    while(temp--){
 4d6:	83 ea 01             	sub    $0x1,%edx
 4d9:	73 bd                	jae    498 <gets+0x48>
          break;
      }
    }
  }

  buf[i] = '\0';
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 4de:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 4e1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  if(fd) close(fd);
 4e5:	57                   	push   %edi
 4e6:	e8 a0 01 00 00       	call   68b <close>
 4eb:	83 c4 10             	add    $0x10,%esp

  if(i == 0) unlink("input.txt");
 4ee:	85 db                	test   %ebx,%ebx
 4f0:	74 76                	je     568 <gets+0x118>

  return buf;
}
 4f2:	8b 45 08             	mov    0x8(%ebp),%eax
 4f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f8:	5b                   	pop    %ebx
 4f9:	5e                   	pop    %esi
 4fa:	5f                   	pop    %edi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 503:	89 f3                	mov    %esi,%ebx
 505:	eb cf                	jmp    4d6 <gets+0x86>
      printf(1, "nooo\n");
 507:	83 ec 08             	sub    $0x8,%esp
 50a:	68 3c 0b 00 00       	push   $0xb3c
 50f:	6a 01                	push   $0x1
 511:	e8 ca 02 00 00       	call   7e0 <printf>
 516:	83 c4 10             	add    $0x10,%esp
{
 519:	31 db                	xor    %ebx,%ebx
      cc = read(fd, &c, 1);
 51b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 51e:	89 df                	mov    %ebx,%edi
 520:	eb 2d                	jmp    54f <gets+0xff>
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 528:	83 ec 04             	sub    $0x4,%esp
 52b:	6a 01                	push   $0x1
 52d:	56                   	push   %esi
 52e:	6a 00                	push   $0x0
 530:	e8 46 01 00 00       	call   67b <read>
      if(cc < 1)
 535:	83 c4 10             	add    $0x10,%esp
 538:	85 c0                	test   %eax,%eax
 53a:	7e 1d                	jle    559 <gets+0x109>
      buf[i++] = c;
 53c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 540:	8b 55 08             	mov    0x8(%ebp),%edx
 543:	88 44 3a ff          	mov    %al,-0x1(%edx,%edi,1)
      if(c == '\n' || c == '\r')
 547:	3c 0a                	cmp    $0xa,%al
 549:	74 10                	je     55b <gets+0x10b>
 54b:	3c 0d                	cmp    $0xd,%al
 54d:	74 0c                	je     55b <gets+0x10b>
    for(i=0; i+1 < max; ){
 54f:	89 fb                	mov    %edi,%ebx
 551:	83 c7 01             	add    $0x1,%edi
 554:	3b 7d 0c             	cmp    0xc(%ebp),%edi
 557:	7c cf                	jl     528 <gets+0xd8>
 559:	89 df                	mov    %ebx,%edi
  buf[i] = '\0';
 55b:	8b 45 08             	mov    0x8(%ebp),%eax
 55e:	89 fb                	mov    %edi,%ebx
 560:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
  if(i == 0) unlink("input.txt");
 564:	85 db                	test   %ebx,%ebx
 566:	75 8a                	jne    4f2 <gets+0xa2>
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	68 32 0b 00 00       	push   $0xb32
 570:	e8 3e 01 00 00       	call   6b3 <unlink>
}
 575:	8b 45 08             	mov    0x8(%ebp),%eax
  if(i == 0) unlink("input.txt");
 578:	83 c4 10             	add    $0x10,%esp
}
 57b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57e:	5b                   	pop    %ebx
 57f:	5e                   	pop    %esi
 580:	5f                   	pop    %edi
 581:	5d                   	pop    %ebp
 582:	c3                   	ret
  buf[i] = '\0';
 583:	8b 45 08             	mov    0x8(%ebp),%eax
  if(fd) close(fd);
 586:	83 ec 0c             	sub    $0xc,%esp
  buf[i] = '\0';
 589:	c6 00 00             	movb   $0x0,(%eax)
  if(fd) close(fd);
 58c:	57                   	push   %edi
 58d:	e8 f9 00 00 00       	call   68b <close>
 592:	83 c4 10             	add    $0x10,%esp
 595:	eb d1                	jmp    568 <gets+0x118>
 597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59e:	00 
 59f:	90                   	nop

000005a0 <stat>:
// }


int
stat(const char *n, struct stat *st)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	56                   	push   %esi
 5a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5a5:	83 ec 08             	sub    $0x8,%esp
 5a8:	6a 00                	push   $0x0
 5aa:	ff 75 08             	push   0x8(%ebp)
 5ad:	e8 f1 00 00 00       	call   6a3 <open>
  if(fd < 0)
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	85 c0                	test   %eax,%eax
 5b7:	78 27                	js     5e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 5b9:	83 ec 08             	sub    $0x8,%esp
 5bc:	ff 75 0c             	push   0xc(%ebp)
 5bf:	89 c3                	mov    %eax,%ebx
 5c1:	50                   	push   %eax
 5c2:	e8 f4 00 00 00       	call   6bb <fstat>
  close(fd);
 5c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 5ca:	89 c6                	mov    %eax,%esi
  close(fd);
 5cc:	e8 ba 00 00 00       	call   68b <close>
  return r;
 5d1:	83 c4 10             	add    $0x10,%esp
}
 5d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d7:	89 f0                	mov    %esi,%eax
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5e5:	eb ed                	jmp    5d4 <stat+0x34>
 5e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ee:	00 
 5ef:	90                   	nop

000005f0 <atoi>:

int
atoi(const char *s)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5f7:	0f be 02             	movsbl (%edx),%eax
 5fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 600:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 605:	77 1e                	ja     625 <atoi+0x35>
 607:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 60e:	00 
 60f:	90                   	nop
    n = n*10 + *s++ - '0';
 610:	83 c2 01             	add    $0x1,%edx
 613:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 616:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 61a:	0f be 02             	movsbl (%edx),%eax
 61d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 620:	80 fb 09             	cmp    $0x9,%bl
 623:	76 eb                	jbe    610 <atoi+0x20>
  return n;
}
 625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 628:	89 c8                	mov    %ecx,%eax
 62a:	c9                   	leave
 62b:	c3                   	ret
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	8b 45 10             	mov    0x10(%ebp),%eax
 637:	8b 55 08             	mov    0x8(%ebp),%edx
 63a:	56                   	push   %esi
 63b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 63e:	85 c0                	test   %eax,%eax
 640:	7e 13                	jle    655 <memmove+0x25>
 642:	01 d0                	add    %edx,%eax
  dst = vdst;
 644:	89 d7                	mov    %edx,%edi
 646:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 64d:	00 
 64e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 650:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 651:	39 f8                	cmp    %edi,%eax
 653:	75 fb                	jne    650 <memmove+0x20>
  return vdst;
}
 655:	5e                   	pop    %esi
 656:	89 d0                	mov    %edx,%eax
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret

0000065b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 65b:	b8 01 00 00 00       	mov    $0x1,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret

00000663 <exit>:
SYSCALL(exit)
 663:	b8 02 00 00 00       	mov    $0x2,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret

0000066b <wait>:
SYSCALL(wait)
 66b:	b8 03 00 00 00       	mov    $0x3,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret

00000673 <pipe>:
SYSCALL(pipe)
 673:	b8 04 00 00 00       	mov    $0x4,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret

0000067b <read>:
SYSCALL(read)
 67b:	b8 05 00 00 00       	mov    $0x5,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret

00000683 <write>:
SYSCALL(write)
 683:	b8 10 00 00 00       	mov    $0x10,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret

0000068b <close>:
SYSCALL(close)
 68b:	b8 15 00 00 00       	mov    $0x15,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret

00000693 <kill>:
SYSCALL(kill)
 693:	b8 06 00 00 00       	mov    $0x6,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret

0000069b <exec>:
SYSCALL(exec)
 69b:	b8 07 00 00 00       	mov    $0x7,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret

000006a3 <open>:
SYSCALL(open)
 6a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret

000006ab <mknod>:
SYSCALL(mknod)
 6ab:	b8 11 00 00 00       	mov    $0x11,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret

000006b3 <unlink>:
SYSCALL(unlink)
 6b3:	b8 12 00 00 00       	mov    $0x12,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret

000006bb <fstat>:
SYSCALL(fstat)
 6bb:	b8 08 00 00 00       	mov    $0x8,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret

000006c3 <link>:
SYSCALL(link)
 6c3:	b8 13 00 00 00       	mov    $0x13,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret

000006cb <mkdir>:
SYSCALL(mkdir)
 6cb:	b8 14 00 00 00       	mov    $0x14,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret

000006d3 <chdir>:
SYSCALL(chdir)
 6d3:	b8 09 00 00 00       	mov    $0x9,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret

000006db <dup>:
SYSCALL(dup)
 6db:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret

000006e3 <getpid>:
SYSCALL(getpid)
 6e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret

000006eb <sbrk>:
SYSCALL(sbrk)
 6eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret

000006f3 <sleep>:
SYSCALL(sleep)
 6f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret

000006fb <uptime>:
SYSCALL(uptime)
 6fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret

00000703 <is_proc_valid>:
SYSCALL(is_proc_valid)
 703:	b8 16 00 00 00       	mov    $0x16,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret

0000070b <get_proc_state>:
SYSCALL(get_proc_state)
 70b:	b8 17 00 00 00       	mov    $0x17,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret

00000713 <fill_proc_name>:
SYSCALL(fill_proc_name)
 713:	b8 18 00 00 00       	mov    $0x18,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret

0000071b <get_proc_name>:
SYSCALL(get_proc_name)
 71b:	b8 19 00 00 00       	mov    $0x19,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret

00000723 <get_num_syscall>:
SYSCALL(get_num_syscall)
 723:	b8 1a 00 00 00       	mov    $0x1a,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret

0000072b <get_num_timer_interrupts>:
SYSCALL(get_num_timer_interrupts)
 72b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret
 733:	66 90                	xchg   %ax,%ax
 735:	66 90                	xchg   %ax,%ax
 737:	66 90                	xchg   %ax,%ax
 739:	66 90                	xchg   %ax,%ax
 73b:	66 90                	xchg   %ax,%ax
 73d:	66 90                	xchg   %ax,%ax
 73f:	90                   	nop

00000740 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 748:	89 d1                	mov    %edx,%ecx
{
 74a:	83 ec 3c             	sub    $0x3c,%esp
 74d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 750:	85 d2                	test   %edx,%edx
 752:	0f 89 80 00 00 00    	jns    7d8 <printint+0x98>
 758:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 75c:	74 7a                	je     7d8 <printint+0x98>
    x = -xx;
 75e:	f7 d9                	neg    %ecx
    neg = 1;
 760:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 765:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 768:	31 f6                	xor    %esi,%esi
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 770:	89 c8                	mov    %ecx,%eax
 772:	31 d2                	xor    %edx,%edx
 774:	89 f7                	mov    %esi,%edi
 776:	f7 f3                	div    %ebx
 778:	8d 76 01             	lea    0x1(%esi),%esi
 77b:	0f b6 92 a4 0b 00 00 	movzbl 0xba4(%edx),%edx
 782:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 786:	89 ca                	mov    %ecx,%edx
 788:	89 c1                	mov    %eax,%ecx
 78a:	39 da                	cmp    %ebx,%edx
 78c:	73 e2                	jae    770 <printint+0x30>
  if(neg)
 78e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 791:	85 c0                	test   %eax,%eax
 793:	74 07                	je     79c <printint+0x5c>
    buf[i++] = '-';
 795:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 79a:	89 f7                	mov    %esi,%edi
 79c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 79f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 7a2:	01 df                	add    %ebx,%edi
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 7a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 7ab:	83 ec 04             	sub    $0x4,%esp
 7ae:	88 45 d7             	mov    %al,-0x29(%ebp)
 7b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 7b4:	6a 01                	push   $0x1
 7b6:	50                   	push   %eax
 7b7:	56                   	push   %esi
 7b8:	e8 c6 fe ff ff       	call   683 <write>
  while(--i >= 0)
 7bd:	89 f8                	mov    %edi,%eax
 7bf:	83 c4 10             	add    $0x10,%esp
 7c2:	83 ef 01             	sub    $0x1,%edi
 7c5:	39 c3                	cmp    %eax,%ebx
 7c7:	75 df                	jne    7a8 <printint+0x68>
}
 7c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cc:	5b                   	pop    %ebx
 7cd:	5e                   	pop    %esi
 7ce:	5f                   	pop    %edi
 7cf:	5d                   	pop    %ebp
 7d0:	c3                   	ret
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7d8:	31 c0                	xor    %eax,%eax
 7da:	eb 89                	jmp    765 <printint+0x25>
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 7ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 7ef:	0f b6 1e             	movzbl (%esi),%ebx
 7f2:	83 c6 01             	add    $0x1,%esi
 7f5:	84 db                	test   %bl,%bl
 7f7:	74 67                	je     860 <printf+0x80>
 7f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 7fc:	31 d2                	xor    %edx,%edx
 7fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 801:	eb 34                	jmp    837 <printf+0x57>
 803:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 808:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 80b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 810:	83 f8 25             	cmp    $0x25,%eax
 813:	74 18                	je     82d <printf+0x4d>
  write(fd, &c, 1);
 815:	83 ec 04             	sub    $0x4,%esp
 818:	8d 45 e7             	lea    -0x19(%ebp),%eax
 81b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 81e:	6a 01                	push   $0x1
 820:	50                   	push   %eax
 821:	57                   	push   %edi
 822:	e8 5c fe ff ff       	call   683 <write>
 827:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 82a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 82d:	0f b6 1e             	movzbl (%esi),%ebx
 830:	83 c6 01             	add    $0x1,%esi
 833:	84 db                	test   %bl,%bl
 835:	74 29                	je     860 <printf+0x80>
    c = fmt[i] & 0xff;
 837:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 83a:	85 d2                	test   %edx,%edx
 83c:	74 ca                	je     808 <printf+0x28>
      }
    } else if(state == '%'){
 83e:	83 fa 25             	cmp    $0x25,%edx
 841:	75 ea                	jne    82d <printf+0x4d>
      if(c == 'd'){
 843:	83 f8 25             	cmp    $0x25,%eax
 846:	0f 84 04 01 00 00    	je     950 <printf+0x170>
 84c:	83 e8 63             	sub    $0x63,%eax
 84f:	83 f8 15             	cmp    $0x15,%eax
 852:	77 1c                	ja     870 <printf+0x90>
 854:	ff 24 85 4c 0b 00 00 	jmp    *0xb4c(,%eax,4)
 85b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 860:	8d 65 f4             	lea    -0xc(%ebp),%esp
 863:	5b                   	pop    %ebx
 864:	5e                   	pop    %esi
 865:	5f                   	pop    %edi
 866:	5d                   	pop    %ebp
 867:	c3                   	ret
 868:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 86f:	00 
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
 873:	8d 55 e7             	lea    -0x19(%ebp),%edx
 876:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 87a:	6a 01                	push   $0x1
 87c:	52                   	push   %edx
 87d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 880:	57                   	push   %edi
 881:	e8 fd fd ff ff       	call   683 <write>
 886:	83 c4 0c             	add    $0xc,%esp
 889:	88 5d e7             	mov    %bl,-0x19(%ebp)
 88c:	6a 01                	push   $0x1
 88e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 891:	52                   	push   %edx
 892:	57                   	push   %edi
 893:	e8 eb fd ff ff       	call   683 <write>
        putc(fd, c);
 898:	83 c4 10             	add    $0x10,%esp
      state = 0;
 89b:	31 d2                	xor    %edx,%edx
 89d:	eb 8e                	jmp    82d <printf+0x4d>
 89f:	90                   	nop
        printint(fd, *ap, 16, 0);
 8a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 8ab:	8b 13                	mov    (%ebx),%edx
 8ad:	6a 00                	push   $0x0
 8af:	89 f8                	mov    %edi,%eax
        ap++;
 8b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 8b4:	e8 87 fe ff ff       	call   740 <printint>
        ap++;
 8b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8bf:	31 d2                	xor    %edx,%edx
 8c1:	e9 67 ff ff ff       	jmp    82d <printf+0x4d>
        s = (char*)*ap;
 8c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8c9:	8b 18                	mov    (%eax),%ebx
        ap++;
 8cb:	83 c0 04             	add    $0x4,%eax
 8ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8d1:	85 db                	test   %ebx,%ebx
 8d3:	0f 84 87 00 00 00    	je     960 <printf+0x180>
        while(*s != 0){
 8d9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8dc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8de:	84 c0                	test   %al,%al
 8e0:	0f 84 47 ff ff ff    	je     82d <printf+0x4d>
 8e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8e9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8ec:	89 de                	mov    %ebx,%esi
 8ee:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 8f0:	83 ec 04             	sub    $0x4,%esp
 8f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 8f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8f9:	6a 01                	push   $0x1
 8fb:	53                   	push   %ebx
 8fc:	57                   	push   %edi
 8fd:	e8 81 fd ff ff       	call   683 <write>
        while(*s != 0){
 902:	0f b6 06             	movzbl (%esi),%eax
 905:	83 c4 10             	add    $0x10,%esp
 908:	84 c0                	test   %al,%al
 90a:	75 e4                	jne    8f0 <printf+0x110>
      state = 0;
 90c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 90f:	31 d2                	xor    %edx,%edx
 911:	e9 17 ff ff ff       	jmp    82d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 916:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 919:	83 ec 0c             	sub    $0xc,%esp
 91c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 921:	8b 13                	mov    (%ebx),%edx
 923:	6a 01                	push   $0x1
 925:	eb 88                	jmp    8af <printf+0xcf>
        putc(fd, *ap);
 927:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 92a:	83 ec 04             	sub    $0x4,%esp
 92d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 930:	8b 03                	mov    (%ebx),%eax
        ap++;
 932:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 935:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 938:	6a 01                	push   $0x1
 93a:	52                   	push   %edx
 93b:	57                   	push   %edi
 93c:	e8 42 fd ff ff       	call   683 <write>
        ap++;
 941:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 944:	83 c4 10             	add    $0x10,%esp
      state = 0;
 947:	31 d2                	xor    %edx,%edx
 949:	e9 df fe ff ff       	jmp    82d <printf+0x4d>
 94e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 950:	83 ec 04             	sub    $0x4,%esp
 953:	88 5d e7             	mov    %bl,-0x19(%ebp)
 956:	8d 55 e7             	lea    -0x19(%ebp),%edx
 959:	6a 01                	push   $0x1
 95b:	e9 31 ff ff ff       	jmp    891 <printf+0xb1>
 960:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 965:	bb 42 0b 00 00       	mov    $0xb42,%ebx
 96a:	e9 77 ff ff ff       	jmp    8e6 <printf+0x106>
 96f:	90                   	nop

00000970 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 970:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 971:	a1 ec 0e 00 00       	mov    0xeec,%eax
{
 976:	89 e5                	mov    %esp,%ebp
 978:	57                   	push   %edi
 979:	56                   	push   %esi
 97a:	53                   	push   %ebx
 97b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 97e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 988:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 98a:	39 c8                	cmp    %ecx,%eax
 98c:	73 32                	jae    9c0 <free+0x50>
 98e:	39 d1                	cmp    %edx,%ecx
 990:	72 04                	jb     996 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 992:	39 d0                	cmp    %edx,%eax
 994:	72 32                	jb     9c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 996:	8b 73 fc             	mov    -0x4(%ebx),%esi
 999:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 99c:	39 fa                	cmp    %edi,%edx
 99e:	74 30                	je     9d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9a3:	8b 50 04             	mov    0x4(%eax),%edx
 9a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9a9:	39 f1                	cmp    %esi,%ecx
 9ab:	74 3a                	je     9e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9ad:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9af:	5b                   	pop    %ebx
  freep = p;
 9b0:	a3 ec 0e 00 00       	mov    %eax,0xeec
}
 9b5:	5e                   	pop    %esi
 9b6:	5f                   	pop    %edi
 9b7:	5d                   	pop    %ebp
 9b8:	c3                   	ret
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c0:	39 d0                	cmp    %edx,%eax
 9c2:	72 04                	jb     9c8 <free+0x58>
 9c4:	39 d1                	cmp    %edx,%ecx
 9c6:	72 ce                	jb     996 <free+0x26>
{
 9c8:	89 d0                	mov    %edx,%eax
 9ca:	eb bc                	jmp    988 <free+0x18>
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9d0:	03 72 04             	add    0x4(%edx),%esi
 9d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d6:	8b 10                	mov    (%eax),%edx
 9d8:	8b 12                	mov    (%edx),%edx
 9da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9dd:	8b 50 04             	mov    0x4(%eax),%edx
 9e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9e3:	39 f1                	cmp    %esi,%ecx
 9e5:	75 c6                	jne    9ad <free+0x3d>
    p->s.size += bp->s.size;
 9e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9ea:	a3 ec 0e 00 00       	mov    %eax,0xeec
    p->s.size += bp->s.size;
 9ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9f2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9f5:	89 08                	mov    %ecx,(%eax)
}
 9f7:	5b                   	pop    %ebx
 9f8:	5e                   	pop    %esi
 9f9:	5f                   	pop    %edi
 9fa:	5d                   	pop    %ebp
 9fb:	c3                   	ret
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	57                   	push   %edi
 a04:	56                   	push   %esi
 a05:	53                   	push   %ebx
 a06:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a0c:	8b 15 ec 0e 00 00    	mov    0xeec,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a12:	8d 78 07             	lea    0x7(%eax),%edi
 a15:	c1 ef 03             	shr    $0x3,%edi
 a18:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a1b:	85 d2                	test   %edx,%edx
 a1d:	0f 84 8d 00 00 00    	je     ab0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a23:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a25:	8b 48 04             	mov    0x4(%eax),%ecx
 a28:	39 f9                	cmp    %edi,%ecx
 a2a:	73 64                	jae    a90 <malloc+0x90>
  if(nu < 4096)
 a2c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a31:	39 df                	cmp    %ebx,%edi
 a33:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a36:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a3d:	eb 0a                	jmp    a49 <malloc+0x49>
 a3f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a42:	8b 48 04             	mov    0x4(%eax),%ecx
 a45:	39 f9                	cmp    %edi,%ecx
 a47:	73 47                	jae    a90 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a49:	89 c2                	mov    %eax,%edx
 a4b:	3b 05 ec 0e 00 00    	cmp    0xeec,%eax
 a51:	75 ed                	jne    a40 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	56                   	push   %esi
 a57:	e8 8f fc ff ff       	call   6eb <sbrk>
  if(p == (char*)-1)
 a5c:	83 c4 10             	add    $0x10,%esp
 a5f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a62:	74 1c                	je     a80 <malloc+0x80>
  hp->s.size = nu;
 a64:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a67:	83 ec 0c             	sub    $0xc,%esp
 a6a:	83 c0 08             	add    $0x8,%eax
 a6d:	50                   	push   %eax
 a6e:	e8 fd fe ff ff       	call   970 <free>
  return freep;
 a73:	8b 15 ec 0e 00 00    	mov    0xeec,%edx
      if((p = morecore(nunits)) == 0)
 a79:	83 c4 10             	add    $0x10,%esp
 a7c:	85 d2                	test   %edx,%edx
 a7e:	75 c0                	jne    a40 <malloc+0x40>
        return 0;
  }
}
 a80:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a83:	31 c0                	xor    %eax,%eax
}
 a85:	5b                   	pop    %ebx
 a86:	5e                   	pop    %esi
 a87:	5f                   	pop    %edi
 a88:	5d                   	pop    %ebp
 a89:	c3                   	ret
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a90:	39 cf                	cmp    %ecx,%edi
 a92:	74 4c                	je     ae0 <malloc+0xe0>
        p->s.size -= nunits;
 a94:	29 f9                	sub    %edi,%ecx
 a96:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a99:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a9c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a9f:	89 15 ec 0e 00 00    	mov    %edx,0xeec
}
 aa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 aa8:	83 c0 08             	add    $0x8,%eax
}
 aab:	5b                   	pop    %ebx
 aac:	5e                   	pop    %esi
 aad:	5f                   	pop    %edi
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 ab0:	c7 05 ec 0e 00 00 f0 	movl   $0xef0,0xeec
 ab7:	0e 00 00 
    base.s.size = 0;
 aba:	b8 f0 0e 00 00       	mov    $0xef0,%eax
    base.s.ptr = freep = prevp = &base;
 abf:	c7 05 f0 0e 00 00 f0 	movl   $0xef0,0xef0
 ac6:	0e 00 00 
    base.s.size = 0;
 ac9:	c7 05 f4 0e 00 00 00 	movl   $0x0,0xef4
 ad0:	00 00 00 
    if(p->s.size >= nunits){
 ad3:	e9 54 ff ff ff       	jmp    a2c <malloc+0x2c>
 ad8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 adf:	00 
        prevp->s.ptr = p->s.ptr;
 ae0:	8b 08                	mov    (%eax),%ecx
 ae2:	89 0a                	mov    %ecx,(%edx)
 ae4:	eb b9                	jmp    a9f <malloc+0x9f>
