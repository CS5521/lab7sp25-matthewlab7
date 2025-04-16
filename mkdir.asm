
_mkdir:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
   f:	c7 44 24 04 ce 09 00 	movl   $0x9ce,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 df 05 00 00       	call   602 <printf>
    exit();
  23:	e8 4a 04 00 00       	call   472 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(mkdir(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 8e 04 00 00       	call   4da <mkdir>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 e5 09 00 	movl   $0x9e5,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 88 05 00 00       	call   602 <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 e3 03 00 00       	call   472 <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 bf 02 00 00       	call   48a <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 82 02 00 00       	call   4b2 <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 78 02 00 00       	call   4ca <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 3a 02 00 00       	call   49a <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:

void
ps()
{
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 2fb:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 09 02 00 00       	call   512 <getpinfo>
 309:	83 f8 ff             	cmp    $0xffffffff,%eax
 30c:	0f 84 4d 01 00 00    	je     45f <ps+0x170>
    return;
  int i = 0;
 312:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 319:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31c:	89 d0                	mov    %edx,%eax
 31e:	c1 e0 03             	shl    $0x3,%eax
 321:	01 d0                	add    %edx,%eax
 323:	c1 e0 02             	shl    $0x2,%eax
 326:	8d 7d e8             	lea    -0x18(%ebp),%edi
 329:	01 f8                	add    %edi,%eax
 32b:	2d 04 09 00 00       	sub    $0x904,%eax
 330:	8b 10                	mov    (%eax),%edx
 332:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 338:	8b 50 04             	mov    0x4(%eax),%edx
 33b:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 341:	8b 50 08             	mov    0x8(%eax),%edx
 344:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 34a:	8b 50 0c             	mov    0xc(%eax),%edx
 34d:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 353:	8b 50 10             	mov    0x10(%eax),%edx
 356:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 35c:	8b 50 14             	mov    0x14(%eax),%edx
 35f:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 365:	8b 50 18             	mov    0x18(%eax),%edx
 368:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 36e:	8b 50 1c             	mov    0x1c(%eax),%edx
 371:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 377:	8b 40 20             	mov    0x20(%eax),%eax
 37a:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 380:	c7 44 24 04 01 0a 00 	movl   $0xa01,0x4(%esp)
 387:	00 
 388:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 38f:	e8 6e 02 00 00       	call   602 <printf>
  for(;p.pid != 0; p = table[i])
 394:	e9 b8 00 00 00       	jmp    451 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 399:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 3a0:	0f be d8             	movsbl %al,%ebx
 3a3:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 3a9:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 3af:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 3b5:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 3bb:	83 c6 10             	add    $0x10,%esi
 3be:	89 74 24 18          	mov    %esi,0x18(%esp)
 3c2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 3c6:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 3ca:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3ce:	89 44 24 08          	mov    %eax,0x8(%esp)
 3d2:	c7 44 24 04 1a 0a 00 	movl   $0xa1a,0x4(%esp)
 3d9:	00 
 3da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e1:	e8 1c 02 00 00       	call   602 <printf>
    i++;
 3e6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 3ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ed:	89 d0                	mov    %edx,%eax
 3ef:	c1 e0 03             	shl    $0x3,%eax
 3f2:	01 d0                	add    %edx,%eax
 3f4:	c1 e0 02             	shl    $0x2,%eax
 3f7:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3fa:	01 c8                	add    %ecx,%eax
 3fc:	2d 04 09 00 00       	sub    $0x904,%eax
 401:	8b 10                	mov    (%eax),%edx
 403:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 409:	8b 50 04             	mov    0x4(%eax),%edx
 40c:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 412:	8b 50 08             	mov    0x8(%eax),%edx
 415:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 41b:	8b 50 0c             	mov    0xc(%eax),%edx
 41e:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 424:	8b 50 10             	mov    0x10(%eax),%edx
 427:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 42d:	8b 50 14             	mov    0x14(%eax),%edx
 430:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 436:	8b 50 18             	mov    0x18(%eax),%edx
 439:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 43f:	8b 50 1c             	mov    0x1c(%eax),%edx
 442:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 448:	8b 40 20             	mov    0x20(%eax),%eax
 44b:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 451:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 457:	85 c0                	test   %eax,%eax
 459:	0f 85 3a ff ff ff    	jne    399 <ps+0xaa>
  }
}
 45f:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 465:	5b                   	pop    %ebx
 466:	5e                   	pop    %esi
 467:	5f                   	pop    %edi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    

0000046a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46a:	b8 01 00 00 00       	mov    $0x1,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <exit>:
SYSCALL(exit)
 472:	b8 02 00 00 00       	mov    $0x2,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <wait>:
SYSCALL(wait)
 47a:	b8 03 00 00 00       	mov    $0x3,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <pipe>:
SYSCALL(pipe)
 482:	b8 04 00 00 00       	mov    $0x4,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <read>:
SYSCALL(read)
 48a:	b8 05 00 00 00       	mov    $0x5,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <write>:
SYSCALL(write)
 492:	b8 10 00 00 00       	mov    $0x10,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <close>:
SYSCALL(close)
 49a:	b8 15 00 00 00       	mov    $0x15,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <kill>:
SYSCALL(kill)
 4a2:	b8 06 00 00 00       	mov    $0x6,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <exec>:
SYSCALL(exec)
 4aa:	b8 07 00 00 00       	mov    $0x7,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <open>:
SYSCALL(open)
 4b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <mknod>:
SYSCALL(mknod)
 4ba:	b8 11 00 00 00       	mov    $0x11,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <unlink>:
SYSCALL(unlink)
 4c2:	b8 12 00 00 00       	mov    $0x12,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <fstat>:
SYSCALL(fstat)
 4ca:	b8 08 00 00 00       	mov    $0x8,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <link>:
SYSCALL(link)
 4d2:	b8 13 00 00 00       	mov    $0x13,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <mkdir>:
SYSCALL(mkdir)
 4da:	b8 14 00 00 00       	mov    $0x14,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <chdir>:
SYSCALL(chdir)
 4e2:	b8 09 00 00 00       	mov    $0x9,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <dup>:
SYSCALL(dup)
 4ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <getpid>:
SYSCALL(getpid)
 4f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <sbrk>:
SYSCALL(sbrk)
 4fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <sleep>:
SYSCALL(sleep)
 502:	b8 0d 00 00 00       	mov    $0xd,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <uptime>:
SYSCALL(uptime)
 50a:	b8 0e 00 00 00       	mov    $0xe,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <getpinfo>:
SYSCALL(getpinfo)
 512:	b8 16 00 00 00       	mov    $0x16,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <settickets>:
 51a:	b8 17 00 00 00       	mov    $0x17,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	83 ec 18             	sub    $0x18,%esp
 528:	8b 45 0c             	mov    0xc(%ebp),%eax
 52b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 52e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 535:	00 
 536:	8d 45 f4             	lea    -0xc(%ebp),%eax
 539:	89 44 24 04          	mov    %eax,0x4(%esp)
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
 540:	89 04 24             	mov    %eax,(%esp)
 543:	e8 4a ff ff ff       	call   492 <write>
}
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	56                   	push   %esi
 54e:	53                   	push   %ebx
 54f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 552:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 559:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 55d:	74 17                	je     576 <printint+0x2c>
 55f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 563:	79 11                	jns    576 <printint+0x2c>
    neg = 1;
 565:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 56c:	8b 45 0c             	mov    0xc(%ebp),%eax
 56f:	f7 d8                	neg    %eax
 571:	89 45 ec             	mov    %eax,-0x14(%ebp)
 574:	eb 06                	jmp    57c <printint+0x32>
  } else {
    x = xx;
 576:	8b 45 0c             	mov    0xc(%ebp),%eax
 579:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 57c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 583:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 586:	8d 41 01             	lea    0x1(%ecx),%eax
 589:	89 45 f4             	mov    %eax,-0xc(%ebp)
 58c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 58f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 592:	ba 00 00 00 00       	mov    $0x0,%edx
 597:	f7 f3                	div    %ebx
 599:	89 d0                	mov    %edx,%eax
 59b:	0f b6 80 a8 0c 00 00 	movzbl 0xca8(%eax),%eax
 5a2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5a6:	8b 75 10             	mov    0x10(%ebp),%esi
 5a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ac:	ba 00 00 00 00       	mov    $0x0,%edx
 5b1:	f7 f6                	div    %esi
 5b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5b6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ba:	75 c7                	jne    583 <printint+0x39>
  if(neg)
 5bc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5c0:	74 10                	je     5d2 <printint+0x88>
    buf[i++] = '-';
 5c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c5:	8d 50 01             	lea    0x1(%eax),%edx
 5c8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5cb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5d0:	eb 1f                	jmp    5f1 <printint+0xa7>
 5d2:	eb 1d                	jmp    5f1 <printint+0xa7>
    putc(fd, buf[i]);
 5d4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5da:	01 d0                	add    %edx,%eax
 5dc:	0f b6 00             	movzbl (%eax),%eax
 5df:	0f be c0             	movsbl %al,%eax
 5e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	89 04 24             	mov    %eax,(%esp)
 5ec:	e8 31 ff ff ff       	call   522 <putc>
  while(--i >= 0)
 5f1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f9:	79 d9                	jns    5d4 <printint+0x8a>
}
 5fb:	83 c4 30             	add    $0x30,%esp
 5fe:	5b                   	pop    %ebx
 5ff:	5e                   	pop    %esi
 600:	5d                   	pop    %ebp
 601:	c3                   	ret    

