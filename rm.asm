
_rm:     file format elf32-i386


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
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 c6 09 00 	movl   $0x9c6,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 d7 05 00 00       	call   5fa <printf>
    exit();
  23:	e8 4a 04 00 00       	call   472 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 76 04 00 00       	call   4c2 <unlink>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 da 09 00 	movl   $0x9da,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 80 05 00 00       	call   5fa <printf>
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
 380:	c7 44 24 04 f3 09 00 	movl   $0x9f3,0x4(%esp)
 387:	00 
 388:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 38f:	e8 66 02 00 00       	call   5fa <printf>
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
 3d2:	c7 44 24 04 0c 0a 00 	movl   $0xa0c,0x4(%esp)
 3d9:	00 
 3da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e1:	e8 14 02 00 00       	call   5fa <printf>
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

0000051a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 51a:	55                   	push   %ebp
 51b:	89 e5                	mov    %esp,%ebp
 51d:	83 ec 18             	sub    $0x18,%esp
 520:	8b 45 0c             	mov    0xc(%ebp),%eax
 523:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 526:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52d:	00 
 52e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 531:	89 44 24 04          	mov    %eax,0x4(%esp)
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	89 04 24             	mov    %eax,(%esp)
 53b:	e8 52 ff ff ff       	call   492 <write>
}
 540:	c9                   	leave  
 541:	c3                   	ret    

00000542 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 542:	55                   	push   %ebp
 543:	89 e5                	mov    %esp,%ebp
 545:	56                   	push   %esi
 546:	53                   	push   %ebx
 547:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 54a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 551:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 555:	74 17                	je     56e <printint+0x2c>
 557:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 55b:	79 11                	jns    56e <printint+0x2c>
    neg = 1;
 55d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 564:	8b 45 0c             	mov    0xc(%ebp),%eax
 567:	f7 d8                	neg    %eax
 569:	89 45 ec             	mov    %eax,-0x14(%ebp)
 56c:	eb 06                	jmp    574 <printint+0x32>
  } else {
    x = xx;
 56e:	8b 45 0c             	mov    0xc(%ebp),%eax
 571:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 574:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 57b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 57e:	8d 41 01             	lea    0x1(%ecx),%eax
 581:	89 45 f4             	mov    %eax,-0xc(%ebp)
 584:	8b 5d 10             	mov    0x10(%ebp),%ebx
 587:	8b 45 ec             	mov    -0x14(%ebp),%eax
 58a:	ba 00 00 00 00       	mov    $0x0,%edx
 58f:	f7 f3                	div    %ebx
 591:	89 d0                	mov    %edx,%eax
 593:	0f b6 80 98 0c 00 00 	movzbl 0xc98(%eax),%eax
 59a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 59e:	8b 75 10             	mov    0x10(%ebp),%esi
 5a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a4:	ba 00 00 00 00       	mov    $0x0,%edx
 5a9:	f7 f6                	div    %esi
 5ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b2:	75 c7                	jne    57b <printint+0x39>
  if(neg)
 5b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b8:	74 10                	je     5ca <printint+0x88>
    buf[i++] = '-';
 5ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bd:	8d 50 01             	lea    0x1(%eax),%edx
 5c0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5c3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5c8:	eb 1f                	jmp    5e9 <printint+0xa7>
 5ca:	eb 1d                	jmp    5e9 <printint+0xa7>
    putc(fd, buf[i]);
 5cc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d2:	01 d0                	add    %edx,%eax
 5d4:	0f b6 00             	movzbl (%eax),%eax
 5d7:	0f be c0             	movsbl %al,%eax
 5da:	89 44 24 04          	mov    %eax,0x4(%esp)
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	89 04 24             	mov    %eax,(%esp)
 5e4:	e8 31 ff ff ff       	call   51a <putc>
  while(--i >= 0)
 5e9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f1:	79 d9                	jns    5cc <printint+0x8a>
}
 5f3:	83 c4 30             	add    $0x30,%esp
 5f6:	5b                   	pop    %ebx
 5f7:	5e                   	pop    %esi
 5f8:	5d                   	pop    %ebp
 5f9:	c3                   	ret    

