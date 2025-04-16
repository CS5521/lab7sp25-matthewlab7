
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 f0 03 00 00       	call   3fe <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 78 04 00 00       	call   496 <sleep>
  exit();
  1e:	e8 e3 03 00 00       	call   406 <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(const char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 bf 02 00 00       	call   41e <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(const char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 82 02 00 00       	call   446 <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 78 02 00 00       	call   45e <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 3a 02 00 00       	call   42e <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <ps>:

void
ps()
{
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	57                   	push   %edi
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
 289:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 28f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 09 02 00 00       	call   4a6 <getpinfo>
 29d:	83 f8 ff             	cmp    $0xffffffff,%eax
 2a0:	0f 84 4d 01 00 00    	je     3f3 <ps+0x170>
    return;
  int i = 0;
 2a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 2ad:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2b0:	89 d0                	mov    %edx,%eax
 2b2:	c1 e0 03             	shl    $0x3,%eax
 2b5:	01 d0                	add    %edx,%eax
 2b7:	c1 e0 02             	shl    $0x2,%eax
 2ba:	8d 7d e8             	lea    -0x18(%ebp),%edi
 2bd:	01 f8                	add    %edi,%eax
 2bf:	2d 04 09 00 00       	sub    $0x904,%eax
 2c4:	8b 10                	mov    (%eax),%edx
 2c6:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 2cc:	8b 50 04             	mov    0x4(%eax),%edx
 2cf:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 2d5:	8b 50 08             	mov    0x8(%eax),%edx
 2d8:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 2de:	8b 50 0c             	mov    0xc(%eax),%edx
 2e1:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 2e7:	8b 50 10             	mov    0x10(%eax),%edx
 2ea:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 2f0:	8b 50 14             	mov    0x14(%eax),%edx
 2f3:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 2f9:	8b 50 18             	mov    0x18(%eax),%edx
 2fc:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 302:	8b 50 1c             	mov    0x1c(%eax),%edx
 305:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 30b:	8b 40 20             	mov    0x20(%eax),%eax
 30e:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 314:	c7 44 24 04 5a 09 00 	movl   $0x95a,0x4(%esp)
 31b:	00 
 31c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 323:	e8 66 02 00 00       	call   58e <printf>
  for(;p.pid != 0; p = table[i])
 328:	e9 b8 00 00 00       	jmp    3e5 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 32d:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 334:	0f be d8             	movsbl %al,%ebx
 337:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 33d:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 343:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 349:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 34f:	83 c6 10             	add    $0x10,%esi
 352:	89 74 24 18          	mov    %esi,0x18(%esp)
 356:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 35a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 35e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 362:	89 44 24 08          	mov    %eax,0x8(%esp)
 366:	c7 44 24 04 73 09 00 	movl   $0x973,0x4(%esp)
 36d:	00 
 36e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 375:	e8 14 02 00 00       	call   58e <printf>
    i++;
 37a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 37e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 381:	89 d0                	mov    %edx,%eax
 383:	c1 e0 03             	shl    $0x3,%eax
 386:	01 d0                	add    %edx,%eax
 388:	c1 e0 02             	shl    $0x2,%eax
 38b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 38e:	01 c8                	add    %ecx,%eax
 390:	2d 04 09 00 00       	sub    $0x904,%eax
 395:	8b 10                	mov    (%eax),%edx
 397:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 39d:	8b 50 04             	mov    0x4(%eax),%edx
 3a0:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3a6:	8b 50 08             	mov    0x8(%eax),%edx
 3a9:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3af:	8b 50 0c             	mov    0xc(%eax),%edx
 3b2:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3b8:	8b 50 10             	mov    0x10(%eax),%edx
 3bb:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 3c1:	8b 50 14             	mov    0x14(%eax),%edx
 3c4:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 3ca:	8b 50 18             	mov    0x18(%eax),%edx
 3cd:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 3d3:	8b 50 1c             	mov    0x1c(%eax),%edx
 3d6:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 3dc:	8b 40 20             	mov    0x20(%eax),%eax
 3df:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 3e5:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 3eb:	85 c0                	test   %eax,%eax
 3ed:	0f 85 3a ff ff ff    	jne    32d <ps+0xaa>
  }
}
 3f3:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5f                   	pop    %edi
 3fc:	5d                   	pop    %ebp
 3fd:	c3                   	ret    

000003fe <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fe:	b8 01 00 00 00       	mov    $0x1,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <exit>:
SYSCALL(exit)
 406:	b8 02 00 00 00       	mov    $0x2,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <wait>:
SYSCALL(wait)
 40e:	b8 03 00 00 00       	mov    $0x3,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <pipe>:
SYSCALL(pipe)
 416:	b8 04 00 00 00       	mov    $0x4,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <read>:
SYSCALL(read)
 41e:	b8 05 00 00 00       	mov    $0x5,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <write>:
SYSCALL(write)
 426:	b8 10 00 00 00       	mov    $0x10,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <close>:
SYSCALL(close)
 42e:	b8 15 00 00 00       	mov    $0x15,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <kill>:
SYSCALL(kill)
 436:	b8 06 00 00 00       	mov    $0x6,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <exec>:
SYSCALL(exec)
 43e:	b8 07 00 00 00       	mov    $0x7,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <open>:
SYSCALL(open)
 446:	b8 0f 00 00 00       	mov    $0xf,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <mknod>:
SYSCALL(mknod)
 44e:	b8 11 00 00 00       	mov    $0x11,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <unlink>:
SYSCALL(unlink)
 456:	b8 12 00 00 00       	mov    $0x12,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <fstat>:
SYSCALL(fstat)
 45e:	b8 08 00 00 00       	mov    $0x8,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <link>:
SYSCALL(link)
 466:	b8 13 00 00 00       	mov    $0x13,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <mkdir>:
SYSCALL(mkdir)
 46e:	b8 14 00 00 00       	mov    $0x14,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <chdir>:
SYSCALL(chdir)
 476:	b8 09 00 00 00       	mov    $0x9,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <dup>:
SYSCALL(dup)
 47e:	b8 0a 00 00 00       	mov    $0xa,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <getpid>:
SYSCALL(getpid)
 486:	b8 0b 00 00 00       	mov    $0xb,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <sbrk>:
SYSCALL(sbrk)
 48e:	b8 0c 00 00 00       	mov    $0xc,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <sleep>:
SYSCALL(sleep)
 496:	b8 0d 00 00 00       	mov    $0xd,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <uptime>:
SYSCALL(uptime)
 49e:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <getpinfo>:
SYSCALL(getpinfo)
 4a6:	b8 16 00 00 00       	mov    $0x16,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 18             	sub    $0x18,%esp
 4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c1:	00 
 4c2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 4cc:	89 04 24             	mov    %eax,(%esp)
 4cf:	e8 52 ff ff ff       	call   426 <write>
}
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4e5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e9:	74 17                	je     502 <printint+0x2c>
 4eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ef:	79 11                	jns    502 <printint+0x2c>
    neg = 1;
 4f1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fb:	f7 d8                	neg    %eax
 4fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 500:	eb 06                	jmp    508 <printint+0x32>
  } else {
    x = xx;
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 508:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 50f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 512:	8d 41 01             	lea    0x1(%ecx),%eax
 515:	89 45 f4             	mov    %eax,-0xc(%ebp)
 518:	8b 5d 10             	mov    0x10(%ebp),%ebx
 51b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 51e:	ba 00 00 00 00       	mov    $0x0,%edx
 523:	f7 f3                	div    %ebx
 525:	89 d0                	mov    %edx,%eax
 527:	0f b6 80 00 0c 00 00 	movzbl 0xc00(%eax),%eax
 52e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 532:	8b 75 10             	mov    0x10(%ebp),%esi
 535:	8b 45 ec             	mov    -0x14(%ebp),%eax
 538:	ba 00 00 00 00       	mov    $0x0,%edx
 53d:	f7 f6                	div    %esi
 53f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 542:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 546:	75 c7                	jne    50f <printint+0x39>
  if(neg)
 548:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 54c:	74 10                	je     55e <printint+0x88>
    buf[i++] = '-';
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 f4             	mov    %edx,-0xc(%ebp)
 557:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 55c:	eb 1f                	jmp    57d <printint+0xa7>
 55e:	eb 1d                	jmp    57d <printint+0xa7>
    putc(fd, buf[i]);
 560:	8d 55 dc             	lea    -0x24(%ebp),%edx
 563:	8b 45 f4             	mov    -0xc(%ebp),%eax
 566:	01 d0                	add    %edx,%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	0f be c0             	movsbl %al,%eax
 56e:	89 44 24 04          	mov    %eax,0x4(%esp)
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	89 04 24             	mov    %eax,(%esp)
 578:	e8 31 ff ff ff       	call   4ae <putc>
  while(--i >= 0)
 57d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 581:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 585:	79 d9                	jns    560 <printint+0x8a>
}
 587:	83 c4 30             	add    $0x30,%esp
 58a:	5b                   	pop    %ebx
 58b:	5e                   	pop    %esi
 58c:	5d                   	pop    %ebp
 58d:	c3                   	ret    

