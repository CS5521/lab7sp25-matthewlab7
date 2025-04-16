
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 40 0e 00 00       	add    $0xe40,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 40 0e 00 00       	add    $0xe40,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 10 0b 00 00 	movl   $0xb10,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 40 0e 00 	movl   $0xe40,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 2f 05 00 00       	call   5d4 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 16 0b 00 	movl   $0xb16,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 78 06 00 00       	call   744 <printf>
    exit();
  cc:	e8 eb 04 00 00       	call   5bc <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 26 0b 00 	movl   $0xb26,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 43 06 00 00       	call   744 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 33 0b 00 	movl   $0xb33,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 91 04 00 00       	call   5bc <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 a2 04 00 00       	call   5fc <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 34 0b 00 	movl   $0xb34,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 b5 05 00 00       	call   744 <printf>
      exit();
 18f:	e8 28 04 00 00       	call   5bc <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 22 04 00 00       	call   5e4 <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 e3 03 00 00       	call   5bc <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 bf 02 00 00       	call   5d4 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 82 02 00 00       	call   5fc <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 78 02 00 00       	call   614 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 3a 02 00 00       	call   5e4 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <ps>:

void
ps()
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 445:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 09 02 00 00       	call   65c <getpinfo>
 453:	83 f8 ff             	cmp    $0xffffffff,%eax
 456:	0f 84 4d 01 00 00    	je     5a9 <ps+0x170>
    return;
  int i = 0;
 45c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 463:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 466:	89 d0                	mov    %edx,%eax
 468:	c1 e0 03             	shl    $0x3,%eax
 46b:	01 d0                	add    %edx,%eax
 46d:	c1 e0 02             	shl    $0x2,%eax
 470:	8d 7d e8             	lea    -0x18(%ebp),%edi
 473:	01 f8                	add    %edi,%eax
 475:	2d 04 09 00 00       	sub    $0x904,%eax
 47a:	8b 10                	mov    (%eax),%edx
 47c:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 482:	8b 50 04             	mov    0x4(%eax),%edx
 485:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 48b:	8b 50 08             	mov    0x8(%eax),%edx
 48e:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 494:	8b 50 0c             	mov    0xc(%eax),%edx
 497:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 49d:	8b 50 10             	mov    0x10(%eax),%edx
 4a0:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4a6:	8b 50 14             	mov    0x14(%eax),%edx
 4a9:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4af:	8b 50 18             	mov    0x18(%eax),%edx
 4b2:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4b8:	8b 50 1c             	mov    0x1c(%eax),%edx
 4bb:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4c1:	8b 40 20             	mov    0x20(%eax),%eax
 4c4:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 4ca:	c7 44 24 04 48 0b 00 	movl   $0xb48,0x4(%esp)
 4d1:	00 
 4d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4d9:	e8 66 02 00 00       	call   744 <printf>
  for(;p.pid != 0; p = table[i])
 4de:	e9 b8 00 00 00       	jmp    59b <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 4e3:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 4ea:	0f be d8             	movsbl %al,%ebx
 4ed:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 4f3:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 4f9:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 4ff:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 505:	83 c6 10             	add    $0x10,%esi
 508:	89 74 24 18          	mov    %esi,0x18(%esp)
 50c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 510:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 514:	89 54 24 0c          	mov    %edx,0xc(%esp)
 518:	89 44 24 08          	mov    %eax,0x8(%esp)
 51c:	c7 44 24 04 61 0b 00 	movl   $0xb61,0x4(%esp)
 523:	00 
 524:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 52b:	e8 14 02 00 00       	call   744 <printf>
    i++;
 530:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 534:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 537:	89 d0                	mov    %edx,%eax
 539:	c1 e0 03             	shl    $0x3,%eax
 53c:	01 d0                	add    %edx,%eax
 53e:	c1 e0 02             	shl    $0x2,%eax
 541:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 544:	01 c8                	add    %ecx,%eax
 546:	2d 04 09 00 00       	sub    $0x904,%eax
 54b:	8b 10                	mov    (%eax),%edx
 54d:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 553:	8b 50 04             	mov    0x4(%eax),%edx
 556:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 55c:	8b 50 08             	mov    0x8(%eax),%edx
 55f:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 565:	8b 50 0c             	mov    0xc(%eax),%edx
 568:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 56e:	8b 50 10             	mov    0x10(%eax),%edx
 571:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 577:	8b 50 14             	mov    0x14(%eax),%edx
 57a:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 580:	8b 50 18             	mov    0x18(%eax),%edx
 583:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 589:	8b 50 1c             	mov    0x1c(%eax),%edx
 58c:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 592:	8b 40 20             	mov    0x20(%eax),%eax
 595:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 59b:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 5a1:	85 c0                	test   %eax,%eax
 5a3:	0f 85 3a ff ff ff    	jne    4e3 <ps+0xaa>
  }
}
 5a9:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    

