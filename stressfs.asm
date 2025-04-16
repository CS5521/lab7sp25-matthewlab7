
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
  2c:	c7 44 24 04 ea 0a 00 	movl   $0xaea,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 de 06 00 00       	call   71e <printf>
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
  91:	c7 44 24 04 fd 0a 00 	movl   $0xafd,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 79 06 00 00       	call   71e <printf>

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
 12a:	c7 44 24 04 07 0b 00 	movl   $0xb07,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 e0 05 00 00       	call   71e <printf>

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
 4a4:	c7 44 24 04 0d 0b 00 	movl   $0xb0d,0x4(%esp)
 4ab:	00 
 4ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4b3:	e8 66 02 00 00       	call   71e <printf>
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
 4f6:	c7 44 24 04 26 0b 00 	movl   $0xb26,0x4(%esp)
 4fd:	00 
 4fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 505:	e8 14 02 00 00       	call   71e <printf>
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

0000063e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 63e:	55                   	push   %ebp
 63f:	89 e5                	mov    %esp,%ebp
 641:	83 ec 18             	sub    $0x18,%esp
 644:	8b 45 0c             	mov    0xc(%ebp),%eax
 647:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 64a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 651:	00 
 652:	8d 45 f4             	lea    -0xc(%ebp),%eax
 655:	89 44 24 04          	mov    %eax,0x4(%esp)
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	89 04 24             	mov    %eax,(%esp)
 65f:	e8 52 ff ff ff       	call   5b6 <write>
}
 664:	c9                   	leave  
 665:	c3                   	ret    

00000666 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 666:	55                   	push   %ebp
 667:	89 e5                	mov    %esp,%ebp
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 66e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 675:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 679:	74 17                	je     692 <printint+0x2c>
 67b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 67f:	79 11                	jns    692 <printint+0x2c>
    neg = 1;
 681:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 688:	8b 45 0c             	mov    0xc(%ebp),%eax
 68b:	f7 d8                	neg    %eax
 68d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 690:	eb 06                	jmp    698 <printint+0x32>
  } else {
    x = xx;
 692:	8b 45 0c             	mov    0xc(%ebp),%eax
 695:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 698:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 69f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6a2:	8d 41 01             	lea    0x1(%ecx),%eax
 6a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ae:	ba 00 00 00 00       	mov    $0x0,%edx
 6b3:	f7 f3                	div    %ebx
 6b5:	89 d0                	mov    %edx,%eax
 6b7:	0f b6 80 b4 0d 00 00 	movzbl 0xdb4(%eax),%eax
 6be:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6c2:	8b 75 10             	mov    0x10(%ebp),%esi
 6c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c8:	ba 00 00 00 00       	mov    $0x0,%edx
 6cd:	f7 f6                	div    %esi
 6cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6d6:	75 c7                	jne    69f <printint+0x39>
  if(neg)
 6d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6dc:	74 10                	je     6ee <printint+0x88>
    buf[i++] = '-';
 6de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e1:	8d 50 01             	lea    0x1(%eax),%edx
 6e4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6e7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6ec:	eb 1f                	jmp    70d <printint+0xa7>
 6ee:	eb 1d                	jmp    70d <printint+0xa7>
    putc(fd, buf[i]);
 6f0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f6:	01 d0                	add    %edx,%eax
 6f8:	0f b6 00             	movzbl (%eax),%eax
 6fb:	0f be c0             	movsbl %al,%eax
 6fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	89 04 24             	mov    %eax,(%esp)
 708:	e8 31 ff ff ff       	call   63e <putc>
  while(--i >= 0)
 70d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 711:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 715:	79 d9                	jns    6f0 <printint+0x8a>
}
 717:	83 c4 30             	add    $0x30,%esp
 71a:	5b                   	pop    %ebx
 71b:	5e                   	pop    %esi
 71c:	5d                   	pop    %ebp
 71d:	c3                   	ret    

