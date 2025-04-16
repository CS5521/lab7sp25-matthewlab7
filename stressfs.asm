
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 f2 0a 00 	movl   $0xaf2,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 e6 06 00 00       	call   726 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 12 02 00 00       	call   26e <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 20 05 00 00       	call   58e <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 05 0b 00 	movl   $0xb05,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 81 06 00 00       	call   726 <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 00 05 00 00       	call   5d6 <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 ad 04 00 00       	call   5b6 <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 94 04 00 00       	call   5be <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 0f 0b 00 	movl   $0xb0f,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 e8 05 00 00       	call   726 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 81 04 00 00       	call   5d6 <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 26 04 00 00       	call   5ae <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 15 04 00 00       	call   5be <close>

  wait();
 1a9:	e8 f0 03 00 00       	call   59e <wait>

  exit();
 1ae:	e8 e3 03 00 00       	call   596 <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e4:	90                   	nop
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8d 50 01             	lea    0x1(%eax),%edx
 1eb:	89 55 08             	mov    %edx,0x8(%ebp)
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f1:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	88 10                	mov    %dl,(%eax)
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 08                	jmp    215 <strcmp+0xd>
    p++, q++;
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 10                	je     22f <strcmp+0x27>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	38 c2                	cmp    %al,%dl
 22d:	74 de                	je     20d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	0f b6 d0             	movzbl %al,%edx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 c0             	movzbl %al,%eax
 241:	29 c2                	sub    %eax,%edx
 243:	89 d0                	mov    %edx,%eax
}
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    

00000247 <strlen>:

uint
strlen(const char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 254:	eb 04                	jmp    25a <strlen+0x13>
 256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	01 d0                	add    %edx,%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	84 c0                	test   %al,%al
 267:	75 ed                	jne    256 <strlen+0xf>
    ;
  return n;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <memset>:

void*
memset(void *dst, int c, uint n)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	8b 45 0c             	mov    0xc(%ebp),%eax
 27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 26 ff ff ff       	call   1b3 <stosb>
  return dst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <strchr>:

char*
strchr(const char *s, char c)
{
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 45 0c             	mov    0xc(%ebp),%eax
 29b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29e:	eb 14                	jmp    2b4 <strchr+0x22>
    if(*s == c)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a9:	75 05                	jne    2b0 <strchr+0x1e>
      return (char*)s;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	eb 13                	jmp    2c3 <strchr+0x31>
  for(; *s; s++)
 2b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	84 c0                	test   %al,%al
 2bc:	75 e2                	jne    2a0 <strchr+0xe>
  return 0;
 2be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <gets>:

char*
gets(char *buf, int max)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d2:	eb 4c                	jmp    320 <gets+0x5b>
    cc = read(0, &c, 1);
 2d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2db:	00 
 2dc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2df:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ea:	e8 bf 02 00 00       	call   5ae <read>
 2ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f6:	7f 02                	jg     2fa <gets+0x35>
      break;
 2f8:	eb 31                	jmp    32b <gets+0x66>
    buf[i++] = c;
 2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fd:	8d 50 01             	lea    0x1(%eax),%edx
 300:	89 55 f4             	mov    %edx,-0xc(%ebp)
 303:	89 c2                	mov    %eax,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	01 c2                	add    %eax,%edx
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 13                	je     32b <gets+0x66>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0b                	je     32b <gets+0x66>
  for(i=0; i+1 < max; ){
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c a9                	jl     2d4 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 32b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 d0                	add    %edx,%eax
 333:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <stat>:

int
stat(const char *n, struct stat *st)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 341:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 348:	00 
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	89 04 24             	mov    %eax,(%esp)
 34f:	e8 82 02 00 00       	call   5d6 <open>
 354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35b:	79 07                	jns    364 <stat+0x29>
    return -1;
 35d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 362:	eb 23                	jmp    387 <stat+0x4c>
  r = fstat(fd, st);
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 78 02 00 00       	call   5ee <fstat>
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 3a 02 00 00       	call   5be <close>
  return r;
 384:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <atoi>:

int
atoi(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 396:	eb 25                	jmp    3bd <atoi+0x34>
    n = n*10 + *s++ - '0';
 398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39b:	89 d0                	mov    %edx,%eax
 39d:	c1 e0 02             	shl    $0x2,%eax
 3a0:	01 d0                	add    %edx,%eax
 3a2:	01 c0                	add    %eax,%eax
 3a4:	89 c1                	mov    %eax,%ecx
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	8d 50 01             	lea    0x1(%eax),%edx
 3ac:	89 55 08             	mov    %edx,0x8(%ebp)
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	0f be c0             	movsbl %al,%eax
 3b5:	01 c8                	add    %ecx,%eax
 3b7:	83 e8 30             	sub    $0x30,%eax
 3ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x48>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c7                	jle    398 <atoi+0xf>
  return n;
 3d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e8:	eb 17                	jmp    401 <memmove+0x2b>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fc:	0f b6 12             	movzbl (%edx),%edx
 3ff:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 401:	8b 45 10             	mov    0x10(%ebp),%eax
 404:	8d 50 ff             	lea    -0x1(%eax),%edx
 407:	89 55 10             	mov    %edx,0x10(%ebp)
 40a:	85 c0                	test   %eax,%eax
 40c:	7f dc                	jg     3ea <memmove+0x14>
  return vdst;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <ps>:

void
ps()
{
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	57                   	push   %edi
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
 419:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 41f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 09 02 00 00       	call   636 <getpinfo>
 42d:	83 f8 ff             	cmp    $0xffffffff,%eax
 430:	0f 84 4d 01 00 00    	je     583 <ps+0x170>
    return;
  int i = 0;
 436:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 43d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 440:	89 d0                	mov    %edx,%eax
 442:	c1 e0 03             	shl    $0x3,%eax
 445:	01 d0                	add    %edx,%eax
 447:	c1 e0 02             	shl    $0x2,%eax
 44a:	8d 7d e8             	lea    -0x18(%ebp),%edi
 44d:	01 f8                	add    %edi,%eax
 44f:	2d 04 09 00 00       	sub    $0x904,%eax
 454:	8b 10                	mov    (%eax),%edx
 456:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 45c:	8b 50 04             	mov    0x4(%eax),%edx
 45f:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 465:	8b 50 08             	mov    0x8(%eax),%edx
 468:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 46e:	8b 50 0c             	mov    0xc(%eax),%edx
 471:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 477:	8b 50 10             	mov    0x10(%eax),%edx
 47a:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 480:	8b 50 14             	mov    0x14(%eax),%edx
 483:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 489:	8b 50 18             	mov    0x18(%eax),%edx
 48c:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 492:	8b 50 1c             	mov    0x1c(%eax),%edx
 495:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 49b:	8b 40 20             	mov    0x20(%eax),%eax
 49e:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 4a4:	c7 44 24 04 15 0b 00 	movl   $0xb15,0x4(%esp)
 4ab:	00 
 4ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4b3:	e8 6e 02 00 00       	call   726 <printf>
  for(;p.pid != 0; p = table[i])
 4b8:	e9 b8 00 00 00       	jmp    575 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 4bd:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 4c4:	0f be d8             	movsbl %al,%ebx
 4c7:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 4cd:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 4d3:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 4d9:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 4df:	83 c6 10             	add    $0x10,%esi
 4e2:	89 74 24 18          	mov    %esi,0x18(%esp)
 4e6:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 4ea:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 4ee:	89 54 24 0c          	mov    %edx,0xc(%esp)
 4f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 4f6:	c7 44 24 04 2e 0b 00 	movl   $0xb2e,0x4(%esp)
 4fd:	00 
 4fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 505:	e8 1c 02 00 00       	call   726 <printf>
    i++;
 50a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 50e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 511:	89 d0                	mov    %edx,%eax
 513:	c1 e0 03             	shl    $0x3,%eax
 516:	01 d0                	add    %edx,%eax
 518:	c1 e0 02             	shl    $0x2,%eax
 51b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 51e:	01 c8                	add    %ecx,%eax
 520:	2d 04 09 00 00       	sub    $0x904,%eax
 525:	8b 10                	mov    (%eax),%edx
 527:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 52d:	8b 50 04             	mov    0x4(%eax),%edx
 530:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 536:	8b 50 08             	mov    0x8(%eax),%edx
 539:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 53f:	8b 50 0c             	mov    0xc(%eax),%edx
 542:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 548:	8b 50 10             	mov    0x10(%eax),%edx
 54b:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 551:	8b 50 14             	mov    0x14(%eax),%edx
 554:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 55a:	8b 50 18             	mov    0x18(%eax),%edx
 55d:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 563:	8b 50 1c             	mov    0x1c(%eax),%edx
 566:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 56c:	8b 40 20             	mov    0x20(%eax),%eax
 56f:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 575:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 57b:	85 c0                	test   %eax,%eax
 57d:	0f 85 3a ff ff ff    	jne    4bd <ps+0xaa>
  }
}
 583:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5f                   	pop    %edi
 58c:	5d                   	pop    %ebp
 58d:	c3                   	ret    

0000058e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58e:	b8 01 00 00 00       	mov    $0x1,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <exit>:
SYSCALL(exit)
 596:	b8 02 00 00 00       	mov    $0x2,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <wait>:
SYSCALL(wait)
 59e:	b8 03 00 00 00       	mov    $0x3,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <pipe>:
SYSCALL(pipe)
 5a6:	b8 04 00 00 00       	mov    $0x4,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <read>:
SYSCALL(read)
 5ae:	b8 05 00 00 00       	mov    $0x5,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <write>:
SYSCALL(write)
 5b6:	b8 10 00 00 00       	mov    $0x10,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <close>:
SYSCALL(close)
 5be:	b8 15 00 00 00       	mov    $0x15,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <kill>:
SYSCALL(kill)
 5c6:	b8 06 00 00 00       	mov    $0x6,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <exec>:
SYSCALL(exec)
 5ce:	b8 07 00 00 00       	mov    $0x7,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <open>:
SYSCALL(open)
 5d6:	b8 0f 00 00 00       	mov    $0xf,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <mknod>:
SYSCALL(mknod)
 5de:	b8 11 00 00 00       	mov    $0x11,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <unlink>:
SYSCALL(unlink)
 5e6:	b8 12 00 00 00       	mov    $0x12,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <fstat>:
SYSCALL(fstat)
 5ee:	b8 08 00 00 00       	mov    $0x8,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <link>:
SYSCALL(link)
 5f6:	b8 13 00 00 00       	mov    $0x13,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <mkdir>:
SYSCALL(mkdir)
 5fe:	b8 14 00 00 00       	mov    $0x14,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <chdir>:
SYSCALL(chdir)
 606:	b8 09 00 00 00       	mov    $0x9,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <dup>:
SYSCALL(dup)
 60e:	b8 0a 00 00 00       	mov    $0xa,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <getpid>:
SYSCALL(getpid)
 616:	b8 0b 00 00 00       	mov    $0xb,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <sbrk>:
SYSCALL(sbrk)
 61e:	b8 0c 00 00 00       	mov    $0xc,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <sleep>:
SYSCALL(sleep)
 626:	b8 0d 00 00 00       	mov    $0xd,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <uptime>:
SYSCALL(uptime)
 62e:	b8 0e 00 00 00       	mov    $0xe,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <getpinfo>:
SYSCALL(getpinfo)
 636:	b8 16 00 00 00       	mov    $0x16,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <settickets>:
 63e:	b8 17 00 00 00       	mov    $0x17,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 646:	55                   	push   %ebp
 647:	89 e5                	mov    %esp,%ebp
 649:	83 ec 18             	sub    $0x18,%esp
 64c:	8b 45 0c             	mov    0xc(%ebp),%eax
 64f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 652:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 659:	00 
 65a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 65d:	89 44 24 04          	mov    %eax,0x4(%esp)
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	89 04 24             	mov    %eax,(%esp)
 667:	e8 4a ff ff ff       	call   5b6 <write>
}
 66c:	c9                   	leave  
 66d:	c3                   	ret    

0000066e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 66e:	55                   	push   %ebp
 66f:	89 e5                	mov    %esp,%ebp
 671:	56                   	push   %esi
 672:	53                   	push   %ebx
 673:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 676:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 67d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 681:	74 17                	je     69a <printint+0x2c>
 683:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 687:	79 11                	jns    69a <printint+0x2c>
    neg = 1;
 689:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 690:	8b 45 0c             	mov    0xc(%ebp),%eax
 693:	f7 d8                	neg    %eax
 695:	89 45 ec             	mov    %eax,-0x14(%ebp)
 698:	eb 06                	jmp    6a0 <printint+0x32>
  } else {
    x = xx;
 69a:	8b 45 0c             	mov    0xc(%ebp),%eax
 69d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6a7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6aa:	8d 41 01             	lea    0x1(%ecx),%eax
 6ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6b0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b6:	ba 00 00 00 00       	mov    $0x0,%edx
 6bb:	f7 f3                	div    %ebx
 6bd:	89 d0                	mov    %edx,%eax
 6bf:	0f b6 80 bc 0d 00 00 	movzbl 0xdbc(%eax),%eax
 6c6:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6ca:	8b 75 10             	mov    0x10(%ebp),%esi
 6cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d0:	ba 00 00 00 00       	mov    $0x0,%edx
 6d5:	f7 f6                	div    %esi
 6d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6de:	75 c7                	jne    6a7 <printint+0x39>
  if(neg)
 6e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6e4:	74 10                	je     6f6 <printint+0x88>
    buf[i++] = '-';
 6e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e9:	8d 50 01             	lea    0x1(%eax),%edx
 6ec:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ef:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6f4:	eb 1f                	jmp    715 <printint+0xa7>
 6f6:	eb 1d                	jmp    715 <printint+0xa7>
    putc(fd, buf[i]);
 6f8:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fe:	01 d0                	add    %edx,%eax
 700:	0f b6 00             	movzbl (%eax),%eax
 703:	0f be c0             	movsbl %al,%eax
 706:	89 44 24 04          	mov    %eax,0x4(%esp)
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	89 04 24             	mov    %eax,(%esp)
 710:	e8 31 ff ff ff       	call   646 <putc>
  while(--i >= 0)
 715:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 719:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 71d:	79 d9                	jns    6f8 <printint+0x8a>
}
 71f:	83 c4 30             	add    $0x30,%esp
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5d                   	pop    %ebp
 725:	c3                   	ret    

00000726 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 726:	55                   	push   %ebp
 727:	89 e5                	mov    %esp,%ebp
 729:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 72c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 733:	8d 45 0c             	lea    0xc(%ebp),%eax
 736:	83 c0 04             	add    $0x4,%eax
 739:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 73c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 743:	e9 7c 01 00 00       	jmp    8c4 <printf+0x19e>
    c = fmt[i] & 0xff;
 748:	8b 55 0c             	mov    0xc(%ebp),%edx
 74b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74e:	01 d0                	add    %edx,%eax
 750:	0f b6 00             	movzbl (%eax),%eax
 753:	0f be c0             	movsbl %al,%eax
 756:	25 ff 00 00 00       	and    $0xff,%eax
 75b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 75e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 762:	75 2c                	jne    790 <printf+0x6a>
      if(c == '%'){
 764:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 768:	75 0c                	jne    776 <printf+0x50>
        state = '%';
 76a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 771:	e9 4a 01 00 00       	jmp    8c0 <printf+0x19a>
      } else {
        putc(fd, c);
 776:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 779:	0f be c0             	movsbl %al,%eax
 77c:	89 44 24 04          	mov    %eax,0x4(%esp)
 780:	8b 45 08             	mov    0x8(%ebp),%eax
 783:	89 04 24             	mov    %eax,(%esp)
 786:	e8 bb fe ff ff       	call   646 <putc>
 78b:	e9 30 01 00 00       	jmp    8c0 <printf+0x19a>
      }
    } else if(state == '%'){
 790:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 794:	0f 85 26 01 00 00    	jne    8c0 <printf+0x19a>
      if(c == 'd'){
 79a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 79e:	75 2d                	jne    7cd <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a3:	8b 00                	mov    (%eax),%eax
 7a5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7ac:	00 
 7ad:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7b4:	00 
 7b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 aa fe ff ff       	call   66e <printint>
        ap++;
 7c4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c8:	e9 ec 00 00 00       	jmp    8b9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7cd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7d1:	74 06                	je     7d9 <printf+0xb3>
 7d3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7d7:	75 2d                	jne    806 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7dc:	8b 00                	mov    (%eax),%eax
 7de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7e5:	00 
 7e6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7ed:	00 
 7ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f2:	8b 45 08             	mov    0x8(%ebp),%eax
 7f5:	89 04 24             	mov    %eax,(%esp)
 7f8:	e8 71 fe ff ff       	call   66e <printint>
        ap++;
 7fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 801:	e9 b3 00 00 00       	jmp    8b9 <printf+0x193>
      } else if(c == 's'){
 806:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 80a:	75 45                	jne    851 <printf+0x12b>
        s = (char*)*ap;
 80c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80f:	8b 00                	mov    (%eax),%eax
 811:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 814:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 818:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 81c:	75 09                	jne    827 <printf+0x101>
          s = "(null)";
 81e:	c7 45 f4 3e 0b 00 00 	movl   $0xb3e,-0xc(%ebp)
        while(*s != 0){
 825:	eb 1e                	jmp    845 <printf+0x11f>
 827:	eb 1c                	jmp    845 <printf+0x11f>
          putc(fd, *s);
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	0f b6 00             	movzbl (%eax),%eax
 82f:	0f be c0             	movsbl %al,%eax
 832:	89 44 24 04          	mov    %eax,0x4(%esp)
 836:	8b 45 08             	mov    0x8(%ebp),%eax
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 05 fe ff ff       	call   646 <putc>
          s++;
 841:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 845:	8b 45 f4             	mov    -0xc(%ebp),%eax
 848:	0f b6 00             	movzbl (%eax),%eax
 84b:	84 c0                	test   %al,%al
 84d:	75 da                	jne    829 <printf+0x103>
 84f:	eb 68                	jmp    8b9 <printf+0x193>
        }
      } else if(c == 'c'){
 851:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 855:	75 1d                	jne    874 <printf+0x14e>
        putc(fd, *ap);
 857:	8b 45 e8             	mov    -0x18(%ebp),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	0f be c0             	movsbl %al,%eax
 85f:	89 44 24 04          	mov    %eax,0x4(%esp)
 863:	8b 45 08             	mov    0x8(%ebp),%eax
 866:	89 04 24             	mov    %eax,(%esp)
 869:	e8 d8 fd ff ff       	call   646 <putc>
        ap++;
 86e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 872:	eb 45                	jmp    8b9 <printf+0x193>
      } else if(c == '%'){
 874:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 878:	75 17                	jne    891 <printf+0x16b>
        putc(fd, c);
 87a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 87d:	0f be c0             	movsbl %al,%eax
 880:	89 44 24 04          	mov    %eax,0x4(%esp)
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	89 04 24             	mov    %eax,(%esp)
 88a:	e8 b7 fd ff ff       	call   646 <putc>
 88f:	eb 28                	jmp    8b9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 891:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 898:	00 
 899:	8b 45 08             	mov    0x8(%ebp),%eax
 89c:	89 04 24             	mov    %eax,(%esp)
 89f:	e8 a2 fd ff ff       	call   646 <putc>
        putc(fd, c);
 8a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a7:	0f be c0             	movsbl %al,%eax
 8aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ae:	8b 45 08             	mov    0x8(%ebp),%eax
 8b1:	89 04 24             	mov    %eax,(%esp)
 8b4:	e8 8d fd ff ff       	call   646 <putc>
      }
      state = 0;
 8b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8c0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8c4:	8b 55 0c             	mov    0xc(%ebp),%edx
 8c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ca:	01 d0                	add    %edx,%eax
 8cc:	0f b6 00             	movzbl (%eax),%eax
 8cf:	84 c0                	test   %al,%al
 8d1:	0f 85 71 fe ff ff    	jne    748 <printf+0x22>
    }
  }
}
 8d7:	c9                   	leave  
 8d8:	c3                   	ret    

