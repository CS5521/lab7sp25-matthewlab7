
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
  32:	05 60 0e 00 00       	add    $0xe60,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 60 0e 00 00       	add    $0xe60,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 18 0b 00 00 	movl   $0xb18,(%esp)
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
  92:	c7 44 24 04 60 0e 00 	movl   $0xe60,0x4(%esp)
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
  b8:	c7 44 24 04 1e 0b 00 	movl   $0xb1e,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 80 06 00 00       	call   74c <printf>
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
  ed:	c7 44 24 04 2e 0b 00 	movl   $0xb2e,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 4b 06 00 00       	call   74c <printf>
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
 112:	c7 44 24 04 3b 0b 00 	movl   $0xb3b,0x4(%esp)
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
 17b:	c7 44 24 04 3c 0b 00 	movl   $0xb3c,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 bd 05 00 00       	call   74c <printf>
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
 4ca:	c7 44 24 04 50 0b 00 	movl   $0xb50,0x4(%esp)
 4d1:	00 
 4d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4d9:	e8 6e 02 00 00       	call   74c <printf>
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
 51c:	c7 44 24 04 69 0b 00 	movl   $0xb69,0x4(%esp)
 523:	00 
 524:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 52b:	e8 1c 02 00 00       	call   74c <printf>
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

00000664 <settickets>:
 664:	b8 17 00 00 00       	mov    $0x17,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 66c:	55                   	push   %ebp
 66d:	89 e5                	mov    %esp,%ebp
 66f:	83 ec 18             	sub    $0x18,%esp
 672:	8b 45 0c             	mov    0xc(%ebp),%eax
 675:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 678:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67f:	00 
 680:	8d 45 f4             	lea    -0xc(%ebp),%eax
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 4a ff ff ff       	call   5dc <write>
}
 692:	c9                   	leave  
 693:	c3                   	ret    

00000694 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	56                   	push   %esi
 698:	53                   	push   %ebx
 699:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 69c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6a3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6a7:	74 17                	je     6c0 <printint+0x2c>
 6a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6ad:	79 11                	jns    6c0 <printint+0x2c>
    neg = 1;
 6af:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b9:	f7 d8                	neg    %eax
 6bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6be:	eb 06                	jmp    6c6 <printint+0x32>
  } else {
    x = xx;
 6c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6cd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6d0:	8d 41 01             	lea    0x1(%ecx),%eax
 6d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6d6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6dc:	ba 00 00 00 00       	mov    $0x0,%edx
 6e1:	f7 f3                	div    %ebx
 6e3:	89 d0                	mov    %edx,%eax
 6e5:	0f b6 80 14 0e 00 00 	movzbl 0xe14(%eax),%eax
 6ec:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6f0:	8b 75 10             	mov    0x10(%ebp),%esi
 6f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6f6:	ba 00 00 00 00       	mov    $0x0,%edx
 6fb:	f7 f6                	div    %esi
 6fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 700:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 704:	75 c7                	jne    6cd <printint+0x39>
  if(neg)
 706:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70a:	74 10                	je     71c <printint+0x88>
    buf[i++] = '-';
 70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70f:	8d 50 01             	lea    0x1(%eax),%edx
 712:	89 55 f4             	mov    %edx,-0xc(%ebp)
 715:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 71a:	eb 1f                	jmp    73b <printint+0xa7>
 71c:	eb 1d                	jmp    73b <printint+0xa7>
    putc(fd, buf[i]);
 71e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 721:	8b 45 f4             	mov    -0xc(%ebp),%eax
 724:	01 d0                	add    %edx,%eax
 726:	0f b6 00             	movzbl (%eax),%eax
 729:	0f be c0             	movsbl %al,%eax
 72c:	89 44 24 04          	mov    %eax,0x4(%esp)
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 31 ff ff ff       	call   66c <putc>
  while(--i >= 0)
 73b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 73f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 743:	79 d9                	jns    71e <printint+0x8a>
}
 745:	83 c4 30             	add    $0x30,%esp
 748:	5b                   	pop    %ebx
 749:	5e                   	pop    %esi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    