0000058e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 594:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 59b:	8d 45 0c             	lea    0xc(%ebp),%eax
 59e:	83 c0 04             	add    $0x4,%eax
 5a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ab:	e9 7c 01 00 00       	jmp    72c <printf+0x19e>
    c = fmt[i] & 0xff;
 5b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b6:	01 d0                	add    %edx,%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	0f be c0             	movsbl %al,%eax
 5be:	25 ff 00 00 00       	and    $0xff,%eax
 5c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ca:	75 2c                	jne    5f8 <printf+0x6a>
      if(c == '%'){
 5cc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5d0:	75 0c                	jne    5de <printf+0x50>
        state = '%';
 5d2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d9:	e9 4a 01 00 00       	jmp    728 <printf+0x19a>
      } else {
        putc(fd, c);
 5de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e1:	0f be c0             	movsbl %al,%eax
 5e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	89 04 24             	mov    %eax,(%esp)
 5ee:	e8 bb fe ff ff       	call   4ae <putc>
 5f3:	e9 30 01 00 00       	jmp    728 <printf+0x19a>
      }
    } else if(state == '%'){
 5f8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5fc:	0f 85 26 01 00 00    	jne    728 <printf+0x19a>
      if(c == 'd'){
 602:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 606:	75 2d                	jne    635 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 608:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 614:	00 
 615:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 61c:	00 
 61d:	89 44 24 04          	mov    %eax,0x4(%esp)
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 04 24             	mov    %eax,(%esp)
 627:	e8 aa fe ff ff       	call   4d6 <printint>
        ap++;
 62c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 630:	e9 ec 00 00 00       	jmp    721 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 635:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 639:	74 06                	je     641 <printf+0xb3>
 63b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63f:	75 2d                	jne    66e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 641:	8b 45 e8             	mov    -0x18(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 64d:	00 
 64e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 655:	00 
 656:	89 44 24 04          	mov    %eax,0x4(%esp)
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	89 04 24             	mov    %eax,(%esp)
 660:	e8 71 fe ff ff       	call   4d6 <printint>
        ap++;
 665:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 669:	e9 b3 00 00 00       	jmp    721 <printf+0x193>
      } else if(c == 's'){
 66e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 672:	75 45                	jne    6b9 <printf+0x12b>
        s = (char*)*ap;
 674:	8b 45 e8             	mov    -0x18(%ebp),%eax
 677:	8b 00                	mov    (%eax),%eax
 679:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 67c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 680:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 684:	75 09                	jne    68f <printf+0x101>
          s = "(null)";
 686:	c7 45 f4 83 09 00 00 	movl   $0x983,-0xc(%ebp)
        while(*s != 0){
 68d:	eb 1e                	jmp    6ad <printf+0x11f>
 68f:	eb 1c                	jmp    6ad <printf+0x11f>
          putc(fd, *s);
 691:	8b 45 f4             	mov    -0xc(%ebp),%eax
 694:	0f b6 00             	movzbl (%eax),%eax
 697:	0f be c0             	movsbl %al,%eax
 69a:	89 44 24 04          	mov    %eax,0x4(%esp)
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	89 04 24             	mov    %eax,(%esp)
 6a4:	e8 05 fe ff ff       	call   4ae <putc>
          s++;
 6a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b0:	0f b6 00             	movzbl (%eax),%eax
 6b3:	84 c0                	test   %al,%al
 6b5:	75 da                	jne    691 <printf+0x103>
 6b7:	eb 68                	jmp    721 <printf+0x193>
        }
      } else if(c == 'c'){
 6b9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6bd:	75 1d                	jne    6dc <printf+0x14e>
        putc(fd, *ap);
 6bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	0f be c0             	movsbl %al,%eax
 6c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ce:	89 04 24             	mov    %eax,(%esp)
 6d1:	e8 d8 fd ff ff       	call   4ae <putc>
        ap++;
 6d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6da:	eb 45                	jmp    721 <printf+0x193>
      } else if(c == '%'){
 6dc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e0:	75 17                	jne    6f9 <printf+0x16b>
        putc(fd, c);
 6e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e5:	0f be c0             	movsbl %al,%eax
 6e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 b7 fd ff ff       	call   4ae <putc>
 6f7:	eb 28                	jmp    721 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 700:	00 
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	89 04 24             	mov    %eax,(%esp)
 707:	e8 a2 fd ff ff       	call   4ae <putc>
        putc(fd, c);
 70c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70f:	0f be c0             	movsbl %al,%eax
 712:	89 44 24 04          	mov    %eax,0x4(%esp)
 716:	8b 45 08             	mov    0x8(%ebp),%eax
 719:	89 04 24             	mov    %eax,(%esp)
 71c:	e8 8d fd ff ff       	call   4ae <putc>
      }
      state = 0;
 721:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 728:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 72c:	8b 55 0c             	mov    0xc(%ebp),%edx
 72f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 732:	01 d0                	add    %edx,%eax
 734:	0f b6 00             	movzbl (%eax),%eax
 737:	84 c0                	test   %al,%al
 739:	0f 85 71 fe ff ff    	jne    5b0 <printf+0x22>
    }
  }
}
 73f:	c9                   	leave  
 740:	c3                   	ret    

