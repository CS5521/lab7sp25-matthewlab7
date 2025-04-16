
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
 301:	c7 44 24 04 4f 09 00 	movl   $0x94f,0x4(%esp)
 308:	00 
 309:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 310:	e8 6e 02 00 00       	call   583 <printf>
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
 353:	c7 44 24 04 68 09 00 	movl   $0x968,0x4(%esp)
 35a:	00 
 35b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 362:	e8 1c 02 00 00       	call   583 <printf>
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

0000049b <settickets>:
 49b:	b8 17 00 00 00       	mov    $0x17,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	83 ec 18             	sub    $0x18,%esp
 4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ac:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b6:	00 
 4b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	89 04 24             	mov    %eax,(%esp)
 4c4:	e8 4a ff ff ff       	call   413 <write>
}
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	56                   	push   %esi
 4cf:	53                   	push   %ebx
 4d0:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4da:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4de:	74 17                	je     4f7 <printint+0x2c>
 4e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e4:	79 11                	jns    4f7 <printint+0x2c>
    neg = 1;
 4e6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f0:	f7 d8                	neg    %eax
 4f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f5:	eb 06                	jmp    4fd <printint+0x32>
  } else {
    x = xx;
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 504:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 507:	8d 41 01             	lea    0x1(%ecx),%eax
 50a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 50d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 510:	8b 45 ec             	mov    -0x14(%ebp),%eax
 513:	ba 00 00 00 00       	mov    $0x0,%edx
 518:	f7 f3                	div    %ebx
 51a:	89 d0                	mov    %edx,%eax
 51c:	0f b6 80 f4 0b 00 00 	movzbl 0xbf4(%eax),%eax
 523:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 527:	8b 75 10             	mov    0x10(%ebp),%esi
 52a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52d:	ba 00 00 00 00       	mov    $0x0,%edx
 532:	f7 f6                	div    %esi
 534:	89 45 ec             	mov    %eax,-0x14(%ebp)
 537:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 53b:	75 c7                	jne    504 <printint+0x39>
  if(neg)
 53d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 541:	74 10                	je     553 <printint+0x88>
    buf[i++] = '-';
 543:	8b 45 f4             	mov    -0xc(%ebp),%eax
 546:	8d 50 01             	lea    0x1(%eax),%edx
 549:	89 55 f4             	mov    %edx,-0xc(%ebp)
 54c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 551:	eb 1f                	jmp    572 <printint+0xa7>
 553:	eb 1d                	jmp    572 <printint+0xa7>
    putc(fd, buf[i]);
 555:	8d 55 dc             	lea    -0x24(%ebp),%edx
 558:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55b:	01 d0                	add    %edx,%eax
 55d:	0f b6 00             	movzbl (%eax),%eax
 560:	0f be c0             	movsbl %al,%eax
 563:	89 44 24 04          	mov    %eax,0x4(%esp)
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	89 04 24             	mov    %eax,(%esp)
 56d:	e8 31 ff ff ff       	call   4a3 <putc>
  while(--i >= 0)
 572:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 576:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57a:	79 d9                	jns    555 <printint+0x8a>
}
 57c:	83 c4 30             	add    $0x30,%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5d                   	pop    %ebp
 582:	c3                   	ret    