000005fa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 600:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 607:	8d 45 0c             	lea    0xc(%ebp),%eax
 60a:	83 c0 04             	add    $0x4,%eax
 60d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 610:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 617:	e9 7c 01 00 00       	jmp    798 <printf+0x19e>
    c = fmt[i] & 0xff;
 61c:	8b 55 0c             	mov    0xc(%ebp),%edx
 61f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 622:	01 d0                	add    %edx,%eax
 624:	0f b6 00             	movzbl (%eax),%eax
 627:	0f be c0             	movsbl %al,%eax
 62a:	25 ff 00 00 00       	and    $0xff,%eax
 62f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 632:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 636:	75 2c                	jne    664 <printf+0x6a>
      if(c == '%'){
 638:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 63c:	75 0c                	jne    64a <printf+0x50>
        state = '%';
 63e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 645:	e9 4a 01 00 00       	jmp    794 <printf+0x19a>
      } else {
        putc(fd, c);
 64a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64d:	0f be c0             	movsbl %al,%eax
 650:	89 44 24 04          	mov    %eax,0x4(%esp)
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 bb fe ff ff       	call   51a <putc>
 65f:	e9 30 01 00 00       	jmp    794 <printf+0x19a>
      }
    } else if(state == '%'){
 664:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 668:	0f 85 26 01 00 00    	jne    794 <printf+0x19a>
      if(c == 'd'){
 66e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 672:	75 2d                	jne    6a1 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 674:	8b 45 e8             	mov    -0x18(%ebp),%eax
 677:	8b 00                	mov    (%eax),%eax
 679:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 680:	00 
 681:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 688:	00 
 689:	89 44 24 04          	mov    %eax,0x4(%esp)
 68d:	8b 45 08             	mov    0x8(%ebp),%eax
 690:	89 04 24             	mov    %eax,(%esp)
 693:	e8 aa fe ff ff       	call   542 <printint>
        ap++;
 698:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69c:	e9 ec 00 00 00       	jmp    78d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6a1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6a5:	74 06                	je     6ad <printf+0xb3>
 6a7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6ab:	75 2d                	jne    6da <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6b9:	00 
 6ba:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6c1:	00 
 6c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c6:	8b 45 08             	mov    0x8(%ebp),%eax
 6c9:	89 04 24             	mov    %eax,(%esp)
 6cc:	e8 71 fe ff ff       	call   542 <printint>
        ap++;
 6d1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d5:	e9 b3 00 00 00       	jmp    78d <printf+0x193>
      } else if(c == 's'){
 6da:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6de:	75 45                	jne    725 <printf+0x12b>
        s = (char*)*ap;
 6e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e3:	8b 00                	mov    (%eax),%eax
 6e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6e8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6f0:	75 09                	jne    6fb <printf+0x101>
          s = "(null)";
 6f2:	c7 45 f4 1c 0a 00 00 	movl   $0xa1c,-0xc(%ebp)
        while(*s != 0){
 6f9:	eb 1e                	jmp    719 <printf+0x11f>
 6fb:	eb 1c                	jmp    719 <printf+0x11f>
          putc(fd, *s);
 6fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 700:	0f b6 00             	movzbl (%eax),%eax
 703:	0f be c0             	movsbl %al,%eax
 706:	89 44 24 04          	mov    %eax,0x4(%esp)
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	89 04 24             	mov    %eax,(%esp)
 710:	e8 05 fe ff ff       	call   51a <putc>
          s++;
 715:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	0f b6 00             	movzbl (%eax),%eax
 71f:	84 c0                	test   %al,%al
 721:	75 da                	jne    6fd <printf+0x103>
 723:	eb 68                	jmp    78d <printf+0x193>
        }
      } else if(c == 'c'){
 725:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 729:	75 1d                	jne    748 <printf+0x14e>
        putc(fd, *ap);
 72b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72e:	8b 00                	mov    (%eax),%eax
 730:	0f be c0             	movsbl %al,%eax
 733:	89 44 24 04          	mov    %eax,0x4(%esp)
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	89 04 24             	mov    %eax,(%esp)
 73d:	e8 d8 fd ff ff       	call   51a <putc>
        ap++;
 742:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 746:	eb 45                	jmp    78d <printf+0x193>
      } else if(c == '%'){
 748:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74c:	75 17                	jne    765 <printf+0x16b>
        putc(fd, c);
 74e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 751:	0f be c0             	movsbl %al,%eax
 754:	89 44 24 04          	mov    %eax,0x4(%esp)
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	89 04 24             	mov    %eax,(%esp)
 75e:	e8 b7 fd ff ff       	call   51a <putc>
 763:	eb 28                	jmp    78d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 765:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 76c:	00 
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	89 04 24             	mov    %eax,(%esp)
 773:	e8 a2 fd ff ff       	call   51a <putc>
        putc(fd, c);
 778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77b:	0f be c0             	movsbl %al,%eax
 77e:	89 44 24 04          	mov    %eax,0x4(%esp)
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	89 04 24             	mov    %eax,(%esp)
 788:	e8 8d fd ff ff       	call   51a <putc>
      }
      state = 0;
 78d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 794:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 798:	8b 55 0c             	mov    0xc(%ebp),%edx
 79b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79e:	01 d0                	add    %edx,%eax
 7a0:	0f b6 00             	movzbl (%eax),%eax
 7a3:	84 c0                	test   %al,%al
 7a5:	0f 85 71 fe ff ff    	jne    61c <printf+0x22>
    }
  }
}
 7ab:	c9                   	leave  
 7ac:	c3                   	ret    

