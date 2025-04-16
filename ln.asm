
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
   f:	c7 44 24 04 b0 09 00 	movl   $0x9b0,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 c1 05 00 00       	call   5e4 <printf>
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
  60:	c7 44 24 04 c3 09 00 	movl   $0x9c3,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 70 05 00 00       	call   5e4 <printf>
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
 36a:	c7 44 24 04 d7 09 00 	movl   $0x9d7,0x4(%esp)
 371:	00 
 372:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 379:	e8 66 02 00 00       	call   5e4 <printf>
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
 3bc:	c7 44 24 04 f0 09 00 	movl   $0x9f0,0x4(%esp)
 3c3:	00 
 3c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cb:	e8 14 02 00 00       	call   5e4 <printf>
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

00000504 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	83 ec 18             	sub    $0x18,%esp
 50a:	8b 45 0c             	mov    0xc(%ebp),%eax
 50d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 510:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 517:	00 
 518:	8d 45 f4             	lea    -0xc(%ebp),%eax
 51b:	89 44 24 04          	mov    %eax,0x4(%esp)
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
 522:	89 04 24             	mov    %eax,(%esp)
 525:	e8 52 ff ff ff       	call   47c <write>
}
 52a:	c9                   	leave  
 52b:	c3                   	ret    

0000052c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	56                   	push   %esi
 530:	53                   	push   %ebx
 531:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 534:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 53b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 53f:	74 17                	je     558 <printint+0x2c>
 541:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 545:	79 11                	jns    558 <printint+0x2c>
    neg = 1;
 547:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 54e:	8b 45 0c             	mov    0xc(%ebp),%eax
 551:	f7 d8                	neg    %eax
 553:	89 45 ec             	mov    %eax,-0x14(%ebp)
 556:	eb 06                	jmp    55e <printint+0x32>
  } else {
    x = xx;
 558:	8b 45 0c             	mov    0xc(%ebp),%eax
 55b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 55e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 565:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 568:	8d 41 01             	lea    0x1(%ecx),%eax
 56b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 56e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 571:	8b 45 ec             	mov    -0x14(%ebp),%eax
 574:	ba 00 00 00 00       	mov    $0x0,%edx
 579:	f7 f3                	div    %ebx
 57b:	89 d0                	mov    %edx,%eax
 57d:	0f b6 80 7c 0c 00 00 	movzbl 0xc7c(%eax),%eax
 584:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 588:	8b 75 10             	mov    0x10(%ebp),%esi
 58b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
 593:	f7 f6                	div    %esi
 595:	89 45 ec             	mov    %eax,-0x14(%ebp)
 598:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 59c:	75 c7                	jne    565 <printint+0x39>
  if(neg)
 59e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a2:	74 10                	je     5b4 <printint+0x88>
    buf[i++] = '-';
 5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a7:	8d 50 01             	lea    0x1(%eax),%edx
 5aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5ad:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5b2:	eb 1f                	jmp    5d3 <printint+0xa7>
 5b4:	eb 1d                	jmp    5d3 <printint+0xa7>
    putc(fd, buf[i]);
 5b6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bc:	01 d0                	add    %edx,%eax
 5be:	0f b6 00             	movzbl (%eax),%eax
 5c1:	0f be c0             	movsbl %al,%eax
 5c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	89 04 24             	mov    %eax,(%esp)
 5ce:	e8 31 ff ff ff       	call   504 <putc>
  while(--i >= 0)
 5d3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5db:	79 d9                	jns    5b6 <printint+0x8a>
}
 5dd:	83 c4 30             	add    $0x30,%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5f1:	8d 45 0c             	lea    0xc(%ebp),%eax
 5f4:	83 c0 04             	add    $0x4,%eax
 5f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 601:	e9 7c 01 00 00       	jmp    782 <printf+0x19e>
    c = fmt[i] & 0xff;
 606:	8b 55 0c             	mov    0xc(%ebp),%edx
 609:	8b 45 f0             	mov    -0x10(%ebp),%eax
 60c:	01 d0                	add    %edx,%eax
 60e:	0f b6 00             	movzbl (%eax),%eax
 611:	0f be c0             	movsbl %al,%eax
 614:	25 ff 00 00 00       	and    $0xff,%eax
 619:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 61c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 620:	75 2c                	jne    64e <printf+0x6a>
      if(c == '%'){
 622:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 626:	75 0c                	jne    634 <printf+0x50>
        state = '%';
 628:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 62f:	e9 4a 01 00 00       	jmp    77e <printf+0x19a>
      } else {
        putc(fd, c);
 634:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 637:	0f be c0             	movsbl %al,%eax
 63a:	89 44 24 04          	mov    %eax,0x4(%esp)
 63e:	8b 45 08             	mov    0x8(%ebp),%eax
 641:	89 04 24             	mov    %eax,(%esp)
 644:	e8 bb fe ff ff       	call   504 <putc>
 649:	e9 30 01 00 00       	jmp    77e <printf+0x19a>
      }
    } else if(state == '%'){
 64e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 652:	0f 85 26 01 00 00    	jne    77e <printf+0x19a>
      if(c == 'd'){
 658:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 65c:	75 2d                	jne    68b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 65e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 66a:	00 
 66b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 672:	00 
 673:	89 44 24 04          	mov    %eax,0x4(%esp)
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	89 04 24             	mov    %eax,(%esp)
 67d:	e8 aa fe ff ff       	call   52c <printint>
        ap++;
 682:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 686:	e9 ec 00 00 00       	jmp    777 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 68b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 68f:	74 06                	je     697 <printf+0xb3>
 691:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 695:	75 2d                	jne    6c4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 697:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6a3:	00 
 6a4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6ab:	00 
 6ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b0:	8b 45 08             	mov    0x8(%ebp),%eax
 6b3:	89 04 24             	mov    %eax,(%esp)
 6b6:	e8 71 fe ff ff       	call   52c <printint>
        ap++;
 6bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6bf:	e9 b3 00 00 00       	jmp    777 <printf+0x193>
      } else if(c == 's'){
 6c4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6c8:	75 45                	jne    70f <printf+0x12b>
        s = (char*)*ap;
 6ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6cd:	8b 00                	mov    (%eax),%eax
 6cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6da:	75 09                	jne    6e5 <printf+0x101>
          s = "(null)";
 6dc:	c7 45 f4 00 0a 00 00 	movl   $0xa00,-0xc(%ebp)
        while(*s != 0){
 6e3:	eb 1e                	jmp    703 <printf+0x11f>
 6e5:	eb 1c                	jmp    703 <printf+0x11f>
          putc(fd, *s);
 6e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ea:	0f b6 00             	movzbl (%eax),%eax
 6ed:	0f be c0             	movsbl %al,%eax
 6f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	89 04 24             	mov    %eax,(%esp)
 6fa:	e8 05 fe ff ff       	call   504 <putc>
          s++;
 6ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 703:	8b 45 f4             	mov    -0xc(%ebp),%eax
 706:	0f b6 00             	movzbl (%eax),%eax
 709:	84 c0                	test   %al,%al
 70b:	75 da                	jne    6e7 <printf+0x103>
 70d:	eb 68                	jmp    777 <printf+0x193>
        }
      } else if(c == 'c'){
 70f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 713:	75 1d                	jne    732 <printf+0x14e>
        putc(fd, *ap);
 715:	8b 45 e8             	mov    -0x18(%ebp),%eax
 718:	8b 00                	mov    (%eax),%eax
 71a:	0f be c0             	movsbl %al,%eax
 71d:	89 44 24 04          	mov    %eax,0x4(%esp)
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	89 04 24             	mov    %eax,(%esp)
 727:	e8 d8 fd ff ff       	call   504 <putc>
        ap++;
 72c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 730:	eb 45                	jmp    777 <printf+0x193>
      } else if(c == '%'){
 732:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 736:	75 17                	jne    74f <printf+0x16b>
        putc(fd, c);
 738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73b:	0f be c0             	movsbl %al,%eax
 73e:	89 44 24 04          	mov    %eax,0x4(%esp)
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 b7 fd ff ff       	call   504 <putc>
 74d:	eb 28                	jmp    777 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 74f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 756:	00 
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 a2 fd ff ff       	call   504 <putc>
        putc(fd, c);
 762:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 765:	0f be c0             	movsbl %al,%eax
 768:	89 44 24 04          	mov    %eax,0x4(%esp)
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 8d fd ff ff       	call   504 <putc>
      }
      state = 0;
 777:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 77e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 782:	8b 55 0c             	mov    0xc(%ebp),%edx
 785:	8b 45 f0             	mov    -0x10(%ebp),%eax
 788:	01 d0                	add    %edx,%eax
 78a:	0f b6 00             	movzbl (%eax),%eax
 78d:	84 c0                	test   %al,%al
 78f:	0f 85 71 fe ff ff    	jne    606 <printf+0x22>
    }
  }
}
 795:	c9                   	leave  
 796:	c3                   	ret    