000005b4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b4:	b8 01 00 00 00       	mov    $0x1,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <exit>:
SYSCALL(exit)
 5bc:	b8 02 00 00 00       	mov    $0x2,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <wait>:
SYSCALL(wait)
 5c4:	b8 03 00 00 00       	mov    $0x3,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <pipe>:
SYSCALL(pipe)
 5cc:	b8 04 00 00 00       	mov    $0x4,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <read>:
SYSCALL(read)
 5d4:	b8 05 00 00 00       	mov    $0x5,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <write>:
SYSCALL(write)
 5dc:	b8 10 00 00 00       	mov    $0x10,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <close>:
SYSCALL(close)
 5e4:	b8 15 00 00 00       	mov    $0x15,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <kill>:
SYSCALL(kill)
 5ec:	b8 06 00 00 00       	mov    $0x6,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <exec>:
SYSCALL(exec)
 5f4:	b8 07 00 00 00       	mov    $0x7,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <open>:
SYSCALL(open)
 5fc:	b8 0f 00 00 00       	mov    $0xf,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <mknod>:
SYSCALL(mknod)
 604:	b8 11 00 00 00       	mov    $0x11,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <unlink>:
SYSCALL(unlink)
 60c:	b8 12 00 00 00       	mov    $0x12,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <fstat>:
SYSCALL(fstat)
 614:	b8 08 00 00 00       	mov    $0x8,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <link>:
SYSCALL(link)
 61c:	b8 13 00 00 00       	mov    $0x13,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <mkdir>:
SYSCALL(mkdir)
 624:	b8 14 00 00 00       	mov    $0x14,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <chdir>:
SYSCALL(chdir)
 62c:	b8 09 00 00 00       	mov    $0x9,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <dup>:
SYSCALL(dup)
 634:	b8 0a 00 00 00       	mov    $0xa,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <getpid>:
SYSCALL(getpid)
 63c:	b8 0b 00 00 00       	mov    $0xb,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <sbrk>:
SYSCALL(sbrk)
 644:	b8 0c 00 00 00       	mov    $0xc,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <sleep>:
SYSCALL(sleep)
 64c:	b8 0d 00 00 00       	mov    $0xd,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <uptime>:
SYSCALL(uptime)
 654:	b8 0e 00 00 00       	mov    $0xe,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <getpinfo>:
SYSCALL(getpinfo)
 65c:	b8 16 00 00 00       	mov    $0x16,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	83 ec 18             	sub    $0x18,%esp
 66a:	8b 45 0c             	mov    0xc(%ebp),%eax
 66d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 670:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 677:	00 
 678:	8d 45 f4             	lea    -0xc(%ebp),%eax
 67b:	89 44 24 04          	mov    %eax,0x4(%esp)
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	89 04 24             	mov    %eax,(%esp)
 685:	e8 52 ff ff ff       	call   5dc <write>
}
 68a:	c9                   	leave  
 68b:	c3                   	ret    

0000068c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	56                   	push   %esi
 690:	53                   	push   %ebx
 691:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 694:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 69b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 69f:	74 17                	je     6b8 <printint+0x2c>
 6a1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6a5:	79 11                	jns    6b8 <printint+0x2c>
    neg = 1;
 6a7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b1:	f7 d8                	neg    %eax
 6b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6b6:	eb 06                	jmp    6be <printint+0x32>
  } else {
    x = xx;
 6b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 6bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6c5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6c8:	8d 41 01             	lea    0x1(%ecx),%eax
 6cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6ce:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d4:	ba 00 00 00 00       	mov    $0x0,%edx
 6d9:	f7 f3                	div    %ebx
 6db:	89 d0                	mov    %edx,%eax
 6dd:	0f b6 80 0c 0e 00 00 	movzbl 0xe0c(%eax),%eax
 6e4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6e8:	8b 75 10             	mov    0x10(%ebp),%esi
 6eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ee:	ba 00 00 00 00       	mov    $0x0,%edx
 6f3:	f7 f6                	div    %esi
 6f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6fc:	75 c7                	jne    6c5 <printint+0x39>
  if(neg)
 6fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 702:	74 10                	je     714 <printint+0x88>
    buf[i++] = '-';
 704:	8b 45 f4             	mov    -0xc(%ebp),%eax
 707:	8d 50 01             	lea    0x1(%eax),%edx
 70a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 70d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 712:	eb 1f                	jmp    733 <printint+0xa7>
 714:	eb 1d                	jmp    733 <printint+0xa7>
    putc(fd, buf[i]);
 716:	8d 55 dc             	lea    -0x24(%ebp),%edx
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	01 d0                	add    %edx,%eax
 71e:	0f b6 00             	movzbl (%eax),%eax
 721:	0f be c0             	movsbl %al,%eax
 724:	89 44 24 04          	mov    %eax,0x4(%esp)
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	89 04 24             	mov    %eax,(%esp)
 72e:	e8 31 ff ff ff       	call   664 <putc>
  while(--i >= 0)
 733:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 737:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 73b:	79 d9                	jns    716 <printint+0x8a>
}
 73d:	83 c4 30             	add    $0x30,%esp
 740:	5b                   	pop    %ebx
 741:	5e                   	pop    %esi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    