00000741 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	83 e8 08             	sub    $0x8,%eax
 74d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 750:	a1 1c 0c 00 00       	mov    0xc1c,%eax
 755:	89 45 fc             	mov    %eax,-0x4(%ebp)
 758:	eb 24                	jmp    77e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 762:	77 12                	ja     776 <free+0x35>
 764:	8b 45 f8             	mov    -0x8(%ebp),%eax
 767:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76a:	77 24                	ja     790 <free+0x4f>
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 00                	mov    (%eax),%eax
 771:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 774:	77 1a                	ja     790 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 776:	8b 45 fc             	mov    -0x4(%ebp),%eax
 779:	8b 00                	mov    (%eax),%eax
 77b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 784:	76 d4                	jbe    75a <free+0x19>
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78e:	76 ca                	jbe    75a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 790:	8b 45 f8             	mov    -0x8(%ebp),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 79d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a0:	01 c2                	add    %eax,%edx
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 00                	mov    (%eax),%eax
 7a7:	39 c2                	cmp    %eax,%edx
 7a9:	75 24                	jne    7cf <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ae:	8b 50 04             	mov    0x4(%eax),%edx
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	8b 40 04             	mov    0x4(%eax),%eax
 7b9:	01 c2                	add    %eax,%edx
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 00                	mov    (%eax),%eax
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cb:	89 10                	mov    %edx,(%eax)
 7cd:	eb 0a                	jmp    7d9 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 10                	mov    (%eax),%edx
 7d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d7:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 40 04             	mov    0x4(%eax),%eax
 7df:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	01 d0                	add    %edx,%eax
 7eb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ee:	75 20                	jne    810 <free+0xcf>
    p->s.size += bp->s.size;
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	8b 50 04             	mov    0x4(%eax),%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	01 c2                	add    %eax,%edx
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	8b 10                	mov    (%eax),%edx
 809:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80c:	89 10                	mov    %edx,(%eax)
 80e:	eb 08                	jmp    818 <free+0xd7>
  } else
    p->s.ptr = bp;
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 55 f8             	mov    -0x8(%ebp),%edx
 816:	89 10                	mov    %edx,(%eax)
  freep = p;
 818:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81b:	a3 1c 0c 00 00       	mov    %eax,0xc1c
}
 820:	c9                   	leave  
 821:	c3                   	ret    

