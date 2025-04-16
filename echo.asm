
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
  1f:	b8 a3 09 00 00       	mov    $0x9a3,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 a5 09 00 00       	mov    $0x9a5,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 a7 09 00 	movl   $0x9a7,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 7e 05 00 00       	call   5d7 <printf>
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
 35d:	c7 44 24 04 ac 09 00 	movl   $0x9ac,0x4(%esp)
 364:	00 
 365:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36c:	e8 66 02 00 00       	call   5d7 <printf>
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
 3af:	c7 44 24 04 c5 09 00 	movl   $0x9c5,0x4(%esp)
 3b6:	00 
 3b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3be:	e8 14 02 00 00       	call   5d7 <printf>
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

000004f7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4f7:	55                   	push   %ebp
 4f8:	89 e5                	mov    %esp,%ebp
 4fa:	83 ec 18             	sub    $0x18,%esp
 4fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 500:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 503:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 50a:	00 
 50b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50e:	89 44 24 04          	mov    %eax,0x4(%esp)
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 52 ff ff ff       	call   46f <write>
}
 51d:	c9                   	leave  
 51e:	c3                   	ret    

0000051f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	56                   	push   %esi
 523:	53                   	push   %ebx
 524:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 527:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 52e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 532:	74 17                	je     54b <printint+0x2c>
 534:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 538:	79 11                	jns    54b <printint+0x2c>
    neg = 1;
 53a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 541:	8b 45 0c             	mov    0xc(%ebp),%eax
 544:	f7 d8                	neg    %eax
 546:	89 45 ec             	mov    %eax,-0x14(%ebp)
 549:	eb 06                	jmp    551 <printint+0x32>
  } else {
    x = xx;
 54b:	8b 45 0c             	mov    0xc(%ebp),%eax
 54e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 551:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 558:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 55b:	8d 41 01             	lea    0x1(%ecx),%eax
 55e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 561:	8b 5d 10             	mov    0x10(%ebp),%ebx
 564:	8b 45 ec             	mov    -0x14(%ebp),%eax
 567:	ba 00 00 00 00       	mov    $0x0,%edx
 56c:	f7 f3                	div    %ebx
 56e:	89 d0                	mov    %edx,%eax
 570:	0f b6 80 50 0c 00 00 	movzbl 0xc50(%eax),%eax
 577:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 57b:	8b 75 10             	mov    0x10(%ebp),%esi
 57e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 581:	ba 00 00 00 00       	mov    $0x0,%edx
 586:	f7 f6                	div    %esi
 588:	89 45 ec             	mov    %eax,-0x14(%ebp)
 58b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 58f:	75 c7                	jne    558 <printint+0x39>
  if(neg)
 591:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 595:	74 10                	je     5a7 <printint+0x88>
    buf[i++] = '-';
 597:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5a0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5a5:	eb 1f                	jmp    5c6 <printint+0xa7>
 5a7:	eb 1d                	jmp    5c6 <printint+0xa7>
    putc(fd, buf[i]);
 5a9:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5af:	01 d0                	add    %edx,%eax
 5b1:	0f b6 00             	movzbl (%eax),%eax
 5b4:	0f be c0             	movsbl %al,%eax
 5b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
 5be:	89 04 24             	mov    %eax,(%esp)
 5c1:	e8 31 ff ff ff       	call   4f7 <putc>
  while(--i >= 0)
 5c6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ce:	79 d9                	jns    5a9 <printint+0x8a>
}
 5d0:	83 c4 30             	add    $0x30,%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5d                   	pop    %ebp
 5d6:	c3                   	ret    

