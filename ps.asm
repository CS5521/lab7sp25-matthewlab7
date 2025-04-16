
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   ps();
   6:	e8 65 02 00 00       	call   270 <ps>
   exit();
   b:	e8 e3 03 00 00       	call   3f3 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 bf 02 00 00       	call   40b <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 82 02 00 00       	call   433 <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 78 02 00 00       	call   44b <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 3a 02 00 00       	call   41b <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:

void
ps()
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 27c:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 282:	89 04 24             	mov    %eax,(%esp)
 285:	e8 09 02 00 00       	call   493 <getpinfo>
 28a:	83 f8 ff             	cmp    $0xffffffff,%eax
 28d:	0f 84 4d 01 00 00    	je     3e0 <ps+0x170>
    return;
  int i = 0;
 293:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 29a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 29d:	89 d0                	mov    %edx,%eax
 29f:	c1 e0 03             	shl    $0x3,%eax
 2a2:	01 d0                	add    %edx,%eax
 2a4:	c1 e0 02             	shl    $0x2,%eax
 2a7:	8d 7d e8             	lea    -0x18(%ebp),%edi
 2aa:	01 f8                	add    %edi,%eax
 2ac:	2d 04 09 00 00       	sub    $0x904,%eax
 2b1:	8b 10                	mov    (%eax),%edx
 2b3:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 2b9:	8b 50 04             	mov    0x4(%eax),%edx
 2bc:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 2c2:	8b 50 08             	mov    0x8(%eax),%edx
 2c5:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 2cb:	8b 50 0c             	mov    0xc(%eax),%edx
 2ce:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 2d4:	8b 50 10             	mov    0x10(%eax),%edx
 2d7:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 2dd:	8b 50 14             	mov    0x14(%eax),%edx
 2e0:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 2e6:	8b 50 18             	mov    0x18(%eax),%edx
 2e9:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 2ef:	8b 50 1c             	mov    0x1c(%eax),%edx
 2f2:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 2f8:	8b 40 20             	mov    0x20(%eax),%eax
 2fb:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 301:	c7 44 24 04 47 09 00 	movl   $0x947,0x4(%esp)
 308:	00 
 309:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 310:	e8 66 02 00 00       	call   57b <printf>
  for(;p.pid != 0; p = table[i])
 315:	e9 b8 00 00 00       	jmp    3d2 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 31a:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 321:	0f be d8             	movsbl %al,%ebx
 324:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 32a:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 330:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 336:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 33c:	83 c6 10             	add    $0x10,%esi
 33f:	89 74 24 18          	mov    %esi,0x18(%esp)
 343:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 347:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 34b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 34f:	89 44 24 08          	mov    %eax,0x8(%esp)
 353:	c7 44 24 04 60 09 00 	movl   $0x960,0x4(%esp)
 35a:	00 
 35b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 362:	e8 14 02 00 00       	call   57b <printf>
    i++;
 367:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 36b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36e:	89 d0                	mov    %edx,%eax
 370:	c1 e0 03             	shl    $0x3,%eax
 373:	01 d0                	add    %edx,%eax
 375:	c1 e0 02             	shl    $0x2,%eax
 378:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 37b:	01 c8                	add    %ecx,%eax
 37d:	2d 04 09 00 00       	sub    $0x904,%eax
 382:	8b 10                	mov    (%eax),%edx
 384:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 38a:	8b 50 04             	mov    0x4(%eax),%edx
 38d:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 393:	8b 50 08             	mov    0x8(%eax),%edx
 396:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 39c:	8b 50 0c             	mov    0xc(%eax),%edx
 39f:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3a5:	8b 50 10             	mov    0x10(%eax),%edx
 3a8:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 3ae:	8b 50 14             	mov    0x14(%eax),%edx
 3b1:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 3b7:	8b 50 18             	mov    0x18(%eax),%edx
 3ba:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 3c0:	8b 50 1c             	mov    0x1c(%eax),%edx
 3c3:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 3c9:	8b 40 20             	mov    0x20(%eax),%eax
 3cc:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 3d2:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 3d8:	85 c0                	test   %eax,%eax
 3da:	0f 85 3a ff ff ff    	jne    31a <ps+0xaa>
  }
}
 3e0:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    

