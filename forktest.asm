
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	89 04 24             	mov    %eax,(%esp)
   c:	e8 98 01 00 00       	call   1a9 <strlen>
  11:	89 44 24 08          	mov    %eax,0x8(%esp)
  15:	8b 45 0c             	mov    0xc(%ebp),%eax
  18:	89 44 24 04          	mov    %eax,0x4(%esp)
  1c:	8b 45 08             	mov    0x8(%ebp),%eax
  1f:	89 04 24             	mov    %eax,(%esp)
  22:	e8 f1 04 00 00       	call   518 <write>
}
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	c7 44 24 04 a0 05 00 	movl   $0x5a0,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 bd ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  4a:	eb 1f                	jmp    6b <forktest+0x42>
    pid = fork();
  4c:	e8 9f 04 00 00       	call   4f0 <fork>
  51:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  54:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  58:	79 02                	jns    5c <forktest+0x33>
      break;
  5a:	eb 18                	jmp    74 <forktest+0x4b>
    if(pid == 0)
  5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  60:	75 05                	jne    67 <forktest+0x3e>
      exit();
  62:	e8 91 04 00 00       	call   4f8 <exit>
  for(n=0; n<N; n++){
  67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  6b:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  72:	7e d8                	jle    4c <forktest+0x23>
  }

  if(n == N){
  74:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  7b:	75 21                	jne    9e <forktest+0x75>
    printf(1, "fork claimed to work N times!\n", N);
  7d:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  84:	00 
  85:	c7 44 24 04 ac 05 00 	movl   $0x5ac,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 67 ff ff ff       	call   0 <printf>
    exit();
  99:	e8 5a 04 00 00       	call   4f8 <exit>
  }

  for(; n > 0; n--){
  9e:	eb 26                	jmp    c6 <forktest+0x9d>
    if(wait() < 0){
  a0:	e8 5b 04 00 00       	call   500 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	79 19                	jns    c2 <forktest+0x99>
      printf(1, "wait stopped early\n");
  a9:	c7 44 24 04 cb 05 00 	movl   $0x5cb,0x4(%esp)
  b0:	00 
  b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b8:	e8 43 ff ff ff       	call   0 <printf>
      exit();
  bd:	e8 36 04 00 00       	call   4f8 <exit>
  for(; n > 0; n--){
  c2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ca:	7f d4                	jg     a0 <forktest+0x77>
    }
  }

  if(wait() != -1){
  cc:	e8 2f 04 00 00       	call   500 <wait>
  d1:	83 f8 ff             	cmp    $0xffffffff,%eax
  d4:	74 19                	je     ef <forktest+0xc6>
    printf(1, "wait got too many\n");
  d6:	c7 44 24 04 df 05 00 	movl   $0x5df,0x4(%esp)
  dd:	00 
  de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e5:	e8 16 ff ff ff       	call   0 <printf>
    exit();
  ea:	e8 09 04 00 00       	call   4f8 <exit>
  }

  printf(1, "fork test OK\n");
  ef:	c7 44 24 04 f2 05 00 	movl   $0x5f2,0x4(%esp)
  f6:	00 
  f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fe:	e8 fd fe ff ff       	call   0 <printf>
}
 103:	c9                   	leave  
 104:	c3                   	ret    

00000105 <main>:

int
main(void)
{
 105:	55                   	push   %ebp
 106:	89 e5                	mov    %esp,%ebp
 108:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
 10b:	e8 19 ff ff ff       	call   29 <forktest>
  exit();
 110:	e8 e3 03 00 00       	call   4f8 <exit>

00000115 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	57                   	push   %edi
 119:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 55 10             	mov    0x10(%ebp),%edx
 120:	8b 45 0c             	mov    0xc(%ebp),%eax
 123:	89 cb                	mov    %ecx,%ebx
 125:	89 df                	mov    %ebx,%edi
 127:	89 d1                	mov    %edx,%ecx
 129:	fc                   	cld    
 12a:	f3 aa                	rep stos %al,%es:(%edi)
 12c:	89 ca                	mov    %ecx,%edx
 12e:	89 fb                	mov    %edi,%ebx
 130:	89 5d 08             	mov    %ebx,0x8(%ebp)
 133:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 136:	5b                   	pop    %ebx
 137:	5f                   	pop    %edi
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 146:	90                   	nop
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	8d 50 01             	lea    0x1(%eax),%edx
 14d:	89 55 08             	mov    %edx,0x8(%ebp)
 150:	8b 55 0c             	mov    0xc(%ebp),%edx
 153:	8d 4a 01             	lea    0x1(%edx),%ecx
 156:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 159:	0f b6 12             	movzbl (%edx),%edx
 15c:	88 10                	mov    %dl,(%eax)
 15e:	0f b6 00             	movzbl (%eax),%eax
 161:	84 c0                	test   %al,%al
 163:	75 e2                	jne    147 <strcpy+0xd>
    ;
  return os;
 165:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 168:	c9                   	leave  
 169:	c3                   	ret    

0000016a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16d:	eb 08                	jmp    177 <strcmp+0xd>
    p++, q++;
 16f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 173:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	0f b6 00             	movzbl (%eax),%eax
 17d:	84 c0                	test   %al,%al
 17f:	74 10                	je     191 <strcmp+0x27>
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	8b 45 0c             	mov    0xc(%ebp),%eax
 18a:	0f b6 00             	movzbl (%eax),%eax
 18d:	38 c2                	cmp    %al,%dl
 18f:	74 de                	je     16f <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	0f b6 00             	movzbl (%eax),%eax
 197:	0f b6 d0             	movzbl %al,%edx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	0f b6 c0             	movzbl %al,%eax
 1a3:	29 c2                	sub    %eax,%edx
 1a5:	89 d0                	mov    %edx,%eax
}
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    

