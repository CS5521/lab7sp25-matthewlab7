
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 9e 09 00 	movl   $0x99e,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 af 05 00 00       	call   5d2 <printf>
    exit();
  23:	e8 22 04 00 00       	call   44a <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 f1 01 00 00       	call   23d <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 26 04 00 00       	call   47a <kill>
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
  exit();
  62:	e8 e3 03 00 00       	call   44a <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  98:	90                   	nop
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 55 08             	mov    %edx,0x8(%ebp)
  a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  a5:	8d 4a 01             	lea    0x1(%edx),%ecx
  a8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ab:	0f b6 12             	movzbl (%edx),%edx
  ae:	88 10                	mov    %dl,(%eax)
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	84 c0                	test   %al,%al
  b5:	75 e2                	jne    99 <strcpy+0xd>
    ;
  return os;
  b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  bf:	eb 08                	jmp    c9 <strcmp+0xd>
    p++, q++;
  c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 00             	movzbl (%eax),%eax
  cf:	84 c0                	test   %al,%al
  d1:	74 10                	je     e3 <strcmp+0x27>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 10             	movzbl (%eax),%edx
  d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	38 c2                	cmp    %al,%dl
  e1:	74 de                	je     c1 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	0f b6 d0             	movzbl %al,%edx
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	0f b6 c0             	movzbl %al,%eax
  f5:	29 c2                	sub    %eax,%edx
  f7:	89 d0                	mov    %edx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(const char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 04                	jmp    10e <strlen+0x13>
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	01 d0                	add    %edx,%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ed                	jne    10a <strlen+0xf>
    ;
  return n;
 11d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <memset>:

void*
memset(void *dst, int c, uint n)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 128:	8b 45 10             	mov    0x10(%ebp),%eax
 12b:	89 44 24 08          	mov    %eax,0x8(%esp)
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 44 24 04          	mov    %eax,0x4(%esp)
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	89 04 24             	mov    %eax,(%esp)
 13c:	e8 26 ff ff ff       	call   67 <stosb>
  return dst;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	8b 45 0c             	mov    0xc(%ebp),%eax
 14f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 152:	eb 14                	jmp    168 <strchr+0x22>
    if(*s == c)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15d:	75 05                	jne    164 <strchr+0x1e>
      return (char*)s;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	eb 13                	jmp    177 <strchr+0x31>
  for(; *s; s++)
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	75 e2                	jne    154 <strchr+0xe>
  return 0;
 172:	b8 00 00 00 00       	mov    $0x0,%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <gets>:

char*
gets(char *buf, int max)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 186:	eb 4c                	jmp    1d4 <gets+0x5b>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 bf 02 00 00       	call   462 <read>
 1a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	7f 02                	jg     1ae <gets+0x35>
      break;
 1ac:	eb 31                	jmp    1df <gets+0x66>
    buf[i++] = c;
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	8d 50 01             	lea    0x1(%eax),%edx
 1b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b7:	89 c2                	mov    %eax,%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 c2                	add    %eax,%edx
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0a                	cmp    $0xa,%al
 1ca:	74 13                	je     1df <gets+0x66>
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	3c 0d                	cmp    $0xd,%al
 1d2:	74 0b                	je     1df <gets+0x66>
  for(i=0; i+1 < max; ){
 1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1dd:	7c a9                	jl     188 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fc:	00 
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	89 04 24             	mov    %eax,(%esp)
 203:	e8 82 02 00 00       	call   48a <open>
 208:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20f:	79 07                	jns    218 <stat+0x29>
    return -1;
 211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 216:	eb 23                	jmp    23b <stat+0x4c>
  r = fstat(fd, st);
 218:	8b 45 0c             	mov    0xc(%ebp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 78 02 00 00       	call   4a2 <fstat>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 3a 02 00 00       	call   472 <close>
  return r;
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <atoi>:

int
atoi(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24a:	eb 25                	jmp    271 <atoi+0x34>
    n = n*10 + *s++ - '0';
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 02             	shl    $0x2,%eax
 254:	01 d0                	add    %edx,%eax
 256:	01 c0                	add    %eax,%eax
 258:	89 c1                	mov    %eax,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 08             	mov    %edx,0x8(%ebp)
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	01 c8                	add    %ecx,%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 0a                	jle    285 <atoi+0x48>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 39                	cmp    $0x39,%al
 283:	7e c7                	jle    24c <atoi+0xf>
  return n;
 285:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29c:	eb 17                	jmp    2b5 <memmove+0x2b>
    *dst++ = *src++;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a1:	8d 50 01             	lea    0x1(%eax),%edx
 2a4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2aa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b0:	0f b6 12             	movzbl (%edx),%edx
 2b3:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2bb:	89 55 10             	mov    %edx,0x10(%ebp)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7f dc                	jg     29e <memmove+0x14>
  return vdst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <ps>:

void
ps()
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 2d3:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2d9:	89 04 24             	mov    %eax,(%esp)
 2dc:	e8 09 02 00 00       	call   4ea <getpinfo>
 2e1:	83 f8 ff             	cmp    $0xffffffff,%eax
 2e4:	0f 84 4d 01 00 00    	je     437 <ps+0x170>
    return;
  int i = 0;
 2ea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 2f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f4:	89 d0                	mov    %edx,%eax
 2f6:	c1 e0 03             	shl    $0x3,%eax
 2f9:	01 d0                	add    %edx,%eax
 2fb:	c1 e0 02             	shl    $0x2,%eax
 2fe:	8d 7d e8             	lea    -0x18(%ebp),%edi
 301:	01 f8                	add    %edi,%eax
 303:	2d 04 09 00 00       	sub    $0x904,%eax
 308:	8b 10                	mov    (%eax),%edx
 30a:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 310:	8b 50 04             	mov    0x4(%eax),%edx
 313:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 319:	8b 50 08             	mov    0x8(%eax),%edx
 31c:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 322:	8b 50 0c             	mov    0xc(%eax),%edx
 325:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 32b:	8b 50 10             	mov    0x10(%eax),%edx
 32e:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 334:	8b 50 14             	mov    0x14(%eax),%edx
 337:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 33d:	8b 50 18             	mov    0x18(%eax),%edx
 340:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 346:	8b 50 1c             	mov    0x1c(%eax),%edx
 349:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 34f:	8b 40 20             	mov    0x20(%eax),%eax
 352:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 358:	c7 44 24 04 b2 09 00 	movl   $0x9b2,0x4(%esp)
 35f:	00 
 360:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 367:	e8 66 02 00 00       	call   5d2 <printf>
  for(;p.pid != 0; p = table[i])
 36c:	e9 b8 00 00 00       	jmp    429 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 371:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 378:	0f be d8             	movsbl %al,%ebx
 37b:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 381:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 387:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 38d:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 393:	83 c6 10             	add    $0x10,%esi
 396:	89 74 24 18          	mov    %esi,0x18(%esp)
 39a:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 39e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 3a2:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3a6:	89 44 24 08          	mov    %eax,0x8(%esp)
 3aa:	c7 44 24 04 cb 09 00 	movl   $0x9cb,0x4(%esp)
 3b1:	00 
 3b2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b9:	e8 14 02 00 00       	call   5d2 <printf>
    i++;
 3be:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 3c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	c1 e0 03             	shl    $0x3,%eax
 3ca:	01 d0                	add    %edx,%eax
 3cc:	c1 e0 02             	shl    $0x2,%eax
 3cf:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3d2:	01 c8                	add    %ecx,%eax
 3d4:	2d 04 09 00 00       	sub    $0x904,%eax
 3d9:	8b 10                	mov    (%eax),%edx
 3db:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3e1:	8b 50 04             	mov    0x4(%eax),%edx
 3e4:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3ea:	8b 50 08             	mov    0x8(%eax),%edx
 3ed:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3f3:	8b 50 0c             	mov    0xc(%eax),%edx
 3f6:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3fc:	8b 50 10             	mov    0x10(%eax),%edx
 3ff:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 405:	8b 50 14             	mov    0x14(%eax),%edx
 408:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 40e:	8b 50 18             	mov    0x18(%eax),%edx
 411:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 417:	8b 50 1c             	mov    0x1c(%eax),%edx
 41a:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 420:	8b 40 20             	mov    0x20(%eax),%eax
 423:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 429:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 42f:	85 c0                	test   %eax,%eax
 431:	0f 85 3a ff ff ff    	jne    371 <ps+0xaa>
  }
}
 437:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 43d:	5b                   	pop    %ebx
 43e:	5e                   	pop    %esi
 43f:	5f                   	pop    %edi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 442:	b8 01 00 00 00       	mov    $0x1,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <exit>:
SYSCALL(exit)
 44a:	b8 02 00 00 00       	mov    $0x2,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <wait>:
SYSCALL(wait)
 452:	b8 03 00 00 00       	mov    $0x3,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <pipe>:
SYSCALL(pipe)
 45a:	b8 04 00 00 00       	mov    $0x4,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <read>:
SYSCALL(read)
 462:	b8 05 00 00 00       	mov    $0x5,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <write>:
SYSCALL(write)
 46a:	b8 10 00 00 00       	mov    $0x10,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <close>:
SYSCALL(close)
 472:	b8 15 00 00 00       	mov    $0x15,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <kill>:
SYSCALL(kill)
 47a:	b8 06 00 00 00       	mov    $0x6,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <exec>:
SYSCALL(exec)
 482:	b8 07 00 00 00       	mov    $0x7,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <open>:
SYSCALL(open)
 48a:	b8 0f 00 00 00       	mov    $0xf,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <mknod>:
SYSCALL(mknod)
 492:	b8 11 00 00 00       	mov    $0x11,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <unlink>:
SYSCALL(unlink)
 49a:	b8 12 00 00 00       	mov    $0x12,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <fstat>:
SYSCALL(fstat)
 4a2:	b8 08 00 00 00       	mov    $0x8,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <link>:
SYSCALL(link)
 4aa:	b8 13 00 00 00       	mov    $0x13,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <mkdir>:
SYSCALL(mkdir)
 4b2:	b8 14 00 00 00       	mov    $0x14,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <chdir>:
SYSCALL(chdir)
 4ba:	b8 09 00 00 00       	mov    $0x9,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <dup>:
SYSCALL(dup)
 4c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <getpid>:
SYSCALL(getpid)
 4ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <sbrk>:
SYSCALL(sbrk)
 4d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <sleep>:
SYSCALL(sleep)
 4da:	b8 0d 00 00 00       	mov    $0xd,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <uptime>:
SYSCALL(uptime)
 4e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <getpinfo>:
SYSCALL(getpinfo)
 4ea:	b8 16 00 00 00       	mov    $0x16,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	83 ec 18             	sub    $0x18,%esp
 4f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 505:	00 
 506:	8d 45 f4             	lea    -0xc(%ebp),%eax
 509:	89 44 24 04          	mov    %eax,0x4(%esp)
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	89 04 24             	mov    %eax,(%esp)
 513:	e8 52 ff ff ff       	call   46a <write>
}
 518:	c9                   	leave  
 519:	c3                   	ret    

0000051a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 51a:	55                   	push   %ebp
 51b:	89 e5                	mov    %esp,%ebp
 51d:	56                   	push   %esi
 51e:	53                   	push   %ebx
 51f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 522:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 529:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 52d:	74 17                	je     546 <printint+0x2c>
 52f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 533:	79 11                	jns    546 <printint+0x2c>
    neg = 1;
 535:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 53c:	8b 45 0c             	mov    0xc(%ebp),%eax
 53f:	f7 d8                	neg    %eax
 541:	89 45 ec             	mov    %eax,-0x14(%ebp)
 544:	eb 06                	jmp    54c <printint+0x32>
  } else {
    x = xx;
 546:	8b 45 0c             	mov    0xc(%ebp),%eax
 549:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 54c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 553:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 556:	8d 41 01             	lea    0x1(%ecx),%eax
 559:	89 45 f4             	mov    %eax,-0xc(%ebp)
 55c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 55f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 562:	ba 00 00 00 00       	mov    $0x0,%edx
 567:	f7 f3                	div    %ebx
 569:	89 d0                	mov    %edx,%eax
 56b:	0f b6 80 58 0c 00 00 	movzbl 0xc58(%eax),%eax
 572:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 576:	8b 75 10             	mov    0x10(%ebp),%esi
 579:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57c:	ba 00 00 00 00       	mov    $0x0,%edx
 581:	f7 f6                	div    %esi
 583:	89 45 ec             	mov    %eax,-0x14(%ebp)
 586:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 58a:	75 c7                	jne    553 <printint+0x39>
  if(neg)
 58c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 590:	74 10                	je     5a2 <printint+0x88>
    buf[i++] = '-';
 592:	8b 45 f4             	mov    -0xc(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 f4             	mov    %edx,-0xc(%ebp)
 59b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5a0:	eb 1f                	jmp    5c1 <printint+0xa7>
 5a2:	eb 1d                	jmp    5c1 <printint+0xa7>
    putc(fd, buf[i]);
 5a4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5aa:	01 d0                	add    %edx,%eax
 5ac:	0f b6 00             	movzbl (%eax),%eax
 5af:	0f be c0             	movsbl %al,%eax
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	89 04 24             	mov    %eax,(%esp)
 5bc:	e8 31 ff ff ff       	call   4f2 <putc>
  while(--i >= 0)
 5c1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c9:	79 d9                	jns    5a4 <printint+0x8a>
}
 5cb:	83 c4 30             	add    $0x30,%esp
 5ce:	5b                   	pop    %ebx
 5cf:	5e                   	pop    %esi
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    

000005d2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d2:	55                   	push   %ebp
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5df:	8d 45 0c             	lea    0xc(%ebp),%eax
 5e2:	83 c0 04             	add    $0x4,%eax
 5e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5e8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ef:	e9 7c 01 00 00       	jmp    770 <printf+0x19e>
    c = fmt[i] & 0xff;
 5f4:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5fa:	01 d0                	add    %edx,%eax
 5fc:	0f b6 00             	movzbl (%eax),%eax
 5ff:	0f be c0             	movsbl %al,%eax
 602:	25 ff 00 00 00       	and    $0xff,%eax
 607:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 60a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60e:	75 2c                	jne    63c <printf+0x6a>
      if(c == '%'){
 610:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 614:	75 0c                	jne    622 <printf+0x50>
        state = '%';
 616:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 61d:	e9 4a 01 00 00       	jmp    76c <printf+0x19a>
      } else {
        putc(fd, c);
 622:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	89 44 24 04          	mov    %eax,0x4(%esp)
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	89 04 24             	mov    %eax,(%esp)
 632:	e8 bb fe ff ff       	call   4f2 <putc>
 637:	e9 30 01 00 00       	jmp    76c <printf+0x19a>
      }
    } else if(state == '%'){
 63c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 640:	0f 85 26 01 00 00    	jne    76c <printf+0x19a>
      if(c == 'd'){
 646:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 64a:	75 2d                	jne    679 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 64c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 658:	00 
 659:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 660:	00 
 661:	89 44 24 04          	mov    %eax,0x4(%esp)
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	89 04 24             	mov    %eax,(%esp)
 66b:	e8 aa fe ff ff       	call   51a <printint>
        ap++;
 670:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 674:	e9 ec 00 00 00       	jmp    765 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 679:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 67d:	74 06                	je     685 <printf+0xb3>
 67f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 683:	75 2d                	jne    6b2 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 685:	8b 45 e8             	mov    -0x18(%ebp),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 691:	00 
 692:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 699:	00 
 69a:	89 44 24 04          	mov    %eax,0x4(%esp)
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	89 04 24             	mov    %eax,(%esp)
 6a4:	e8 71 fe ff ff       	call   51a <printint>
        ap++;
 6a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ad:	e9 b3 00 00 00       	jmp    765 <printf+0x193>
      } else if(c == 's'){
 6b2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b6:	75 45                	jne    6fd <printf+0x12b>
        s = (char*)*ap;
 6b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6bb:	8b 00                	mov    (%eax),%eax
 6bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c8:	75 09                	jne    6d3 <printf+0x101>
          s = "(null)";
 6ca:	c7 45 f4 db 09 00 00 	movl   $0x9db,-0xc(%ebp)
        while(*s != 0){
 6d1:	eb 1e                	jmp    6f1 <printf+0x11f>
 6d3:	eb 1c                	jmp    6f1 <printf+0x11f>
          putc(fd, *s);
 6d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d8:	0f b6 00             	movzbl (%eax),%eax
 6db:	0f be c0             	movsbl %al,%eax
 6de:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 05 fe ff ff       	call   4f2 <putc>
          s++;
 6ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f4:	0f b6 00             	movzbl (%eax),%eax
 6f7:	84 c0                	test   %al,%al
 6f9:	75 da                	jne    6d5 <printf+0x103>
 6fb:	eb 68                	jmp    765 <printf+0x193>
        }
      } else if(c == 'c'){
 6fd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 701:	75 1d                	jne    720 <printf+0x14e>
        putc(fd, *ap);
 703:	8b 45 e8             	mov    -0x18(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	0f be c0             	movsbl %al,%eax
 70b:	89 44 24 04          	mov    %eax,0x4(%esp)
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	89 04 24             	mov    %eax,(%esp)
 715:	e8 d8 fd ff ff       	call   4f2 <putc>
        ap++;
 71a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71e:	eb 45                	jmp    765 <printf+0x193>
      } else if(c == '%'){
 720:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 724:	75 17                	jne    73d <printf+0x16b>
        putc(fd, c);
 726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 729:	0f be c0             	movsbl %al,%eax
 72c:	89 44 24 04          	mov    %eax,0x4(%esp)
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 b7 fd ff ff       	call   4f2 <putc>
 73b:	eb 28                	jmp    765 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 73d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 744:	00 
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 a2 fd ff ff       	call   4f2 <putc>
        putc(fd, c);
 750:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 753:	0f be c0             	movsbl %al,%eax
 756:	89 44 24 04          	mov    %eax,0x4(%esp)
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	89 04 24             	mov    %eax,(%esp)
 760:	e8 8d fd ff ff       	call   4f2 <putc>
      }
      state = 0;
 765:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 76c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 770:	8b 55 0c             	mov    0xc(%ebp),%edx
 773:	8b 45 f0             	mov    -0x10(%ebp),%eax
 776:	01 d0                	add    %edx,%eax
 778:	0f b6 00             	movzbl (%eax),%eax
 77b:	84 c0                	test   %al,%al
 77d:	0f 85 71 fe ff ff    	jne    5f4 <printf+0x22>
    }
  }
}
 783:	c9                   	leave  
 784:	c3                   	ret    