0000071e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 71e:	55                   	push   %ebp
 71f:	89 e5                	mov    %esp,%ebp
 721:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 724:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 72b:	8d 45 0c             	lea    0xc(%ebp),%eax
 72e:	83 c0 04             	add    $0x4,%eax
 731:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 734:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 73b:	e9 7c 01 00 00       	jmp    8bc <printf+0x19e>
    c = fmt[i] & 0xff;
 740:	8b 55 0c             	mov    0xc(%ebp),%edx
 743:	8b 45 f0             	mov    -0x10(%ebp),%eax
 746:	01 d0                	add    %edx,%eax
 748:	0f b6 00             	movzbl (%eax),%eax
 74b:	0f be c0             	movsbl %al,%eax
 74e:	25 ff 00 00 00       	and    $0xff,%eax
 753:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 756:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 75a:	75 2c                	jne    788 <printf+0x6a>
      if(c == '%'){
 75c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 760:	75 0c                	jne    76e <printf+0x50>
        state = '%';
 762:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 769:	e9 4a 01 00 00       	jmp    8b8 <printf+0x19a>
      } else {
        putc(fd, c);
 76e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 771:	0f be c0             	movsbl %al,%eax
 774:	89 44 24 04          	mov    %eax,0x4(%esp)
 778:	8b 45 08             	mov    0x8(%ebp),%eax
 77b:	89 04 24             	mov    %eax,(%esp)
 77e:	e8 bb fe ff ff       	call   63e <putc>
 783:	e9 30 01 00 00       	jmp    8b8 <printf+0x19a>
      }
    } else if(state == '%'){
 788:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 78c:	0f 85 26 01 00 00    	jne    8b8 <printf+0x19a>
      if(c == 'd'){
 792:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 796:	75 2d                	jne    7c5 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 798:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7a4:	00 
 7a5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7ac:	00 
 7ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	89 04 24             	mov    %eax,(%esp)
 7b7:	e8 aa fe ff ff       	call   666 <printint>
        ap++;
 7bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c0:	e9 ec 00 00 00       	jmp    8b1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7c5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7c9:	74 06                	je     7d1 <printf+0xb3>
 7cb:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7cf:	75 2d                	jne    7fe <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7dd:	00 
 7de:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7e5:	00 
 7e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ea:	8b 45 08             	mov    0x8(%ebp),%eax
 7ed:	89 04 24             	mov    %eax,(%esp)
 7f0:	e8 71 fe ff ff       	call   666 <printint>
        ap++;
 7f5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f9:	e9 b3 00 00 00       	jmp    8b1 <printf+0x193>
      } else if(c == 's'){
 7fe:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 802:	75 45                	jne    849 <printf+0x12b>
        s = (char*)*ap;
 804:	8b 45 e8             	mov    -0x18(%ebp),%eax
 807:	8b 00                	mov    (%eax),%eax
 809:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 80c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 810:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 814:	75 09                	jne    81f <printf+0x101>
          s = "(null)";
 816:	c7 45 f4 36 0b 00 00 	movl   $0xb36,-0xc(%ebp)
        while(*s != 0){
 81d:	eb 1e                	jmp    83d <printf+0x11f>
 81f:	eb 1c                	jmp    83d <printf+0x11f>
          putc(fd, *s);
 821:	8b 45 f4             	mov    -0xc(%ebp),%eax
 824:	0f b6 00             	movzbl (%eax),%eax
 827:	0f be c0             	movsbl %al,%eax
 82a:	89 44 24 04          	mov    %eax,0x4(%esp)
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	89 04 24             	mov    %eax,(%esp)
 834:	e8 05 fe ff ff       	call   63e <putc>
          s++;
 839:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 83d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 840:	0f b6 00             	movzbl (%eax),%eax
 843:	84 c0                	test   %al,%al
 845:	75 da                	jne    821 <printf+0x103>
 847:	eb 68                	jmp    8b1 <printf+0x193>
        }
      } else if(c == 'c'){
 849:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 84d:	75 1d                	jne    86c <printf+0x14e>
        putc(fd, *ap);
 84f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 852:	8b 00                	mov    (%eax),%eax
 854:	0f be c0             	movsbl %al,%eax
 857:	89 44 24 04          	mov    %eax,0x4(%esp)
 85b:	8b 45 08             	mov    0x8(%ebp),%eax
 85e:	89 04 24             	mov    %eax,(%esp)
 861:	e8 d8 fd ff ff       	call   63e <putc>
        ap++;
 866:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 86a:	eb 45                	jmp    8b1 <printf+0x193>
      } else if(c == '%'){
 86c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 870:	75 17                	jne    889 <printf+0x16b>
        putc(fd, c);
 872:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 875:	0f be c0             	movsbl %al,%eax
 878:	89 44 24 04          	mov    %eax,0x4(%esp)
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 b7 fd ff ff       	call   63e <putc>
 887:	eb 28                	jmp    8b1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 889:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 890:	00 
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	89 04 24             	mov    %eax,(%esp)
 897:	e8 a2 fd ff ff       	call   63e <putc>
        putc(fd, c);
 89c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 89f:	0f be c0             	movsbl %al,%eax
 8a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a6:	8b 45 08             	mov    0x8(%ebp),%eax
 8a9:	89 04 24             	mov    %eax,(%esp)
 8ac:	e8 8d fd ff ff       	call   63e <putc>
      }
      state = 0;
 8b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8bc:	8b 55 0c             	mov    0xc(%ebp),%edx
 8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c2:	01 d0                	add    %edx,%eax
 8c4:	0f b6 00             	movzbl (%eax),%eax
 8c7:	84 c0                	test   %al,%al
 8c9:	0f 85 71 fe ff ff    	jne    740 <printf+0x22>
    }
  }
}
 8cf:	c9                   	leave  
 8d0:	c3                   	ret    