00000602 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 602:	55                   	push   %ebp
 603:	89 e5                	mov    %esp,%ebp
 605:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 608:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 60f:	8d 45 0c             	lea    0xc(%ebp),%eax
 612:	83 c0 04             	add    $0x4,%eax
 615:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 618:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 61f:	e9 7c 01 00 00       	jmp    7a0 <printf+0x19e>
    c = fmt[i] & 0xff;
 624:	8b 55 0c             	mov    0xc(%ebp),%edx
 627:	8b 45 f0             	mov    -0x10(%ebp),%eax
 62a:	01 d0                	add    %edx,%eax
 62c:	0f b6 00             	movzbl (%eax),%eax
 62f:	0f be c0             	movsbl %al,%eax
 632:	25 ff 00 00 00       	and    $0xff,%eax
 637:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 63a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 63e:	75 2c                	jne    66c <printf+0x6a>
      if(c == '%'){
 640:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 644:	75 0c                	jne    652 <printf+0x50>
        state = '%';
 646:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 64d:	e9 4a 01 00 00       	jmp    79c <printf+0x19a>
      } else {
        putc(fd, c);
 652:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 bb fe ff ff       	call   522 <putc>
 667:	e9 30 01 00 00       	jmp    79c <printf+0x19a>
      }
    } else if(state == '%'){
 66c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 670:	0f 85 26 01 00 00    	jne    79c <printf+0x19a>
      if(c == 'd'){
 676:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 67a:	75 2d                	jne    6a9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 67c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 67f:	8b 00                	mov    (%eax),%eax
 681:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 688:	00 
 689:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 690:	00 
 691:	89 44 24 04          	mov    %eax,0x4(%esp)
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	89 04 24             	mov    %eax,(%esp)
 69b:	e8 aa fe ff ff       	call   54a <printint>
        ap++;
 6a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a4:	e9 ec 00 00 00       	jmp    795 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6a9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6ad:	74 06                	je     6b5 <printf+0xb3>
 6af:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6b3:	75 2d                	jne    6e2 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6c1:	00 
 6c2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6c9:	00 
 6ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 71 fe ff ff       	call   54a <printint>
        ap++;
 6d9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6dd:	e9 b3 00 00 00       	jmp    795 <printf+0x193>
      } else if(c == 's'){
 6e2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6e6:	75 45                	jne    72d <printf+0x12b>
        s = (char*)*ap;
 6e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6eb:	8b 00                	mov    (%eax),%eax
 6ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6f0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6f8:	75 09                	jne    703 <printf+0x101>
          s = "(null)";
 6fa:	c7 45 f4 2a 0a 00 00 	movl   $0xa2a,-0xc(%ebp)
        while(*s != 0){
 701:	eb 1e                	jmp    721 <printf+0x11f>
 703:	eb 1c                	jmp    721 <printf+0x11f>
          putc(fd, *s);
 705:	8b 45 f4             	mov    -0xc(%ebp),%eax
 708:	0f b6 00             	movzbl (%eax),%eax
 70b:	0f be c0             	movsbl %al,%eax
 70e:	89 44 24 04          	mov    %eax,0x4(%esp)
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	89 04 24             	mov    %eax,(%esp)
 718:	e8 05 fe ff ff       	call   522 <putc>
          s++;
 71d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 721:	8b 45 f4             	mov    -0xc(%ebp),%eax
 724:	0f b6 00             	movzbl (%eax),%eax
 727:	84 c0                	test   %al,%al
 729:	75 da                	jne    705 <printf+0x103>
 72b:	eb 68                	jmp    795 <printf+0x193>
        }
      } else if(c == 'c'){
 72d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 731:	75 1d                	jne    750 <printf+0x14e>
        putc(fd, *ap);
 733:	8b 45 e8             	mov    -0x18(%ebp),%eax
 736:	8b 00                	mov    (%eax),%eax
 738:	0f be c0             	movsbl %al,%eax
 73b:	89 44 24 04          	mov    %eax,0x4(%esp)
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	89 04 24             	mov    %eax,(%esp)
 745:	e8 d8 fd ff ff       	call   522 <putc>
        ap++;
 74a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 74e:	eb 45                	jmp    795 <printf+0x193>
      } else if(c == '%'){
 750:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 754:	75 17                	jne    76d <printf+0x16b>
        putc(fd, c);
 756:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 759:	0f be c0             	movsbl %al,%eax
 75c:	89 44 24 04          	mov    %eax,0x4(%esp)
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	89 04 24             	mov    %eax,(%esp)
 766:	e8 b7 fd ff ff       	call   522 <putc>
 76b:	eb 28                	jmp    795 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 76d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 774:	00 
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	89 04 24             	mov    %eax,(%esp)
 77b:	e8 a2 fd ff ff       	call   522 <putc>
        putc(fd, c);
 780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 783:	0f be c0             	movsbl %al,%eax
 786:	89 44 24 04          	mov    %eax,0x4(%esp)
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	89 04 24             	mov    %eax,(%esp)
 790:	e8 8d fd ff ff       	call   522 <putc>
      }
      state = 0;
 795:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 79c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7a0:	8b 55 0c             	mov    0xc(%ebp),%edx
 7a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a6:	01 d0                	add    %edx,%eax
 7a8:	0f b6 00             	movzbl (%eax),%eax
 7ab:	84 c0                	test   %al,%al
 7ad:	0f 85 71 fe ff ff    	jne    624 <printf+0x22>
    }
  }
}
 7b3:	c9                   	leave  
 7b4:	c3                   	ret    

