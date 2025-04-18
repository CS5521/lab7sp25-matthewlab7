
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 b8 09 00 	movl   $0x9b8,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 c9 05 00 00       	call   5ec <printf>
    exit();
  23:	e8 34 04 00 00       	call   45c <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 78 04 00 00       	call   4bc <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 cb 09 00 	movl   $0x9cb,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 78 05 00 00       	call   5ec <printf>
  exit();
  74:	e8 e3 03 00 00       	call   45c <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 bf 02 00 00       	call   474 <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 82 02 00 00       	call   49c <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 78 02 00 00       	call   4b4 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 3a 02 00 00       	call   484 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:

void
ps()
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 2e5:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2eb:	89 04 24             	mov    %eax,(%esp)
 2ee:	e8 09 02 00 00       	call   4fc <getpinfo>
 2f3:	83 f8 ff             	cmp    $0xffffffff,%eax
 2f6:	0f 84 4d 01 00 00    	je     449 <ps+0x170>
    return;
  int i = 0;
 2fc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 303:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 306:	89 d0                	mov    %edx,%eax
 308:	c1 e0 03             	shl    $0x3,%eax
 30b:	01 d0                	add    %edx,%eax
 30d:	c1 e0 02             	shl    $0x2,%eax
 310:	8d 7d e8             	lea    -0x18(%ebp),%edi
 313:	01 f8                	add    %edi,%eax
 315:	2d 04 09 00 00       	sub    $0x904,%eax
 31a:	8b 10                	mov    (%eax),%edx
 31c:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 322:	8b 50 04             	mov    0x4(%eax),%edx
 325:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 32b:	8b 50 08             	mov    0x8(%eax),%edx
 32e:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 334:	8b 50 0c             	mov    0xc(%eax),%edx
 337:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 33d:	8b 50 10             	mov    0x10(%eax),%edx
 340:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 346:	8b 50 14             	mov    0x14(%eax),%edx
 349:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 34f:	8b 50 18             	mov    0x18(%eax),%edx
 352:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 358:	8b 50 1c             	mov    0x1c(%eax),%edx
 35b:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 361:	8b 40 20             	mov    0x20(%eax),%eax
 364:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 36a:	c7 44 24 04 df 09 00 	movl   $0x9df,0x4(%esp)
 371:	00 
 372:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 379:	e8 6e 02 00 00       	call   5ec <printf>
  for(;p.pid != 0; p = table[i])
 37e:	e9 b8 00 00 00       	jmp    43b <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 383:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 38a:	0f be d8             	movsbl %al,%ebx
 38d:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 393:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 399:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 39f:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 3a5:	83 c6 10             	add    $0x10,%esi
 3a8:	89 74 24 18          	mov    %esi,0x18(%esp)
 3ac:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 3b0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 3b4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3b8:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bc:	c7 44 24 04 f8 09 00 	movl   $0x9f8,0x4(%esp)
 3c3:	00 
 3c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cb:	e8 1c 02 00 00       	call   5ec <printf>
    i++;
 3d0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 3d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3d7:	89 d0                	mov    %edx,%eax
 3d9:	c1 e0 03             	shl    $0x3,%eax
 3dc:	01 d0                	add    %edx,%eax
 3de:	c1 e0 02             	shl    $0x2,%eax
 3e1:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3e4:	01 c8                	add    %ecx,%eax
 3e6:	2d 04 09 00 00       	sub    $0x904,%eax
 3eb:	8b 10                	mov    (%eax),%edx
 3ed:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3f3:	8b 50 04             	mov    0x4(%eax),%edx
 3f6:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3fc:	8b 50 08             	mov    0x8(%eax),%edx
 3ff:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 405:	8b 50 0c             	mov    0xc(%eax),%edx
 408:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 40e:	8b 50 10             	mov    0x10(%eax),%edx
 411:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 417:	8b 50 14             	mov    0x14(%eax),%edx
 41a:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 420:	8b 50 18             	mov    0x18(%eax),%edx
 423:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 429:	8b 50 1c             	mov    0x1c(%eax),%edx
 42c:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 432:	8b 40 20             	mov    0x20(%eax),%eax
 435:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 43b:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 441:	85 c0                	test   %eax,%eax
 443:	0f 85 3a ff ff ff    	jne    383 <ps+0xaa>
  }
}
 449:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5f                   	pop    %edi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    

00000454 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 454:	b8 01 00 00 00       	mov    $0x1,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <exit>:
SYSCALL(exit)
 45c:	b8 02 00 00 00       	mov    $0x2,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <wait>:
SYSCALL(wait)
 464:	b8 03 00 00 00       	mov    $0x3,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <pipe>:
SYSCALL(pipe)
 46c:	b8 04 00 00 00       	mov    $0x4,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <read>:
SYSCALL(read)
 474:	b8 05 00 00 00       	mov    $0x5,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <write>:
SYSCALL(write)
 47c:	b8 10 00 00 00       	mov    $0x10,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <close>:
SYSCALL(close)
 484:	b8 15 00 00 00       	mov    $0x15,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <kill>:
SYSCALL(kill)
 48c:	b8 06 00 00 00       	mov    $0x6,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <exec>:
SYSCALL(exec)
 494:	b8 07 00 00 00       	mov    $0x7,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <open>:
SYSCALL(open)
 49c:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <mknod>:
SYSCALL(mknod)
 4a4:	b8 11 00 00 00       	mov    $0x11,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <unlink>:
SYSCALL(unlink)
 4ac:	b8 12 00 00 00       	mov    $0x12,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <fstat>:
SYSCALL(fstat)
 4b4:	b8 08 00 00 00       	mov    $0x8,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <link>:
SYSCALL(link)
 4bc:	b8 13 00 00 00       	mov    $0x13,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <mkdir>:
SYSCALL(mkdir)
 4c4:	b8 14 00 00 00       	mov    $0x14,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <chdir>:
SYSCALL(chdir)
 4cc:	b8 09 00 00 00       	mov    $0x9,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <dup>:
SYSCALL(dup)
 4d4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <getpid>:
SYSCALL(getpid)
 4dc:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <sbrk>:
SYSCALL(sbrk)
 4e4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <sleep>:
SYSCALL(sleep)
 4ec:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <uptime>:
SYSCALL(uptime)
 4f4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <getpinfo>:
SYSCALL(getpinfo)
 4fc:	b8 16 00 00 00       	mov    $0x16,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <settickets>:
 504:	b8 17 00 00 00       	mov    $0x17,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	83 ec 18             	sub    $0x18,%esp
 512:	8b 45 0c             	mov    0xc(%ebp),%eax
 515:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 518:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51f:	00 
 520:	8d 45 f4             	lea    -0xc(%ebp),%eax
 523:	89 44 24 04          	mov    %eax,0x4(%esp)
 527:	8b 45 08             	mov    0x8(%ebp),%eax
 52a:	89 04 24             	mov    %eax,(%esp)
 52d:	e8 4a ff ff ff       	call   47c <write>
}
 532:	c9                   	leave  
 533:	c3                   	ret    

00000534 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	56                   	push   %esi
 538:	53                   	push   %ebx
 539:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 53c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 543:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 547:	74 17                	je     560 <printint+0x2c>
 549:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 54d:	79 11                	jns    560 <printint+0x2c>
    neg = 1;
 54f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 556:	8b 45 0c             	mov    0xc(%ebp),%eax
 559:	f7 d8                	neg    %eax
 55b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55e:	eb 06                	jmp    566 <printint+0x32>
  } else {
    x = xx;
 560:	8b 45 0c             	mov    0xc(%ebp),%eax
 563:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 566:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 56d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 570:	8d 41 01             	lea    0x1(%ecx),%eax
 573:	89 45 f4             	mov    %eax,-0xc(%ebp)
 576:	8b 5d 10             	mov    0x10(%ebp),%ebx
 579:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57c:	ba 00 00 00 00       	mov    $0x0,%edx
 581:	f7 f3                	div    %ebx
 583:	89 d0                	mov    %edx,%eax
 585:	0f b6 80 84 0c 00 00 	movzbl 0xc84(%eax),%eax
 58c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 590:	8b 75 10             	mov    0x10(%ebp),%esi
 593:	8b 45 ec             	mov    -0x14(%ebp),%eax
 596:	ba 00 00 00 00       	mov    $0x0,%edx
 59b:	f7 f6                	div    %esi
 59d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a4:	75 c7                	jne    56d <printint+0x39>
  if(neg)
 5a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5aa:	74 10                	je     5bc <printint+0x88>
    buf[i++] = '-';
 5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5af:	8d 50 01             	lea    0x1(%eax),%edx
 5b2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5b5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5ba:	eb 1f                	jmp    5db <printint+0xa7>
 5bc:	eb 1d                	jmp    5db <printint+0xa7>
    putc(fd, buf[i]);
 5be:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c4:	01 d0                	add    %edx,%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 31 ff ff ff       	call   50c <putc>
  while(--i >= 0)
 5db:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e3:	79 d9                	jns    5be <printint+0x8a>
}
 5e5:	83 c4 30             	add    $0x30,%esp
 5e8:	5b                   	pop    %ebx
 5e9:	5e                   	pop    %esi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret    

