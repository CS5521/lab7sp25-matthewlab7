
_echo:     file format elf32-i386


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
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 ab 09 00 00       	mov    $0x9ab,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 ad 09 00 00       	mov    $0x9ad,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 af 09 00 	movl   $0x9af,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 86 05 00 00       	call   5df <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 e3 03 00 00       	call   44f <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 bf 02 00 00       	call   467 <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 82 02 00 00       	call   48f <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 78 02 00 00       	call   4a7 <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 3a 02 00 00       	call   477 <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <ps>:

void
ps()
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 2d8:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2de:	89 04 24             	mov    %eax,(%esp)
 2e1:	e8 09 02 00 00       	call   4ef <getpinfo>
 2e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 2e9:	0f 84 4d 01 00 00    	je     43c <ps+0x170>
    return;
  int i = 0;
 2ef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 2f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f9:	89 d0                	mov    %edx,%eax
 2fb:	c1 e0 03             	shl    $0x3,%eax
 2fe:	01 d0                	add    %edx,%eax
 300:	c1 e0 02             	shl    $0x2,%eax
 303:	8d 7d e8             	lea    -0x18(%ebp),%edi
 306:	01 f8                	add    %edi,%eax
 308:	2d 04 09 00 00       	sub    $0x904,%eax
 30d:	8b 10                	mov    (%eax),%edx
 30f:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 315:	8b 50 04             	mov    0x4(%eax),%edx
 318:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 31e:	8b 50 08             	mov    0x8(%eax),%edx
 321:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 327:	8b 50 0c             	mov    0xc(%eax),%edx
 32a:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 330:	8b 50 10             	mov    0x10(%eax),%edx
 333:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 339:	8b 50 14             	mov    0x14(%eax),%edx
 33c:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 342:	8b 50 18             	mov    0x18(%eax),%edx
 345:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 34b:	8b 50 1c             	mov    0x1c(%eax),%edx
 34e:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 354:	8b 40 20             	mov    0x20(%eax),%eax
 357:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 35d:	c7 44 24 04 b4 09 00 	movl   $0x9b4,0x4(%esp)
 364:	00 
 365:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36c:	e8 6e 02 00 00       	call   5df <printf>
  for(;p.pid != 0; p = table[i])
 371:	e9 b8 00 00 00       	jmp    42e <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 376:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 37d:	0f be d8             	movsbl %al,%ebx
 380:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 386:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 38c:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 392:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 398:	83 c6 10             	add    $0x10,%esi
 39b:	89 74 24 18          	mov    %esi,0x18(%esp)
 39f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 3a3:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 3a7:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 3af:	c7 44 24 04 cd 09 00 	movl   $0x9cd,0x4(%esp)
 3b6:	00 
 3b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3be:	e8 1c 02 00 00       	call   5df <printf>
    i++;
 3c3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 3c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ca:	89 d0                	mov    %edx,%eax
 3cc:	c1 e0 03             	shl    $0x3,%eax
 3cf:	01 d0                	add    %edx,%eax
 3d1:	c1 e0 02             	shl    $0x2,%eax
 3d4:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3d7:	01 c8                	add    %ecx,%eax
 3d9:	2d 04 09 00 00       	sub    $0x904,%eax
 3de:	8b 10                	mov    (%eax),%edx
 3e0:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3e6:	8b 50 04             	mov    0x4(%eax),%edx
 3e9:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3ef:	8b 50 08             	mov    0x8(%eax),%edx
 3f2:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3f8:	8b 50 0c             	mov    0xc(%eax),%edx
 3fb:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 401:	8b 50 10             	mov    0x10(%eax),%edx
 404:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 40a:	8b 50 14             	mov    0x14(%eax),%edx
 40d:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 413:	8b 50 18             	mov    0x18(%eax),%edx
 416:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 41c:	8b 50 1c             	mov    0x1c(%eax),%edx
 41f:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 425:	8b 40 20             	mov    0x20(%eax),%eax
 428:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 42e:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 434:	85 c0                	test   %eax,%eax
 436:	0f 85 3a ff ff ff    	jne    376 <ps+0xaa>
  }
}
 43c:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 442:	5b                   	pop    %ebx
 443:	5e                   	pop    %esi
 444:	5f                   	pop    %edi
 445:	5d                   	pop    %ebp
 446:	c3                   	ret    

00000447 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 447:	b8 01 00 00 00       	mov    $0x1,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <exit>:
SYSCALL(exit)
 44f:	b8 02 00 00 00       	mov    $0x2,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <wait>:
SYSCALL(wait)
 457:	b8 03 00 00 00       	mov    $0x3,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <pipe>:
SYSCALL(pipe)
 45f:	b8 04 00 00 00       	mov    $0x4,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <read>:
SYSCALL(read)
 467:	b8 05 00 00 00       	mov    $0x5,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <write>:
SYSCALL(write)
 46f:	b8 10 00 00 00       	mov    $0x10,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <close>:
SYSCALL(close)
 477:	b8 15 00 00 00       	mov    $0x15,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <kill>:
SYSCALL(kill)
 47f:	b8 06 00 00 00       	mov    $0x6,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <exec>:
SYSCALL(exec)
 487:	b8 07 00 00 00       	mov    $0x7,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <open>:
SYSCALL(open)
 48f:	b8 0f 00 00 00       	mov    $0xf,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <mknod>:
SYSCALL(mknod)
 497:	b8 11 00 00 00       	mov    $0x11,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <unlink>:
SYSCALL(unlink)
 49f:	b8 12 00 00 00       	mov    $0x12,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <fstat>:
SYSCALL(fstat)
 4a7:	b8 08 00 00 00       	mov    $0x8,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <link>:
SYSCALL(link)
 4af:	b8 13 00 00 00       	mov    $0x13,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <mkdir>:
SYSCALL(mkdir)
 4b7:	b8 14 00 00 00       	mov    $0x14,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <chdir>:
SYSCALL(chdir)
 4bf:	b8 09 00 00 00       	mov    $0x9,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <dup>:
SYSCALL(dup)
 4c7:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <getpid>:
SYSCALL(getpid)
 4cf:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <sbrk>:
SYSCALL(sbrk)
 4d7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <sleep>:
SYSCALL(sleep)
 4df:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <uptime>:
SYSCALL(uptime)
 4e7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <getpinfo>:
SYSCALL(getpinfo)
 4ef:	b8 16 00 00 00       	mov    $0x16,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <settickets>:
 4f7:	b8 17 00 00 00       	mov    $0x17,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ff:	55                   	push   %ebp
 500:	89 e5                	mov    %esp,%ebp
 502:	83 ec 18             	sub    $0x18,%esp
 505:	8b 45 0c             	mov    0xc(%ebp),%eax
 508:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 50b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 512:	00 
 513:	8d 45 f4             	lea    -0xc(%ebp),%eax
 516:	89 44 24 04          	mov    %eax,0x4(%esp)
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	89 04 24             	mov    %eax,(%esp)
 520:	e8 4a ff ff ff       	call   46f <write>
}
 525:	c9                   	leave  
 526:	c3                   	ret    

00000527 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	56                   	push   %esi
 52b:	53                   	push   %ebx
 52c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 52f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 536:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 53a:	74 17                	je     553 <printint+0x2c>
 53c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 540:	79 11                	jns    553 <printint+0x2c>
    neg = 1;
 542:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 549:	8b 45 0c             	mov    0xc(%ebp),%eax
 54c:	f7 d8                	neg    %eax
 54e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 551:	eb 06                	jmp    559 <printint+0x32>
  } else {
    x = xx;
 553:	8b 45 0c             	mov    0xc(%ebp),%eax
 556:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 559:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 560:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 563:	8d 41 01             	lea    0x1(%ecx),%eax
 566:	89 45 f4             	mov    %eax,-0xc(%ebp)
 569:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 56f:	ba 00 00 00 00       	mov    $0x0,%edx
 574:	f7 f3                	div    %ebx
 576:	89 d0                	mov    %edx,%eax
 578:	0f b6 80 58 0c 00 00 	movzbl 0xc58(%eax),%eax
 57f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 583:	8b 75 10             	mov    0x10(%ebp),%esi
 586:	8b 45 ec             	mov    -0x14(%ebp),%eax
 589:	ba 00 00 00 00       	mov    $0x0,%edx
 58e:	f7 f6                	div    %esi
 590:	89 45 ec             	mov    %eax,-0x14(%ebp)
 593:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 597:	75 c7                	jne    560 <printint+0x39>
  if(neg)
 599:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 59d:	74 10                	je     5af <printint+0x88>
    buf[i++] = '-';
 59f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a2:	8d 50 01             	lea    0x1(%eax),%edx
 5a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5a8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5ad:	eb 1f                	jmp    5ce <printint+0xa7>
 5af:	eb 1d                	jmp    5ce <printint+0xa7>
    putc(fd, buf[i]);
 5b1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b7:	01 d0                	add    %edx,%eax
 5b9:	0f b6 00             	movzbl (%eax),%eax
 5bc:	0f be c0             	movsbl %al,%eax
 5bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	89 04 24             	mov    %eax,(%esp)
 5c9:	e8 31 ff ff ff       	call   4ff <putc>
  while(--i >= 0)
 5ce:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5d6:	79 d9                	jns    5b1 <printint+0x8a>
}
 5d8:	83 c4 30             	add    $0x30,%esp
 5db:	5b                   	pop    %ebx
 5dc:	5e                   	pop    %esi
 5dd:	5d                   	pop    %ebp
 5de:	c3                   	ret    