000001a9 <strlen>:

uint
strlen(const char *s)
{
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b6:	eb 04                	jmp    1bc <strlen+0x13>
 1b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	01 d0                	add    %edx,%eax
 1c4:	0f b6 00             	movzbl (%eax),%eax
 1c7:	84 c0                	test   %al,%al
 1c9:	75 ed                	jne    1b8 <strlen+0xf>
    ;
  return n;
 1cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1ce:	c9                   	leave  
 1cf:	c3                   	ret    

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d6:	8b 45 10             	mov    0x10(%ebp),%eax
 1d9:	89 44 24 08          	mov    %eax,0x8(%esp)
 1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	89 04 24             	mov    %eax,(%esp)
 1ea:	e8 26 ff ff ff       	call   115 <stosb>
  return dst;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <strchr>:

char*
strchr(const char *s, char c)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 04             	sub    $0x4,%esp
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 200:	eb 14                	jmp    216 <strchr+0x22>
    if(*s == c)
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	0f b6 00             	movzbl (%eax),%eax
 208:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20b:	75 05                	jne    212 <strchr+0x1e>
      return (char*)s;
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
 210:	eb 13                	jmp    225 <strchr+0x31>
  for(; *s; s++)
 212:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	0f b6 00             	movzbl (%eax),%eax
 21c:	84 c0                	test   %al,%al
 21e:	75 e2                	jne    202 <strchr+0xe>
  return 0;
 220:	b8 00 00 00 00       	mov    $0x0,%eax
}
 225:	c9                   	leave  
 226:	c3                   	ret    

00000227 <gets>:

char*
gets(char *buf, int max)
{
 227:	55                   	push   %ebp
 228:	89 e5                	mov    %esp,%ebp
 22a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 234:	eb 4c                	jmp    282 <gets+0x5b>
    cc = read(0, &c, 1);
 236:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23d:	00 
 23e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 241:	89 44 24 04          	mov    %eax,0x4(%esp)
 245:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24c:	e8 bf 02 00 00       	call   510 <read>
 251:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 254:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 258:	7f 02                	jg     25c <gets+0x35>
      break;
 25a:	eb 31                	jmp    28d <gets+0x66>
    buf[i++] = c;
 25c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25f:	8d 50 01             	lea    0x1(%eax),%edx
 262:	89 55 f4             	mov    %edx,-0xc(%ebp)
 265:	89 c2                	mov    %eax,%edx
 267:	8b 45 08             	mov    0x8(%ebp),%eax
 26a:	01 c2                	add    %eax,%edx
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 272:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 276:	3c 0a                	cmp    $0xa,%al
 278:	74 13                	je     28d <gets+0x66>
 27a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27e:	3c 0d                	cmp    $0xd,%al
 280:	74 0b                	je     28d <gets+0x66>
  for(i=0; i+1 < max; ){
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	83 c0 01             	add    $0x1,%eax
 288:	3b 45 0c             	cmp    0xc(%ebp),%eax
 28b:	7c a9                	jl     236 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 28d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	01 d0                	add    %edx,%eax
 295:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29b:	c9                   	leave  
 29c:	c3                   	ret    

0000029d <stat>:

int
stat(const char *n, struct stat *st)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2aa:	00 
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	89 04 24             	mov    %eax,(%esp)
 2b1:	e8 82 02 00 00       	call   538 <open>
 2b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2bd:	79 07                	jns    2c6 <stat+0x29>
    return -1;
 2bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c4:	eb 23                	jmp    2e9 <stat+0x4c>
  r = fstat(fd, st);
 2c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d0:	89 04 24             	mov    %eax,(%esp)
 2d3:	e8 78 02 00 00       	call   550 <fstat>
 2d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2de:	89 04 24             	mov    %eax,(%esp)
 2e1:	e8 3a 02 00 00       	call   520 <close>
  return r;
 2e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <atoi>:

int
atoi(const char *s)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f8:	eb 25                	jmp    31f <atoi+0x34>
    n = n*10 + *s++ - '0';
 2fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fd:	89 d0                	mov    %edx,%eax
 2ff:	c1 e0 02             	shl    $0x2,%eax
 302:	01 d0                	add    %edx,%eax
 304:	01 c0                	add    %eax,%eax
 306:	89 c1                	mov    %eax,%ecx
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	8d 50 01             	lea    0x1(%eax),%edx
 30e:	89 55 08             	mov    %edx,0x8(%ebp)
 311:	0f b6 00             	movzbl (%eax),%eax
 314:	0f be c0             	movsbl %al,%eax
 317:	01 c8                	add    %ecx,%eax
 319:	83 e8 30             	sub    $0x30,%eax
 31c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	0f b6 00             	movzbl (%eax),%eax
 325:	3c 2f                	cmp    $0x2f,%al
 327:	7e 0a                	jle    333 <atoi+0x48>
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	0f b6 00             	movzbl (%eax),%eax
 32f:	3c 39                	cmp    $0x39,%al
 331:	7e c7                	jle    2fa <atoi+0xf>
  return n;
 333:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 336:	c9                   	leave  
 337:	c3                   	ret    

00000338 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 33e:	8b 45 08             	mov    0x8(%ebp),%eax
 341:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 344:	8b 45 0c             	mov    0xc(%ebp),%eax
 347:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 34a:	eb 17                	jmp    363 <memmove+0x2b>
    *dst++ = *src++;
 34c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34f:	8d 50 01             	lea    0x1(%eax),%edx
 352:	89 55 fc             	mov    %edx,-0x4(%ebp)
 355:	8b 55 f8             	mov    -0x8(%ebp),%edx
 358:	8d 4a 01             	lea    0x1(%edx),%ecx
 35b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 35e:	0f b6 12             	movzbl (%edx),%edx
 361:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 363:	8b 45 10             	mov    0x10(%ebp),%eax
 366:	8d 50 ff             	lea    -0x1(%eax),%edx
 369:	89 55 10             	mov    %edx,0x10(%ebp)
 36c:	85 c0                	test   %eax,%eax
 36e:	7f dc                	jg     34c <memmove+0x14>
  return vdst;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
}
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <ps>:

void
ps()
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	57                   	push   %edi
 379:	56                   	push   %esi
 37a:	53                   	push   %ebx
 37b:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 381:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 387:	89 04 24             	mov    %eax,(%esp)
 38a:	e8 09 02 00 00       	call   598 <getpinfo>
 38f:	83 f8 ff             	cmp    $0xffffffff,%eax
 392:	0f 84 4d 01 00 00    	je     4e5 <ps+0x170>
    return;
  int i = 0;
 398:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 39f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e0 03             	shl    $0x3,%eax
 3a7:	01 d0                	add    %edx,%eax
 3a9:	c1 e0 02             	shl    $0x2,%eax
 3ac:	8d 7d e8             	lea    -0x18(%ebp),%edi
 3af:	01 f8                	add    %edi,%eax
 3b1:	2d 04 09 00 00       	sub    $0x904,%eax
 3b6:	8b 10                	mov    (%eax),%edx
 3b8:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3be:	8b 50 04             	mov    0x4(%eax),%edx
 3c1:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3c7:	8b 50 08             	mov    0x8(%eax),%edx
 3ca:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3d0:	8b 50 0c             	mov    0xc(%eax),%edx
 3d3:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3d9:	8b 50 10             	mov    0x10(%eax),%edx
 3dc:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 3e2:	8b 50 14             	mov    0x14(%eax),%edx
 3e5:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 3eb:	8b 50 18             	mov    0x18(%eax),%edx
 3ee:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 3f4:	8b 50 1c             	mov    0x1c(%eax),%edx
 3f7:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 3fd:	8b 40 20             	mov    0x20(%eax),%eax
 400:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 406:	c7 44 24 04 00 06 00 	movl   $0x600,0x4(%esp)
 40d:	00 
 40e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 415:	e8 e6 fb ff ff       	call   0 <printf>
  for(;p.pid != 0; p = table[i])
 41a:	e9 b8 00 00 00       	jmp    4d7 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 41f:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 426:	0f be d8             	movsbl %al,%ebx
 429:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 42f:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 435:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 43b:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 441:	83 c6 10             	add    $0x10,%esi
 444:	89 74 24 18          	mov    %esi,0x18(%esp)
 448:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 44c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 450:	89 54 24 0c          	mov    %edx,0xc(%esp)
 454:	89 44 24 08          	mov    %eax,0x8(%esp)
 458:	c7 44 24 04 19 06 00 	movl   $0x619,0x4(%esp)
 45f:	00 
 460:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 467:	e8 94 fb ff ff       	call   0 <printf>
    i++;
 46c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 470:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 473:	89 d0                	mov    %edx,%eax
 475:	c1 e0 03             	shl    $0x3,%eax
 478:	01 d0                	add    %edx,%eax
 47a:	c1 e0 02             	shl    $0x2,%eax
 47d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 480:	01 c8                	add    %ecx,%eax
 482:	2d 04 09 00 00       	sub    $0x904,%eax
 487:	8b 10                	mov    (%eax),%edx
 489:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 48f:	8b 50 04             	mov    0x4(%eax),%edx
 492:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 498:	8b 50 08             	mov    0x8(%eax),%edx
 49b:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 4a1:	8b 50 0c             	mov    0xc(%eax),%edx
 4a4:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 4aa:	8b 50 10             	mov    0x10(%eax),%edx
 4ad:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4b3:	8b 50 14             	mov    0x14(%eax),%edx
 4b6:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4bc:	8b 50 18             	mov    0x18(%eax),%edx
 4bf:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4c5:	8b 50 1c             	mov    0x1c(%eax),%edx
 4c8:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4ce:	8b 40 20             	mov    0x20(%eax),%eax
 4d1:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 4d7:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 4dd:	85 c0                	test   %eax,%eax
 4df:	0f 85 3a ff ff ff    	jne    41f <ps+0xaa>
  }
}
 4e5:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    

