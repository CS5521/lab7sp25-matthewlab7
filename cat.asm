
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 c0 0d 00 	movl   $0xdc0,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 1b 05 00 00       	call   53e <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 7a 0a 00 	movl   $0xa7a,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 72 06 00 00       	call   6ae <printf>
      exit();
  3c:	e8 dd 04 00 00       	call   51e <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 c0 0d 00 	movl   $0xdc0,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 da 04 00 00       	call   536 <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 8c 0a 00 	movl   $0xa8c,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 2f 06 00 00       	call   6ae <printf>
    exit();
  7f:	e8 9a 04 00 00       	call   51e <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 78 04 00 00       	call   51e <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 8c 04 00 00       	call   55e <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 9d 0a 00 	movl   $0xa9d,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 a7 05 00 00       	call   6ae <printf>
      exit();
 107:	e8 12 04 00 00       	call   51e <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 22 04 00 00       	call   546 <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 e3 03 00 00       	call   51e <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 bf 02 00 00       	call   536 <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 82 02 00 00       	call   55e <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 78 02 00 00       	call   576 <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 3a 02 00 00       	call   546 <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:

void
ps()
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 3a7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3ad:	89 04 24             	mov    %eax,(%esp)
 3b0:	e8 09 02 00 00       	call   5be <getpinfo>
 3b5:	83 f8 ff             	cmp    $0xffffffff,%eax
 3b8:	0f 84 4d 01 00 00    	je     50b <ps+0x170>
    return;
  int i = 0;
 3be:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 3c5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c8:	89 d0                	mov    %edx,%eax
 3ca:	c1 e0 03             	shl    $0x3,%eax
 3cd:	01 d0                	add    %edx,%eax
 3cf:	c1 e0 02             	shl    $0x2,%eax
 3d2:	8d 7d e8             	lea    -0x18(%ebp),%edi
 3d5:	01 f8                	add    %edi,%eax
 3d7:	2d 04 09 00 00       	sub    $0x904,%eax
 3dc:	8b 10                	mov    (%eax),%edx
 3de:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3e4:	8b 50 04             	mov    0x4(%eax),%edx
 3e7:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3ed:	8b 50 08             	mov    0x8(%eax),%edx
 3f0:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3f6:	8b 50 0c             	mov    0xc(%eax),%edx
 3f9:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3ff:	8b 50 10             	mov    0x10(%eax),%edx
 402:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 408:	8b 50 14             	mov    0x14(%eax),%edx
 40b:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 411:	8b 50 18             	mov    0x18(%eax),%edx
 414:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 41a:	8b 50 1c             	mov    0x1c(%eax),%edx
 41d:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 423:	8b 40 20             	mov    0x20(%eax),%eax
 426:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 42c:	c7 44 24 04 b2 0a 00 	movl   $0xab2,0x4(%esp)
 433:	00 
 434:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 43b:	e8 6e 02 00 00       	call   6ae <printf>
  for(;p.pid != 0; p = table[i])
 440:	e9 b8 00 00 00       	jmp    4fd <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 445:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 44c:	0f be d8             	movsbl %al,%ebx
 44f:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 455:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 45b:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 461:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 467:	83 c6 10             	add    $0x10,%esi
 46a:	89 74 24 18          	mov    %esi,0x18(%esp)
 46e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 472:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 476:	89 54 24 0c          	mov    %edx,0xc(%esp)
 47a:	89 44 24 08          	mov    %eax,0x8(%esp)
 47e:	c7 44 24 04 cb 0a 00 	movl   $0xacb,0x4(%esp)
 485:	00 
 486:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 48d:	e8 1c 02 00 00       	call   6ae <printf>
    i++;
 492:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 496:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 499:	89 d0                	mov    %edx,%eax
 49b:	c1 e0 03             	shl    $0x3,%eax
 49e:	01 d0                	add    %edx,%eax
 4a0:	c1 e0 02             	shl    $0x2,%eax
 4a3:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4a6:	01 c8                	add    %ecx,%eax
 4a8:	2d 04 09 00 00       	sub    $0x904,%eax
 4ad:	8b 10                	mov    (%eax),%edx
 4af:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 4b5:	8b 50 04             	mov    0x4(%eax),%edx
 4b8:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 4be:	8b 50 08             	mov    0x8(%eax),%edx
 4c1:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 4c7:	8b 50 0c             	mov    0xc(%eax),%edx
 4ca:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 4d0:	8b 50 10             	mov    0x10(%eax),%edx
 4d3:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4d9:	8b 50 14             	mov    0x14(%eax),%edx
 4dc:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4e2:	8b 50 18             	mov    0x18(%eax),%edx
 4e5:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4eb:	8b 50 1c             	mov    0x1c(%eax),%edx
 4ee:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4f4:	8b 40 20             	mov    0x20(%eax),%eax
 4f7:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 4fd:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 503:	85 c0                	test   %eax,%eax
 505:	0f 85 3a ff ff ff    	jne    445 <ps+0xaa>
  }
}
 50b:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 511:	5b                   	pop    %ebx
 512:	5e                   	pop    %esi
 513:	5f                   	pop    %edi
 514:	5d                   	pop    %ebp
 515:	c3                   	ret    

