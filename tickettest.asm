
_tickettest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  printf(1, "parent pid: %d; tickets should be 10\n", getpid());
   9:	e8 8d 05 00 00       	call   59b <getpid>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 78 0a 00 	movl   $0xa78,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 85 06 00 00       	call   6ab <printf>
  ps();
  26:	e8 6d 03 00 00       	call   398 <ps>
  int pid = fork();
  2b:	e8 e3 04 00 00       	call   513 <fork>
  30:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  34:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  39:	75 27                	jne    62 <main+0x62>
  {
     printf(1, "first child pid: %d; tickets should be 10\n", getpid());
  3b:	e8 5b 05 00 00       	call   59b <getpid>
  40:	89 44 24 08          	mov    %eax,0x8(%esp)
  44:	c7 44 24 04 a0 0a 00 	movl   $0xaa0,0x4(%esp)
  4b:	00 
  4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  53:	e8 53 06 00 00       	call   6ab <printf>
     ps();
  58:	e8 3b 03 00 00       	call   398 <ps>
     exit();
  5d:	e8 b9 04 00 00       	call   51b <exit>
  }
  wait();
  62:	e8 bc 04 00 00       	call   523 <wait>
  printf(1, "parent pid: %d; setting tickets to 20\n", getpid());
  67:	e8 2f 05 00 00       	call   59b <getpid>
  6c:	89 44 24 08          	mov    %eax,0x8(%esp)
  70:	c7 44 24 04 cc 0a 00 	movl   $0xacc,0x4(%esp)
  77:	00 
  78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7f:	e8 27 06 00 00       	call   6ab <printf>
  settickets(20);
  84:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  8b:	e8 33 05 00 00       	call   5c3 <settickets>
  ps();
  90:	e8 03 03 00 00       	call   398 <ps>
  pid = fork();
  95:	e8 79 04 00 00       	call   513 <fork>
  9a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  9e:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  a3:	0f 85 85 00 00 00    	jne    12e <main+0x12e>
  {
     printf(1, "second child pid: %d; tickets should be 20\n", getpid());
  a9:	e8 ed 04 00 00       	call   59b <getpid>
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 f4 0a 00 	movl   $0xaf4,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 e5 05 00 00       	call   6ab <printf>
     ps();
  c6:	e8 cd 02 00 00       	call   398 <ps>
     settickets(30);
  cb:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  d2:	e8 ec 04 00 00       	call   5c3 <settickets>
     printf(1, "second child pid: %d; tickets should now be 30\n");
  d7:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
  de:	00 
  df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e6:	e8 c0 05 00 00       	call   6ab <printf>
     ps();
  eb:	e8 a8 02 00 00       	call   398 <ps>
     pid = fork();
  f0:	e8 1e 04 00 00       	call   513 <fork>
  f5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     if (pid == 0)
  f9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  fe:	75 24                	jne    124 <main+0x124>
     {
        printf(1, "child of second child pid: %d; tickets should be 30\n", getpid());
 100:	e8 96 04 00 00       	call   59b <getpid>
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	c7 44 24 04 50 0b 00 	movl   $0xb50,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 8e 05 00 00       	call   6ab <printf>
        ps();
 11d:	e8 76 02 00 00       	call   398 <ps>
 122:	eb 0a                	jmp    12e <main+0x12e>
     } else
     {
        wait();
 124:	e8 fa 03 00 00       	call   523 <wait>
        exit();
 129:	e8 ed 03 00 00       	call   51b <exit>
     }
  }
  wait();
 12e:	e8 f0 03 00 00       	call   523 <wait>
  exit();
 133:	e8 e3 03 00 00       	call   51b <exit>