000008d1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d1:	55                   	push   %ebp
 8d2:	89 e5                	mov    %esp,%ebp
 8d4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	83 e8 08             	sub    $0x8,%eax
 8dd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e0:	a1 d0 0d 00 00       	mov    0xdd0,%eax
 8e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8e8:	eb 24                	jmp    90e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f2:	77 12                	ja     906 <free+0x35>
 8f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fa:	77 24                	ja     920 <free+0x4f>
 8fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ff:	8b 00                	mov    (%eax),%eax
 901:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 904:	77 1a                	ja     920 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 906:	8b 45 fc             	mov    -0x4(%ebp),%eax
 909:	8b 00                	mov    (%eax),%eax
 90b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 90e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 911:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 914:	76 d4                	jbe    8ea <free+0x19>
 916:	8b 45 fc             	mov    -0x4(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 91e:	76 ca                	jbe    8ea <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 920:	8b 45 f8             	mov    -0x8(%ebp),%eax
 923:	8b 40 04             	mov    0x4(%eax),%eax
 926:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 92d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 930:	01 c2                	add    %eax,%edx
 932:	8b 45 fc             	mov    -0x4(%ebp),%eax
 935:	8b 00                	mov    (%eax),%eax
 937:	39 c2                	cmp    %eax,%edx
 939:	75 24                	jne    95f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 93b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93e:	8b 50 04             	mov    0x4(%eax),%edx
 941:	8b 45 fc             	mov    -0x4(%ebp),%eax
 944:	8b 00                	mov    (%eax),%eax
 946:	8b 40 04             	mov    0x4(%eax),%eax
 949:	01 c2                	add    %eax,%edx
 94b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 951:	8b 45 fc             	mov    -0x4(%ebp),%eax
 954:	8b 00                	mov    (%eax),%eax
 956:	8b 10                	mov    (%eax),%edx
 958:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95b:	89 10                	mov    %edx,(%eax)
 95d:	eb 0a                	jmp    969 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 95f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 962:	8b 10                	mov    (%eax),%edx
 964:	8b 45 f8             	mov    -0x8(%ebp),%eax
 967:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 40 04             	mov    0x4(%eax),%eax
 96f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 976:	8b 45 fc             	mov    -0x4(%ebp),%eax
 979:	01 d0                	add    %edx,%eax
 97b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 97e:	75 20                	jne    9a0 <free+0xcf>
    p->s.size += bp->s.size;
 980:	8b 45 fc             	mov    -0x4(%ebp),%eax
 983:	8b 50 04             	mov    0x4(%eax),%edx
 986:	8b 45 f8             	mov    -0x8(%ebp),%eax
 989:	8b 40 04             	mov    0x4(%eax),%eax
 98c:	01 c2                	add    %eax,%edx
 98e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 991:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 994:	8b 45 f8             	mov    -0x8(%ebp),%eax
 997:	8b 10                	mov    (%eax),%edx
 999:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99c:	89 10                	mov    %edx,(%eax)
 99e:	eb 08                	jmp    9a8 <free+0xd7>
  } else
    p->s.ptr = bp;
 9a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9a6:	89 10                	mov    %edx,(%eax)
  freep = p;
 9a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ab:	a3 d0 0d 00 00       	mov    %eax,0xdd0
}
 9b0:	c9                   	leave  
 9b1:	c3                   	ret    