00000516 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 516:	b8 01 00 00 00       	mov    $0x1,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <exit>:
SYSCALL(exit)
 51e:	b8 02 00 00 00       	mov    $0x2,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <wait>:
SYSCALL(wait)
 526:	b8 03 00 00 00       	mov    $0x3,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <pipe>:
SYSCALL(pipe)
 52e:	b8 04 00 00 00       	mov    $0x4,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <read>:
SYSCALL(read)
 536:	b8 05 00 00 00       	mov    $0x5,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <write>:
SYSCALL(write)
 53e:	b8 10 00 00 00       	mov    $0x10,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <close>:
SYSCALL(close)
 546:	b8 15 00 00 00       	mov    $0x15,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <kill>:
SYSCALL(kill)
 54e:	b8 06 00 00 00       	mov    $0x6,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <exec>:
SYSCALL(exec)
 556:	b8 07 00 00 00       	mov    $0x7,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <open>:
SYSCALL(open)
 55e:	b8 0f 00 00 00       	mov    $0xf,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <mknod>:
SYSCALL(mknod)
 566:	b8 11 00 00 00       	mov    $0x11,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <unlink>:
SYSCALL(unlink)
 56e:	b8 12 00 00 00       	mov    $0x12,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <fstat>:
SYSCALL(fstat)
 576:	b8 08 00 00 00       	mov    $0x8,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <link>:
SYSCALL(link)
 57e:	b8 13 00 00 00       	mov    $0x13,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <mkdir>:
SYSCALL(mkdir)
 586:	b8 14 00 00 00       	mov    $0x14,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <chdir>:
SYSCALL(chdir)
 58e:	b8 09 00 00 00       	mov    $0x9,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <dup>:
SYSCALL(dup)
 596:	b8 0a 00 00 00       	mov    $0xa,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <getpid>:
SYSCALL(getpid)
 59e:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <sbrk>:
SYSCALL(sbrk)
 5a6:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <sleep>:
SYSCALL(sleep)
 5ae:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <uptime>:
SYSCALL(uptime)
 5b6:	b8 0e 00 00 00       	mov    $0xe,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <getpinfo>:
SYSCALL(getpinfo)
 5be:	b8 16 00 00 00       	mov    $0x16,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <settickets>:
 5c6:	b8 17 00 00 00       	mov    $0x17,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ce:	55                   	push   %ebp
 5cf:	89 e5                	mov    %esp,%ebp
 5d1:	83 ec 18             	sub    $0x18,%esp
 5d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5da:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e1:	00 
 5e2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	89 04 24             	mov    %eax,(%esp)
 5ef:	e8 4a ff ff ff       	call   53e <write>
}
 5f4:	c9                   	leave  
 5f5:	c3                   	ret    