00000744 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 74a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 751:	8d 45 0c             	lea    0xc(%ebp),%eax
 754:	83 c0 04             	add    $0x4,%eax
 757:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 75a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 761:	e9 7c 01 00 00       	jmp    8e2 <printf+0x19e>
    c = fmt[i] & 0xff;
 766:	8b 55 0c             	mov    0xc(%ebp),%edx
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	01 d0                	add    %edx,%eax
 76e:	0f b6 00             	movzbl (%eax),%eax
 771:	0f be c0             	movsbl %al,%eax
 774:	25 ff 00 00 00       	and    $0xff,%eax
 779:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 77c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 780:	75 2c                	jne    7ae <printf+0x6a>
      if(c == '%'){
 782:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 786:	75 0c                	jne    794 <printf+0x50>
        state = '%';
 788:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 78f:	e9 4a 01 00 00       	jmp    8de <printf+0x19a>
      } else {
        putc(fd, c);
 794:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 797:	0f be c0             	movsbl %al,%eax
 79a:	89 44 24 04          	mov    %eax,0x4(%esp)
 79e:	8b 45 08             	mov    0x8(%ebp),%eax
 7a1:	89 04 24             	mov    %eax,(%esp)
 7a4:	e8 bb fe ff ff       	call   664 <putc>
 7a9:	e9 30 01 00 00       	jmp    8de <printf+0x19a>
      }
    } else if(state == '%'){
 7ae:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7b2:	0f 85 26 01 00 00    	jne    8de <printf+0x19a>
      if(c == 'd'){
 7b8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7bc:	75 2d                	jne    7eb <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7c1:	8b 00                	mov    (%eax),%eax
 7c3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7ca:	00 
 7cb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7d2:	00 
 7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 aa fe ff ff       	call   68c <printint>
        ap++;
 7e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e6:	e9 ec 00 00 00       	jmp    8d7 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7eb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7ef:	74 06                	je     7f7 <printf+0xb3>
 7f1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7f5:	75 2d                	jne    824 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 803:	00 
 804:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 80b:	00 
 80c:	89 44 24 04          	mov    %eax,0x4(%esp)
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	89 04 24             	mov    %eax,(%esp)
 816:	e8 71 fe ff ff       	call   68c <printint>
        ap++;
 81b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 81f:	e9 b3 00 00 00       	jmp    8d7 <printf+0x193>
      } else if(c == 's'){
 824:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 828:	75 45                	jne    86f <printf+0x12b>
        s = (char*)*ap;
 82a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 82d:	8b 00                	mov    (%eax),%eax
 82f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 832:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 836:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 83a:	75 09                	jne    845 <printf+0x101>
          s = "(null)";
 83c:	c7 45 f4 71 0b 00 00 	movl   $0xb71,-0xc(%ebp)
        while(*s != 0){
 843:	eb 1e                	jmp    863 <printf+0x11f>
 845:	eb 1c                	jmp    863 <printf+0x11f>
          putc(fd, *s);
 847:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84a:	0f b6 00             	movzbl (%eax),%eax
 84d:	0f be c0             	movsbl %al,%eax
 850:	89 44 24 04          	mov    %eax,0x4(%esp)
 854:	8b 45 08             	mov    0x8(%ebp),%eax
 857:	89 04 24             	mov    %eax,(%esp)
 85a:	e8 05 fe ff ff       	call   664 <putc>
          s++;
 85f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 863:	8b 45 f4             	mov    -0xc(%ebp),%eax
 866:	0f b6 00             	movzbl (%eax),%eax
 869:	84 c0                	test   %al,%al
 86b:	75 da                	jne    847 <printf+0x103>
 86d:	eb 68                	jmp    8d7 <printf+0x193>
        }
      } else if(c == 'c'){
 86f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 873:	75 1d                	jne    892 <printf+0x14e>
        putc(fd, *ap);
 875:	8b 45 e8             	mov    -0x18(%ebp),%eax
 878:	8b 00                	mov    (%eax),%eax
 87a:	0f be c0             	movsbl %al,%eax
 87d:	89 44 24 04          	mov    %eax,0x4(%esp)
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	89 04 24             	mov    %eax,(%esp)
 887:	e8 d8 fd ff ff       	call   664 <putc>
        ap++;
 88c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 890:	eb 45                	jmp    8d7 <printf+0x193>
      } else if(c == '%'){
 892:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 896:	75 17                	jne    8af <printf+0x16b>
        putc(fd, c);
 898:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 89b:	0f be c0             	movsbl %al,%eax
 89e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	89 04 24             	mov    %eax,(%esp)
 8a8:	e8 b7 fd ff ff       	call   664 <putc>
 8ad:	eb 28                	jmp    8d7 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8af:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8b6:	00 
 8b7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ba:	89 04 24             	mov    %eax,(%esp)
 8bd:	e8 a2 fd ff ff       	call   664 <putc>
        putc(fd, c);
 8c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c5:	0f be c0             	movsbl %al,%eax
 8c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cc:	8b 45 08             	mov    0x8(%ebp),%eax
 8cf:	89 04 24             	mov    %eax,(%esp)
 8d2:	e8 8d fd ff ff       	call   664 <putc>
      }
      state = 0;
 8d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e8:	01 d0                	add    %edx,%eax
 8ea:	0f b6 00             	movzbl (%eax),%eax
 8ed:	84 c0                	test   %al,%al
 8ef:	0f 85 71 fe ff ff    	jne    766 <printf+0x22>
    }
  }
}
 8f5:	c9                   	leave  
 8f6:	c3                   	ret    