000005df <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5ec:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ef:	83 c0 04             	add    $0x4,%eax
 5f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5f5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5fc:	e9 7c 01 00 00       	jmp    77d <printf+0x19e>
    c = fmt[i] & 0xff;
 601:	8b 55 0c             	mov    0xc(%ebp),%edx
 604:	8b 45 f0             	mov    -0x10(%ebp),%eax
 607:	01 d0                	add    %edx,%eax
 609:	0f b6 00             	movzbl (%eax),%eax
 60c:	0f be c0             	movsbl %al,%eax
 60f:	25 ff 00 00 00       	and    $0xff,%eax
 614:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 617:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 61b:	75 2c                	jne    649 <printf+0x6a>
      if(c == '%'){
 61d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 621:	75 0c                	jne    62f <printf+0x50>
        state = '%';
 623:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 62a:	e9 4a 01 00 00       	jmp    779 <printf+0x19a>
      } else {
        putc(fd, c);
 62f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 632:	0f be c0             	movsbl %al,%eax
 635:	89 44 24 04          	mov    %eax,0x4(%esp)
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	89 04 24             	mov    %eax,(%esp)
 63f:	e8 bb fe ff ff       	call   4ff <putc>
 644:	e9 30 01 00 00       	jmp    779 <printf+0x19a>
      }
    } else if(state == '%'){
 649:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 64d:	0f 85 26 01 00 00    	jne    779 <printf+0x19a>
      if(c == 'd'){
 653:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 657:	75 2d                	jne    686 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 659:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 665:	00 
 666:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 66d:	00 
 66e:	89 44 24 04          	mov    %eax,0x4(%esp)
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	89 04 24             	mov    %eax,(%esp)
 678:	e8 aa fe ff ff       	call   527 <printint>
        ap++;
 67d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 681:	e9 ec 00 00 00       	jmp    772 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 686:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 68a:	74 06                	je     692 <printf+0xb3>
 68c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 690:	75 2d                	jne    6bf <printf+0xe0>
        printint(fd, *ap, 16, 0);
 692:	8b 45 e8             	mov    -0x18(%ebp),%eax
 695:	8b 00                	mov    (%eax),%eax
 697:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 69e:	00 
 69f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6a6:	00 
 6a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	89 04 24             	mov    %eax,(%esp)
 6b1:	e8 71 fe ff ff       	call   527 <printint>
        ap++;
 6b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ba:	e9 b3 00 00 00       	jmp    772 <printf+0x193>
      } else if(c == 's'){
 6bf:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6c3:	75 45                	jne    70a <printf+0x12b>
        s = (char*)*ap;
 6c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c8:	8b 00                	mov    (%eax),%eax
 6ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6cd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6d5:	75 09                	jne    6e0 <printf+0x101>
          s = "(null)";
 6d7:	c7 45 f4 dd 09 00 00 	movl   $0x9dd,-0xc(%ebp)
        while(*s != 0){
 6de:	eb 1e                	jmp    6fe <printf+0x11f>
 6e0:	eb 1c                	jmp    6fe <printf+0x11f>
          putc(fd, *s);
 6e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e5:	0f b6 00             	movzbl (%eax),%eax
 6e8:	0f be c0             	movsbl %al,%eax
 6eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ef:	8b 45 08             	mov    0x8(%ebp),%eax
 6f2:	89 04 24             	mov    %eax,(%esp)
 6f5:	e8 05 fe ff ff       	call   4ff <putc>
          s++;
 6fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 701:	0f b6 00             	movzbl (%eax),%eax
 704:	84 c0                	test   %al,%al
 706:	75 da                	jne    6e2 <printf+0x103>
 708:	eb 68                	jmp    772 <printf+0x193>
        }
      } else if(c == 'c'){
 70a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 70e:	75 1d                	jne    72d <printf+0x14e>
        putc(fd, *ap);
 710:	8b 45 e8             	mov    -0x18(%ebp),%eax
 713:	8b 00                	mov    (%eax),%eax
 715:	0f be c0             	movsbl %al,%eax
 718:	89 44 24 04          	mov    %eax,0x4(%esp)
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 d8 fd ff ff       	call   4ff <putc>
        ap++;
 727:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 72b:	eb 45                	jmp    772 <printf+0x193>
      } else if(c == '%'){
 72d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 731:	75 17                	jne    74a <printf+0x16b>
        putc(fd, c);
 733:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 736:	0f be c0             	movsbl %al,%eax
 739:	89 44 24 04          	mov    %eax,0x4(%esp)
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	89 04 24             	mov    %eax,(%esp)
 743:	e8 b7 fd ff ff       	call   4ff <putc>
 748:	eb 28                	jmp    772 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 74a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 751:	00 
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	89 04 24             	mov    %eax,(%esp)
 758:	e8 a2 fd ff ff       	call   4ff <putc>
        putc(fd, c);
 75d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 760:	0f be c0             	movsbl %al,%eax
 763:	89 44 24 04          	mov    %eax,0x4(%esp)
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 8d fd ff ff       	call   4ff <putc>
      }
      state = 0;
 772:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 779:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 77d:	8b 55 0c             	mov    0xc(%ebp),%edx
 780:	8b 45 f0             	mov    -0x10(%ebp),%eax
 783:	01 d0                	add    %edx,%eax
 785:	0f b6 00             	movzbl (%eax),%eax
 788:	84 c0                	test   %al,%al
 78a:	0f 85 71 fe ff ff    	jne    601 <printf+0x22>
    }
  }
}
 790:	c9                   	leave  
 791:	c3                   	ret    