000005f6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5f6:	55                   	push   %ebp
 5f7:	89 e5                	mov    %esp,%ebp
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 605:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 609:	74 17                	je     622 <printint+0x2c>
 60b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 60f:	79 11                	jns    622 <printint+0x2c>
    neg = 1;
 611:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 618:	8b 45 0c             	mov    0xc(%ebp),%eax
 61b:	f7 d8                	neg    %eax
 61d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 620:	eb 06                	jmp    628 <printint+0x32>
  } else {
    x = xx;
 622:	8b 45 0c             	mov    0xc(%ebp),%eax
 625:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 628:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 62f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 632:	8d 41 01             	lea    0x1(%ecx),%eax
 635:	89 45 f4             	mov    %eax,-0xc(%ebp)
 638:	8b 5d 10             	mov    0x10(%ebp),%ebx
 63b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 63e:	ba 00 00 00 00       	mov    $0x0,%edx
 643:	f7 f3                	div    %ebx
 645:	89 d0                	mov    %edx,%eax
 647:	0f b6 80 78 0d 00 00 	movzbl 0xd78(%eax),%eax
 64e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 652:	8b 75 10             	mov    0x10(%ebp),%esi
 655:	8b 45 ec             	mov    -0x14(%ebp),%eax
 658:	ba 00 00 00 00       	mov    $0x0,%edx
 65d:	f7 f6                	div    %esi
 65f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 662:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 666:	75 c7                	jne    62f <printint+0x39>
  if(neg)
 668:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 66c:	74 10                	je     67e <printint+0x88>
    buf[i++] = '-';
 66e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 671:	8d 50 01             	lea    0x1(%eax),%edx
 674:	89 55 f4             	mov    %edx,-0xc(%ebp)
 677:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 67c:	eb 1f                	jmp    69d <printint+0xa7>
 67e:	eb 1d                	jmp    69d <printint+0xa7>
    putc(fd, buf[i]);
 680:	8d 55 dc             	lea    -0x24(%ebp),%edx
 683:	8b 45 f4             	mov    -0xc(%ebp),%eax
 686:	01 d0                	add    %edx,%eax
 688:	0f b6 00             	movzbl (%eax),%eax
 68b:	0f be c0             	movsbl %al,%eax
 68e:	89 44 24 04          	mov    %eax,0x4(%esp)
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	89 04 24             	mov    %eax,(%esp)
 698:	e8 31 ff ff ff       	call   5ce <putc>
  while(--i >= 0)
 69d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6a5:	79 d9                	jns    680 <printint+0x8a>
}
 6a7:	83 c4 30             	add    $0x30,%esp
 6aa:	5b                   	pop    %ebx
 6ab:	5e                   	pop    %esi
 6ac:	5d                   	pop    %ebp
 6ad:	c3                   	ret    

