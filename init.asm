
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 51 0a 00 00 	movl   $0xa51,(%esp)
  18:	e8 15 05 00 00       	call   532 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 51 0a 00 00 	movl   $0xa51,(%esp)
  38:	e8 fd 04 00 00       	call   53a <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 51 0a 00 00 	movl   $0xa51,(%esp)
  4c:	e8 e1 04 00 00       	call   532 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 0d 05 00 00       	call   56a <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 01 05 00 00       	call   56a <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 59 0a 00 	movl   $0xa59,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 05 06 00 00       	call   682 <printf>
    pid = fork();
  7d:	e8 68 04 00 00       	call   4ea <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 6c 0a 00 	movl   $0xa6c,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 e1 05 00 00       	call   682 <printf>
      exit();
  a1:	e8 4c 04 00 00       	call   4f2 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 44 0d 00 	movl   $0xd44,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 4e 0a 00 00 	movl   $0xa4e,(%esp)
  bc:	e8 69 04 00 00       	call   52a <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 7f 0a 00 	movl   $0xa7f,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 ad 05 00 00       	call   682 <printf>
      exit();
  d5:	e8 18 04 00 00       	call   4f2 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 95 0a 00 	movl   $0xa95,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 92 05 00 00       	call   682 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 05 04 00 00       	call   4fa <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 bf 02 00 00       	call   50a <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 82 02 00 00       	call   532 <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 78 02 00 00       	call   54a <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 3a 02 00 00       	call   51a <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:

void
ps()
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 37b:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 381:	89 04 24             	mov    %eax,(%esp)
 384:	e8 09 02 00 00       	call   592 <getpinfo>
 389:	83 f8 ff             	cmp    $0xffffffff,%eax
 38c:	0f 84 4d 01 00 00    	je     4df <ps+0x170>
    return;
  int i = 0;
 392:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 399:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 39c:	89 d0                	mov    %edx,%eax
 39e:	c1 e0 03             	shl    $0x3,%eax
 3a1:	01 d0                	add    %edx,%eax
 3a3:	c1 e0 02             	shl    $0x2,%eax
 3a6:	8d 7d e8             	lea    -0x18(%ebp),%edi
 3a9:	01 f8                	add    %edi,%eax
 3ab:	2d 04 09 00 00       	sub    $0x904,%eax
 3b0:	8b 10                	mov    (%eax),%edx
 3b2:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3b8:	8b 50 04             	mov    0x4(%eax),%edx
 3bb:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3c1:	8b 50 08             	mov    0x8(%eax),%edx
 3c4:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3ca:	8b 50 0c             	mov    0xc(%eax),%edx
 3cd:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3d3:	8b 50 10             	mov    0x10(%eax),%edx
 3d6:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 3dc:	8b 50 14             	mov    0x14(%eax),%edx
 3df:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 3e5:	8b 50 18             	mov    0x18(%eax),%edx
 3e8:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 3ee:	8b 50 1c             	mov    0x1c(%eax),%edx
 3f1:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 3f7:	8b 40 20             	mov    0x20(%eax),%eax
 3fa:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 400:	c7 44 24 04 9e 0a 00 	movl   $0xa9e,0x4(%esp)
 407:	00 
 408:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 40f:	e8 6e 02 00 00       	call   682 <printf>
  for(;p.pid != 0; p = table[i])
 414:	e9 b8 00 00 00       	jmp    4d1 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 419:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 420:	0f be d8             	movsbl %al,%ebx
 423:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 429:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 42f:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 435:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 43b:	83 c6 10             	add    $0x10,%esi
 43e:	89 74 24 18          	mov    %esi,0x18(%esp)
 442:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 446:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 44a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 44e:	89 44 24 08          	mov    %eax,0x8(%esp)
 452:	c7 44 24 04 b7 0a 00 	movl   $0xab7,0x4(%esp)
 459:	00 
 45a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 461:	e8 1c 02 00 00       	call   682 <printf>
    i++;
 466:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 46a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 46d:	89 d0                	mov    %edx,%eax
 46f:	c1 e0 03             	shl    $0x3,%eax
 472:	01 d0                	add    %edx,%eax
 474:	c1 e0 02             	shl    $0x2,%eax
 477:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 47a:	01 c8                	add    %ecx,%eax
 47c:	2d 04 09 00 00       	sub    $0x904,%eax
 481:	8b 10                	mov    (%eax),%edx
 483:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 489:	8b 50 04             	mov    0x4(%eax),%edx
 48c:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 492:	8b 50 08             	mov    0x8(%eax),%edx
 495:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 49b:	8b 50 0c             	mov    0xc(%eax),%edx
 49e:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 4a4:	8b 50 10             	mov    0x10(%eax),%edx
 4a7:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4ad:	8b 50 14             	mov    0x14(%eax),%edx
 4b0:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4b6:	8b 50 18             	mov    0x18(%eax),%edx
 4b9:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4bf:	8b 50 1c             	mov    0x1c(%eax),%edx
 4c2:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4c8:	8b 40 20             	mov    0x20(%eax),%eax
 4cb:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 4d1:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 4d7:	85 c0                	test   %eax,%eax
 4d9:	0f 85 3a ff ff ff    	jne    419 <ps+0xaa>
  }
}
 4df:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 4e5:	5b                   	pop    %ebx
 4e6:	5e                   	pop    %esi
 4e7:	5f                   	pop    %edi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ea:	b8 01 00 00 00       	mov    $0x1,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <exit>:
SYSCALL(exit)
 4f2:	b8 02 00 00 00       	mov    $0x2,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <wait>:
SYSCALL(wait)
 4fa:	b8 03 00 00 00       	mov    $0x3,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <pipe>:
SYSCALL(pipe)
 502:	b8 04 00 00 00       	mov    $0x4,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <read>:
SYSCALL(read)
 50a:	b8 05 00 00 00       	mov    $0x5,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <write>:
SYSCALL(write)
 512:	b8 10 00 00 00       	mov    $0x10,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <close>:
SYSCALL(close)
 51a:	b8 15 00 00 00       	mov    $0x15,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <kill>:
SYSCALL(kill)
 522:	b8 06 00 00 00       	mov    $0x6,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <exec>:
SYSCALL(exec)
 52a:	b8 07 00 00 00       	mov    $0x7,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <open>:
SYSCALL(open)
 532:	b8 0f 00 00 00       	mov    $0xf,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <mknod>:
SYSCALL(mknod)
 53a:	b8 11 00 00 00       	mov    $0x11,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <unlink>:
SYSCALL(unlink)
 542:	b8 12 00 00 00       	mov    $0x12,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <fstat>:
SYSCALL(fstat)
 54a:	b8 08 00 00 00       	mov    $0x8,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <link>:
SYSCALL(link)
 552:	b8 13 00 00 00       	mov    $0x13,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <mkdir>:
SYSCALL(mkdir)
 55a:	b8 14 00 00 00       	mov    $0x14,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <chdir>:
SYSCALL(chdir)
 562:	b8 09 00 00 00       	mov    $0x9,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <dup>:
SYSCALL(dup)
 56a:	b8 0a 00 00 00       	mov    $0xa,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <getpid>:
SYSCALL(getpid)
 572:	b8 0b 00 00 00       	mov    $0xb,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <sbrk>:
SYSCALL(sbrk)
 57a:	b8 0c 00 00 00       	mov    $0xc,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <sleep>:
SYSCALL(sleep)
 582:	b8 0d 00 00 00       	mov    $0xd,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <uptime>:
SYSCALL(uptime)
 58a:	b8 0e 00 00 00       	mov    $0xe,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <getpinfo>:
SYSCALL(getpinfo)
 592:	b8 16 00 00 00       	mov    $0x16,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <settickets>:
 59a:	b8 17 00 00 00       	mov    $0x17,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	83 ec 18             	sub    $0x18,%esp
 5a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ab:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b5:	00 
 5b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
 5c0:	89 04 24             	mov    %eax,(%esp)
 5c3:	e8 4a ff ff ff       	call   512 <write>
}
 5c8:	c9                   	leave  
 5c9:	c3                   	ret    