000005ec <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5f9:	8d 45 0c             	lea    0xc(%ebp),%eax
 5fc:	83 c0 04             	add    $0x4,%eax
 5ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 602:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 609:	e9 7c 01 00 00       	jmp    78a <printf+0x19e>
    c = fmt[i] & 0xff;
 60e:	8b 55 0c             	mov    0xc(%ebp),%edx
 611:	8b 45 f0             	mov    -0x10(%ebp),%eax
 614:	01 d0                	add    %edx,%eax
 616:	0f b6 00             	movzbl (%eax),%eax
 619:	0f be c0             	movsbl %al,%eax
 61c:	25 ff 00 00 00       	and    $0xff,%eax
 621:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 624:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 628:	75 2c                	jne    656 <printf+0x6a>
      if(c == '%'){
 62a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62e:	75 0c                	jne    63c <printf+0x50>
        state = '%';
 630:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 637:	e9 4a 01 00 00       	jmp    786 <printf+0x19a>
      } else {
        putc(fd, c);
 63c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63f:	0f be c0             	movsbl %al,%eax
 642:	89 44 24 04          	mov    %eax,0x4(%esp)
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	89 04 24             	mov    %eax,(%esp)
 64c:	e8 bb fe ff ff       	call   50c <putc>
 651:	e9 30 01 00 00       	jmp    786 <printf+0x19a>
      }
    } else if(state == '%'){
 656:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 65a:	0f 85 26 01 00 00    	jne    786 <printf+0x19a>
      if(c == 'd'){
 660:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 664:	75 2d                	jne    693 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 666:	8b 45 e8             	mov    -0x18(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 672:	00 
 673:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 67a:	00 
 67b:	89 44 24 04          	mov    %eax,0x4(%esp)
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	89 04 24             	mov    %eax,(%esp)
 685:	e8 aa fe ff ff       	call   534 <printint>
        ap++;
 68a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 68e:	e9 ec 00 00 00       	jmp    77f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 693:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 697:	74 06                	je     69f <printf+0xb3>
 699:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 69d:	75 2d                	jne    6cc <printf+0xe0>
        printint(fd, *ap, 16, 0);
 69f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a2:	8b 00                	mov    (%eax),%eax
 6a4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6ab:	00 
 6ac:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6b3:	00 
 6b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 71 fe ff ff       	call   534 <printint>
        ap++;
 6c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c7:	e9 b3 00 00 00       	jmp    77f <printf+0x193>
      } else if(c == 's'){
 6cc:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6d0:	75 45                	jne    717 <printf+0x12b>
        s = (char*)*ap;
 6d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d5:	8b 00                	mov    (%eax),%eax
 6d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6da:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6e2:	75 09                	jne    6ed <printf+0x101>
          s = "(null)";
 6e4:	c7 45 f4 08 0a 00 00 	movl   $0xa08,-0xc(%ebp)
        while(*s != 0){
 6eb:	eb 1e                	jmp    70b <printf+0x11f>
 6ed:	eb 1c                	jmp    70b <printf+0x11f>
          putc(fd, *s);
 6ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f2:	0f b6 00             	movzbl (%eax),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 05 fe ff ff       	call   50c <putc>
          s++;
 707:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 70b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70e:	0f b6 00             	movzbl (%eax),%eax
 711:	84 c0                	test   %al,%al
 713:	75 da                	jne    6ef <printf+0x103>
 715:	eb 68                	jmp    77f <printf+0x193>
        }
      } else if(c == 'c'){
 717:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 71b:	75 1d                	jne    73a <printf+0x14e>
        putc(fd, *ap);
 71d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 720:	8b 00                	mov    (%eax),%eax
 722:	0f be c0             	movsbl %al,%eax
 725:	89 44 24 04          	mov    %eax,0x4(%esp)
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	89 04 24             	mov    %eax,(%esp)
 72f:	e8 d8 fd ff ff       	call   50c <putc>
        ap++;
 734:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 738:	eb 45                	jmp    77f <printf+0x193>
      } else if(c == '%'){
 73a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 73e:	75 17                	jne    757 <printf+0x16b>
        putc(fd, c);
 740:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 743:	0f be c0             	movsbl %al,%eax
 746:	89 44 24 04          	mov    %eax,0x4(%esp)
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	89 04 24             	mov    %eax,(%esp)
 750:	e8 b7 fd ff ff       	call   50c <putc>
 755:	eb 28                	jmp    77f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 757:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 75e:	00 
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 a2 fd ff ff       	call   50c <putc>
        putc(fd, c);
 76a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76d:	0f be c0             	movsbl %al,%eax
 770:	89 44 24 04          	mov    %eax,0x4(%esp)
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	89 04 24             	mov    %eax,(%esp)
 77a:	e8 8d fd ff ff       	call   50c <putc>
      }
      state = 0;
 77f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 786:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 78a:	8b 55 0c             	mov    0xc(%ebp),%edx
 78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 790:	01 d0                	add    %edx,%eax
 792:	0f b6 00             	movzbl (%eax),%eax
 795:	84 c0                	test   %al,%al
 797:	0f 85 71 fe ff ff    	jne    60e <printf+0x22>
    }
  }
}
 79d:	c9                   	leave  
 79e:	c3                   	ret    