00000138 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 10             	mov    0x10(%ebp),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	89 cb                	mov    %ecx,%ebx
 148:	89 df                	mov    %ebx,%edi
 14a:	89 d1                	mov    %edx,%ecx
 14c:	fc                   	cld    
 14d:	f3 aa                	rep stos %al,%es:(%edi)
 14f:	89 ca                	mov    %ecx,%edx
 151:	89 fb                	mov    %edi,%ebx
 153:	89 5d 08             	mov    %ebx,0x8(%ebp)
 156:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 159:	5b                   	pop    %ebx
 15a:	5f                   	pop    %edi
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 169:	90                   	nop
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 08             	mov    %edx,0x8(%ebp)
 173:	8b 55 0c             	mov    0xc(%ebp),%edx
 176:	8d 4a 01             	lea    0x1(%edx),%ecx
 179:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17c:	0f b6 12             	movzbl (%edx),%edx
 17f:	88 10                	mov    %dl,(%eax)
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	84 c0                	test   %al,%al
 186:	75 e2                	jne    16a <strcpy+0xd>
    ;
  return os;
 188:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18b:	c9                   	leave  
 18c:	c3                   	ret    

0000018d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 190:	eb 08                	jmp    19a <strcmp+0xd>
    p++, q++;
 192:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 196:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	84 c0                	test   %al,%al
 1a2:	74 10                	je     1b4 <strcmp+0x27>
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	0f b6 10             	movzbl (%eax),%edx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	0f b6 00             	movzbl (%eax),%eax
 1b0:	38 c2                	cmp    %al,%dl
 1b2:	74 de                	je     192 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	0f b6 00             	movzbl (%eax),%eax
 1ba:	0f b6 d0             	movzbl %al,%edx
 1bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	0f b6 c0             	movzbl %al,%eax
 1c6:	29 c2                	sub    %eax,%edx
 1c8:	89 d0                	mov    %edx,%eax
}
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    

000001cc <strlen>:

uint
strlen(const char *s)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1d9:	eb 04                	jmp    1df <strlen+0x13>
 1db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1df:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	75 ed                	jne    1db <strlen+0xf>
    ;
  return n;
 1ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f1:	c9                   	leave  
 1f2:	c3                   	ret    

000001f3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1f9:	8b 45 10             	mov    0x10(%ebp),%eax
 1fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	89 44 24 04          	mov    %eax,0x4(%esp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	89 04 24             	mov    %eax,(%esp)
 20d:	e8 26 ff ff ff       	call   138 <stosb>
  return dst;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <strchr>:

char*
strchr(const char *s, char c)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 04             	sub    $0x4,%esp
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 223:	eb 14                	jmp    239 <strchr+0x22>
    if(*s == c)
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 22e:	75 05                	jne    235 <strchr+0x1e>
      return (char*)s;
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	eb 13                	jmp    248 <strchr+0x31>
  for(; *s; s++)
 235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	84 c0                	test   %al,%al
 241:	75 e2                	jne    225 <strchr+0xe>
  return 0;
 243:	b8 00 00 00 00       	mov    $0x0,%eax
}
 248:	c9                   	leave  
 249:	c3                   	ret    

0000024a <gets>:

char*
gets(char *buf, int max)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 257:	eb 4c                	jmp    2a5 <gets+0x5b>
    cc = read(0, &c, 1);
 259:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 260:	00 
 261:	8d 45 ef             	lea    -0x11(%ebp),%eax
 264:	89 44 24 04          	mov    %eax,0x4(%esp)
 268:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 26f:	e8 bf 02 00 00       	call   533 <read>
 274:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 277:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27b:	7f 02                	jg     27f <gets+0x35>
      break;
 27d:	eb 31                	jmp    2b0 <gets+0x66>
    buf[i++] = c;
 27f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 282:	8d 50 01             	lea    0x1(%eax),%edx
 285:	89 55 f4             	mov    %edx,-0xc(%ebp)
 288:	89 c2                	mov    %eax,%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 c2                	add    %eax,%edx
 28f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 293:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 295:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 13                	je     2b0 <gets+0x66>
 29d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a1:	3c 0d                	cmp    $0xd,%al
 2a3:	74 0b                	je     2b0 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a8:	83 c0 01             	add    $0x1,%eax
 2ab:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2ae:	7c a9                	jl     259 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 d0                	add    %edx,%eax
 2b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2be:	c9                   	leave  
 2bf:	c3                   	ret    

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2cd:	00 
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	89 04 24             	mov    %eax,(%esp)
 2d4:	e8 82 02 00 00       	call   55b <open>
 2d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e0:	79 07                	jns    2e9 <stat+0x29>
    return -1;
 2e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e7:	eb 23                	jmp    30c <stat+0x4c>
  r = fstat(fd, st);
 2e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f3:	89 04 24             	mov    %eax,(%esp)
 2f6:	e8 78 02 00 00       	call   573 <fstat>
 2fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 3a 02 00 00       	call   543 <close>
  return r;
 309:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <atoi>:

int
atoi(const char *s)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 314:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31b:	eb 25                	jmp    342 <atoi+0x34>
    n = n*10 + *s++ - '0';
 31d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 320:	89 d0                	mov    %edx,%eax
 322:	c1 e0 02             	shl    $0x2,%eax
 325:	01 d0                	add    %edx,%eax
 327:	01 c0                	add    %eax,%eax
 329:	89 c1                	mov    %eax,%ecx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	8d 50 01             	lea    0x1(%eax),%edx
 331:	89 55 08             	mov    %edx,0x8(%ebp)
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	0f be c0             	movsbl %al,%eax
 33a:	01 c8                	add    %ecx,%eax
 33c:	83 e8 30             	sub    $0x30,%eax
 33f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 342:	8b 45 08             	mov    0x8(%ebp),%eax
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	3c 2f                	cmp    $0x2f,%al
 34a:	7e 0a                	jle    356 <atoi+0x48>
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	0f b6 00             	movzbl (%eax),%eax
 352:	3c 39                	cmp    $0x39,%al
 354:	7e c7                	jle    31d <atoi+0xf>
  return n;
 356:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 359:	c9                   	leave  
 35a:	c3                   	ret    

0000035b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 36d:	eb 17                	jmp    386 <memmove+0x2b>
    *dst++ = *src++;
 36f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 372:	8d 50 01             	lea    0x1(%eax),%edx
 375:	89 55 fc             	mov    %edx,-0x4(%ebp)
 378:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37b:	8d 4a 01             	lea    0x1(%edx),%ecx
 37e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 381:	0f b6 12             	movzbl (%edx),%edx
 384:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 386:	8b 45 10             	mov    0x10(%ebp),%eax
 389:	8d 50 ff             	lea    -0x1(%eax),%edx
 38c:	89 55 10             	mov    %edx,0x10(%ebp)
 38f:	85 c0                	test   %eax,%eax
 391:	7f dc                	jg     36f <memmove+0x14>
  return vdst;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <ps>:

void
ps()
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 3a4:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 09 02 00 00       	call   5bb <getpinfo>
 3b2:	83 f8 ff             	cmp    $0xffffffff,%eax
 3b5:	0f 84 4d 01 00 00    	je     508 <ps+0x170>
    return;
  int i = 0;
 3bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 3c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	c1 e0 03             	shl    $0x3,%eax
 3ca:	01 d0                	add    %edx,%eax
 3cc:	c1 e0 02             	shl    $0x2,%eax
 3cf:	8d 7d e8             	lea    -0x18(%ebp),%edi
 3d2:	01 f8                	add    %edi,%eax
 3d4:	2d 04 09 00 00       	sub    $0x904,%eax
 3d9:	8b 10                	mov    (%eax),%edx
 3db:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 3e1:	8b 50 04             	mov    0x4(%eax),%edx
 3e4:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 3ea:	8b 50 08             	mov    0x8(%eax),%edx
 3ed:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 3f3:	8b 50 0c             	mov    0xc(%eax),%edx
 3f6:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 3fc:	8b 50 10             	mov    0x10(%eax),%edx
 3ff:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 405:	8b 50 14             	mov    0x14(%eax),%edx
 408:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 40e:	8b 50 18             	mov    0x18(%eax),%edx
 411:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 417:	8b 50 1c             	mov    0x1c(%eax),%edx
 41a:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 420:	8b 40 20             	mov    0x20(%eax),%eax
 423:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 429:	c7 44 24 04 85 0b 00 	movl   $0xb85,0x4(%esp)
 430:	00 
 431:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 438:	e8 6e 02 00 00       	call   6ab <printf>
  for(;p.pid != 0; p = table[i])
 43d:	e9 b8 00 00 00       	jmp    4fa <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 442:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 449:	0f be d8             	movsbl %al,%ebx
 44c:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 452:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 458:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 45e:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 464:	83 c6 10             	add    $0x10,%esi
 467:	89 74 24 18          	mov    %esi,0x18(%esp)
 46b:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 46f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 473:	89 54 24 0c          	mov    %edx,0xc(%esp)
 477:	89 44 24 08          	mov    %eax,0x8(%esp)
 47b:	c7 44 24 04 9e 0b 00 	movl   $0xb9e,0x4(%esp)
 482:	00 
 483:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 48a:	e8 1c 02 00 00       	call   6ab <printf>
    i++;
 48f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 493:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 496:	89 d0                	mov    %edx,%eax
 498:	c1 e0 03             	shl    $0x3,%eax
 49b:	01 d0                	add    %edx,%eax
 49d:	c1 e0 02             	shl    $0x2,%eax
 4a0:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4a3:	01 c8                	add    %ecx,%eax
 4a5:	2d 04 09 00 00       	sub    $0x904,%eax
 4aa:	8b 10                	mov    (%eax),%edx
 4ac:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 4b2:	8b 50 04             	mov    0x4(%eax),%edx
 4b5:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 4bb:	8b 50 08             	mov    0x8(%eax),%edx
 4be:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 4c4:	8b 50 0c             	mov    0xc(%eax),%edx
 4c7:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 4cd:	8b 50 10             	mov    0x10(%eax),%edx
 4d0:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4d6:	8b 50 14             	mov    0x14(%eax),%edx
 4d9:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4df:	8b 50 18             	mov    0x18(%eax),%edx
 4e2:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4e8:	8b 50 1c             	mov    0x1c(%eax),%edx
 4eb:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4f1:	8b 40 20             	mov    0x20(%eax),%eax
 4f4:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 4fa:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 500:	85 c0                	test   %eax,%eax
 502:	0f 85 3a ff ff ff    	jne    442 <ps+0xaa>
  }
}
 508:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 50e:	5b                   	pop    %ebx
 50f:	5e                   	pop    %esi
 510:	5f                   	pop    %edi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    

00000513 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 513:	b8 01 00 00 00       	mov    $0x1,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exit>:
SYSCALL(exit)
 51b:	b8 02 00 00 00       	mov    $0x2,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <wait>:
SYSCALL(wait)
 523:	b8 03 00 00 00       	mov    $0x3,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <pipe>:
SYSCALL(pipe)
 52b:	b8 04 00 00 00       	mov    $0x4,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <read>:
SYSCALL(read)
 533:	b8 05 00 00 00       	mov    $0x5,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <write>:
SYSCALL(write)
 53b:	b8 10 00 00 00       	mov    $0x10,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <close>:
SYSCALL(close)
 543:	b8 15 00 00 00       	mov    $0x15,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <kill>:
SYSCALL(kill)
 54b:	b8 06 00 00 00       	mov    $0x6,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <exec>:
SYSCALL(exec)
 553:	b8 07 00 00 00       	mov    $0x7,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <open>:
SYSCALL(open)
 55b:	b8 0f 00 00 00       	mov    $0xf,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <mknod>:
SYSCALL(mknod)
 563:	b8 11 00 00 00       	mov    $0x11,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <unlink>:
SYSCALL(unlink)
 56b:	b8 12 00 00 00       	mov    $0x12,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <fstat>:
SYSCALL(fstat)
 573:	b8 08 00 00 00       	mov    $0x8,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <link>:
SYSCALL(link)
 57b:	b8 13 00 00 00       	mov    $0x13,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <mkdir>:
SYSCALL(mkdir)
 583:	b8 14 00 00 00       	mov    $0x14,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <chdir>:
SYSCALL(chdir)
 58b:	b8 09 00 00 00       	mov    $0x9,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <dup>:
SYSCALL(dup)
 593:	b8 0a 00 00 00       	mov    $0xa,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <getpid>:
SYSCALL(getpid)
 59b:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <sbrk>:
SYSCALL(sbrk)
 5a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <sleep>:
SYSCALL(sleep)
 5ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <uptime>:
SYSCALL(uptime)
 5b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <getpinfo>:
SYSCALL(getpinfo)
 5bb:	b8 16 00 00 00       	mov    $0x16,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <settickets>:
 5c3:	b8 17 00 00 00       	mov    $0x17,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5cb:	55                   	push   %ebp
 5cc:	89 e5                	mov    %esp,%ebp
 5ce:	83 ec 18             	sub    $0x18,%esp
 5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5d7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5de:	00 
 5df:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	89 04 24             	mov    %eax,(%esp)
 5ec:	e8 4a ff ff ff       	call   53b <write>
}
 5f1:	c9                   	leave  
 5f2:	c3                   	ret    

000005f3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5f3:	55                   	push   %ebp
 5f4:	89 e5                	mov    %esp,%ebp
 5f6:	56                   	push   %esi
 5f7:	53                   	push   %ebx
 5f8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 602:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 606:	74 17                	je     61f <printint+0x2c>
 608:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 60c:	79 11                	jns    61f <printint+0x2c>
    neg = 1;
 60e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 615:	8b 45 0c             	mov    0xc(%ebp),%eax
 618:	f7 d8                	neg    %eax
 61a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 61d:	eb 06                	jmp    625 <printint+0x32>
  } else {
    x = xx;
 61f:	8b 45 0c             	mov    0xc(%ebp),%eax
 622:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 625:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 62c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 62f:	8d 41 01             	lea    0x1(%ecx),%eax
 632:	89 45 f4             	mov    %eax,-0xc(%ebp)
 635:	8b 5d 10             	mov    0x10(%ebp),%ebx
 638:	8b 45 ec             	mov    -0x14(%ebp),%eax
 63b:	ba 00 00 00 00       	mov    $0x0,%edx
 640:	f7 f3                	div    %ebx
 642:	89 d0                	mov    %edx,%eax
 644:	0f b6 80 2c 0e 00 00 	movzbl 0xe2c(%eax),%eax
 64b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 64f:	8b 75 10             	mov    0x10(%ebp),%esi
 652:	8b 45 ec             	mov    -0x14(%ebp),%eax
 655:	ba 00 00 00 00       	mov    $0x0,%edx
 65a:	f7 f6                	div    %esi
 65c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 65f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 663:	75 c7                	jne    62c <printint+0x39>
  if(neg)
 665:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 669:	74 10                	je     67b <printint+0x88>
    buf[i++] = '-';
 66b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 66e:	8d 50 01             	lea    0x1(%eax),%edx
 671:	89 55 f4             	mov    %edx,-0xc(%ebp)
 674:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 679:	eb 1f                	jmp    69a <printint+0xa7>
 67b:	eb 1d                	jmp    69a <printint+0xa7>
    putc(fd, buf[i]);
 67d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 680:	8b 45 f4             	mov    -0xc(%ebp),%eax
 683:	01 d0                	add    %edx,%eax
 685:	0f b6 00             	movzbl (%eax),%eax
 688:	0f be c0             	movsbl %al,%eax
 68b:	89 44 24 04          	mov    %eax,0x4(%esp)
 68f:	8b 45 08             	mov    0x8(%ebp),%eax
 692:	89 04 24             	mov    %eax,(%esp)
 695:	e8 31 ff ff ff       	call   5cb <putc>
  while(--i >= 0)
 69a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 69e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6a2:	79 d9                	jns    67d <printint+0x8a>
}
 6a4:	83 c4 30             	add    $0x30,%esp
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    