000008f7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f7:	55                   	push   %ebp
 8f8:	89 e5                	mov    %esp,%ebp
 8fa:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
 900:	83 e8 08             	sub    $0x8,%eax
 903:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 906:	a1 28 0e 00 00       	mov    0xe28,%eax
 90b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 90e:	eb 24                	jmp    934 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	8b 45 fc             	mov    -0x4(%ebp),%eax
 913:	8b 00                	mov    (%eax),%eax
 915:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 918:	77 12                	ja     92c <free+0x35>
 91a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 920:	77 24                	ja     946 <free+0x4f>
 922:	8b 45 fc             	mov    -0x4(%ebp),%eax
 925:	8b 00                	mov    (%eax),%eax
 927:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 92a:	77 1a                	ja     946 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	89 45 fc             	mov    %eax,-0x4(%ebp)
 934:	8b 45 f8             	mov    -0x8(%ebp),%eax
 937:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93a:	76 d4                	jbe    910 <free+0x19>
 93c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93f:	8b 00                	mov    (%eax),%eax
 941:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 944:	76 ca                	jbe    910 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 946:	8b 45 f8             	mov    -0x8(%ebp),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 953:	8b 45 f8             	mov    -0x8(%ebp),%eax
 956:	01 c2                	add    %eax,%edx
 958:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95b:	8b 00                	mov    (%eax),%eax
 95d:	39 c2                	cmp    %eax,%edx
 95f:	75 24                	jne    985 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 961:	8b 45 f8             	mov    -0x8(%ebp),%eax
 964:	8b 50 04             	mov    0x4(%eax),%edx
 967:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96a:	8b 00                	mov    (%eax),%eax
 96c:	8b 40 04             	mov    0x4(%eax),%eax
 96f:	01 c2                	add    %eax,%edx
 971:	8b 45 f8             	mov    -0x8(%ebp),%eax
 974:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 977:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97a:	8b 00                	mov    (%eax),%eax
 97c:	8b 10                	mov    (%eax),%edx
 97e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 981:	89 10                	mov    %edx,(%eax)
 983:	eb 0a                	jmp    98f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 985:	8b 45 fc             	mov    -0x4(%ebp),%eax
 988:	8b 10                	mov    (%eax),%edx
 98a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 98f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 992:	8b 40 04             	mov    0x4(%eax),%eax
 995:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 99c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99f:	01 d0                	add    %edx,%eax
 9a1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9a4:	75 20                	jne    9c6 <free+0xcf>
    p->s.size += bp->s.size;
 9a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a9:	8b 50 04             	mov    0x4(%eax),%edx
 9ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9af:	8b 40 04             	mov    0x4(%eax),%eax
 9b2:	01 c2                	add    %eax,%edx
 9b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9bd:	8b 10                	mov    (%eax),%edx
 9bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c2:	89 10                	mov    %edx,(%eax)
 9c4:	eb 08                	jmp    9ce <free+0xd7>
  } else
    p->s.ptr = bp;
 9c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9cc:	89 10                	mov    %edx,(%eax)
  freep = p;
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	a3 28 0e 00 00       	mov    %eax,0xe28
}
 9d6:	c9                   	leave  
 9d7:	c3                   	ret    