000006ae <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6ae:	55                   	push   %ebp
 6af:	89 e5                	mov    %esp,%ebp
 6b1:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6bb:	8d 45 0c             	lea    0xc(%ebp),%eax
 6be:	83 c0 04             	add    $0x4,%eax
 6c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6cb:	e9 7c 01 00 00       	jmp    84c <printf+0x19e>
    c = fmt[i] & 0xff;
 6d0:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d6:	01 d0                	add    %edx,%eax
 6d8:	0f b6 00             	movzbl (%eax),%eax
 6db:	0f be c0             	movsbl %al,%eax
 6de:	25 ff 00 00 00       	and    $0xff,%eax
 6e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6ea:	75 2c                	jne    718 <printf+0x6a>
      if(c == '%'){
 6ec:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6f0:	75 0c                	jne    6fe <printf+0x50>
        state = '%';
 6f2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6f9:	e9 4a 01 00 00       	jmp    848 <printf+0x19a>
      } else {
        putc(fd, c);
 6fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 701:	0f be c0             	movsbl %al,%eax
 704:	89 44 24 04          	mov    %eax,0x4(%esp)
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	89 04 24             	mov    %eax,(%esp)
 70e:	e8 bb fe ff ff       	call   5ce <putc>
 713:	e9 30 01 00 00       	jmp    848 <printf+0x19a>
      }
    } else if(state == '%'){
 718:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 71c:	0f 85 26 01 00 00    	jne    848 <printf+0x19a>
      if(c == 'd'){
 722:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 726:	75 2d                	jne    755 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 728:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72b:	8b 00                	mov    (%eax),%eax
 72d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 734:	00 
 735:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 73c:	00 
 73d:	89 44 24 04          	mov    %eax,0x4(%esp)
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	89 04 24             	mov    %eax,(%esp)
 747:	e8 aa fe ff ff       	call   5f6 <printint>
        ap++;
 74c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 750:	e9 ec 00 00 00       	jmp    841 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 755:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 759:	74 06                	je     761 <printf+0xb3>
 75b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 75f:	75 2d                	jne    78e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 761:	8b 45 e8             	mov    -0x18(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 76d:	00 
 76e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 775:	00 
 776:	89 44 24 04          	mov    %eax,0x4(%esp)
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	89 04 24             	mov    %eax,(%esp)
 780:	e8 71 fe ff ff       	call   5f6 <printint>
        ap++;
 785:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 789:	e9 b3 00 00 00       	jmp    841 <printf+0x193>
      } else if(c == 's'){
 78e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 792:	75 45                	jne    7d9 <printf+0x12b>
        s = (char*)*ap;
 794:	8b 45 e8             	mov    -0x18(%ebp),%eax
 797:	8b 00                	mov    (%eax),%eax
 799:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 79c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a4:	75 09                	jne    7af <printf+0x101>
          s = "(null)";
 7a6:	c7 45 f4 db 0a 00 00 	movl   $0xadb,-0xc(%ebp)
        while(*s != 0){
 7ad:	eb 1e                	jmp    7cd <printf+0x11f>
 7af:	eb 1c                	jmp    7cd <printf+0x11f>
          putc(fd, *s);
 7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b4:	0f b6 00             	movzbl (%eax),%eax
 7b7:	0f be c0             	movsbl %al,%eax
 7ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 7be:	8b 45 08             	mov    0x8(%ebp),%eax
 7c1:	89 04 24             	mov    %eax,(%esp)
 7c4:	e8 05 fe ff ff       	call   5ce <putc>
          s++;
 7c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d0:	0f b6 00             	movzbl (%eax),%eax
 7d3:	84 c0                	test   %al,%al
 7d5:	75 da                	jne    7b1 <printf+0x103>
 7d7:	eb 68                	jmp    841 <printf+0x193>
        }
      } else if(c == 'c'){
 7d9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7dd:	75 1d                	jne    7fc <printf+0x14e>
        putc(fd, *ap);
 7df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	0f be c0             	movsbl %al,%eax
 7e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	89 04 24             	mov    %eax,(%esp)
 7f1:	e8 d8 fd ff ff       	call   5ce <putc>
        ap++;
 7f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7fa:	eb 45                	jmp    841 <printf+0x193>
      } else if(c == '%'){
 7fc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 800:	75 17                	jne    819 <printf+0x16b>
        putc(fd, c);
 802:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 805:	0f be c0             	movsbl %al,%eax
 808:	89 44 24 04          	mov    %eax,0x4(%esp)
 80c:	8b 45 08             	mov    0x8(%ebp),%eax
 80f:	89 04 24             	mov    %eax,(%esp)
 812:	e8 b7 fd ff ff       	call   5ce <putc>
 817:	eb 28                	jmp    841 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 819:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 820:	00 
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	89 04 24             	mov    %eax,(%esp)
 827:	e8 a2 fd ff ff       	call   5ce <putc>
        putc(fd, c);
 82c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 82f:	0f be c0             	movsbl %al,%eax
 832:	89 44 24 04          	mov    %eax,0x4(%esp)
 836:	8b 45 08             	mov    0x8(%ebp),%eax
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 8d fd ff ff       	call   5ce <putc>
      }
      state = 0;
 841:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 848:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 84c:	8b 55 0c             	mov    0xc(%ebp),%edx
 84f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 852:	01 d0                	add    %edx,%eax
 854:	0f b6 00             	movzbl (%eax),%eax
 857:	84 c0                	test   %al,%al
 859:	0f 85 71 fe ff ff    	jne    6d0 <printf+0x22>
    }
  }
}
 85f:	c9                   	leave  
 860:	c3                   	ret    