00000797 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 797:	55                   	push   %ebp
 798:	89 e5                	mov    %esp,%ebp
 79a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	83 e8 08             	sub    $0x8,%eax
 7a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a6:	a1 98 0c 00 00       	mov    0xc98,%eax
 7ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ae:	eb 24                	jmp    7d4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 00                	mov    (%eax),%eax
 7b5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b8:	77 12                	ja     7cc <free+0x35>
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c0:	77 24                	ja     7e6 <free+0x4f>
 7c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c5:	8b 00                	mov    (%eax),%eax
 7c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ca:	77 1a                	ja     7e6 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cf:	8b 00                	mov    (%eax),%eax
 7d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7da:	76 d4                	jbe    7b0 <free+0x19>
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e4:	76 ca                	jbe    7b0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e9:	8b 40 04             	mov    0x4(%eax),%eax
 7ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f6:	01 c2                	add    %eax,%edx
 7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fb:	8b 00                	mov    (%eax),%eax
 7fd:	39 c2                	cmp    %eax,%edx
 7ff:	75 24                	jne    825 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 801:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804:	8b 50 04             	mov    0x4(%eax),%edx
 807:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	8b 40 04             	mov    0x4(%eax),%eax
 80f:	01 c2                	add    %eax,%edx
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	8b 00                	mov    (%eax),%eax
 81c:	8b 10                	mov    (%eax),%edx
 81e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 821:	89 10                	mov    %edx,(%eax)
 823:	eb 0a                	jmp    82f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	8b 10                	mov    (%eax),%edx
 82a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 82f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 832:	8b 40 04             	mov    0x4(%eax),%eax
 835:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	01 d0                	add    %edx,%eax
 841:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 844:	75 20                	jne    866 <free+0xcf>
    p->s.size += bp->s.size;
 846:	8b 45 fc             	mov    -0x4(%ebp),%eax
 849:	8b 50 04             	mov    0x4(%eax),%edx
 84c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84f:	8b 40 04             	mov    0x4(%eax),%eax
 852:	01 c2                	add    %eax,%edx
 854:	8b 45 fc             	mov    -0x4(%ebp),%eax
 857:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85d:	8b 10                	mov    (%eax),%edx
 85f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 862:	89 10                	mov    %edx,(%eax)
 864:	eb 08                	jmp    86e <free+0xd7>
  } else
    p->s.ptr = bp;
 866:	8b 45 fc             	mov    -0x4(%ebp),%eax
 869:	8b 55 f8             	mov    -0x8(%ebp),%edx
 86c:	89 10                	mov    %edx,(%eax)
  freep = p;
 86e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 871:	a3 98 0c 00 00       	mov    %eax,0xc98
}
 876:	c9                   	leave  
 877:	c3                   	ret    