000007ad <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ad:	55                   	push   %ebp
 7ae:	89 e5                	mov    %esp,%ebp
 7b0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	83 e8 08             	sub    $0x8,%eax
 7b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bc:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 7c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c4:	eb 24                	jmp    7ea <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 00                	mov    (%eax),%eax
 7cb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ce:	77 12                	ja     7e2 <free+0x35>
 7d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d6:	77 24                	ja     7fc <free+0x4f>
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e0:	77 1a                	ja     7fc <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e5:	8b 00                	mov    (%eax),%eax
 7e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f0:	76 d4                	jbe    7c6 <free+0x19>
 7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f5:	8b 00                	mov    (%eax),%eax
 7f7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7fa:	76 ca                	jbe    7c6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ff:	8b 40 04             	mov    0x4(%eax),%eax
 802:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 809:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80c:	01 c2                	add    %eax,%edx
 80e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 811:	8b 00                	mov    (%eax),%eax
 813:	39 c2                	cmp    %eax,%edx
 815:	75 24                	jne    83b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 817:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81a:	8b 50 04             	mov    0x4(%eax),%edx
 81d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 820:	8b 00                	mov    (%eax),%eax
 822:	8b 40 04             	mov    0x4(%eax),%eax
 825:	01 c2                	add    %eax,%edx
 827:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 00                	mov    (%eax),%eax
 832:	8b 10                	mov    (%eax),%edx
 834:	8b 45 f8             	mov    -0x8(%ebp),%eax
 837:	89 10                	mov    %edx,(%eax)
 839:	eb 0a                	jmp    845 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 83b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83e:	8b 10                	mov    (%eax),%edx
 840:	8b 45 f8             	mov    -0x8(%ebp),%eax
 843:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
 848:	8b 40 04             	mov    0x4(%eax),%eax
 84b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 852:	8b 45 fc             	mov    -0x4(%ebp),%eax
 855:	01 d0                	add    %edx,%eax
 857:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 85a:	75 20                	jne    87c <free+0xcf>
    p->s.size += bp->s.size;
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	8b 50 04             	mov    0x4(%eax),%edx
 862:	8b 45 f8             	mov    -0x8(%ebp),%eax
 865:	8b 40 04             	mov    0x4(%eax),%eax
 868:	01 c2                	add    %eax,%edx
 86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 870:	8b 45 f8             	mov    -0x8(%ebp),%eax
 873:	8b 10                	mov    (%eax),%edx
 875:	8b 45 fc             	mov    -0x4(%ebp),%eax
 878:	89 10                	mov    %edx,(%eax)
 87a:	eb 08                	jmp    884 <free+0xd7>
  } else
    p->s.ptr = bp;
 87c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 882:	89 10                	mov    %edx,(%eax)
  freep = p;
 884:	8b 45 fc             	mov    -0x4(%ebp),%eax
 887:	a3 b4 0c 00 00       	mov    %eax,0xcb4
}
 88c:	c9                   	leave  
 88d:	c3                   	ret    