0000074c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 74c:	55                   	push   %ebp
 74d:	89 e5                	mov    %esp,%ebp
 74f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 752:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 759:	8d 45 0c             	lea    0xc(%ebp),%eax
 75c:	83 c0 04             	add    $0x4,%eax
 75f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 762:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 769:	e9 7c 01 00 00       	jmp    8ea <printf+0x19e>
    c = fmt[i] & 0xff;
 76e:	8b 55 0c             	mov    0xc(%ebp),%edx
 771:	8b 45 f0             	mov    -0x10(%ebp),%eax
 774:	01 d0                	add    %edx,%eax
 776:	0f b6 00             	movzbl (%eax),%eax
 779:	0f be c0             	movsbl %al,%eax
 77c:	25 ff 00 00 00       	and    $0xff,%eax
 781:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 784:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 788:	75 2c                	jne    7b6 <printf+0x6a>
      if(c == '%'){
 78a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 78e:	75 0c                	jne    79c <printf+0x50>
        state = '%';
 790:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 797:	e9 4a 01 00 00       	jmp    8e6 <printf+0x19a>
      } else {
        putc(fd, c);
 79c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79f:	0f be c0             	movsbl %al,%eax
 7a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 bb fe ff ff       	call   66c <putc>
 7b1:	e9 30 01 00 00       	jmp    8e6 <printf+0x19a>
      }
    } else if(state == '%'){
 7b6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7ba:	0f 85 26 01 00 00    	jne    8e6 <printf+0x19a>
      if(c == 'd'){
 7c0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7c4:	75 2d                	jne    7f3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7c9:	8b 00                	mov    (%eax),%eax
 7cb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7d2:	00 
 7d3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7da:	00 
 7db:	89 44 24 04          	mov    %eax,0x4(%esp)
 7df:	8b 45 08             	mov    0x8(%ebp),%eax
 7e2:	89 04 24             	mov    %eax,(%esp)
 7e5:	e8 aa fe ff ff       	call   694 <printint>
        ap++;
 7ea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ee:	e9 ec 00 00 00       	jmp    8df <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7f3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7f7:	74 06                	je     7ff <printf+0xb3>
 7f9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7fd:	75 2d                	jne    82c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 802:	8b 00                	mov    (%eax),%eax
 804:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 80b:	00 
 80c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 813:	00 
 814:	89 44 24 04          	mov    %eax,0x4(%esp)
 818:	8b 45 08             	mov    0x8(%ebp),%eax
 81b:	89 04 24             	mov    %eax,(%esp)
 81e:	e8 71 fe ff ff       	call   694 <printint>
        ap++;
 823:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 827:	e9 b3 00 00 00       	jmp    8df <printf+0x193>
      } else if(c == 's'){
 82c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 830:	75 45                	jne    877 <printf+0x12b>
        s = (char*)*ap;
 832:	8b 45 e8             	mov    -0x18(%ebp),%eax
 835:	8b 00                	mov    (%eax),%eax
 837:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 83a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 83e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 842:	75 09                	jne    84d <printf+0x101>
          s = "(null)";
 844:	c7 45 f4 79 0b 00 00 	movl   $0xb79,-0xc(%ebp)
        while(*s != 0){
 84b:	eb 1e                	jmp    86b <printf+0x11f>
 84d:	eb 1c                	jmp    86b <printf+0x11f>
          putc(fd, *s);
 84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 852:	0f b6 00             	movzbl (%eax),%eax
 855:	0f be c0             	movsbl %al,%eax
 858:	89 44 24 04          	mov    %eax,0x4(%esp)
 85c:	8b 45 08             	mov    0x8(%ebp),%eax
 85f:	89 04 24             	mov    %eax,(%esp)
 862:	e8 05 fe ff ff       	call   66c <putc>
          s++;
 867:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	0f b6 00             	movzbl (%eax),%eax
 871:	84 c0                	test   %al,%al
 873:	75 da                	jne    84f <printf+0x103>
 875:	eb 68                	jmp    8df <printf+0x193>
        }
      } else if(c == 'c'){
 877:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 87b:	75 1d                	jne    89a <printf+0x14e>
        putc(fd, *ap);
 87d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 880:	8b 00                	mov    (%eax),%eax
 882:	0f be c0             	movsbl %al,%eax
 885:	89 44 24 04          	mov    %eax,0x4(%esp)
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	89 04 24             	mov    %eax,(%esp)
 88f:	e8 d8 fd ff ff       	call   66c <putc>
        ap++;
 894:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 898:	eb 45                	jmp    8df <printf+0x193>
      } else if(c == '%'){
 89a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 89e:	75 17                	jne    8b7 <printf+0x16b>
        putc(fd, c);
 8a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a3:	0f be c0             	movsbl %al,%eax
 8a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	89 04 24             	mov    %eax,(%esp)
 8b0:	e8 b7 fd ff ff       	call   66c <putc>
 8b5:	eb 28                	jmp    8df <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8b7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8be:	00 
 8bf:	8b 45 08             	mov    0x8(%ebp),%eax
 8c2:	89 04 24             	mov    %eax,(%esp)
 8c5:	e8 a2 fd ff ff       	call   66c <putc>
        putc(fd, c);
 8ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8cd:	0f be c0             	movsbl %al,%eax
 8d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8d4:	8b 45 08             	mov    0x8(%ebp),%eax
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 8d fd ff ff       	call   66c <putc>
      }
      state = 0;
 8df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8ea:	8b 55 0c             	mov    0xc(%ebp),%edx
 8ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f0:	01 d0                	add    %edx,%eax
 8f2:	0f b6 00             	movzbl (%eax),%eax
 8f5:	84 c0                	test   %al,%al
 8f7:	0f 85 71 fe ff ff    	jne    76e <printf+0x22>
    }
  }
}
 8fd:	c9                   	leave  
 8fe:	c3                   	ret    