000005d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d7:	55                   	push   %ebp
 5d8:	89 e5                	mov    %esp,%ebp
 5da:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5e4:	8d 45 0c             	lea    0xc(%ebp),%eax
 5e7:	83 c0 04             	add    $0x4,%eax
 5ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5f4:	e9 7c 01 00 00       	jmp    775 <printf+0x19e>
    c = fmt[i] & 0xff;
 5f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ff:	01 d0                	add    %edx,%eax
 601:	0f b6 00             	movzbl (%eax),%eax
 604:	0f be c0             	movsbl %al,%eax
 607:	25 ff 00 00 00       	and    $0xff,%eax
 60c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 60f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 613:	75 2c                	jne    641 <printf+0x6a>
      if(c == '%'){
 615:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 619:	75 0c                	jne    627 <printf+0x50>
        state = '%';
 61b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 622:	e9 4a 01 00 00       	jmp    771 <printf+0x19a>
      } else {
        putc(fd, c);
 627:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62a:	0f be c0             	movsbl %al,%eax
 62d:	89 44 24 04          	mov    %eax,0x4(%esp)
 631:	8b 45 08             	mov    0x8(%ebp),%eax
 634:	89 04 24             	mov    %eax,(%esp)
 637:	e8 bb fe ff ff       	call   4f7 <putc>
 63c:	e9 30 01 00 00       	jmp    771 <printf+0x19a>
      }
    } else if(state == '%'){
 641:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 645:	0f 85 26 01 00 00    	jne    771 <printf+0x19a>
      if(c == 'd'){
 64b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 64f:	75 2d                	jne    67e <printf+0xa7>
        printint(fd, *ap, 10, 1);
 651:	8b 45 e8             	mov    -0x18(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 65d:	00 
 65e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 665:	00 
 666:	89 44 24 04          	mov    %eax,0x4(%esp)
 66a:	8b 45 08             	mov    0x8(%ebp),%eax
 66d:	89 04 24             	mov    %eax,(%esp)
 670:	e8 aa fe ff ff       	call   51f <printint>
        ap++;
 675:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 679:	e9 ec 00 00 00       	jmp    76a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 67e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 682:	74 06                	je     68a <printf+0xb3>
 684:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 688:	75 2d                	jne    6b7 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 68a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 68d:	8b 00                	mov    (%eax),%eax
 68f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 696:	00 
 697:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 69e:	00 
 69f:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	89 04 24             	mov    %eax,(%esp)
 6a9:	e8 71 fe ff ff       	call   51f <printint>
        ap++;
 6ae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b2:	e9 b3 00 00 00       	jmp    76a <printf+0x193>
      } else if(c == 's'){
 6b7:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6bb:	75 45                	jne    702 <printf+0x12b>
        s = (char*)*ap;
 6bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6c5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6cd:	75 09                	jne    6d8 <printf+0x101>
          s = "(null)";
 6cf:	c7 45 f4 d5 09 00 00 	movl   $0x9d5,-0xc(%ebp)
        while(*s != 0){
 6d6:	eb 1e                	jmp    6f6 <printf+0x11f>
 6d8:	eb 1c                	jmp    6f6 <printf+0x11f>
          putc(fd, *s);
 6da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dd:	0f b6 00             	movzbl (%eax),%eax
 6e0:	0f be c0             	movsbl %al,%eax
 6e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 05 fe ff ff       	call   4f7 <putc>
          s++;
 6f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f9:	0f b6 00             	movzbl (%eax),%eax
 6fc:	84 c0                	test   %al,%al
 6fe:	75 da                	jne    6da <printf+0x103>
 700:	eb 68                	jmp    76a <printf+0x193>
        }
      } else if(c == 'c'){
 702:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 706:	75 1d                	jne    725 <printf+0x14e>
        putc(fd, *ap);
 708:	8b 45 e8             	mov    -0x18(%ebp),%eax
 70b:	8b 00                	mov    (%eax),%eax
 70d:	0f be c0             	movsbl %al,%eax
 710:	89 44 24 04          	mov    %eax,0x4(%esp)
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	89 04 24             	mov    %eax,(%esp)
 71a:	e8 d8 fd ff ff       	call   4f7 <putc>
        ap++;
 71f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 723:	eb 45                	jmp    76a <printf+0x193>
      } else if(c == '%'){
 725:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 729:	75 17                	jne    742 <printf+0x16b>
        putc(fd, c);
 72b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72e:	0f be c0             	movsbl %al,%eax
 731:	89 44 24 04          	mov    %eax,0x4(%esp)
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	89 04 24             	mov    %eax,(%esp)
 73b:	e8 b7 fd ff ff       	call   4f7 <putc>
 740:	eb 28                	jmp    76a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 742:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 749:	00 
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	89 04 24             	mov    %eax,(%esp)
 750:	e8 a2 fd ff ff       	call   4f7 <putc>
        putc(fd, c);
 755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 758:	0f be c0             	movsbl %al,%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 8d fd ff ff       	call   4f7 <putc>
      }
      state = 0;
 76a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 771:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 775:	8b 55 0c             	mov    0xc(%ebp),%edx
 778:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77b:	01 d0                	add    %edx,%eax
 77d:	0f b6 00             	movzbl (%eax),%eax
 780:	84 c0                	test   %al,%al
 782:	0f 85 71 fe ff ff    	jne    5f9 <printf+0x22>
    }
  }
}
 788:	c9                   	leave  
 789:	c3                   	ret    