000003eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3eb:	b8 01 00 00 00       	mov    $0x1,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <exit>:
SYSCALL(exit)
 3f3:	b8 02 00 00 00       	mov    $0x2,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <wait>:
SYSCALL(wait)
 3fb:	b8 03 00 00 00       	mov    $0x3,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <pipe>:
SYSCALL(pipe)
 403:	b8 04 00 00 00       	mov    $0x4,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <read>:
SYSCALL(read)
 40b:	b8 05 00 00 00       	mov    $0x5,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <write>:
SYSCALL(write)
 413:	b8 10 00 00 00       	mov    $0x10,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <close>:
SYSCALL(close)
 41b:	b8 15 00 00 00       	mov    $0x15,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <kill>:
SYSCALL(kill)
 423:	b8 06 00 00 00       	mov    $0x6,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <exec>:
SYSCALL(exec)
 42b:	b8 07 00 00 00       	mov    $0x7,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <open>:
SYSCALL(open)
 433:	b8 0f 00 00 00       	mov    $0xf,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mknod>:
SYSCALL(mknod)
 43b:	b8 11 00 00 00       	mov    $0x11,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <unlink>:
SYSCALL(unlink)
 443:	b8 12 00 00 00       	mov    $0x12,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <fstat>:
SYSCALL(fstat)
 44b:	b8 08 00 00 00       	mov    $0x8,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <link>:
SYSCALL(link)
 453:	b8 13 00 00 00       	mov    $0x13,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mkdir>:
SYSCALL(mkdir)
 45b:	b8 14 00 00 00       	mov    $0x14,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <chdir>:
SYSCALL(chdir)
 463:	b8 09 00 00 00       	mov    $0x9,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <dup>:
SYSCALL(dup)
 46b:	b8 0a 00 00 00       	mov    $0xa,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <getpid>:
SYSCALL(getpid)
 473:	b8 0b 00 00 00       	mov    $0xb,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <sbrk>:
SYSCALL(sbrk)
 47b:	b8 0c 00 00 00       	mov    $0xc,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <sleep>:
SYSCALL(sleep)
 483:	b8 0d 00 00 00       	mov    $0xd,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <uptime>:
SYSCALL(uptime)
 48b:	b8 0e 00 00 00       	mov    $0xe,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getpinfo>:
SYSCALL(getpinfo)
 493:	b8 16 00 00 00       	mov    $0x16,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 49b:	55                   	push   %ebp
 49c:	89 e5                	mov    %esp,%ebp
 49e:	83 ec 18             	sub    $0x18,%esp
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ae:	00 
 4af:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
 4b9:	89 04 24             	mov    %eax,(%esp)
 4bc:	e8 52 ff ff ff       	call   413 <write>
}
 4c1:	c9                   	leave  
 4c2:	c3                   	ret    

000004c3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	56                   	push   %esi
 4c7:	53                   	push   %ebx
 4c8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d6:	74 17                	je     4ef <printint+0x2c>
 4d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4dc:	79 11                	jns    4ef <printint+0x2c>
    neg = 1;
 4de:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e8:	f7 d8                	neg    %eax
 4ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ed:	eb 06                	jmp    4f5 <printint+0x32>
  } else {
    x = xx;
 4ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4fc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4ff:	8d 41 01             	lea    0x1(%ecx),%eax
 502:	89 45 f4             	mov    %eax,-0xc(%ebp)
 505:	8b 5d 10             	mov    0x10(%ebp),%ebx
 508:	8b 45 ec             	mov    -0x14(%ebp),%eax
 50b:	ba 00 00 00 00       	mov    $0x0,%edx
 510:	f7 f3                	div    %ebx
 512:	89 d0                	mov    %edx,%eax
 514:	0f b6 80 ec 0b 00 00 	movzbl 0xbec(%eax),%eax
 51b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51f:	8b 75 10             	mov    0x10(%ebp),%esi
 522:	8b 45 ec             	mov    -0x14(%ebp),%eax
 525:	ba 00 00 00 00       	mov    $0x0,%edx
 52a:	f7 f6                	div    %esi
 52c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 533:	75 c7                	jne    4fc <printint+0x39>
  if(neg)
 535:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 539:	74 10                	je     54b <printint+0x88>
    buf[i++] = '-';
 53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53e:	8d 50 01             	lea    0x1(%eax),%edx
 541:	89 55 f4             	mov    %edx,-0xc(%ebp)
 544:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 549:	eb 1f                	jmp    56a <printint+0xa7>
 54b:	eb 1d                	jmp    56a <printint+0xa7>
    putc(fd, buf[i]);
 54d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 550:	8b 45 f4             	mov    -0xc(%ebp),%eax
 553:	01 d0                	add    %edx,%eax
 555:	0f b6 00             	movzbl (%eax),%eax
 558:	0f be c0             	movsbl %al,%eax
 55b:	89 44 24 04          	mov    %eax,0x4(%esp)
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	89 04 24             	mov    %eax,(%esp)
 565:	e8 31 ff ff ff       	call   49b <putc>
  while(--i >= 0)
 56a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 56e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 572:	79 d9                	jns    54d <printint+0x8a>
}
 574:	83 c4 30             	add    $0x30,%esp
 577:	5b                   	pop    %ebx
 578:	5e                   	pop    %esi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    