000009b2 <morecore>:

static Header*
morecore(uint nu)
{
 9b2:	55                   	push   %ebp
 9b3:	89 e5                	mov    %esp,%ebp
 9b5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9b8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9bf:	77 07                	ja     9c8 <morecore+0x16>
    nu = 4096;
 9c1:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9c8:	8b 45 08             	mov    0x8(%ebp),%eax
 9cb:	c1 e0 03             	shl    $0x3,%eax
 9ce:	89 04 24             	mov    %eax,(%esp)
 9d1:	e8 48 fc ff ff       	call   61e <sbrk>
 9d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9d9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9dd:	75 07                	jne    9e6 <morecore+0x34>
    return 0;
 9df:	b8 00 00 00 00       	mov    $0x0,%eax
 9e4:	eb 22                	jmp    a08 <morecore+0x56>
  hp = (Header*)p;
 9e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ef:	8b 55 08             	mov    0x8(%ebp),%edx
 9f2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f8:	83 c0 08             	add    $0x8,%eax
 9fb:	89 04 24             	mov    %eax,(%esp)
 9fe:	e8 ce fe ff ff       	call   8d1 <free>
  return freep;
 a03:	a1 d0 0d 00 00       	mov    0xdd0,%eax
}
 a08:	c9                   	leave  
 a09:	c3                   	ret    

00000a0a <malloc>:

void*
malloc(uint nbytes)
{
 a0a:	55                   	push   %ebp
 a0b:	89 e5                	mov    %esp,%ebp
 a0d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a10:	8b 45 08             	mov    0x8(%ebp),%eax
 a13:	83 c0 07             	add    $0x7,%eax
 a16:	c1 e8 03             	shr    $0x3,%eax
 a19:	83 c0 01             	add    $0x1,%eax
 a1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a1f:	a1 d0 0d 00 00       	mov    0xdd0,%eax
 a24:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a27:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a2b:	75 23                	jne    a50 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a2d:	c7 45 f0 c8 0d 00 00 	movl   $0xdc8,-0x10(%ebp)
 a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a37:	a3 d0 0d 00 00       	mov    %eax,0xdd0
 a3c:	a1 d0 0d 00 00       	mov    0xdd0,%eax
 a41:	a3 c8 0d 00 00       	mov    %eax,0xdc8
    base.s.size = 0;
 a46:	c7 05 cc 0d 00 00 00 	movl   $0x0,0xdcc
 a4d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a50:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a53:	8b 00                	mov    (%eax),%eax
 a55:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5b:	8b 40 04             	mov    0x4(%eax),%eax
 a5e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a61:	72 4d                	jb     ab0 <malloc+0xa6>
      if(p->s.size == nunits)
 a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a66:	8b 40 04             	mov    0x4(%eax),%eax
 a69:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a6c:	75 0c                	jne    a7a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a71:	8b 10                	mov    (%eax),%edx
 a73:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a76:	89 10                	mov    %edx,(%eax)
 a78:	eb 26                	jmp    aa0 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7d:	8b 40 04             	mov    0x4(%eax),%eax
 a80:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a83:	89 c2                	mov    %eax,%edx
 a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a88:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8e:	8b 40 04             	mov    0x4(%eax),%eax
 a91:	c1 e0 03             	shl    $0x3,%eax
 a94:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a9d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa3:	a3 d0 0d 00 00       	mov    %eax,0xdd0
      return (void*)(p + 1);
 aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aab:	83 c0 08             	add    $0x8,%eax
 aae:	eb 38                	jmp    ae8 <malloc+0xde>
    }
    if(p == freep)
 ab0:	a1 d0 0d 00 00       	mov    0xdd0,%eax
 ab5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ab8:	75 1b                	jne    ad5 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 aba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abd:	89 04 24             	mov    %eax,(%esp)
 ac0:	e8 ed fe ff ff       	call   9b2 <morecore>
 ac5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ac8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 acc:	75 07                	jne    ad5 <malloc+0xcb>
        return 0;
 ace:	b8 00 00 00 00       	mov    $0x0,%eax
 ad3:	eb 13                	jmp    ae8 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	8b 00                	mov    (%eax),%eax
 ae0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 ae3:	e9 70 ff ff ff       	jmp    a58 <malloc+0x4e>
}
 ae8:	c9                   	leave  
 ae9:	c3                   	ret    