0000088e <morecore>:

static Header*
morecore(uint nu)
{
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 894:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 89b:	77 07                	ja     8a4 <morecore+0x16>
    nu = 4096;
 89d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	c1 e0 03             	shl    $0x3,%eax
 8aa:	89 04 24             	mov    %eax,(%esp)
 8ad:	e8 48 fc ff ff       	call   4fa <sbrk>
 8b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8b5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8b9:	75 07                	jne    8c2 <morecore+0x34>
    return 0;
 8bb:	b8 00 00 00 00       	mov    $0x0,%eax
 8c0:	eb 22                	jmp    8e4 <morecore+0x56>
  hp = (Header*)p;
 8c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cb:	8b 55 08             	mov    0x8(%ebp),%edx
 8ce:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d4:	83 c0 08             	add    $0x8,%eax
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 ce fe ff ff       	call   7ad <free>
  return freep;
 8df:	a1 b4 0c 00 00       	mov    0xcb4,%eax
}
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    

000008e6 <malloc>:

void*
malloc(uint nbytes)
{
 8e6:	55                   	push   %ebp
 8e7:	89 e5                	mov    %esp,%ebp
 8e9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8ec:	8b 45 08             	mov    0x8(%ebp),%eax
 8ef:	83 c0 07             	add    $0x7,%eax
 8f2:	c1 e8 03             	shr    $0x3,%eax
 8f5:	83 c0 01             	add    $0x1,%eax
 8f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8fb:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 900:	89 45 f0             	mov    %eax,-0x10(%ebp)
 903:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 907:	75 23                	jne    92c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 909:	c7 45 f0 ac 0c 00 00 	movl   $0xcac,-0x10(%ebp)
 910:	8b 45 f0             	mov    -0x10(%ebp),%eax
 913:	a3 b4 0c 00 00       	mov    %eax,0xcb4
 918:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 91d:	a3 ac 0c 00 00       	mov    %eax,0xcac
    base.s.size = 0;
 922:	c7 05 b0 0c 00 00 00 	movl   $0x0,0xcb0
 929:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 934:	8b 45 f4             	mov    -0xc(%ebp),%eax
 937:	8b 40 04             	mov    0x4(%eax),%eax
 93a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 93d:	72 4d                	jb     98c <malloc+0xa6>
      if(p->s.size == nunits)
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	8b 40 04             	mov    0x4(%eax),%eax
 945:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 948:	75 0c                	jne    956 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	8b 10                	mov    (%eax),%edx
 94f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 952:	89 10                	mov    %edx,(%eax)
 954:	eb 26                	jmp    97c <malloc+0x96>
      else {
        p->s.size -= nunits;
 956:	8b 45 f4             	mov    -0xc(%ebp),%eax
 959:	8b 40 04             	mov    0x4(%eax),%eax
 95c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 95f:	89 c2                	mov    %eax,%edx
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 967:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96a:	8b 40 04             	mov    0x4(%eax),%eax
 96d:	c1 e0 03             	shl    $0x3,%eax
 970:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	8b 55 ec             	mov    -0x14(%ebp),%edx
 979:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97f:	a3 b4 0c 00 00       	mov    %eax,0xcb4
      return (void*)(p + 1);
 984:	8b 45 f4             	mov    -0xc(%ebp),%eax
 987:	83 c0 08             	add    $0x8,%eax
 98a:	eb 38                	jmp    9c4 <malloc+0xde>
    }
    if(p == freep)
 98c:	a1 b4 0c 00 00       	mov    0xcb4,%eax
 991:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 994:	75 1b                	jne    9b1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 996:	8b 45 ec             	mov    -0x14(%ebp),%eax
 999:	89 04 24             	mov    %eax,(%esp)
 99c:	e8 ed fe ff ff       	call   88e <morecore>
 9a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a8:	75 07                	jne    9b1 <malloc+0xcb>
        return 0;
 9aa:	b8 00 00 00 00       	mov    $0x0,%eax
 9af:	eb 13                	jmp    9c4 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9bf:	e9 70 ff ff ff       	jmp    934 <malloc+0x4e>
}
 9c4:	c9                   	leave  
 9c5:	c3                   	ret    