00000822 <morecore>:

static Header*
morecore(uint nu)
{
 822:	55                   	push   %ebp
 823:	89 e5                	mov    %esp,%ebp
 825:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 828:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 82f:	77 07                	ja     838 <morecore+0x16>
    nu = 4096;
 831:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	c1 e0 03             	shl    $0x3,%eax
 83e:	89 04 24             	mov    %eax,(%esp)
 841:	e8 48 fc ff ff       	call   48e <sbrk>
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 849:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 84d:	75 07                	jne    856 <morecore+0x34>
    return 0;
 84f:	b8 00 00 00 00       	mov    $0x0,%eax
 854:	eb 22                	jmp    878 <morecore+0x56>
  hp = (Header*)p;
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	8b 55 08             	mov    0x8(%ebp),%edx
 862:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 865:	8b 45 f0             	mov    -0x10(%ebp),%eax
 868:	83 c0 08             	add    $0x8,%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 ce fe ff ff       	call   741 <free>
  return freep;
 873:	a1 1c 0c 00 00       	mov    0xc1c,%eax
}
 878:	c9                   	leave  
 879:	c3                   	ret    

0000087a <malloc>:

void*
malloc(uint nbytes)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	83 c0 07             	add    $0x7,%eax
 886:	c1 e8 03             	shr    $0x3,%eax
 889:	83 c0 01             	add    $0x1,%eax
 88c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 88f:	a1 1c 0c 00 00       	mov    0xc1c,%eax
 894:	89 45 f0             	mov    %eax,-0x10(%ebp)
 897:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 89b:	75 23                	jne    8c0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 89d:	c7 45 f0 14 0c 00 00 	movl   $0xc14,-0x10(%ebp)
 8a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a7:	a3 1c 0c 00 00       	mov    %eax,0xc1c
 8ac:	a1 1c 0c 00 00       	mov    0xc1c,%eax
 8b1:	a3 14 0c 00 00       	mov    %eax,0xc14
    base.s.size = 0;
 8b6:	c7 05 18 0c 00 00 00 	movl   $0x0,0xc18
 8bd:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c3:	8b 00                	mov    (%eax),%eax
 8c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cb:	8b 40 04             	mov    0x4(%eax),%eax
 8ce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d1:	72 4d                	jb     920 <malloc+0xa6>
      if(p->s.size == nunits)
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 40 04             	mov    0x4(%eax),%eax
 8d9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8dc:	75 0c                	jne    8ea <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e6:	89 10                	mov    %edx,(%eax)
 8e8:	eb 26                	jmp    910 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ed:	8b 40 04             	mov    0x4(%eax),%eax
 8f0:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f3:	89 c2                	mov    %eax,%edx
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fe:	8b 40 04             	mov    0x4(%eax),%eax
 901:	c1 e0 03             	shl    $0x3,%eax
 904:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 907:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 90d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 910:	8b 45 f0             	mov    -0x10(%ebp),%eax
 913:	a3 1c 0c 00 00       	mov    %eax,0xc1c
      return (void*)(p + 1);
 918:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91b:	83 c0 08             	add    $0x8,%eax
 91e:	eb 38                	jmp    958 <malloc+0xde>
    }
    if(p == freep)
 920:	a1 1c 0c 00 00       	mov    0xc1c,%eax
 925:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 928:	75 1b                	jne    945 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 92a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92d:	89 04 24             	mov    %eax,(%esp)
 930:	e8 ed fe ff ff       	call   822 <morecore>
 935:	89 45 f4             	mov    %eax,-0xc(%ebp)
 938:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93c:	75 07                	jne    945 <malloc+0xcb>
        return 0;
 93e:	b8 00 00 00 00       	mov    $0x0,%eax
 943:	eb 13                	jmp    958 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	8b 00                	mov    (%eax),%eax
 950:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 953:	e9 70 ff ff ff       	jmp    8c8 <malloc+0x4e>
}
 958:	c9                   	leave  
 959:	c3                   	ret    