0000057b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 57b:	55                   	push   %ebp
 57c:	89 e5                	mov    %esp,%ebp
 57e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 581:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 588:	8d 45 0c             	lea    0xc(%ebp),%eax
 58b:	83 c0 04             	add    $0x4,%eax
 58e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 591:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 598:	e9 7c 01 00 00       	jmp    719 <printf+0x19e>
    c = fmt[i] & 0xff;
 59d:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a3:	01 d0                	add    %edx,%eax
 5a5:	0f b6 00             	movzbl (%eax),%eax
 5a8:	0f be c0             	movsbl %al,%eax
 5ab:	25 ff 00 00 00       	and    $0xff,%eax
 5b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5b3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b7:	75 2c                	jne    5e5 <printf+0x6a>
      if(c == '%'){
 5b9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bd:	75 0c                	jne    5cb <printf+0x50>
        state = '%';
 5bf:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c6:	e9 4a 01 00 00       	jmp    715 <printf+0x19a>
      } else {
        putc(fd, c);
 5cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ce:	0f be c0             	movsbl %al,%eax
 5d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d5:	8b 45 08             	mov    0x8(%ebp),%eax
 5d8:	89 04 24             	mov    %eax,(%esp)
 5db:	e8 bb fe ff ff       	call   49b <putc>
 5e0:	e9 30 01 00 00       	jmp    715 <printf+0x19a>
      }
    } else if(state == '%'){
 5e5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e9:	0f 85 26 01 00 00    	jne    715 <printf+0x19a>
      if(c == 'd'){
 5ef:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5f3:	75 2d                	jne    622 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 601:	00 
 602:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 609:	00 
 60a:	89 44 24 04          	mov    %eax,0x4(%esp)
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	89 04 24             	mov    %eax,(%esp)
 614:	e8 aa fe ff ff       	call   4c3 <printint>
        ap++;
 619:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61d:	e9 ec 00 00 00       	jmp    70e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 622:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 626:	74 06                	je     62e <printf+0xb3>
 628:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 62c:	75 2d                	jne    65b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 62e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 631:	8b 00                	mov    (%eax),%eax
 633:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 63a:	00 
 63b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 642:	00 
 643:	89 44 24 04          	mov    %eax,0x4(%esp)
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	89 04 24             	mov    %eax,(%esp)
 64d:	e8 71 fe ff ff       	call   4c3 <printint>
        ap++;
 652:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 656:	e9 b3 00 00 00       	jmp    70e <printf+0x193>
      } else if(c == 's'){
 65b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65f:	75 45                	jne    6a6 <printf+0x12b>
        s = (char*)*ap;
 661:	8b 45 e8             	mov    -0x18(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 669:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 66d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 671:	75 09                	jne    67c <printf+0x101>
          s = "(null)";
 673:	c7 45 f4 70 09 00 00 	movl   $0x970,-0xc(%ebp)
        while(*s != 0){
 67a:	eb 1e                	jmp    69a <printf+0x11f>
 67c:	eb 1c                	jmp    69a <printf+0x11f>
          putc(fd, *s);
 67e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 681:	0f b6 00             	movzbl (%eax),%eax
 684:	0f be c0             	movsbl %al,%eax
 687:	89 44 24 04          	mov    %eax,0x4(%esp)
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	89 04 24             	mov    %eax,(%esp)
 691:	e8 05 fe ff ff       	call   49b <putc>
          s++;
 696:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 69a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69d:	0f b6 00             	movzbl (%eax),%eax
 6a0:	84 c0                	test   %al,%al
 6a2:	75 da                	jne    67e <printf+0x103>
 6a4:	eb 68                	jmp    70e <printf+0x193>
        }
      } else if(c == 'c'){
 6a6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6aa:	75 1d                	jne    6c9 <printf+0x14e>
        putc(fd, *ap);
 6ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	0f be c0             	movsbl %al,%eax
 6b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 d8 fd ff ff       	call   49b <putc>
        ap++;
 6c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c7:	eb 45                	jmp    70e <printf+0x193>
      } else if(c == '%'){
 6c9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6cd:	75 17                	jne    6e6 <printf+0x16b>
        putc(fd, c);
 6cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d2:	0f be c0             	movsbl %al,%eax
 6d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 b7 fd ff ff       	call   49b <putc>
 6e4:	eb 28                	jmp    70e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6ed:	00 
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	89 04 24             	mov    %eax,(%esp)
 6f4:	e8 a2 fd ff ff       	call   49b <putc>
        putc(fd, c);
 6f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fc:	0f be c0             	movsbl %al,%eax
 6ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	89 04 24             	mov    %eax,(%esp)
 709:	e8 8d fd ff ff       	call   49b <putc>
      }
      state = 0;
 70e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 715:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 719:	8b 55 0c             	mov    0xc(%ebp),%edx
 71c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71f:	01 d0                	add    %edx,%eax
 721:	0f b6 00             	movzbl (%eax),%eax
 724:	84 c0                	test   %al,%al
 726:	0f 85 71 fe ff ff    	jne    59d <printf+0x22>
    }
  }
}
 72c:	c9                   	leave  
 72d:	c3                   	ret    