00000785 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 785:	55                   	push   %ebp
 786:	89 e5                	mov    %esp,%ebp
 788:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	83 e8 08             	sub    $0x8,%eax
 791:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 794:	a1 74 0c 00 00       	mov    0xc74,%eax
 799:	89 45 fc             	mov    %eax,-0x4(%ebp)
 79c:	eb 24                	jmp    7c2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a6:	77 12                	ja     7ba <free+0x35>
 7a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ab:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ae:	77 24                	ja     7d4 <free+0x4f>
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 00                	mov    (%eax),%eax
 7b5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b8:	77 1a                	ja     7d4 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 00                	mov    (%eax),%eax
 7bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c8:	76 d4                	jbe    79e <free+0x19>
 7ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cd:	8b 00                	mov    (%eax),%eax
 7cf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d2:	76 ca                	jbe    79e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d7:	8b 40 04             	mov    0x4(%eax),%eax
 7da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	01 c2                	add    %eax,%edx
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	39 c2                	cmp    %eax,%edx
 7ed:	75 24                	jne    813 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	8b 50 04             	mov    0x4(%eax),%edx
 7f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f8:	8b 00                	mov    (%eax),%eax
 7fa:	8b 40 04             	mov    0x4(%eax),%eax
 7fd:	01 c2                	add    %eax,%edx
 7ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 802:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	8b 00                	mov    (%eax),%eax
 80a:	8b 10                	mov    (%eax),%edx
 80c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80f:	89 10                	mov    %edx,(%eax)
 811:	eb 0a                	jmp    81d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 813:	8b 45 fc             	mov    -0x4(%ebp),%eax
 816:	8b 10                	mov    (%eax),%edx
 818:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 81d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 820:	8b 40 04             	mov    0x4(%eax),%eax
 823:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	01 d0                	add    %edx,%eax
 82f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 832:	75 20                	jne    854 <free+0xcf>
    p->s.size += bp->s.size;
 834:	8b 45 fc             	mov    -0x4(%ebp),%eax
 837:	8b 50 04             	mov    0x4(%eax),%edx
 83a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83d:	8b 40 04             	mov    0x4(%eax),%eax
 840:	01 c2                	add    %eax,%edx
 842:	8b 45 fc             	mov    -0x4(%ebp),%eax
 845:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	8b 10                	mov    (%eax),%edx
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	89 10                	mov    %edx,(%eax)
 852:	eb 08                	jmp    85c <free+0xd7>
  } else
    p->s.ptr = bp;
 854:	8b 45 fc             	mov    -0x4(%ebp),%eax
 857:	8b 55 f8             	mov    -0x8(%ebp),%edx
 85a:	89 10                	mov    %edx,(%eax)
  freep = p;
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	a3 74 0c 00 00       	mov    %eax,0xc74
}
 864:	c9                   	leave  
 865:	c3                   	ret    