00000878 <morecore>:

static Header*
morecore(uint nu)
{
 878:	55                   	push   %ebp
 879:	89 e5                	mov    %esp,%ebp
 87b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 87e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 885:	77 07                	ja     88e <morecore+0x16>
    nu = 4096;
 887:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 88e:	8b 45 08             	mov    0x8(%ebp),%eax
 891:	c1 e0 03             	shl    $0x3,%eax
 894:	89 04 24             	mov    %eax,(%esp)
 897:	e8 48 fc ff ff       	call   4e4 <sbrk>
 89c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 89f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8a3:	75 07                	jne    8ac <morecore+0x34>
    return 0;
 8a5:	b8 00 00 00 00       	mov    $0x0,%eax
 8aa:	eb 22                	jmp    8ce <morecore+0x56>
  hp = (Header*)p;
 8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	8b 55 08             	mov    0x8(%ebp),%edx
 8b8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8be:	83 c0 08             	add    $0x8,%eax
 8c1:	89 04 24             	mov    %eax,(%esp)
 8c4:	e8 ce fe ff ff       	call   797 <free>
  return freep;
 8c9:	a1 98 0c 00 00       	mov    0xc98,%eax
}
 8ce:	c9                   	leave  
 8cf:	c3                   	ret    

000008d0 <malloc>:

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d6:	8b 45 08             	mov    0x8(%ebp),%eax
 8d9:	83 c0 07             	add    $0x7,%eax
 8dc:	c1 e8 03             	shr    $0x3,%eax
 8df:	83 c0 01             	add    $0x1,%eax
 8e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8e5:	a1 98 0c 00 00       	mov    0xc98,%eax
 8ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f1:	75 23                	jne    916 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8f3:	c7 45 f0 90 0c 00 00 	movl   $0xc90,-0x10(%ebp)
 8fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fd:	a3 98 0c 00 00       	mov    %eax,0xc98
 902:	a1 98 0c 00 00       	mov    0xc98,%eax
 907:	a3 90 0c 00 00       	mov    %eax,0xc90
    base.s.size = 0;
 90c:	c7 05 94 0c 00 00 00 	movl   $0x0,0xc94
 913:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 916:	8b 45 f0             	mov    -0x10(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 91e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 921:	8b 40 04             	mov    0x4(%eax),%eax
 924:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 927:	72 4d                	jb     976 <malloc+0xa6>
      if(p->s.size == nunits)
 929:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92c:	8b 40 04             	mov    0x4(%eax),%eax
 92f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 932:	75 0c                	jne    940 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 934:	8b 45 f4             	mov    -0xc(%ebp),%eax
 937:	8b 10                	mov    (%eax),%edx
 939:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93c:	89 10                	mov    %edx,(%eax)
 93e:	eb 26                	jmp    966 <malloc+0x96>
      else {
        p->s.size -= nunits;
 940:	8b 45 f4             	mov    -0xc(%ebp),%eax
 943:	8b 40 04             	mov    0x4(%eax),%eax
 946:	2b 45 ec             	sub    -0x14(%ebp),%eax
 949:	89 c2                	mov    %eax,%edx
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 951:	8b 45 f4             	mov    -0xc(%ebp),%eax
 954:	8b 40 04             	mov    0x4(%eax),%eax
 957:	c1 e0 03             	shl    $0x3,%eax
 95a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	8b 55 ec             	mov    -0x14(%ebp),%edx
 963:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 966:	8b 45 f0             	mov    -0x10(%ebp),%eax
 969:	a3 98 0c 00 00       	mov    %eax,0xc98
      return (void*)(p + 1);
 96e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 971:	83 c0 08             	add    $0x8,%eax
 974:	eb 38                	jmp    9ae <malloc+0xde>
    }
    if(p == freep)
 976:	a1 98 0c 00 00       	mov    0xc98,%eax
 97b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 97e:	75 1b                	jne    99b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 980:	8b 45 ec             	mov    -0x14(%ebp),%eax
 983:	89 04 24             	mov    %eax,(%esp)
 986:	e8 ed fe ff ff       	call   878 <morecore>
 98b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 98e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 992:	75 07                	jne    99b <malloc+0xcb>
        return 0;
 994:	b8 00 00 00 00       	mov    $0x0,%eax
 999:	eb 13                	jmp    9ae <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a4:	8b 00                	mov    (%eax),%eax
 9a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9a9:	e9 70 ff ff ff       	jmp    91e <malloc+0x4e>
}
 9ae:	c9                   	leave  
 9af:	c3                   	ret    