000008ff <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8ff:	55                   	push   %ebp
 900:	89 e5                	mov    %esp,%ebp
 902:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	83 e8 08             	sub    $0x8,%eax
 90b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 90e:	a1 48 0e 00 00       	mov    0xe48,%eax
 913:	89 45 fc             	mov    %eax,-0x4(%ebp)
 916:	eb 24                	jmp    93c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 918:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91b:	8b 00                	mov    (%eax),%eax
 91d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 920:	77 12                	ja     934 <free+0x35>
 922:	8b 45 f8             	mov    -0x8(%ebp),%eax
 925:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 928:	77 24                	ja     94e <free+0x4f>
 92a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92d:	8b 00                	mov    (%eax),%eax
 92f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 932:	77 1a                	ja     94e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 934:	8b 45 fc             	mov    -0x4(%ebp),%eax
 937:	8b 00                	mov    (%eax),%eax
 939:	89 45 fc             	mov    %eax,-0x4(%ebp)
 93c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 942:	76 d4                	jbe    918 <free+0x19>
 944:	8b 45 fc             	mov    -0x4(%ebp),%eax
 947:	8b 00                	mov    (%eax),%eax
 949:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 94c:	76 ca                	jbe    918 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	8b 40 04             	mov    0x4(%eax),%eax
 954:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 95b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95e:	01 c2                	add    %eax,%edx
 960:	8b 45 fc             	mov    -0x4(%ebp),%eax
 963:	8b 00                	mov    (%eax),%eax
 965:	39 c2                	cmp    %eax,%edx
 967:	75 24                	jne    98d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 969:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96c:	8b 50 04             	mov    0x4(%eax),%edx
 96f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 972:	8b 00                	mov    (%eax),%eax
 974:	8b 40 04             	mov    0x4(%eax),%eax
 977:	01 c2                	add    %eax,%edx
 979:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 97f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 982:	8b 00                	mov    (%eax),%eax
 984:	8b 10                	mov    (%eax),%edx
 986:	8b 45 f8             	mov    -0x8(%ebp),%eax
 989:	89 10                	mov    %edx,(%eax)
 98b:	eb 0a                	jmp    997 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 98d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 990:	8b 10                	mov    (%eax),%edx
 992:	8b 45 f8             	mov    -0x8(%ebp),%eax
 995:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 997:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99a:	8b 40 04             	mov    0x4(%eax),%eax
 99d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a7:	01 d0                	add    %edx,%eax
 9a9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9ac:	75 20                	jne    9ce <free+0xcf>
    p->s.size += bp->s.size;
 9ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b1:	8b 50 04             	mov    0x4(%eax),%edx
 9b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b7:	8b 40 04             	mov    0x4(%eax),%eax
 9ba:	01 c2                	add    %eax,%edx
 9bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c5:	8b 10                	mov    (%eax),%edx
 9c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ca:	89 10                	mov    %edx,(%eax)
 9cc:	eb 08                	jmp    9d6 <free+0xd7>
  } else
    p->s.ptr = bp;
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9d4:	89 10                	mov    %edx,(%eax)
  freep = p;
 9d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d9:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 9de:	c9                   	leave  
 9df:	c3                   	ret    