000005ca <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	56                   	push   %esi
 5ce:	53                   	push   %ebx
 5cf:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5d9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5dd:	74 17                	je     5f6 <printint+0x2c>
 5df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5e3:	79 11                	jns    5f6 <printint+0x2c>
    neg = 1;
 5e5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ef:	f7 d8                	neg    %eax
 5f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5f4:	eb 06                	jmp    5fc <printint+0x32>
  } else {
    x = xx;
 5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 603:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 606:	8d 41 01             	lea    0x1(%ecx),%eax
 609:	89 45 f4             	mov    %eax,-0xc(%ebp)
 60c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 60f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 612:	ba 00 00 00 00       	mov    $0x0,%edx
 617:	f7 f3                	div    %ebx
 619:	89 d0                	mov    %edx,%eax
 61b:	0f b6 80 4c 0d 00 00 	movzbl 0xd4c(%eax),%eax
 622:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 626:	8b 75 10             	mov    0x10(%ebp),%esi
 629:	8b 45 ec             	mov    -0x14(%ebp),%eax
 62c:	ba 00 00 00 00       	mov    $0x0,%edx
 631:	f7 f6                	div    %esi
 633:	89 45 ec             	mov    %eax,-0x14(%ebp)
 636:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 63a:	75 c7                	jne    603 <printint+0x39>
  if(neg)
 63c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 640:	74 10                	je     652 <printint+0x88>
    buf[i++] = '-';
 642:	8b 45 f4             	mov    -0xc(%ebp),%eax
 645:	8d 50 01             	lea    0x1(%eax),%edx
 648:	89 55 f4             	mov    %edx,-0xc(%ebp)
 64b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 650:	eb 1f                	jmp    671 <printint+0xa7>
 652:	eb 1d                	jmp    671 <printint+0xa7>
    putc(fd, buf[i]);
 654:	8d 55 dc             	lea    -0x24(%ebp),%edx
 657:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65a:	01 d0                	add    %edx,%eax
 65c:	0f b6 00             	movzbl (%eax),%eax
 65f:	0f be c0             	movsbl %al,%eax
 662:	89 44 24 04          	mov    %eax,0x4(%esp)
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	89 04 24             	mov    %eax,(%esp)
 66c:	e8 31 ff ff ff       	call   5a2 <putc>
  while(--i >= 0)
 671:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 675:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 679:	79 d9                	jns    654 <printint+0x8a>
}
 67b:	83 c4 30             	add    $0x30,%esp
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5d                   	pop    %ebp
 681:	c3                   	ret    

00000682 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 682:	55                   	push   %ebp
 683:	89 e5                	mov    %esp,%ebp
 685:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 688:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 68f:	8d 45 0c             	lea    0xc(%ebp),%eax
 692:	83 c0 04             	add    $0x4,%eax
 695:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 698:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 69f:	e9 7c 01 00 00       	jmp    820 <printf+0x19e>
    c = fmt[i] & 0xff;
 6a4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6aa:	01 d0                	add    %edx,%eax
 6ac:	0f b6 00             	movzbl (%eax),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	25 ff 00 00 00       	and    $0xff,%eax
 6b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6ba:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6be:	75 2c                	jne    6ec <printf+0x6a>
      if(c == '%'){
 6c0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c4:	75 0c                	jne    6d2 <printf+0x50>
        state = '%';
 6c6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6cd:	e9 4a 01 00 00       	jmp    81c <printf+0x19a>
      } else {
        putc(fd, c);
 6d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d5:	0f be c0             	movsbl %al,%eax
 6d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	89 04 24             	mov    %eax,(%esp)
 6e2:	e8 bb fe ff ff       	call   5a2 <putc>
 6e7:	e9 30 01 00 00       	jmp    81c <printf+0x19a>
      }
    } else if(state == '%'){
 6ec:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6f0:	0f 85 26 01 00 00    	jne    81c <printf+0x19a>
      if(c == 'd'){
 6f6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6fa:	75 2d                	jne    729 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 708:	00 
 709:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 710:	00 
 711:	89 44 24 04          	mov    %eax,0x4(%esp)
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	89 04 24             	mov    %eax,(%esp)
 71b:	e8 aa fe ff ff       	call   5ca <printint>
        ap++;
 720:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 724:	e9 ec 00 00 00       	jmp    815 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 729:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 72d:	74 06                	je     735 <printf+0xb3>
 72f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 733:	75 2d                	jne    762 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 735:	8b 45 e8             	mov    -0x18(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 741:	00 
 742:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 749:	00 
 74a:	89 44 24 04          	mov    %eax,0x4(%esp)
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	89 04 24             	mov    %eax,(%esp)
 754:	e8 71 fe ff ff       	call   5ca <printint>
        ap++;
 759:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75d:	e9 b3 00 00 00       	jmp    815 <printf+0x193>
      } else if(c == 's'){
 762:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 766:	75 45                	jne    7ad <printf+0x12b>
        s = (char*)*ap;
 768:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76b:	8b 00                	mov    (%eax),%eax
 76d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 770:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 774:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 778:	75 09                	jne    783 <printf+0x101>
          s = "(null)";
 77a:	c7 45 f4 c7 0a 00 00 	movl   $0xac7,-0xc(%ebp)
        while(*s != 0){
 781:	eb 1e                	jmp    7a1 <printf+0x11f>
 783:	eb 1c                	jmp    7a1 <printf+0x11f>
          putc(fd, *s);
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	0f b6 00             	movzbl (%eax),%eax
 78b:	0f be c0             	movsbl %al,%eax
 78e:	89 44 24 04          	mov    %eax,0x4(%esp)
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	89 04 24             	mov    %eax,(%esp)
 798:	e8 05 fe ff ff       	call   5a2 <putc>
          s++;
 79d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a4:	0f b6 00             	movzbl (%eax),%eax
 7a7:	84 c0                	test   %al,%al
 7a9:	75 da                	jne    785 <printf+0x103>
 7ab:	eb 68                	jmp    815 <printf+0x193>
        }
      } else if(c == 'c'){
 7ad:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7b1:	75 1d                	jne    7d0 <printf+0x14e>
        putc(fd, *ap);
 7b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	0f be c0             	movsbl %al,%eax
 7bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	89 04 24             	mov    %eax,(%esp)
 7c5:	e8 d8 fd ff ff       	call   5a2 <putc>
        ap++;
 7ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ce:	eb 45                	jmp    815 <printf+0x193>
      } else if(c == '%'){
 7d0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7d4:	75 17                	jne    7ed <printf+0x16b>
        putc(fd, c);
 7d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d9:	0f be c0             	movsbl %al,%eax
 7dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e0:	8b 45 08             	mov    0x8(%ebp),%eax
 7e3:	89 04 24             	mov    %eax,(%esp)
 7e6:	e8 b7 fd ff ff       	call   5a2 <putc>
 7eb:	eb 28                	jmp    815 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ed:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7f4:	00 
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	89 04 24             	mov    %eax,(%esp)
 7fb:	e8 a2 fd ff ff       	call   5a2 <putc>
        putc(fd, c);
 800:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 803:	0f be c0             	movsbl %al,%eax
 806:	89 44 24 04          	mov    %eax,0x4(%esp)
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 8d fd ff ff       	call   5a2 <putc>
      }
      state = 0;
 815:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 81c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 820:	8b 55 0c             	mov    0xc(%ebp),%edx
 823:	8b 45 f0             	mov    -0x10(%ebp),%eax
 826:	01 d0                	add    %edx,%eax
 828:	0f b6 00             	movzbl (%eax),%eax
 82b:	84 c0                	test   %al,%al
 82d:	0f 85 71 fe ff ff    	jne    6a4 <printf+0x22>
    }
  }
}
 833:	c9                   	leave  
 834:	c3                   	ret    