000007b5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b5:	55                   	push   %ebp
 7b6:	89 e5                	mov    %esp,%ebp
 7b8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	83 e8 08             	sub    $0x8,%eax
 7c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c4:	a1 c4 0c 00 00       	mov    0xcc4,%eax
 7c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7cc:	eb 24                	jmp    7f2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 00                	mov    (%eax),%eax
 7d3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d6:	77 12                	ja     7ea <free+0x35>
 7d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7de:	77 24                	ja     804 <free+0x4f>
 7e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e8:	77 1a                	ja     804 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	8b 00                	mov    (%eax),%eax
 7ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f8:	76 d4                	jbe    7ce <free+0x19>
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	8b 00                	mov    (%eax),%eax
 7ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 802:	76 ca                	jbe    7ce <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	8b 40 04             	mov    0x4(%eax),%eax
 80a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	01 c2                	add    %eax,%edx
 816:	8b 45 fc             	mov    -0x4(%ebp),%eax
 819:	8b 00                	mov    (%eax),%eax
 81b:	39 c2                	cmp    %eax,%edx
 81d:	75 24                	jne    843 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 81f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 822:	8b 50 04             	mov    0x4(%eax),%edx
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	8b 00                	mov    (%eax),%eax
 82a:	8b 40 04             	mov    0x4(%eax),%eax
 82d:	01 c2                	add    %eax,%edx
 82f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 832:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	8b 10                	mov    (%eax),%edx
 83c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83f:	89 10                	mov    %edx,(%eax)
 841:	eb 0a                	jmp    84d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 843:	8b 45 fc             	mov    -0x4(%ebp),%eax
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	8b 40 04             	mov    0x4(%eax),%eax
 853:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	01 d0                	add    %edx,%eax
 85f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 862:	75 20                	jne    884 <free+0xcf>
    p->s.size += bp->s.size;
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	8b 50 04             	mov    0x4(%eax),%edx
 86a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86d:	8b 40 04             	mov    0x4(%eax),%eax
 870:	01 c2                	add    %eax,%edx
 872:	8b 45 fc             	mov    -0x4(%ebp),%eax
 875:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 878:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87b:	8b 10                	mov    (%eax),%edx
 87d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 880:	89 10                	mov    %edx,(%eax)
 882:	eb 08                	jmp    88c <free+0xd7>
  } else
    p->s.ptr = bp;
 884:	8b 45 fc             	mov    -0x4(%ebp),%eax
 887:	8b 55 f8             	mov    -0x8(%ebp),%edx
 88a:	89 10                	mov    %edx,(%eax)
  freep = p;
 88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88f:	a3 c4 0c 00 00       	mov    %eax,0xcc4
}
 894:	c9                   	leave  
 895:	c3                   	ret    