000009e0 <morecore>:

static Header*
morecore(uint nu)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9e6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9ed:	77 07                	ja     9f6 <morecore+0x16>
    nu = 4096;
 9ef:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9f6:	8b 45 08             	mov    0x8(%ebp),%eax
 9f9:	c1 e0 03             	shl    $0x3,%eax
 9fc:	89 04 24             	mov    %eax,(%esp)
 9ff:	e8 40 fc ff ff       	call   644 <sbrk>
 a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a07:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a0b:	75 07                	jne    a14 <morecore+0x34>
    return 0;
 a0d:	b8 00 00 00 00       	mov    $0x0,%eax
 a12:	eb 22                	jmp    a36 <morecore+0x56>
  hp = (Header*)p;
 a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a17:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1d:	8b 55 08             	mov    0x8(%ebp),%edx
 a20:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a23:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a26:	83 c0 08             	add    $0x8,%eax
 a29:	89 04 24             	mov    %eax,(%esp)
 a2c:	e8 ce fe ff ff       	call   8ff <free>
  return freep;
 a31:	a1 48 0e 00 00       	mov    0xe48,%eax
}
 a36:	c9                   	leave  
 a37:	c3                   	ret    

00000a38 <malloc>:

void*
malloc(uint nbytes)
{
 a38:	55                   	push   %ebp
 a39:	89 e5                	mov    %esp,%ebp
 a3b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 a41:	83 c0 07             	add    $0x7,%eax
 a44:	c1 e8 03             	shr    $0x3,%eax
 a47:	83 c0 01             	add    $0x1,%eax
 a4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a4d:	a1 48 0e 00 00       	mov    0xe48,%eax
 a52:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a59:	75 23                	jne    a7e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a5b:	c7 45 f0 40 0e 00 00 	movl   $0xe40,-0x10(%ebp)
 a62:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a65:	a3 48 0e 00 00       	mov    %eax,0xe48
 a6a:	a1 48 0e 00 00       	mov    0xe48,%eax
 a6f:	a3 40 0e 00 00       	mov    %eax,0xe40
    base.s.size = 0;
 a74:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 a7b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a81:	8b 00                	mov    (%eax),%eax
 a83:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a89:	8b 40 04             	mov    0x4(%eax),%eax
 a8c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a8f:	72 4d                	jb     ade <malloc+0xa6>
      if(p->s.size == nunits)
 a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a94:	8b 40 04             	mov    0x4(%eax),%eax
 a97:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a9a:	75 0c                	jne    aa8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9f:	8b 10                	mov    (%eax),%edx
 aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa4:	89 10                	mov    %edx,(%eax)
 aa6:	eb 26                	jmp    ace <malloc+0x96>
      else {
        p->s.size -= nunits;
 aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aab:	8b 40 04             	mov    0x4(%eax),%eax
 aae:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ab1:	89 c2                	mov    %eax,%edx
 ab3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abc:	8b 40 04             	mov    0x4(%eax),%eax
 abf:	c1 e0 03             	shl    $0x3,%eax
 ac2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 acb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ace:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ad1:	a3 48 0e 00 00       	mov    %eax,0xe48
      return (void*)(p + 1);
 ad6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad9:	83 c0 08             	add    $0x8,%eax
 adc:	eb 38                	jmp    b16 <malloc+0xde>
    }
    if(p == freep)
 ade:	a1 48 0e 00 00       	mov    0xe48,%eax
 ae3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ae6:	75 1b                	jne    b03 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ae8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aeb:	89 04 24             	mov    %eax,(%esp)
 aee:	e8 ed fe ff ff       	call   9e0 <morecore>
 af3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 af6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 afa:	75 07                	jne    b03 <malloc+0xcb>
        return 0;
 afc:	b8 00 00 00 00       	mov    $0x0,%eax
 b01:	eb 13                	jmp    b16 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b06:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b09:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0c:	8b 00                	mov    (%eax),%eax
 b0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b11:	e9 70 ff ff ff       	jmp    a86 <malloc+0x4e>
}
 b16:	c9                   	leave  
 b17:	c3                   	ret    