00000835 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 835:	55                   	push   %ebp
 836:	89 e5                	mov    %esp,%ebp
 838:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	83 e8 08             	sub    $0x8,%eax
 841:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 844:	a1 68 0d 00 00       	mov    0xd68,%eax
 849:	89 45 fc             	mov    %eax,-0x4(%ebp)
 84c:	eb 24                	jmp    872 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 856:	77 12                	ja     86a <free+0x35>
 858:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85e:	77 24                	ja     884 <free+0x4f>
 860:	8b 45 fc             	mov    -0x4(%ebp),%eax
 863:	8b 00                	mov    (%eax),%eax
 865:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 868:	77 1a                	ja     884 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86d:	8b 00                	mov    (%eax),%eax
 86f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 872:	8b 45 f8             	mov    -0x8(%ebp),%eax
 875:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 878:	76 d4                	jbe    84e <free+0x19>
 87a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87d:	8b 00                	mov    (%eax),%eax
 87f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 882:	76 ca                	jbe    84e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 891:	8b 45 f8             	mov    -0x8(%ebp),%eax
 894:	01 c2                	add    %eax,%edx
 896:	8b 45 fc             	mov    -0x4(%ebp),%eax
 899:	8b 00                	mov    (%eax),%eax
 89b:	39 c2                	cmp    %eax,%edx
 89d:	75 24                	jne    8c3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 89f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a2:	8b 50 04             	mov    0x4(%eax),%edx
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	8b 00                	mov    (%eax),%eax
 8aa:	8b 40 04             	mov    0x4(%eax),%eax
 8ad:	01 c2                	add    %eax,%edx
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	8b 10                	mov    (%eax),%edx
 8bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bf:	89 10                	mov    %edx,(%eax)
 8c1:	eb 0a                	jmp    8cd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	8b 10                	mov    (%eax),%edx
 8c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d0:	8b 40 04             	mov    0x4(%eax),%eax
 8d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dd:	01 d0                	add    %edx,%eax
 8df:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e2:	75 20                	jne    904 <free+0xcf>
    p->s.size += bp->s.size;
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	8b 50 04             	mov    0x4(%eax),%edx
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 40 04             	mov    0x4(%eax),%eax
 8f0:	01 c2                	add    %eax,%edx
 8f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fb:	8b 10                	mov    (%eax),%edx
 8fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 900:	89 10                	mov    %edx,(%eax)
 902:	eb 08                	jmp    90c <free+0xd7>
  } else
    p->s.ptr = bp;
 904:	8b 45 fc             	mov    -0x4(%ebp),%eax
 907:	8b 55 f8             	mov    -0x8(%ebp),%edx
 90a:	89 10                	mov    %edx,(%eax)
  freep = p;
 90c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90f:	a3 68 0d 00 00       	mov    %eax,0xd68
}
 914:	c9                   	leave  
 915:	c3                   	ret    