00000792 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 792:	55                   	push   %ebp
 793:	89 e5                	mov    %esp,%ebp
 795:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	83 e8 08             	sub    $0x8,%eax
 79e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 74 0c 00 00       	mov    0xc74,%eax
 7a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a9:	eb 24                	jmp    7cf <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b3:	77 12                	ja     7c7 <free+0x35>
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bb:	77 24                	ja     7e1 <free+0x4f>
 7bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c0:	8b 00                	mov    (%eax),%eax
 7c2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c5:	77 1a                	ja     7e1 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d5:	76 d4                	jbe    7ab <free+0x19>
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7df:	76 ca                	jbe    7ab <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	8b 40 04             	mov    0x4(%eax),%eax
 7e7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	01 c2                	add    %eax,%edx
 7f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f6:	8b 00                	mov    (%eax),%eax
 7f8:	39 c2                	cmp    %eax,%edx
 7fa:	75 24                	jne    820 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ff:	8b 50 04             	mov    0x4(%eax),%edx
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	8b 00                	mov    (%eax),%eax
 807:	8b 40 04             	mov    0x4(%eax),%eax
 80a:	01 c2                	add    %eax,%edx
 80c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	8b 00                	mov    (%eax),%eax
 817:	8b 10                	mov    (%eax),%edx
 819:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81c:	89 10                	mov    %edx,(%eax)
 81e:	eb 0a                	jmp    82a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 820:	8b 45 fc             	mov    -0x4(%ebp),%eax
 823:	8b 10                	mov    (%eax),%edx
 825:	8b 45 f8             	mov    -0x8(%ebp),%eax
 828:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	8b 40 04             	mov    0x4(%eax),%eax
 830:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	01 d0                	add    %edx,%eax
 83c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83f:	75 20                	jne    861 <free+0xcf>
    p->s.size += bp->s.size;
 841:	8b 45 fc             	mov    -0x4(%ebp),%eax
 844:	8b 50 04             	mov    0x4(%eax),%edx
 847:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84a:	8b 40 04             	mov    0x4(%eax),%eax
 84d:	01 c2                	add    %eax,%edx
 84f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 852:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 855:	8b 45 f8             	mov    -0x8(%ebp),%eax
 858:	8b 10                	mov    (%eax),%edx
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	89 10                	mov    %edx,(%eax)
 85f:	eb 08                	jmp    869 <free+0xd7>
  } else
    p->s.ptr = bp;
 861:	8b 45 fc             	mov    -0x4(%ebp),%eax
 864:	8b 55 f8             	mov    -0x8(%ebp),%edx
 867:	89 10                	mov    %edx,(%eax)
  freep = p;
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	a3 74 0c 00 00       	mov    %eax,0xc74
}
 871:	c9                   	leave  
 872:	c3                   	ret    

00000873 <morecore>:

static Header*
morecore(uint nu)
{
 873:	55                   	push   %ebp
 874:	89 e5                	mov    %esp,%ebp
 876:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 879:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 880:	77 07                	ja     889 <morecore+0x16>
    nu = 4096;
 882:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	c1 e0 03             	shl    $0x3,%eax
 88f:	89 04 24             	mov    %eax,(%esp)
 892:	e8 40 fc ff ff       	call   4d7 <sbrk>
 897:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 89a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 89e:	75 07                	jne    8a7 <morecore+0x34>
    return 0;
 8a0:	b8 00 00 00 00       	mov    $0x0,%eax
 8a5:	eb 22                	jmp    8c9 <morecore+0x56>
  hp = (Header*)p;
 8a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b0:	8b 55 08             	mov    0x8(%ebp),%edx
 8b3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b9:	83 c0 08             	add    $0x8,%eax
 8bc:	89 04 24             	mov    %eax,(%esp)
 8bf:	e8 ce fe ff ff       	call   792 <free>
  return freep;
 8c4:	a1 74 0c 00 00       	mov    0xc74,%eax
}
 8c9:	c9                   	leave  
 8ca:	c3                   	ret    

000008cb <malloc>:

void*
malloc(uint nbytes)
{
 8cb:	55                   	push   %ebp
 8cc:	89 e5                	mov    %esp,%ebp
 8ce:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d1:	8b 45 08             	mov    0x8(%ebp),%eax
 8d4:	83 c0 07             	add    $0x7,%eax
 8d7:	c1 e8 03             	shr    $0x3,%eax
 8da:	83 c0 01             	add    $0x1,%eax
 8dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8e0:	a1 74 0c 00 00       	mov    0xc74,%eax
 8e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8ec:	75 23                	jne    911 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ee:	c7 45 f0 6c 0c 00 00 	movl   $0xc6c,-0x10(%ebp)
 8f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f8:	a3 74 0c 00 00       	mov    %eax,0xc74
 8fd:	a1 74 0c 00 00       	mov    0xc74,%eax
 902:	a3 6c 0c 00 00       	mov    %eax,0xc6c
    base.s.size = 0;
 907:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 90e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 911:	8b 45 f0             	mov    -0x10(%ebp),%eax
 914:	8b 00                	mov    (%eax),%eax
 916:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 919:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91c:	8b 40 04             	mov    0x4(%eax),%eax
 91f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 922:	72 4d                	jb     971 <malloc+0xa6>
      if(p->s.size == nunits)
 924:	8b 45 f4             	mov    -0xc(%ebp),%eax
 927:	8b 40 04             	mov    0x4(%eax),%eax
 92a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92d:	75 0c                	jne    93b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 92f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 932:	8b 10                	mov    (%eax),%edx
 934:	8b 45 f0             	mov    -0x10(%ebp),%eax
 937:	89 10                	mov    %edx,(%eax)
 939:	eb 26                	jmp    961 <malloc+0x96>
      else {
        p->s.size -= nunits;
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	8b 40 04             	mov    0x4(%eax),%eax
 941:	2b 45 ec             	sub    -0x14(%ebp),%eax
 944:	89 c2                	mov    %eax,%edx
 946:	8b 45 f4             	mov    -0xc(%ebp),%eax
 949:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94f:	8b 40 04             	mov    0x4(%eax),%eax
 952:	c1 e0 03             	shl    $0x3,%eax
 955:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 958:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 95e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 961:	8b 45 f0             	mov    -0x10(%ebp),%eax
 964:	a3 74 0c 00 00       	mov    %eax,0xc74
      return (void*)(p + 1);
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	83 c0 08             	add    $0x8,%eax
 96f:	eb 38                	jmp    9a9 <malloc+0xde>
    }
    if(p == freep)
 971:	a1 74 0c 00 00       	mov    0xc74,%eax
 976:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 979:	75 1b                	jne    996 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 97b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 97e:	89 04 24             	mov    %eax,(%esp)
 981:	e8 ed fe ff ff       	call   873 <morecore>
 986:	89 45 f4             	mov    %eax,-0xc(%ebp)
 989:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 98d:	75 07                	jne    996 <malloc+0xcb>
        return 0;
 98f:	b8 00 00 00 00       	mov    $0x0,%eax
 994:	eb 13                	jmp    9a9 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 996:	8b 45 f4             	mov    -0xc(%ebp),%eax
 999:	89 45 f0             	mov    %eax,-0x10(%ebp)
 99c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99f:	8b 00                	mov    (%eax),%eax
 9a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9a4:	e9 70 ff ff ff       	jmp    919 <malloc+0x4e>
}
 9a9:	c9                   	leave  
 9aa:	c3                   	ret    