000004f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f0:	b8 01 00 00 00       	mov    $0x1,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <exit>:
SYSCALL(exit)
 4f8:	b8 02 00 00 00       	mov    $0x2,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <wait>:
SYSCALL(wait)
 500:	b8 03 00 00 00       	mov    $0x3,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <pipe>:
SYSCALL(pipe)
 508:	b8 04 00 00 00       	mov    $0x4,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <read>:
SYSCALL(read)
 510:	b8 05 00 00 00       	mov    $0x5,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <write>:
SYSCALL(write)
 518:	b8 10 00 00 00       	mov    $0x10,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <close>:
SYSCALL(close)
 520:	b8 15 00 00 00       	mov    $0x15,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <kill>:
SYSCALL(kill)
 528:	b8 06 00 00 00       	mov    $0x6,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exec>:
SYSCALL(exec)
 530:	b8 07 00 00 00       	mov    $0x7,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <open>:
SYSCALL(open)
 538:	b8 0f 00 00 00       	mov    $0xf,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <mknod>:
SYSCALL(mknod)
 540:	b8 11 00 00 00       	mov    $0x11,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <unlink>:
SYSCALL(unlink)
 548:	b8 12 00 00 00       	mov    $0x12,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <fstat>:
SYSCALL(fstat)
 550:	b8 08 00 00 00       	mov    $0x8,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <link>:
SYSCALL(link)
 558:	b8 13 00 00 00       	mov    $0x13,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <mkdir>:
SYSCALL(mkdir)
 560:	b8 14 00 00 00       	mov    $0x14,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <chdir>:
SYSCALL(chdir)
 568:	b8 09 00 00 00       	mov    $0x9,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <dup>:
SYSCALL(dup)
 570:	b8 0a 00 00 00       	mov    $0xa,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <getpid>:
SYSCALL(getpid)
 578:	b8 0b 00 00 00       	mov    $0xb,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <sbrk>:
SYSCALL(sbrk)
 580:	b8 0c 00 00 00       	mov    $0xc,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <sleep>:
SYSCALL(sleep)
 588:	b8 0d 00 00 00       	mov    $0xd,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <uptime>:
SYSCALL(uptime)
 590:	b8 0e 00 00 00       	mov    $0xe,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <getpinfo>:
SYSCALL(getpinfo)
 598:	b8 16 00 00 00       	mov    $0x16,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    