00000916 <morecore>:

static Header*
morecore(uint nu)
{
 916:	55                   	push   %ebp
 917:	89 e5                	mov    %esp,%ebp
 919:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 91c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 923:	77 07                	ja     92c <morecore+0x16>
    nu = 4096;
 925:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	c1 e0 03             	shl    $0x3,%eax
 932:	89 04 24             	mov    %eax,(%esp)
 935:	e8 40 fc ff ff       	call   57a <sbrk>
 93a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 93d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 941:	75 07                	jne    94a <morecore+0x34>
    return 0;
 943:	b8 00 00 00 00       	mov    $0x0,%eax
 948:	eb 22                	jmp    96c <morecore+0x56>
  hp = (Header*)p;
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 950:	8b 45 f0             	mov    -0x10(%ebp),%eax
 953:	8b 55 08             	mov    0x8(%ebp),%edx
 956:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	83 c0 08             	add    $0x8,%eax
 95f:	89 04 24             	mov    %eax,(%esp)
 962:	e8 ce fe ff ff       	call   835 <free>
  return freep;
 967:	a1 68 0d 00 00       	mov    0xd68,%eax
}
 96c:	c9                   	leave  
 96d:	c3                   	ret    

0000096e <malloc>:

void*
malloc(uint nbytes)
{
 96e:	55                   	push   %ebp
 96f:	89 e5                	mov    %esp,%ebp
 971:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 974:	8b 45 08             	mov    0x8(%ebp),%eax
 977:	83 c0 07             	add    $0x7,%eax
 97a:	c1 e8 03             	shr    $0x3,%eax
 97d:	83 c0 01             	add    $0x1,%eax
 980:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 983:	a1 68 0d 00 00       	mov    0xd68,%eax
 988:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 98f:	75 23                	jne    9b4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 991:	c7 45 f0 60 0d 00 00 	movl   $0xd60,-0x10(%ebp)
 998:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99b:	a3 68 0d 00 00       	mov    %eax,0xd68
 9a0:	a1 68 0d 00 00       	mov    0xd68,%eax
 9a5:	a3 60 0d 00 00       	mov    %eax,0xd60
    base.s.size = 0;
 9aa:	c7 05 64 0d 00 00 00 	movl   $0x0,0xd64
 9b1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b7:	8b 00                	mov    (%eax),%eax
 9b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	8b 40 04             	mov    0x4(%eax),%eax
 9c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9c5:	72 4d                	jb     a14 <malloc+0xa6>
      if(p->s.size == nunits)
 9c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ca:	8b 40 04             	mov    0x4(%eax),%eax
 9cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9d0:	75 0c                	jne    9de <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d5:	8b 10                	mov    (%eax),%edx
 9d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9da:	89 10                	mov    %edx,(%eax)
 9dc:	eb 26                	jmp    a04 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e1:	8b 40 04             	mov    0x4(%eax),%eax
 9e4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9e7:	89 c2                	mov    %eax,%edx
 9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f2:	8b 40 04             	mov    0x4(%eax),%eax
 9f5:	c1 e0 03             	shl    $0x3,%eax
 9f8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a01:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a07:	a3 68 0d 00 00       	mov    %eax,0xd68
      return (void*)(p + 1);
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	83 c0 08             	add    $0x8,%eax
 a12:	eb 38                	jmp    a4c <malloc+0xde>
    }
    if(p == freep)
 a14:	a1 68 0d 00 00       	mov    0xd68,%eax
 a19:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a1c:	75 1b                	jne    a39 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a21:	89 04 24             	mov    %eax,(%esp)
 a24:	e8 ed fe ff ff       	call   916 <morecore>
 a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a30:	75 07                	jne    a39 <malloc+0xcb>
        return 0;
 a32:	b8 00 00 00 00       	mov    $0x0,%eax
 a37:	eb 13                	jmp    a4c <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a42:	8b 00                	mov    (%eax),%eax
 a44:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a47:	e9 70 ff ff ff       	jmp    9bc <malloc+0x4e>
}
 a4c:	c9                   	leave  
 a4d:	c3                   	ret    