000006ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6ab:	55                   	push   %ebp
 6ac:	89 e5                	mov    %esp,%ebp
 6ae:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6b8:	8d 45 0c             	lea    0xc(%ebp),%eax
 6bb:	83 c0 04             	add    $0x4,%eax
 6be:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6c8:	e9 7c 01 00 00       	jmp    849 <printf+0x19e>
    c = fmt[i] & 0xff;
 6cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d3:	01 d0                	add    %edx,%eax
 6d5:	0f b6 00             	movzbl (%eax),%eax
 6d8:	0f be c0             	movsbl %al,%eax
 6db:	25 ff 00 00 00       	and    $0xff,%eax
 6e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6e7:	75 2c                	jne    715 <printf+0x6a>
      if(c == '%'){
 6e9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ed:	75 0c                	jne    6fb <printf+0x50>
        state = '%';
 6ef:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6f6:	e9 4a 01 00 00       	jmp    845 <printf+0x19a>
      } else {
        putc(fd, c);
 6fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fe:	0f be c0             	movsbl %al,%eax
 701:	89 44 24 04          	mov    %eax,0x4(%esp)
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 bb fe ff ff       	call   5cb <putc>
 710:	e9 30 01 00 00       	jmp    845 <printf+0x19a>
      }
    } else if(state == '%'){
 715:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 719:	0f 85 26 01 00 00    	jne    845 <printf+0x19a>
      if(c == 'd'){
 71f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 723:	75 2d                	jne    752 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 725:	8b 45 e8             	mov    -0x18(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 731:	00 
 732:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 739:	00 
 73a:	89 44 24 04          	mov    %eax,0x4(%esp)
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 aa fe ff ff       	call   5f3 <printint>
        ap++;
 749:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 74d:	e9 ec 00 00 00       	jmp    83e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 752:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 756:	74 06                	je     75e <printf+0xb3>
 758:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 75c:	75 2d                	jne    78b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 75e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 76a:	00 
 76b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 772:	00 
 773:	89 44 24 04          	mov    %eax,0x4(%esp)
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 71 fe ff ff       	call   5f3 <printint>
        ap++;
 782:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 786:	e9 b3 00 00 00       	jmp    83e <printf+0x193>
      } else if(c == 's'){
 78b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 78f:	75 45                	jne    7d6 <printf+0x12b>
        s = (char*)*ap;
 791:	8b 45 e8             	mov    -0x18(%ebp),%eax
 794:	8b 00                	mov    (%eax),%eax
 796:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 799:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 79d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a1:	75 09                	jne    7ac <printf+0x101>
          s = "(null)";
 7a3:	c7 45 f4 ae 0b 00 00 	movl   $0xbae,-0xc(%ebp)
        while(*s != 0){
 7aa:	eb 1e                	jmp    7ca <printf+0x11f>
 7ac:	eb 1c                	jmp    7ca <printf+0x11f>
          putc(fd, *s);
 7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b1:	0f b6 00             	movzbl (%eax),%eax
 7b4:	0f be c0             	movsbl %al,%eax
 7b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	89 04 24             	mov    %eax,(%esp)
 7c1:	e8 05 fe ff ff       	call   5cb <putc>
          s++;
 7c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cd:	0f b6 00             	movzbl (%eax),%eax
 7d0:	84 c0                	test   %al,%al
 7d2:	75 da                	jne    7ae <printf+0x103>
 7d4:	eb 68                	jmp    83e <printf+0x193>
        }
      } else if(c == 'c'){
 7d6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7da:	75 1d                	jne    7f9 <printf+0x14e>
        putc(fd, *ap);
 7dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	0f be c0             	movsbl %al,%eax
 7e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	89 04 24             	mov    %eax,(%esp)
 7ee:	e8 d8 fd ff ff       	call   5cb <putc>
        ap++;
 7f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f7:	eb 45                	jmp    83e <printf+0x193>
      } else if(c == '%'){
 7f9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7fd:	75 17                	jne    816 <printf+0x16b>
        putc(fd, c);
 7ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 802:	0f be c0             	movsbl %al,%eax
 805:	89 44 24 04          	mov    %eax,0x4(%esp)
 809:	8b 45 08             	mov    0x8(%ebp),%eax
 80c:	89 04 24             	mov    %eax,(%esp)
 80f:	e8 b7 fd ff ff       	call   5cb <putc>
 814:	eb 28                	jmp    83e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 816:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 81d:	00 
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	89 04 24             	mov    %eax,(%esp)
 824:	e8 a2 fd ff ff       	call   5cb <putc>
        putc(fd, c);
 829:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 82c:	0f be c0             	movsbl %al,%eax
 82f:	89 44 24 04          	mov    %eax,0x4(%esp)
 833:	8b 45 08             	mov    0x8(%ebp),%eax
 836:	89 04 24             	mov    %eax,(%esp)
 839:	e8 8d fd ff ff       	call   5cb <putc>
      }
      state = 0;
 83e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 845:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 849:	8b 55 0c             	mov    0xc(%ebp),%edx
 84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84f:	01 d0                	add    %edx,%eax
 851:	0f b6 00             	movzbl (%eax),%eax
 854:	84 c0                	test   %al,%al
 856:	0f 85 71 fe ff ff    	jne    6cd <printf+0x22>
    }
  }
}
 85c:	c9                   	leave  
 85d:	c3                   	ret    