0000078a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78a:	55                   	push   %ebp
 78b:	89 e5                	mov    %esp,%ebp
 78d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	83 e8 08             	sub    $0x8,%eax
 796:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 799:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 79e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a1:	eb 24                	jmp    7c7 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a6:	8b 00                	mov    (%eax),%eax
 7a8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ab:	77 12                	ja     7bf <free+0x35>
 7ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b3:	77 24                	ja     7d9 <free+0x4f>
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7bd:	77 1a                	ja     7d9 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 00                	mov    (%eax),%eax
 7c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7cd:	76 d4                	jbe    7a3 <free+0x19>
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d7:	76 ca                	jbe    7a3 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dc:	8b 40 04             	mov    0x4(%eax),%eax
 7df:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e9:	01 c2                	add    %eax,%edx
 7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ee:	8b 00                	mov    (%eax),%eax
 7f0:	39 c2                	cmp    %eax,%edx
 7f2:	75 24                	jne    818 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f7:	8b 50 04             	mov    0x4(%eax),%edx
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	8b 00                	mov    (%eax),%eax
 7ff:	8b 40 04             	mov    0x4(%eax),%eax
 802:	01 c2                	add    %eax,%edx
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 00                	mov    (%eax),%eax
 80f:	8b 10                	mov    (%eax),%edx
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	89 10                	mov    %edx,(%eax)
 816:	eb 0a                	jmp    822 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 818:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81b:	8b 10                	mov    (%eax),%edx
 81d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 820:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 822:	8b 45 fc             	mov    -0x4(%ebp),%eax
 825:	8b 40 04             	mov    0x4(%eax),%eax
 828:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 82f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 832:	01 d0                	add    %edx,%eax
 834:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 837:	75 20                	jne    859 <free+0xcf>
    p->s.size += bp->s.size;
 839:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83c:	8b 50 04             	mov    0x4(%eax),%edx
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	8b 40 04             	mov    0x4(%eax),%eax
 845:	01 c2                	add    %eax,%edx
 847:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 84d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 850:	8b 10                	mov    (%eax),%edx
 852:	8b 45 fc             	mov    -0x4(%ebp),%eax
 855:	89 10                	mov    %edx,(%eax)
 857:	eb 08                	jmp    861 <free+0xd7>
  } else
    p->s.ptr = bp;
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 85f:	89 10                	mov    %edx,(%eax)
  freep = p;
 861:	8b 45 fc             	mov    -0x4(%ebp),%eax
 864:	a3 6c 0c 00 00       	mov    %eax,0xc6c
}
 869:	c9                   	leave  
 86a:	c3                   	ret    

0000086b <morecore>:

static Header*
morecore(uint nu)
{
 86b:	55                   	push   %ebp
 86c:	89 e5                	mov    %esp,%ebp
 86e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 871:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 878:	77 07                	ja     881 <morecore+0x16>
    nu = 4096;
 87a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	c1 e0 03             	shl    $0x3,%eax
 887:	89 04 24             	mov    %eax,(%esp)
 88a:	e8 48 fc ff ff       	call   4d7 <sbrk>
 88f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 892:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 896:	75 07                	jne    89f <morecore+0x34>
    return 0;
 898:	b8 00 00 00 00       	mov    $0x0,%eax
 89d:	eb 22                	jmp    8c1 <morecore+0x56>
  hp = (Header*)p;
 89f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a8:	8b 55 08             	mov    0x8(%ebp),%edx
 8ab:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b1:	83 c0 08             	add    $0x8,%eax
 8b4:	89 04 24             	mov    %eax,(%esp)
 8b7:	e8 ce fe ff ff       	call   78a <free>
  return freep;
 8bc:	a1 6c 0c 00 00       	mov    0xc6c,%eax
}
 8c1:	c9                   	leave  
 8c2:	c3                   	ret    

000008c3 <malloc>:

void*
malloc(uint nbytes)
{
 8c3:	55                   	push   %ebp
 8c4:	89 e5                	mov    %esp,%ebp
 8c6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	83 c0 07             	add    $0x7,%eax
 8cf:	c1 e8 03             	shr    $0x3,%eax
 8d2:	83 c0 01             	add    $0x1,%eax
 8d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d8:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 8dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8e4:	75 23                	jne    909 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e6:	c7 45 f0 64 0c 00 00 	movl   $0xc64,-0x10(%ebp)
 8ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f0:	a3 6c 0c 00 00       	mov    %eax,0xc6c
 8f5:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 8fa:	a3 64 0c 00 00       	mov    %eax,0xc64
    base.s.size = 0;
 8ff:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 906:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 911:	8b 45 f4             	mov    -0xc(%ebp),%eax
 914:	8b 40 04             	mov    0x4(%eax),%eax
 917:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 91a:	72 4d                	jb     969 <malloc+0xa6>
      if(p->s.size == nunits)
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	8b 40 04             	mov    0x4(%eax),%eax
 922:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 925:	75 0c                	jne    933 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 927:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92a:	8b 10                	mov    (%eax),%edx
 92c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92f:	89 10                	mov    %edx,(%eax)
 931:	eb 26                	jmp    959 <malloc+0x96>
      else {
        p->s.size -= nunits;
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	8b 40 04             	mov    0x4(%eax),%eax
 939:	2b 45 ec             	sub    -0x14(%ebp),%eax
 93c:	89 c2                	mov    %eax,%edx
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	8b 40 04             	mov    0x4(%eax),%eax
 94a:	c1 e0 03             	shl    $0x3,%eax
 94d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 950:	8b 45 f4             	mov    -0xc(%ebp),%eax
 953:	8b 55 ec             	mov    -0x14(%ebp),%edx
 956:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	a3 6c 0c 00 00       	mov    %eax,0xc6c
      return (void*)(p + 1);
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	83 c0 08             	add    $0x8,%eax
 967:	eb 38                	jmp    9a1 <malloc+0xde>
    }
    if(p == freep)
 969:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 96e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 971:	75 1b                	jne    98e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 973:	8b 45 ec             	mov    -0x14(%ebp),%eax
 976:	89 04 24             	mov    %eax,(%esp)
 979:	e8 ed fe ff ff       	call   86b <morecore>
 97e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 981:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 985:	75 07                	jne    98e <malloc+0xcb>
        return 0;
 987:	b8 00 00 00 00       	mov    $0x0,%eax
 98c:	eb 13                	jmp    9a1 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	89 45 f0             	mov    %eax,-0x10(%ebp)
 994:	8b 45 f4             	mov    -0xc(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 99c:	e9 70 ff ff ff       	jmp    911 <malloc+0x4e>
}
 9a1:	c9                   	leave  
 9a2:	c3                   	ret    