000008d9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d9:	55                   	push   %ebp
 8da:	89 e5                	mov    %esp,%ebp
 8dc:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	83 e8 08             	sub    $0x8,%eax
 8e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e8:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 8ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f0:	eb 24                	jmp    916 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f5:	8b 00                	mov    (%eax),%eax
 8f7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fa:	77 12                	ja     90e <free+0x35>
 8fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 902:	77 24                	ja     928 <free+0x4f>
 904:	8b 45 fc             	mov    -0x4(%ebp),%eax
 907:	8b 00                	mov    (%eax),%eax
 909:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 90c:	77 1a                	ja     928 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 90e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 911:	8b 00                	mov    (%eax),%eax
 913:	89 45 fc             	mov    %eax,-0x4(%ebp)
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 91c:	76 d4                	jbe    8f2 <free+0x19>
 91e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 921:	8b 00                	mov    (%eax),%eax
 923:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 926:	76 ca                	jbe    8f2 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 928:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92b:	8b 40 04             	mov    0x4(%eax),%eax
 92e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	01 c2                	add    %eax,%edx
 93a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93d:	8b 00                	mov    (%eax),%eax
 93f:	39 c2                	cmp    %eax,%edx
 941:	75 24                	jne    967 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	8b 50 04             	mov    0x4(%eax),%edx
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 00                	mov    (%eax),%eax
 94e:	8b 40 04             	mov    0x4(%eax),%eax
 951:	01 c2                	add    %eax,%edx
 953:	8b 45 f8             	mov    -0x8(%ebp),%eax
 956:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 959:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	8b 10                	mov    (%eax),%edx
 960:	8b 45 f8             	mov    -0x8(%ebp),%eax
 963:	89 10                	mov    %edx,(%eax)
 965:	eb 0a                	jmp    971 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 967:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96a:	8b 10                	mov    (%eax),%edx
 96c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 971:	8b 45 fc             	mov    -0x4(%ebp),%eax
 974:	8b 40 04             	mov    0x4(%eax),%eax
 977:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 97e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 981:	01 d0                	add    %edx,%eax
 983:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 986:	75 20                	jne    9a8 <free+0xcf>
    p->s.size += bp->s.size;
 988:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98b:	8b 50 04             	mov    0x4(%eax),%edx
 98e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 991:	8b 40 04             	mov    0x4(%eax),%eax
 994:	01 c2                	add    %eax,%edx
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
 999:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 99c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99f:	8b 10                	mov    (%eax),%edx
 9a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a4:	89 10                	mov    %edx,(%eax)
 9a6:	eb 08                	jmp    9b0 <free+0xd7>
  } else
    p->s.ptr = bp;
 9a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ab:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9ae:	89 10                	mov    %edx,(%eax)
  freep = p;
 9b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b3:	a3 d8 0d 00 00       	mov    %eax,0xdd8
}
 9b8:	c9                   	leave  
 9b9:	c3                   	ret    