0000085e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 85e:	55                   	push   %ebp
 85f:	89 e5                	mov    %esp,%ebp
 861:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	83 e8 08             	sub    $0x8,%eax
 86a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86d:	a1 48 0e 00 00       	mov    0xe48,%eax
 872:	89 45 fc             	mov    %eax,-0x4(%ebp)
 875:	eb 24                	jmp    89b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 877:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 87f:	77 12                	ja     893 <free+0x35>
 881:	8b 45 f8             	mov    -0x8(%ebp),%eax
 884:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 887:	77 24                	ja     8ad <free+0x4f>
 889:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88c:	8b 00                	mov    (%eax),%eax
 88e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 891:	77 1a                	ja     8ad <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 893:	8b 45 fc             	mov    -0x4(%ebp),%eax
 896:	8b 00                	mov    (%eax),%eax
 898:	89 45 fc             	mov    %eax,-0x4(%ebp)
 89b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a1:	76 d4                	jbe    877 <free+0x19>
 8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a6:	8b 00                	mov    (%eax),%eax
 8a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ab:	76 ca                	jbe    877 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b0:	8b 40 04             	mov    0x4(%eax),%eax
 8b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bd:	01 c2                	add    %eax,%edx
 8bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c2:	8b 00                	mov    (%eax),%eax
 8c4:	39 c2                	cmp    %eax,%edx
 8c6:	75 24                	jne    8ec <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cb:	8b 50 04             	mov    0x4(%eax),%edx
 8ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d1:	8b 00                	mov    (%eax),%eax
 8d3:	8b 40 04             	mov    0x4(%eax),%eax
 8d6:	01 c2                	add    %eax,%edx
 8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8db:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e1:	8b 00                	mov    (%eax),%eax
 8e3:	8b 10                	mov    (%eax),%edx
 8e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e8:	89 10                	mov    %edx,(%eax)
 8ea:	eb 0a                	jmp    8f6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ef:	8b 10                	mov    (%eax),%edx
 8f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f9:	8b 40 04             	mov    0x4(%eax),%eax
 8fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 903:	8b 45 fc             	mov    -0x4(%ebp),%eax
 906:	01 d0                	add    %edx,%eax
 908:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 90b:	75 20                	jne    92d <free+0xcf>
    p->s.size += bp->s.size;
 90d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 910:	8b 50 04             	mov    0x4(%eax),%edx
 913:	8b 45 f8             	mov    -0x8(%ebp),%eax
 916:	8b 40 04             	mov    0x4(%eax),%eax
 919:	01 c2                	add    %eax,%edx
 91b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 921:	8b 45 f8             	mov    -0x8(%ebp),%eax
 924:	8b 10                	mov    (%eax),%edx
 926:	8b 45 fc             	mov    -0x4(%ebp),%eax
 929:	89 10                	mov    %edx,(%eax)
 92b:	eb 08                	jmp    935 <free+0xd7>
  } else
    p->s.ptr = bp;
 92d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 930:	8b 55 f8             	mov    -0x8(%ebp),%edx
 933:	89 10                	mov    %edx,(%eax)
  freep = p;
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 93d:	c9                   	leave  
 93e:	c3                   	ret    

0000093f <morecore>:

static Header*
morecore(uint nu)
{
 93f:	55                   	push   %ebp
 940:	89 e5                	mov    %esp,%ebp
 942:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 945:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 94c:	77 07                	ja     955 <morecore+0x16>
    nu = 4096;
 94e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 955:	8b 45 08             	mov    0x8(%ebp),%eax
 958:	c1 e0 03             	shl    $0x3,%eax
 95b:	89 04 24             	mov    %eax,(%esp)
 95e:	e8 40 fc ff ff       	call   5a3 <sbrk>
 963:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 966:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 96a:	75 07                	jne    973 <morecore+0x34>
    return 0;
 96c:	b8 00 00 00 00       	mov    $0x0,%eax
 971:	eb 22                	jmp    995 <morecore+0x56>
  hp = (Header*)p;
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 979:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97c:	8b 55 08             	mov    0x8(%ebp),%edx
 97f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 982:	8b 45 f0             	mov    -0x10(%ebp),%eax
 985:	83 c0 08             	add    $0x8,%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 ce fe ff ff       	call   85e <free>
  return freep;
 990:	a1 48 0e 00 00       	mov    0xe48,%eax
}
 995:	c9                   	leave  
 996:	c3                   	ret    

00000997 <malloc>:

void*
malloc(uint nbytes)
{
 997:	55                   	push   %ebp
 998:	89 e5                	mov    %esp,%ebp
 99a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 99d:	8b 45 08             	mov    0x8(%ebp),%eax
 9a0:	83 c0 07             	add    $0x7,%eax
 9a3:	c1 e8 03             	shr    $0x3,%eax
 9a6:	83 c0 01             	add    $0x1,%eax
 9a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9ac:	a1 48 0e 00 00       	mov    0xe48,%eax
 9b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9b8:	75 23                	jne    9dd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9ba:	c7 45 f0 40 0e 00 00 	movl   $0xe40,-0x10(%ebp)
 9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c4:	a3 48 0e 00 00       	mov    %eax,0xe48
 9c9:	a1 48 0e 00 00       	mov    0xe48,%eax
 9ce:	a3 40 0e 00 00       	mov    %eax,0xe40
    base.s.size = 0;
 9d3:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 9da:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e0:	8b 00                	mov    (%eax),%eax
 9e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9ee:	72 4d                	jb     a3d <malloc+0xa6>
      if(p->s.size == nunits)
 9f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f3:	8b 40 04             	mov    0x4(%eax),%eax
 9f6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9f9:	75 0c                	jne    a07 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fe:	8b 10                	mov    (%eax),%edx
 a00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a03:	89 10                	mov    %edx,(%eax)
 a05:	eb 26                	jmp    a2d <malloc+0x96>
      else {
        p->s.size -= nunits;
 a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0a:	8b 40 04             	mov    0x4(%eax),%eax
 a0d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a10:	89 c2                	mov    %eax,%edx
 a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a15:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1b:	8b 40 04             	mov    0x4(%eax),%eax
 a1e:	c1 e0 03             	shl    $0x3,%eax
 a21:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a27:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a2a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a30:	a3 48 0e 00 00       	mov    %eax,0xe48
      return (void*)(p + 1);
 a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a38:	83 c0 08             	add    $0x8,%eax
 a3b:	eb 38                	jmp    a75 <malloc+0xde>
    }
    if(p == freep)
 a3d:	a1 48 0e 00 00       	mov    0xe48,%eax
 a42:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a45:	75 1b                	jne    a62 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a47:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a4a:	89 04 24             	mov    %eax,(%esp)
 a4d:	e8 ed fe ff ff       	call   93f <morecore>
 a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a59:	75 07                	jne    a62 <malloc+0xcb>
        return 0;
 a5b:	b8 00 00 00 00       	mov    $0x0,%eax
 a60:	eb 13                	jmp    a75 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a65:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6b:	8b 00                	mov    (%eax),%eax
 a6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a70:	e9 70 ff ff ff       	jmp    9e5 <malloc+0x4e>
}
 a75:	c9                   	leave  
 a76:	c3                   	ret    