0000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 734:	8b 45 08             	mov    0x8(%ebp),%eax
 737:	83 e8 08             	sub    $0x8,%eax
 73a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73d:	a1 08 0c 00 00       	mov    0xc08,%eax
 742:	89 45 fc             	mov    %eax,-0x4(%ebp)
 745:	eb 24                	jmp    76b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74f:	77 12                	ja     763 <free+0x35>
 751:	8b 45 f8             	mov    -0x8(%ebp),%eax
 754:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 757:	77 24                	ja     77d <free+0x4f>
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 00                	mov    (%eax),%eax
 75e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 761:	77 1a                	ja     77d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	89 45 fc             	mov    %eax,-0x4(%ebp)
 76b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 771:	76 d4                	jbe    747 <free+0x19>
 773:	8b 45 fc             	mov    -0x4(%ebp),%eax
 776:	8b 00                	mov    (%eax),%eax
 778:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77b:	76 ca                	jbe    747 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 780:	8b 40 04             	mov    0x4(%eax),%eax
 783:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	01 c2                	add    %eax,%edx
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 00                	mov    (%eax),%eax
 794:	39 c2                	cmp    %eax,%edx
 796:	75 24                	jne    7bc <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	8b 50 04             	mov    0x4(%eax),%edx
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	01 c2                	add    %eax,%edx
 7a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	8b 00                	mov    (%eax),%eax
 7b3:	8b 10                	mov    (%eax),%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 10                	mov    %edx,(%eax)
 7ba:	eb 0a                	jmp    7c6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 10                	mov    (%eax),%edx
 7c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 40 04             	mov    0x4(%eax),%eax
 7cc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d6:	01 d0                	add    %edx,%eax
 7d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7db:	75 20                	jne    7fd <free+0xcf>
    p->s.size += bp->s.size;
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 50 04             	mov    0x4(%eax),%edx
 7e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e6:	8b 40 04             	mov    0x4(%eax),%eax
 7e9:	01 c2                	add    %eax,%edx
 7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f4:	8b 10                	mov    (%eax),%edx
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	89 10                	mov    %edx,(%eax)
 7fb:	eb 08                	jmp    805 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	8b 55 f8             	mov    -0x8(%ebp),%edx
 803:	89 10                	mov    %edx,(%eax)
  freep = p;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	a3 08 0c 00 00       	mov    %eax,0xc08
}
 80d:	c9                   	leave  
 80e:	c3                   	ret    