000009ba <morecore>:

static Header*
morecore(uint nu)
{
 9ba:	55                   	push   %ebp
 9bb:	89 e5                	mov    %esp,%ebp
 9bd:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9c0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9c7:	77 07                	ja     9d0 <morecore+0x16>
    nu = 4096;
 9c9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9d0:	8b 45 08             	mov    0x8(%ebp),%eax
 9d3:	c1 e0 03             	shl    $0x3,%eax
 9d6:	89 04 24             	mov    %eax,(%esp)
 9d9:	e8 40 fc ff ff       	call   61e <sbrk>
 9de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9e1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9e5:	75 07                	jne    9ee <morecore+0x34>
    return 0;
 9e7:	b8 00 00 00 00       	mov    $0x0,%eax
 9ec:	eb 22                	jmp    a10 <morecore+0x56>
  hp = (Header*)p;
 9ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f7:	8b 55 08             	mov    0x8(%ebp),%edx
 9fa:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a00:	83 c0 08             	add    $0x8,%eax
 a03:	89 04 24             	mov    %eax,(%esp)
 a06:	e8 ce fe ff ff       	call   8d9 <free>
  return freep;
 a0b:	a1 d8 0d 00 00       	mov    0xdd8,%eax
}
 a10:	c9                   	leave  
 a11:	c3                   	ret    