0000079f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79f:	55                   	push   %ebp
 7a0:	89 e5                	mov    %esp,%ebp
 7a2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	83 e8 08             	sub    $0x8,%eax
 7ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ae:	a1 a0 0c 00 00       	mov    0xca0,%eax
 7b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b6:	eb 24                	jmp    7dc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	8b 00                	mov    (%eax),%eax
 7bd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c0:	77 12                	ja     7d4 <free+0x35>
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c8:	77 24                	ja     7ee <free+0x4f>
 7ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cd:	8b 00                	mov    (%eax),%eax
 7cf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d2:	77 1a                	ja     7ee <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d7:	8b 00                	mov    (%eax),%eax
 7d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7df:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e2:	76 d4                	jbe    7b8 <free+0x19>
 7e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e7:	8b 00                	mov    (%eax),%eax
 7e9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ec:	76 ca                	jbe    7b8 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	01 c2                	add    %eax,%edx
 800:	8b 45 fc             	mov    -0x4(%ebp),%eax
 803:	8b 00                	mov    (%eax),%eax
 805:	39 c2                	cmp    %eax,%edx
 807:	75 24                	jne    82d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 809:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80c:	8b 50 04             	mov    0x4(%eax),%edx
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	8b 00                	mov    (%eax),%eax
 814:	8b 40 04             	mov    0x4(%eax),%eax
 817:	01 c2                	add    %eax,%edx
 819:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 81f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 822:	8b 00                	mov    (%eax),%eax
 824:	8b 10                	mov    (%eax),%edx
 826:	8b 45 f8             	mov    -0x8(%ebp),%eax
 829:	89 10                	mov    %edx,(%eax)
 82b:	eb 0a                	jmp    837 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 10                	mov    (%eax),%edx
 832:	8b 45 f8             	mov    -0x8(%ebp),%eax
 835:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	8b 40 04             	mov    0x4(%eax),%eax
 83d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	01 d0                	add    %edx,%eax
 849:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84c:	75 20                	jne    86e <free+0xcf>
    p->s.size += bp->s.size;
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 50 04             	mov    0x4(%eax),%edx
 854:	8b 45 f8             	mov    -0x8(%ebp),%eax
 857:	8b 40 04             	mov    0x4(%eax),%eax
 85a:	01 c2                	add    %eax,%edx
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 862:	8b 45 f8             	mov    -0x8(%ebp),%eax
 865:	8b 10                	mov    (%eax),%edx
 867:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86a:	89 10                	mov    %edx,(%eax)
 86c:	eb 08                	jmp    876 <free+0xd7>
  } else
    p->s.ptr = bp;
 86e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 871:	8b 55 f8             	mov    -0x8(%ebp),%edx
 874:	89 10                	mov    %edx,(%eax)
  freep = p;
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	a3 a0 0c 00 00       	mov    %eax,0xca0
}
 87e:	c9                   	leave  
 87f:	c3                   	ret    

00000880 <morecore>:

static Header*
morecore(uint nu)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 886:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 88d:	77 07                	ja     896 <morecore+0x16>
    nu = 4096;
 88f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 896:	8b 45 08             	mov    0x8(%ebp),%eax
 899:	c1 e0 03             	shl    $0x3,%eax
 89c:	89 04 24             	mov    %eax,(%esp)
 89f:	e8 40 fc ff ff       	call   4e4 <sbrk>
 8a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8a7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8ab:	75 07                	jne    8b4 <morecore+0x34>
    return 0;
 8ad:	b8 00 00 00 00       	mov    $0x0,%eax
 8b2:	eb 22                	jmp    8d6 <morecore+0x56>
  hp = (Header*)p;
 8b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bd:	8b 55 08             	mov    0x8(%ebp),%edx
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c6:	83 c0 08             	add    $0x8,%eax
 8c9:	89 04 24             	mov    %eax,(%esp)
 8cc:	e8 ce fe ff ff       	call   79f <free>
  return freep;
 8d1:	a1 a0 0c 00 00       	mov    0xca0,%eax
}
 8d6:	c9                   	leave  
 8d7:	c3                   	ret    

000008d8 <malloc>:

void*
malloc(uint nbytes)
{
 8d8:	55                   	push   %ebp
 8d9:	89 e5                	mov    %esp,%ebp
 8db:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	83 c0 07             	add    $0x7,%eax
 8e4:	c1 e8 03             	shr    $0x3,%eax
 8e7:	83 c0 01             	add    $0x1,%eax
 8ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8ed:	a1 a0 0c 00 00       	mov    0xca0,%eax
 8f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f9:	75 23                	jne    91e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8fb:	c7 45 f0 98 0c 00 00 	movl   $0xc98,-0x10(%ebp)
 902:	8b 45 f0             	mov    -0x10(%ebp),%eax
 905:	a3 a0 0c 00 00       	mov    %eax,0xca0
 90a:	a1 a0 0c 00 00       	mov    0xca0,%eax
 90f:	a3 98 0c 00 00       	mov    %eax,0xc98
    base.s.size = 0;
 914:	c7 05 9c 0c 00 00 00 	movl   $0x0,0xc9c
 91b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 921:	8b 00                	mov    (%eax),%eax
 923:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 926:	8b 45 f4             	mov    -0xc(%ebp),%eax
 929:	8b 40 04             	mov    0x4(%eax),%eax
 92c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92f:	72 4d                	jb     97e <malloc+0xa6>
      if(p->s.size == nunits)
 931:	8b 45 f4             	mov    -0xc(%ebp),%eax
 934:	8b 40 04             	mov    0x4(%eax),%eax
 937:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 93a:	75 0c                	jne    948 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 10                	mov    (%eax),%edx
 941:	8b 45 f0             	mov    -0x10(%ebp),%eax
 944:	89 10                	mov    %edx,(%eax)
 946:	eb 26                	jmp    96e <malloc+0x96>
      else {
        p->s.size -= nunits;
 948:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94b:	8b 40 04             	mov    0x4(%eax),%eax
 94e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 951:	89 c2                	mov    %eax,%edx
 953:	8b 45 f4             	mov    -0xc(%ebp),%eax
 956:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 959:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95c:	8b 40 04             	mov    0x4(%eax),%eax
 95f:	c1 e0 03             	shl    $0x3,%eax
 962:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 965:	8b 45 f4             	mov    -0xc(%ebp),%eax
 968:	8b 55 ec             	mov    -0x14(%ebp),%edx
 96b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 96e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 971:	a3 a0 0c 00 00       	mov    %eax,0xca0
      return (void*)(p + 1);
 976:	8b 45 f4             	mov    -0xc(%ebp),%eax
 979:	83 c0 08             	add    $0x8,%eax
 97c:	eb 38                	jmp    9b6 <malloc+0xde>
    }
    if(p == freep)
 97e:	a1 a0 0c 00 00       	mov    0xca0,%eax
 983:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 986:	75 1b                	jne    9a3 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 988:	8b 45 ec             	mov    -0x14(%ebp),%eax
 98b:	89 04 24             	mov    %eax,(%esp)
 98e:	e8 ed fe ff ff       	call   880 <morecore>
 993:	89 45 f4             	mov    %eax,-0xc(%ebp)
 996:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 99a:	75 07                	jne    9a3 <malloc+0xcb>
        return 0;
 99c:	b8 00 00 00 00       	mov    $0x0,%eax
 9a1:	eb 13                	jmp    9b6 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ac:	8b 00                	mov    (%eax),%eax
 9ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9b1:	e9 70 ff ff ff       	jmp    926 <malloc+0x4e>
}
 9b6:	c9                   	leave  
 9b7:	c3                   	ret    