00000866 <morecore>:

static Header*
morecore(uint nu)
{
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 86c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 873:	77 07                	ja     87c <morecore+0x16>
    nu = 4096;
 875:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	c1 e0 03             	shl    $0x3,%eax
 882:	89 04 24             	mov    %eax,(%esp)
 885:	e8 48 fc ff ff       	call   4d2 <sbrk>
 88a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 88d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 891:	75 07                	jne    89a <morecore+0x34>
    return 0;
 893:	b8 00 00 00 00       	mov    $0x0,%eax
 898:	eb 22                	jmp    8bc <morecore+0x56>
  hp = (Header*)p;
 89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a3:	8b 55 08             	mov    0x8(%ebp),%edx
 8a6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ac:	83 c0 08             	add    $0x8,%eax
 8af:	89 04 24             	mov    %eax,(%esp)
 8b2:	e8 ce fe ff ff       	call   785 <free>
  return freep;
 8b7:	a1 74 0c 00 00       	mov    0xc74,%eax
}
 8bc:	c9                   	leave  
 8bd:	c3                   	ret    

000008be <malloc>:

void*
malloc(uint nbytes)
{
 8be:	55                   	push   %ebp
 8bf:	89 e5                	mov    %esp,%ebp
 8c1:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	83 c0 07             	add    $0x7,%eax
 8ca:	c1 e8 03             	shr    $0x3,%eax
 8cd:	83 c0 01             	add    $0x1,%eax
 8d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d3:	a1 74 0c 00 00       	mov    0xc74,%eax
 8d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8df:	75 23                	jne    904 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e1:	c7 45 f0 6c 0c 00 00 	movl   $0xc6c,-0x10(%ebp)
 8e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8eb:	a3 74 0c 00 00       	mov    %eax,0xc74
 8f0:	a1 74 0c 00 00       	mov    0xc74,%eax
 8f5:	a3 6c 0c 00 00       	mov    %eax,0xc6c
    base.s.size = 0;
 8fa:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 901:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 904:	8b 45 f0             	mov    -0x10(%ebp),%eax
 907:	8b 00                	mov    (%eax),%eax
 909:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 90c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90f:	8b 40 04             	mov    0x4(%eax),%eax
 912:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 915:	72 4d                	jb     964 <malloc+0xa6>
      if(p->s.size == nunits)
 917:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91a:	8b 40 04             	mov    0x4(%eax),%eax
 91d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 920:	75 0c                	jne    92e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 922:	8b 45 f4             	mov    -0xc(%ebp),%eax
 925:	8b 10                	mov    (%eax),%edx
 927:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92a:	89 10                	mov    %edx,(%eax)
 92c:	eb 26                	jmp    954 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	2b 45 ec             	sub    -0x14(%ebp),%eax
 937:	89 c2                	mov    %eax,%edx
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	8b 40 04             	mov    0x4(%eax),%eax
 945:	c1 e0 03             	shl    $0x3,%eax
 948:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 951:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 954:	8b 45 f0             	mov    -0x10(%ebp),%eax
 957:	a3 74 0c 00 00       	mov    %eax,0xc74
      return (void*)(p + 1);
 95c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95f:	83 c0 08             	add    $0x8,%eax
 962:	eb 38                	jmp    99c <malloc+0xde>
    }
    if(p == freep)
 964:	a1 74 0c 00 00       	mov    0xc74,%eax
 969:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 96c:	75 1b                	jne    989 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 96e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 971:	89 04 24             	mov    %eax,(%esp)
 974:	e8 ed fe ff ff       	call   866 <morecore>
 979:	89 45 f4             	mov    %eax,-0xc(%ebp)
 97c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 980:	75 07                	jne    989 <malloc+0xcb>
        return 0;
 982:	b8 00 00 00 00       	mov    $0x0,%eax
 987:	eb 13                	jmp    99c <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 992:	8b 00                	mov    (%eax),%eax
 994:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 997:	e9 70 ff ff ff       	jmp    90c <malloc+0x4e>
}
 99c:	c9                   	leave  
 99d:	c3                   	ret    