00000896 <morecore>:

static Header*
morecore(uint nu)
{
 896:	55                   	push   %ebp
 897:	89 e5                	mov    %esp,%ebp
 899:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 89c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8a3:	77 07                	ja     8ac <morecore+0x16>
    nu = 4096;
 8a5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	c1 e0 03             	shl    $0x3,%eax
 8b2:	89 04 24             	mov    %eax,(%esp)
 8b5:	e8 40 fc ff ff       	call   4fa <sbrk>
 8ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8bd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8c1:	75 07                	jne    8ca <morecore+0x34>
    return 0;
 8c3:	b8 00 00 00 00       	mov    $0x0,%eax
 8c8:	eb 22                	jmp    8ec <morecore+0x56>
  hp = (Header*)p;
 8ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d3:	8b 55 08             	mov    0x8(%ebp),%edx
 8d6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	83 c0 08             	add    $0x8,%eax
 8df:	89 04 24             	mov    %eax,(%esp)
 8e2:	e8 ce fe ff ff       	call   7b5 <free>
  return freep;
 8e7:	a1 c4 0c 00 00       	mov    0xcc4,%eax
}
 8ec:	c9                   	leave  
 8ed:	c3                   	ret    

000008ee <malloc>:

void*
malloc(uint nbytes)
{
 8ee:	55                   	push   %ebp
 8ef:	89 e5                	mov    %esp,%ebp
 8f1:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f4:	8b 45 08             	mov    0x8(%ebp),%eax
 8f7:	83 c0 07             	add    $0x7,%eax
 8fa:	c1 e8 03             	shr    $0x3,%eax
 8fd:	83 c0 01             	add    $0x1,%eax
 900:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 903:	a1 c4 0c 00 00       	mov    0xcc4,%eax
 908:	89 45 f0             	mov    %eax,-0x10(%ebp)
 90b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 90f:	75 23                	jne    934 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 911:	c7 45 f0 bc 0c 00 00 	movl   $0xcbc,-0x10(%ebp)
 918:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91b:	a3 c4 0c 00 00       	mov    %eax,0xcc4
 920:	a1 c4 0c 00 00       	mov    0xcc4,%eax
 925:	a3 bc 0c 00 00       	mov    %eax,0xcbc
    base.s.size = 0;
 92a:	c7 05 c0 0c 00 00 00 	movl   $0x0,0xcc0
 931:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 934:	8b 45 f0             	mov    -0x10(%ebp),%eax
 937:	8b 00                	mov    (%eax),%eax
 939:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 40 04             	mov    0x4(%eax),%eax
 942:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 945:	72 4d                	jb     994 <malloc+0xa6>
      if(p->s.size == nunits)
 947:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94a:	8b 40 04             	mov    0x4(%eax),%eax
 94d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 950:	75 0c                	jne    95e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 952:	8b 45 f4             	mov    -0xc(%ebp),%eax
 955:	8b 10                	mov    (%eax),%edx
 957:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95a:	89 10                	mov    %edx,(%eax)
 95c:	eb 26                	jmp    984 <malloc+0x96>
      else {
        p->s.size -= nunits;
 95e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 961:	8b 40 04             	mov    0x4(%eax),%eax
 964:	2b 45 ec             	sub    -0x14(%ebp),%eax
 967:	89 c2                	mov    %eax,%edx
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 96f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 972:	8b 40 04             	mov    0x4(%eax),%eax
 975:	c1 e0 03             	shl    $0x3,%eax
 978:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 97b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 981:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 984:	8b 45 f0             	mov    -0x10(%ebp),%eax
 987:	a3 c4 0c 00 00       	mov    %eax,0xcc4
      return (void*)(p + 1);
 98c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98f:	83 c0 08             	add    $0x8,%eax
 992:	eb 38                	jmp    9cc <malloc+0xde>
    }
    if(p == freep)
 994:	a1 c4 0c 00 00       	mov    0xcc4,%eax
 999:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 99c:	75 1b                	jne    9b9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 99e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9a1:	89 04 24             	mov    %eax,(%esp)
 9a4:	e8 ed fe ff ff       	call   896 <morecore>
 9a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9b0:	75 07                	jne    9b9 <malloc+0xcb>
        return 0;
 9b2:	b8 00 00 00 00       	mov    $0x0,%eax
 9b7:	eb 13                	jmp    9cc <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c2:	8b 00                	mov    (%eax),%eax
 9c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9c7:	e9 70 ff ff ff       	jmp    93c <malloc+0x4e>
}
 9cc:	c9                   	leave  
 9cd:	c3                   	ret    