0000080f <morecore>:

static Header*
morecore(uint nu)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 815:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 81c:	77 07                	ja     825 <morecore+0x16>
    nu = 4096;
 81e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	c1 e0 03             	shl    $0x3,%eax
 82b:	89 04 24             	mov    %eax,(%esp)
 82e:	e8 48 fc ff ff       	call   47b <sbrk>
 833:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 836:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 83a:	75 07                	jne    843 <morecore+0x34>
    return 0;
 83c:	b8 00 00 00 00       	mov    $0x0,%eax
 841:	eb 22                	jmp    865 <morecore+0x56>
  hp = (Header*)p;
 843:	8b 45 f4             	mov    -0xc(%ebp),%eax
 846:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 849:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84c:	8b 55 08             	mov    0x8(%ebp),%edx
 84f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 852:	8b 45 f0             	mov    -0x10(%ebp),%eax
 855:	83 c0 08             	add    $0x8,%eax
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 ce fe ff ff       	call   72e <free>
  return freep;
 860:	a1 08 0c 00 00       	mov    0xc08,%eax
}
 865:	c9                   	leave  
 866:	c3                   	ret    

00000867 <malloc>:

void*
malloc(uint nbytes)
{
 867:	55                   	push   %ebp
 868:	89 e5                	mov    %esp,%ebp
 86a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	83 c0 07             	add    $0x7,%eax
 873:	c1 e8 03             	shr    $0x3,%eax
 876:	83 c0 01             	add    $0x1,%eax
 879:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 87c:	a1 08 0c 00 00       	mov    0xc08,%eax
 881:	89 45 f0             	mov    %eax,-0x10(%ebp)
 884:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 888:	75 23                	jne    8ad <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 88a:	c7 45 f0 00 0c 00 00 	movl   $0xc00,-0x10(%ebp)
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	a3 08 0c 00 00       	mov    %eax,0xc08
 899:	a1 08 0c 00 00       	mov    0xc08,%eax
 89e:	a3 00 0c 00 00       	mov    %eax,0xc00
    base.s.size = 0;
 8a3:	c7 05 04 0c 00 00 00 	movl   $0x0,0xc04
 8aa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b0:	8b 00                	mov    (%eax),%eax
 8b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b8:	8b 40 04             	mov    0x4(%eax),%eax
 8bb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8be:	72 4d                	jb     90d <malloc+0xa6>
      if(p->s.size == nunits)
 8c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c3:	8b 40 04             	mov    0x4(%eax),%eax
 8c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c9:	75 0c                	jne    8d7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	8b 10                	mov    (%eax),%edx
 8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d3:	89 10                	mov    %edx,(%eax)
 8d5:	eb 26                	jmp    8fd <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	8b 40 04             	mov    0x4(%eax),%eax
 8dd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e0:	89 c2                	mov    %eax,%edx
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 40 04             	mov    0x4(%eax),%eax
 8ee:	c1 e0 03             	shl    $0x3,%eax
 8f1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8fa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 900:	a3 08 0c 00 00       	mov    %eax,0xc08
      return (void*)(p + 1);
 905:	8b 45 f4             	mov    -0xc(%ebp),%eax
 908:	83 c0 08             	add    $0x8,%eax
 90b:	eb 38                	jmp    945 <malloc+0xde>
    }
    if(p == freep)
 90d:	a1 08 0c 00 00       	mov    0xc08,%eax
 912:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 915:	75 1b                	jne    932 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 917:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91a:	89 04 24             	mov    %eax,(%esp)
 91d:	e8 ed fe ff ff       	call   80f <morecore>
 922:	89 45 f4             	mov    %eax,-0xc(%ebp)
 925:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 929:	75 07                	jne    932 <malloc+0xcb>
        return 0;
 92b:	b8 00 00 00 00       	mov    $0x0,%eax
 930:	eb 13                	jmp    945 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 932:	8b 45 f4             	mov    -0xc(%ebp),%eax
 935:	89 45 f0             	mov    %eax,-0x10(%ebp)
 938:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93b:	8b 00                	mov    (%eax),%eax
 93d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 940:	e9 70 ff ff ff       	jmp    8b5 <malloc+0x4e>
}
 945:	c9                   	leave  
 946:	c3                   	ret    