00000a12 <malloc>:

void*
malloc(uint nbytes)
{
 a12:	55                   	push   %ebp
 a13:	89 e5                	mov    %esp,%ebp
 a15:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a18:	8b 45 08             	mov    0x8(%ebp),%eax
 a1b:	83 c0 07             	add    $0x7,%eax
 a1e:	c1 e8 03             	shr    $0x3,%eax
 a21:	83 c0 01             	add    $0x1,%eax
 a24:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a27:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 a2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a33:	75 23                	jne    a58 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a35:	c7 45 f0 d0 0d 00 00 	movl   $0xdd0,-0x10(%ebp)
 a3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3f:	a3 d8 0d 00 00       	mov    %eax,0xdd8
 a44:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 a49:	a3 d0 0d 00 00       	mov    %eax,0xdd0
    base.s.size = 0;
 a4e:	c7 05 d4 0d 00 00 00 	movl   $0x0,0xdd4
 a55:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5b:	8b 00                	mov    (%eax),%eax
 a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	8b 40 04             	mov    0x4(%eax),%eax
 a66:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a69:	72 4d                	jb     ab8 <malloc+0xa6>
      if(p->s.size == nunits)
 a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6e:	8b 40 04             	mov    0x4(%eax),%eax
 a71:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a74:	75 0c                	jne    a82 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a79:	8b 10                	mov    (%eax),%edx
 a7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7e:	89 10                	mov    %edx,(%eax)
 a80:	eb 26                	jmp    aa8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a85:	8b 40 04             	mov    0x4(%eax),%eax
 a88:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a8b:	89 c2                	mov    %eax,%edx
 a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a90:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a96:	8b 40 04             	mov    0x4(%eax),%eax
 a99:	c1 e0 03             	shl    $0x3,%eax
 a9c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 aa5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aab:	a3 d8 0d 00 00       	mov    %eax,0xdd8
      return (void*)(p + 1);
 ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab3:	83 c0 08             	add    $0x8,%eax
 ab6:	eb 38                	jmp    af0 <malloc+0xde>
    }
    if(p == freep)
 ab8:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 abd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ac0:	75 1b                	jne    add <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ac2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac5:	89 04 24             	mov    %eax,(%esp)
 ac8:	e8 ed fe ff ff       	call   9ba <morecore>
 acd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ad0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ad4:	75 07                	jne    add <malloc+0xcb>
        return 0;
 ad6:	b8 00 00 00 00       	mov    $0x0,%eax
 adb:	eb 13                	jmp    af0 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 add:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae6:	8b 00                	mov    (%eax),%eax
 ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 aeb:	e9 70 ff ff ff       	jmp    a60 <malloc+0x4e>
}
 af0:	c9                   	leave  
 af1:	c3                   	ret    