000009d8 <morecore>:

static Header*
morecore(uint nu)
{
 9d8:	55                   	push   %ebp
 9d9:	89 e5                	mov    %esp,%ebp
 9db:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9de:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9e5:	77 07                	ja     9ee <morecore+0x16>
    nu = 4096;
 9e7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 9f1:	c1 e0 03             	shl    $0x3,%eax
 9f4:	89 04 24             	mov    %eax,(%esp)
 9f7:	e8 48 fc ff ff       	call   644 <sbrk>
 9fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9ff:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a03:	75 07                	jne    a0c <morecore+0x34>
    return 0;
 a05:	b8 00 00 00 00       	mov    $0x0,%eax
 a0a:	eb 22                	jmp    a2e <morecore+0x56>
  hp = (Header*)p;
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a12:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a15:	8b 55 08             	mov    0x8(%ebp),%edx
 a18:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1e:	83 c0 08             	add    $0x8,%eax
 a21:	89 04 24             	mov    %eax,(%esp)
 a24:	e8 ce fe ff ff       	call   8f7 <free>
  return freep;
 a29:	a1 28 0e 00 00       	mov    0xe28,%eax
}
 a2e:	c9                   	leave  
 a2f:	c3                   	ret    

00000a30 <malloc>:

void*
malloc(uint nbytes)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a36:	8b 45 08             	mov    0x8(%ebp),%eax
 a39:	83 c0 07             	add    $0x7,%eax
 a3c:	c1 e8 03             	shr    $0x3,%eax
 a3f:	83 c0 01             	add    $0x1,%eax
 a42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a45:	a1 28 0e 00 00       	mov    0xe28,%eax
 a4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a4d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a51:	75 23                	jne    a76 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a53:	c7 45 f0 20 0e 00 00 	movl   $0xe20,-0x10(%ebp)
 a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5d:	a3 28 0e 00 00       	mov    %eax,0xe28
 a62:	a1 28 0e 00 00       	mov    0xe28,%eax
 a67:	a3 20 0e 00 00       	mov    %eax,0xe20
    base.s.size = 0;
 a6c:	c7 05 24 0e 00 00 00 	movl   $0x0,0xe24
 a73:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a79:	8b 00                	mov    (%eax),%eax
 a7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a81:	8b 40 04             	mov    0x4(%eax),%eax
 a84:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a87:	72 4d                	jb     ad6 <malloc+0xa6>
      if(p->s.size == nunits)
 a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8c:	8b 40 04             	mov    0x4(%eax),%eax
 a8f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a92:	75 0c                	jne    aa0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a97:	8b 10                	mov    (%eax),%edx
 a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a9c:	89 10                	mov    %edx,(%eax)
 a9e:	eb 26                	jmp    ac6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa3:	8b 40 04             	mov    0x4(%eax),%eax
 aa6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 aa9:	89 c2                	mov    %eax,%edx
 aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aae:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	8b 40 04             	mov    0x4(%eax),%eax
 ab7:	c1 e0 03             	shl    $0x3,%eax
 aba:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ac3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac9:	a3 28 0e 00 00       	mov    %eax,0xe28
      return (void*)(p + 1);
 ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad1:	83 c0 08             	add    $0x8,%eax
 ad4:	eb 38                	jmp    b0e <malloc+0xde>
    }
    if(p == freep)
 ad6:	a1 28 0e 00 00       	mov    0xe28,%eax
 adb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ade:	75 1b                	jne    afb <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ae0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ae3:	89 04 24             	mov    %eax,(%esp)
 ae6:	e8 ed fe ff ff       	call   9d8 <morecore>
 aeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 af2:	75 07                	jne    afb <malloc+0xcb>
        return 0;
 af4:	b8 00 00 00 00       	mov    $0x0,%eax
 af9:	eb 13                	jmp    b0e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b04:	8b 00                	mov    (%eax),%eax
 b06:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b09:	e9 70 ff ff ff       	jmp    a7e <malloc+0x4e>
}
 b0e:	c9                   	leave  
 b0f:	c3                   	ret    