00000861 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 861:	55                   	push   %ebp
 862:	89 e5                	mov    %esp,%ebp
 864:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 867:	8b 45 08             	mov    0x8(%ebp),%eax
 86a:	83 e8 08             	sub    $0x8,%eax
 86d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 870:	a1 a8 0d 00 00       	mov    0xda8,%eax
 875:	89 45 fc             	mov    %eax,-0x4(%ebp)
 878:	eb 24                	jmp    89e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87d:	8b 00                	mov    (%eax),%eax
 87f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 882:	77 12                	ja     896 <free+0x35>
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 88a:	77 24                	ja     8b0 <free+0x4f>
 88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88f:	8b 00                	mov    (%eax),%eax
 891:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 894:	77 1a                	ja     8b0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 896:	8b 45 fc             	mov    -0x4(%ebp),%eax
 899:	8b 00                	mov    (%eax),%eax
 89b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 89e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a4:	76 d4                	jbe    87a <free+0x19>
 8a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a9:	8b 00                	mov    (%eax),%eax
 8ab:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ae:	76 ca                	jbe    87a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b3:	8b 40 04             	mov    0x4(%eax),%eax
 8b6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	01 c2                	add    %eax,%edx
 8c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c5:	8b 00                	mov    (%eax),%eax
 8c7:	39 c2                	cmp    %eax,%edx
 8c9:	75 24                	jne    8ef <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ce:	8b 50 04             	mov    0x4(%eax),%edx
 8d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d4:	8b 00                	mov    (%eax),%eax
 8d6:	8b 40 04             	mov    0x4(%eax),%eax
 8d9:	01 c2                	add    %eax,%edx
 8db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8de:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 00                	mov    (%eax),%eax
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8eb:	89 10                	mov    %edx,(%eax)
 8ed:	eb 0a                	jmp    8f9 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f2:	8b 10                	mov    (%eax),%edx
 8f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f7:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fc:	8b 40 04             	mov    0x4(%eax),%eax
 8ff:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 906:	8b 45 fc             	mov    -0x4(%ebp),%eax
 909:	01 d0                	add    %edx,%eax
 90b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 90e:	75 20                	jne    930 <free+0xcf>
    p->s.size += bp->s.size;
 910:	8b 45 fc             	mov    -0x4(%ebp),%eax
 913:	8b 50 04             	mov    0x4(%eax),%edx
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	8b 40 04             	mov    0x4(%eax),%eax
 91c:	01 c2                	add    %eax,%edx
 91e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 921:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 924:	8b 45 f8             	mov    -0x8(%ebp),%eax
 927:	8b 10                	mov    (%eax),%edx
 929:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92c:	89 10                	mov    %edx,(%eax)
 92e:	eb 08                	jmp    938 <free+0xd7>
  } else
    p->s.ptr = bp;
 930:	8b 45 fc             	mov    -0x4(%ebp),%eax
 933:	8b 55 f8             	mov    -0x8(%ebp),%edx
 936:	89 10                	mov    %edx,(%eax)
  freep = p;
 938:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93b:	a3 a8 0d 00 00       	mov    %eax,0xda8
}
 940:	c9                   	leave  
 941:	c3                   	ret    

00000942 <morecore>:

static Header*
morecore(uint nu)
{
 942:	55                   	push   %ebp
 943:	89 e5                	mov    %esp,%ebp
 945:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 948:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 94f:	77 07                	ja     958 <morecore+0x16>
    nu = 4096;
 951:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 958:	8b 45 08             	mov    0x8(%ebp),%eax
 95b:	c1 e0 03             	shl    $0x3,%eax
 95e:	89 04 24             	mov    %eax,(%esp)
 961:	e8 40 fc ff ff       	call   5a6 <sbrk>
 966:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 969:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 96d:	75 07                	jne    976 <morecore+0x34>
    return 0;
 96f:	b8 00 00 00 00       	mov    $0x0,%eax
 974:	eb 22                	jmp    998 <morecore+0x56>
  hp = (Header*)p;
 976:	8b 45 f4             	mov    -0xc(%ebp),%eax
 979:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97f:	8b 55 08             	mov    0x8(%ebp),%edx
 982:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 985:	8b 45 f0             	mov    -0x10(%ebp),%eax
 988:	83 c0 08             	add    $0x8,%eax
 98b:	89 04 24             	mov    %eax,(%esp)
 98e:	e8 ce fe ff ff       	call   861 <free>
  return freep;
 993:	a1 a8 0d 00 00       	mov    0xda8,%eax
}
 998:	c9                   	leave  
 999:	c3                   	ret    

0000099a <malloc>:

void*
malloc(uint nbytes)
{
 99a:	55                   	push   %ebp
 99b:	89 e5                	mov    %esp,%ebp
 99d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a0:	8b 45 08             	mov    0x8(%ebp),%eax
 9a3:	83 c0 07             	add    $0x7,%eax
 9a6:	c1 e8 03             	shr    $0x3,%eax
 9a9:	83 c0 01             	add    $0x1,%eax
 9ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9af:	a1 a8 0d 00 00       	mov    0xda8,%eax
 9b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9bb:	75 23                	jne    9e0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9bd:	c7 45 f0 a0 0d 00 00 	movl   $0xda0,-0x10(%ebp)
 9c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c7:	a3 a8 0d 00 00       	mov    %eax,0xda8
 9cc:	a1 a8 0d 00 00       	mov    0xda8,%eax
 9d1:	a3 a0 0d 00 00       	mov    %eax,0xda0
    base.s.size = 0;
 9d6:	c7 05 a4 0d 00 00 00 	movl   $0x0,0xda4
 9dd:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e3:	8b 00                	mov    (%eax),%eax
 9e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9eb:	8b 40 04             	mov    0x4(%eax),%eax
 9ee:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9f1:	72 4d                	jb     a40 <malloc+0xa6>
      if(p->s.size == nunits)
 9f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f6:	8b 40 04             	mov    0x4(%eax),%eax
 9f9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9fc:	75 0c                	jne    a0a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a01:	8b 10                	mov    (%eax),%edx
 a03:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a06:	89 10                	mov    %edx,(%eax)
 a08:	eb 26                	jmp    a30 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0d:	8b 40 04             	mov    0x4(%eax),%eax
 a10:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a13:	89 c2                	mov    %eax,%edx
 a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a18:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1e:	8b 40 04             	mov    0x4(%eax),%eax
 a21:	c1 e0 03             	shl    $0x3,%eax
 a24:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a2d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a30:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a33:	a3 a8 0d 00 00       	mov    %eax,0xda8
      return (void*)(p + 1);
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	83 c0 08             	add    $0x8,%eax
 a3e:	eb 38                	jmp    a78 <malloc+0xde>
    }
    if(p == freep)
 a40:	a1 a8 0d 00 00       	mov    0xda8,%eax
 a45:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a48:	75 1b                	jne    a65 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a4d:	89 04 24             	mov    %eax,(%esp)
 a50:	e8 ed fe ff ff       	call   942 <morecore>
 a55:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a5c:	75 07                	jne    a65 <malloc+0xcb>
        return 0;
 a5e:	b8 00 00 00 00       	mov    $0x0,%eax
 a63:	eb 13                	jmp    a78 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a65:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a68:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6e:	8b 00                	mov    (%eax),%eax
 a70:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a73:	e9 70 ff ff ff       	jmp    9e8 <malloc+0x4e>
}
 a78:	c9                   	leave  
 a79:	c3                   	ret    