00000583 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 589:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 590:	8d 45 0c             	lea    0xc(%ebp),%eax
 593:	83 c0 04             	add    $0x4,%eax
 596:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 599:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a0:	e9 7c 01 00 00       	jmp    721 <printf+0x19e>
    c = fmt[i] & 0xff;
 5a5:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ab:	01 d0                	add    %edx,%eax
 5ad:	0f b6 00             	movzbl (%eax),%eax
 5b0:	0f be c0             	movsbl %al,%eax
 5b3:	25 ff 00 00 00       	and    $0xff,%eax
 5b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5bf:	75 2c                	jne    5ed <printf+0x6a>
      if(c == '%'){
 5c1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c5:	75 0c                	jne    5d3 <printf+0x50>
        state = '%';
 5c7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5ce:	e9 4a 01 00 00       	jmp    71d <printf+0x19a>
      } else {
        putc(fd, c);
 5d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 bb fe ff ff       	call   4a3 <putc>
 5e8:	e9 30 01 00 00       	jmp    71d <printf+0x19a>
      }
    } else if(state == '%'){
 5ed:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f1:	0f 85 26 01 00 00    	jne    71d <printf+0x19a>
      if(c == 'd'){
 5f7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5fb:	75 2d                	jne    62a <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 609:	00 
 60a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 611:	00 
 612:	89 44 24 04          	mov    %eax,0x4(%esp)
 616:	8b 45 08             	mov    0x8(%ebp),%eax
 619:	89 04 24             	mov    %eax,(%esp)
 61c:	e8 aa fe ff ff       	call   4cb <printint>
        ap++;
 621:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 625:	e9 ec 00 00 00       	jmp    716 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 62a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 62e:	74 06                	je     636 <printf+0xb3>
 630:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 634:	75 2d                	jne    663 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 636:	8b 45 e8             	mov    -0x18(%ebp),%eax
 639:	8b 00                	mov    (%eax),%eax
 63b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 642:	00 
 643:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64a:	00 
 64b:	89 44 24 04          	mov    %eax,0x4(%esp)
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	89 04 24             	mov    %eax,(%esp)
 655:	e8 71 fe ff ff       	call   4cb <printint>
        ap++;
 65a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65e:	e9 b3 00 00 00       	jmp    716 <printf+0x193>
      } else if(c == 's'){
 663:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 667:	75 45                	jne    6ae <printf+0x12b>
        s = (char*)*ap;
 669:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66c:	8b 00                	mov    (%eax),%eax
 66e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 671:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 675:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 679:	75 09                	jne    684 <printf+0x101>
          s = "(null)";
 67b:	c7 45 f4 78 09 00 00 	movl   $0x978,-0xc(%ebp)
        while(*s != 0){
 682:	eb 1e                	jmp    6a2 <printf+0x11f>
 684:	eb 1c                	jmp    6a2 <printf+0x11f>
          putc(fd, *s);
 686:	8b 45 f4             	mov    -0xc(%ebp),%eax
 689:	0f b6 00             	movzbl (%eax),%eax
 68c:	0f be c0             	movsbl %al,%eax
 68f:	89 44 24 04          	mov    %eax,0x4(%esp)
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	89 04 24             	mov    %eax,(%esp)
 699:	e8 05 fe ff ff       	call   4a3 <putc>
          s++;
 69e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a5:	0f b6 00             	movzbl (%eax),%eax
 6a8:	84 c0                	test   %al,%al
 6aa:	75 da                	jne    686 <printf+0x103>
 6ac:	eb 68                	jmp    716 <printf+0x193>
        }
      } else if(c == 'c'){
 6ae:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b2:	75 1d                	jne    6d1 <printf+0x14e>
        putc(fd, *ap);
 6b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	0f be c0             	movsbl %al,%eax
 6bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 04 24             	mov    %eax,(%esp)
 6c6:	e8 d8 fd ff ff       	call   4a3 <putc>
        ap++;
 6cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6cf:	eb 45                	jmp    716 <printf+0x193>
      } else if(c == '%'){
 6d1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d5:	75 17                	jne    6ee <printf+0x16b>
        putc(fd, c);
 6d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6da:	0f be c0             	movsbl %al,%eax
 6dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	89 04 24             	mov    %eax,(%esp)
 6e7:	e8 b7 fd ff ff       	call   4a3 <putc>
 6ec:	eb 28                	jmp    716 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ee:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6f5:	00 
 6f6:	8b 45 08             	mov    0x8(%ebp),%eax
 6f9:	89 04 24             	mov    %eax,(%esp)
 6fc:	e8 a2 fd ff ff       	call   4a3 <putc>
        putc(fd, c);
 701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 704:	0f be c0             	movsbl %al,%eax
 707:	89 44 24 04          	mov    %eax,0x4(%esp)
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	89 04 24             	mov    %eax,(%esp)
 711:	e8 8d fd ff ff       	call   4a3 <putc>
      }
      state = 0;
 716:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 71d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 721:	8b 55 0c             	mov    0xc(%ebp),%edx
 724:	8b 45 f0             	mov    -0x10(%ebp),%eax
 727:	01 d0                	add    %edx,%eax
 729:	0f b6 00             	movzbl (%eax),%eax
 72c:	84 c0                	test   %al,%al
 72e:	0f 85 71 fe ff ff    	jne    5a5 <printf+0x22>
    }
  }
}
 734:	c9                   	leave  
 735:	c3                   	ret    

00000736 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 736:	55                   	push   %ebp
 737:	89 e5                	mov    %esp,%ebp
 739:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	83 e8 08             	sub    $0x8,%eax
 742:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 745:	a1 10 0c 00 00       	mov    0xc10,%eax
 74a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 74d:	eb 24                	jmp    773 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 757:	77 12                	ja     76b <free+0x35>
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75f:	77 24                	ja     785 <free+0x4f>
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 769:	77 1a                	ja     785 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	89 45 fc             	mov    %eax,-0x4(%ebp)
 773:	8b 45 f8             	mov    -0x8(%ebp),%eax
 776:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 779:	76 d4                	jbe    74f <free+0x19>
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	8b 00                	mov    (%eax),%eax
 780:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 783:	76 ca                	jbe    74f <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	01 c2                	add    %eax,%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	39 c2                	cmp    %eax,%edx
 79e:	75 24                	jne    7c4 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a3:	8b 50 04             	mov    0x4(%eax),%edx
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	8b 00                	mov    (%eax),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	01 c2                	add    %eax,%edx
 7b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	89 10                	mov    %edx,(%eax)
 7c2:	eb 0a                	jmp    7ce <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 10                	mov    (%eax),%edx
 7c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cc:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	01 d0                	add    %edx,%eax
 7e0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e3:	75 20                	jne    805 <free+0xcf>
    p->s.size += bp->s.size;
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	8b 50 04             	mov    0x4(%eax),%edx
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 40 04             	mov    0x4(%eax),%eax
 7f1:	01 c2                	add    %eax,%edx
 7f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fc:	8b 10                	mov    (%eax),%edx
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	89 10                	mov    %edx,(%eax)
 803:	eb 08                	jmp    80d <free+0xd7>
  } else
    p->s.ptr = bp;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80b:	89 10                	mov    %edx,(%eax)
  freep = p;
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	a3 10 0c 00 00       	mov    %eax,0xc10
}
 815:	c9                   	leave  
 816:	c3                   	ret    

00000817 <morecore>:

static Header*
morecore(uint nu)
{
 817:	55                   	push   %ebp
 818:	89 e5                	mov    %esp,%ebp
 81a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 81d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 824:	77 07                	ja     82d <morecore+0x16>
    nu = 4096;
 826:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	c1 e0 03             	shl    $0x3,%eax
 833:	89 04 24             	mov    %eax,(%esp)
 836:	e8 40 fc ff ff       	call   47b <sbrk>
 83b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 83e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 842:	75 07                	jne    84b <morecore+0x34>
    return 0;
 844:	b8 00 00 00 00       	mov    $0x0,%eax
 849:	eb 22                	jmp    86d <morecore+0x56>
  hp = (Header*)p;
 84b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 851:	8b 45 f0             	mov    -0x10(%ebp),%eax
 854:	8b 55 08             	mov    0x8(%ebp),%edx
 857:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85d:	83 c0 08             	add    $0x8,%eax
 860:	89 04 24             	mov    %eax,(%esp)
 863:	e8 ce fe ff ff       	call   736 <free>
  return freep;
 868:	a1 10 0c 00 00       	mov    0xc10,%eax
}
 86d:	c9                   	leave  
 86e:	c3                   	ret    

0000086f <malloc>:

void*
malloc(uint nbytes)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 875:	8b 45 08             	mov    0x8(%ebp),%eax
 878:	83 c0 07             	add    $0x7,%eax
 87b:	c1 e8 03             	shr    $0x3,%eax
 87e:	83 c0 01             	add    $0x1,%eax
 881:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 884:	a1 10 0c 00 00       	mov    0xc10,%eax
 889:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 890:	75 23                	jne    8b5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 892:	c7 45 f0 08 0c 00 00 	movl   $0xc08,-0x10(%ebp)
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	a3 10 0c 00 00       	mov    %eax,0xc10
 8a1:	a1 10 0c 00 00       	mov    0xc10,%eax
 8a6:	a3 08 0c 00 00       	mov    %eax,0xc08
    base.s.size = 0;
 8ab:	c7 05 0c 0c 00 00 00 	movl   $0x0,0xc0c
 8b2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c0:	8b 40 04             	mov    0x4(%eax),%eax
 8c3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c6:	72 4d                	jb     915 <malloc+0xa6>
      if(p->s.size == nunits)
 8c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cb:	8b 40 04             	mov    0x4(%eax),%eax
 8ce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d1:	75 0c                	jne    8df <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 10                	mov    (%eax),%edx
 8d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8db:	89 10                	mov    %edx,(%eax)
 8dd:	eb 26                	jmp    905 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	8b 40 04             	mov    0x4(%eax),%eax
 8e5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e8:	89 c2                	mov    %eax,%edx
 8ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	8b 40 04             	mov    0x4(%eax),%eax
 8f6:	c1 e0 03             	shl    $0x3,%eax
 8f9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
 902:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 905:	8b 45 f0             	mov    -0x10(%ebp),%eax
 908:	a3 10 0c 00 00       	mov    %eax,0xc10
      return (void*)(p + 1);
 90d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 910:	83 c0 08             	add    $0x8,%eax
 913:	eb 38                	jmp    94d <malloc+0xde>
    }
    if(p == freep)
 915:	a1 10 0c 00 00       	mov    0xc10,%eax
 91a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91d:	75 1b                	jne    93a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 91f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 922:	89 04 24             	mov    %eax,(%esp)
 925:	e8 ed fe ff ff       	call   817 <morecore>
 92a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 931:	75 07                	jne    93a <malloc+0xcb>
        return 0;
 933:	b8 00 00 00 00       	mov    $0x0,%eax
 938:	eb 13                	jmp    94d <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 940:	8b 45 f4             	mov    -0xc(%ebp),%eax
 943:	8b 00                	mov    (%eax),%eax
 945:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 948:	e9 70 ff ff ff       	jmp    8bd <malloc+0x4e>
}
 94d:	c9                   	leave  
 94e:	c3                   	ret    
