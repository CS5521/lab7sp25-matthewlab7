
_schedtest:     file format elf32-i386


Disassembly of section .text:

00000000 <loop_forever>:
#include "types.h"
#include "user.h"
#include "stat.h"

void loop_forever() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
    while (1);
   3:	eb fe                	jmp    3 <loop_forever+0x3>

00000005 <main>:
}

int main(int argc, char *argv[])
{
   5:	55                   	push   %ebp
   6:	89 e5                	mov    %esp,%ebp
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	83 ec 40             	sub    $0x40,%esp
    if (argc < 3 || argc > 9)
   e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  12:	7e 06                	jle    1a <main+0x15>
  14:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
  18:	7e 55                	jle    6f <main+0x6a>
    {
        printf(2, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
  1a:	c7 44 24 04 24 0b 00 	movl   $0xb24,0x4(%esp)
  21:	00 
  22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  29:	e8 28 07 00 00       	call   756 <printf>
        printf(2, "     loops must be greater than 0\n");
  2e:	c7 44 24 04 60 0b 00 	movl   $0xb60,0x4(%esp)
  35:	00 
  36:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  3d:	e8 14 07 00 00       	call   756 <printf>
        printf(2, "     tickets must be greater than or equal to  10\n");
  42:	c7 44 24 04 84 0b 00 	movl   $0xb84,0x4(%esp)
  49:	00 
  4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  51:	e8 00 07 00 00       	call   756 <printf>
        printf(2, "     up to 7 tickets can be provided\n");
  56:	c7 44 24 04 b8 0b 00 	movl   $0xbb8,0x4(%esp)
  5d:	00 
  5e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  65:	e8 ec 06 00 00       	call   756 <printf>
        exit();
  6a:	e8 57 05 00 00       	call   5c6 <exit>
    }

    int loops = atoi(argv[1]);
  6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  72:	83 c0 04             	add    $0x4,%eax
  75:	8b 00                	mov    (%eax),%eax
  77:	89 04 24             	mov    %eax,(%esp)
  7a:	e8 3a 03 00 00       	call   3b9 <atoi>
  7f:	89 44 24 38          	mov    %eax,0x38(%esp)
    if (loops <= 0)
  83:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
  88:	7f 19                	jg     a3 <main+0x9e>
    {
        printf(2, "loops must be greater than 0\n");
  8a:	c7 44 24 04 de 0b 00 	movl   $0xbde,0x4(%esp)
  91:	00 
  92:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  99:	e8 b8 06 00 00       	call   756 <printf>
        exit();
  9e:	e8 23 05 00 00       	call   5c6 <exit>
    }
    int tickets[7];
    int num_tickets = argc -2;
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	83 e8 02             	sub    $0x2,%eax
  a9:	89 44 24 34          	mov    %eax,0x34(%esp)
    int i;
    for (i = 0; i < num_tickets; i++)
  ad:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  b4:	00 
  b5:	e9 a5 00 00 00       	jmp    15f <main+0x15a>
    {
        tickets[i] = atoi(argv[i + 2]);
  ba:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  be:	83 c0 02             	add    $0x2,%eax
  c1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  cb:	01 d0                	add    %edx,%eax
  cd:	8b 00                	mov    (%eax),%eax
  cf:	89 04 24             	mov    %eax,(%esp)
  d2:	e8 e2 02 00 00       	call   3b9 <atoi>
  d7:	8b 54 24 3c          	mov    0x3c(%esp),%edx
  db:	89 44 94 14          	mov    %eax,0x14(%esp,%edx,4)
        if (tickets[i] < 10)
  df:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  e3:	8b 44 84 14          	mov    0x14(%esp,%eax,4),%eax
  e7:	83 f8 09             	cmp    $0x9,%eax
  ea:	7f 19                	jg     105 <main+0x100>
        {
            printf(2, "tickets must be greater than or equal to 10\n");
  ec:	c7 44 24 04 fc 0b 00 	movl   $0xbfc,0x4(%esp)
  f3:	00 
  f4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  fb:	e8 56 06 00 00       	call   756 <printf>
            exit();
 100:	e8 c1 04 00 00       	call   5c6 <exit>
        }
    
    
        int pid = fork();
 105:	e8 b4 04 00 00       	call   5be <fork>
 10a:	89 44 24 30          	mov    %eax,0x30(%esp)
        if (pid == 0)
 10e:	83 7c 24 30 00       	cmpl   $0x0,0x30(%esp)
 113:	75 17                	jne    12c <main+0x127>
        {
            settickets(tickets[i]);
 115:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 119:	8b 44 84 14          	mov    0x14(%esp,%eax,4),%eax
 11d:	89 04 24             	mov    %eax,(%esp)
 120:	e8 49 05 00 00       	call   66e <settickets>
            loop_forever();
 125:	e8 d6 fe ff ff       	call   0 <loop_forever>
 12a:	eb 2e                	jmp    15a <main+0x155>
        }
        else if (pid > 0)
 12c:	83 7c 24 30 00       	cmpl   $0x0,0x30(%esp)
 131:	7e 0e                	jle    141 <main+0x13c>
        {
            tickets[i] = pid;
 133:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 137:	8b 54 24 30          	mov    0x30(%esp),%edx
 13b:	89 54 84 14          	mov    %edx,0x14(%esp,%eax,4)
 13f:	eb 19                	jmp    15a <main+0x155>
        }
        else
        {
            printf(2, "fork failed\n");
 141:	c7 44 24 04 29 0c 00 	movl   $0xc29,0x4(%esp)
 148:	00 
 149:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 150:	e8 01 06 00 00       	call   756 <printf>
            exit();
 155:	e8 6c 04 00 00       	call   5c6 <exit>
    for (i = 0; i < num_tickets; i++)
 15a:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 15f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 163:	3b 44 24 34          	cmp    0x34(%esp),%eax
 167:	0f 8c 4d ff ff ff    	jl     ba <main+0xb5>
        }
    }

    for (i = 0; i < loops; i++)
 16d:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 174:	00 
 175:	eb 16                	jmp    18d <main+0x188>
    {
        ps();
 177:	e8 c7 02 00 00       	call   443 <ps>
        sleep(3);
 17c:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 183:	e8 ce 04 00 00       	call   656 <sleep>
    for (i = 0; i < loops; i++)
 188:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 18d:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 191:	3b 44 24 38          	cmp    0x38(%esp),%eax
 195:	7c e0                	jl     177 <main+0x172>
    }

    for (i = 0; i < num_tickets; i++)
 197:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 19e:	00 
 19f:	eb 15                	jmp    1b6 <main+0x1b1>
    {
        kill(tickets[i]);
 1a1:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1a5:	8b 44 84 14          	mov    0x14(%esp,%eax,4),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 45 04 00 00       	call   5f6 <kill>
    for (i = 0; i < num_tickets; i++)
 1b1:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 1b6:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1ba:	3b 44 24 34          	cmp    0x34(%esp),%eax
 1be:	7c e1                	jl     1a1 <main+0x19c>
    }
    for (i = 0; i < num_tickets; i++)
 1c0:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 1c7:	00 
 1c8:	eb 0a                	jmp    1d4 <main+0x1cf>
    {
        wait();
 1ca:	e8 ff 03 00 00       	call   5ce <wait>
    for (i = 0; i < num_tickets; i++)
 1cf:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 1d4:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1d8:	3b 44 24 34          	cmp    0x34(%esp),%eax
 1dc:	7c ec                	jl     1ca <main+0x1c5>
    }

    exit();
 1de:	e8 e3 03 00 00       	call   5c6 <exit>

000001e3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	57                   	push   %edi
 1e7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1eb:	8b 55 10             	mov    0x10(%ebp),%edx
 1ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f1:	89 cb                	mov    %ecx,%ebx
 1f3:	89 df                	mov    %ebx,%edi
 1f5:	89 d1                	mov    %edx,%ecx
 1f7:	fc                   	cld    
 1f8:	f3 aa                	rep stos %al,%es:(%edi)
 1fa:	89 ca                	mov    %ecx,%edx
 1fc:	89 fb                	mov    %edi,%ebx
 1fe:	89 5d 08             	mov    %ebx,0x8(%ebp)
 201:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 204:	5b                   	pop    %ebx
 205:	5f                   	pop    %edi
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    

00000208 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 214:	90                   	nop
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	8d 50 01             	lea    0x1(%eax),%edx
 21b:	89 55 08             	mov    %edx,0x8(%ebp)
 21e:	8b 55 0c             	mov    0xc(%ebp),%edx
 221:	8d 4a 01             	lea    0x1(%edx),%ecx
 224:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 227:	0f b6 12             	movzbl (%edx),%edx
 22a:	88 10                	mov    %dl,(%eax)
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	84 c0                	test   %al,%al
 231:	75 e2                	jne    215 <strcpy+0xd>
    ;
  return os;
 233:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 236:	c9                   	leave  
 237:	c3                   	ret    

00000238 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 238:	55                   	push   %ebp
 239:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 23b:	eb 08                	jmp    245 <strcmp+0xd>
    p++, q++;
 23d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 241:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 00             	movzbl (%eax),%eax
 24b:	84 c0                	test   %al,%al
 24d:	74 10                	je     25f <strcmp+0x27>
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	0f b6 10             	movzbl (%eax),%edx
 255:	8b 45 0c             	mov    0xc(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	38 c2                	cmp    %al,%dl
 25d:	74 de                	je     23d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	0f b6 d0             	movzbl %al,%edx
 268:	8b 45 0c             	mov    0xc(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	0f b6 c0             	movzbl %al,%eax
 271:	29 c2                	sub    %eax,%edx
 273:	89 d0                	mov    %edx,%eax
}
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    

00000277 <strlen>:

uint
strlen(const char *s)
{
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 27d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 284:	eb 04                	jmp    28a <strlen+0x13>
 286:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 28a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 d0                	add    %edx,%eax
 292:	0f b6 00             	movzbl (%eax),%eax
 295:	84 c0                	test   %al,%al
 297:	75 ed                	jne    286 <strlen+0xf>
    ;
  return n;
 299:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29c:	c9                   	leave  
 29d:	c3                   	ret    

0000029e <memset>:

void*
memset(void *dst, int c, uint n)
{
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	89 04 24             	mov    %eax,(%esp)
 2b8:	e8 26 ff ff ff       	call   1e3 <stosb>
  return dst;
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c0:	c9                   	leave  
 2c1:	c3                   	ret    

000002c2 <strchr>:

char*
strchr(const char *s, char c)
{
 2c2:	55                   	push   %ebp
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	83 ec 04             	sub    $0x4,%esp
 2c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2ce:	eb 14                	jmp    2e4 <strchr+0x22>
    if(*s == c)
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	0f b6 00             	movzbl (%eax),%eax
 2d6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2d9:	75 05                	jne    2e0 <strchr+0x1e>
      return (char*)s;
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	eb 13                	jmp    2f3 <strchr+0x31>
  for(; *s; s++)
 2e0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	0f b6 00             	movzbl (%eax),%eax
 2ea:	84 c0                	test   %al,%al
 2ec:	75 e2                	jne    2d0 <strchr+0xe>
  return 0;
 2ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f3:	c9                   	leave  
 2f4:	c3                   	ret    

000002f5 <gets>:

char*
gets(char *buf, int max)
{
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 302:	eb 4c                	jmp    350 <gets+0x5b>
    cc = read(0, &c, 1);
 304:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 30b:	00 
 30c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 30f:	89 44 24 04          	mov    %eax,0x4(%esp)
 313:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31a:	e8 bf 02 00 00       	call   5de <read>
 31f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 322:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 326:	7f 02                	jg     32a <gets+0x35>
      break;
 328:	eb 31                	jmp    35b <gets+0x66>
    buf[i++] = c;
 32a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 32d:	8d 50 01             	lea    0x1(%eax),%edx
 330:	89 55 f4             	mov    %edx,-0xc(%ebp)
 333:	89 c2                	mov    %eax,%edx
 335:	8b 45 08             	mov    0x8(%ebp),%eax
 338:	01 c2                	add    %eax,%edx
 33a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 340:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 344:	3c 0a                	cmp    $0xa,%al
 346:	74 13                	je     35b <gets+0x66>
 348:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 34c:	3c 0d                	cmp    $0xd,%al
 34e:	74 0b                	je     35b <gets+0x66>
  for(i=0; i+1 < max; ){
 350:	8b 45 f4             	mov    -0xc(%ebp),%eax
 353:	83 c0 01             	add    $0x1,%eax
 356:	3b 45 0c             	cmp    0xc(%ebp),%eax
 359:	7c a9                	jl     304 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 35b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 35e:	8b 45 08             	mov    0x8(%ebp),%eax
 361:	01 d0                	add    %edx,%eax
 363:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 366:	8b 45 08             	mov    0x8(%ebp),%eax
}
 369:	c9                   	leave  
 36a:	c3                   	ret    

0000036b <stat>:

int
stat(const char *n, struct stat *st)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 371:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 378:	00 
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 82 02 00 00       	call   606 <open>
 384:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 387:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 38b:	79 07                	jns    394 <stat+0x29>
    return -1;
 38d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 392:	eb 23                	jmp    3b7 <stat+0x4c>
  r = fstat(fd, st);
 394:	8b 45 0c             	mov    0xc(%ebp),%eax
 397:	89 44 24 04          	mov    %eax,0x4(%esp)
 39b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39e:	89 04 24             	mov    %eax,(%esp)
 3a1:	e8 78 02 00 00       	call   61e <fstat>
 3a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ac:	89 04 24             	mov    %eax,(%esp)
 3af:	e8 3a 02 00 00       	call   5ee <close>
  return r;
 3b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3b7:	c9                   	leave  
 3b8:	c3                   	ret    

000003b9 <atoi>:

int
atoi(const char *s)
{
 3b9:	55                   	push   %ebp
 3ba:	89 e5                	mov    %esp,%ebp
 3bc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c6:	eb 25                	jmp    3ed <atoi+0x34>
    n = n*10 + *s++ - '0';
 3c8:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3cb:	89 d0                	mov    %edx,%eax
 3cd:	c1 e0 02             	shl    $0x2,%eax
 3d0:	01 d0                	add    %edx,%eax
 3d2:	01 c0                	add    %eax,%eax
 3d4:	89 c1                	mov    %eax,%ecx
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	8d 50 01             	lea    0x1(%eax),%edx
 3dc:	89 55 08             	mov    %edx,0x8(%ebp)
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f be c0             	movsbl %al,%eax
 3e5:	01 c8                	add    %ecx,%eax
 3e7:	83 e8 30             	sub    $0x30,%eax
 3ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 2f                	cmp    $0x2f,%al
 3f5:	7e 0a                	jle    401 <atoi+0x48>
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
 3fd:	3c 39                	cmp    $0x39,%al
 3ff:	7e c7                	jle    3c8 <atoi+0xf>
  return n;
 401:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 40c:	8b 45 08             	mov    0x8(%ebp),%eax
 40f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 418:	eb 17                	jmp    431 <memmove+0x2b>
    *dst++ = *src++;
 41a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 41d:	8d 50 01             	lea    0x1(%eax),%edx
 420:	89 55 fc             	mov    %edx,-0x4(%ebp)
 423:	8b 55 f8             	mov    -0x8(%ebp),%edx
 426:	8d 4a 01             	lea    0x1(%edx),%ecx
 429:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 42c:	0f b6 12             	movzbl (%edx),%edx
 42f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 431:	8b 45 10             	mov    0x10(%ebp),%eax
 434:	8d 50 ff             	lea    -0x1(%eax),%edx
 437:	89 55 10             	mov    %edx,0x10(%ebp)
 43a:	85 c0                	test   %eax,%eax
 43c:	7f dc                	jg     41a <memmove+0x14>
  return vdst;
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 441:	c9                   	leave  
 442:	c3                   	ret    

00000443 <ps>:

void
ps()
{
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	57                   	push   %edi
 447:	56                   	push   %esi
 448:	53                   	push   %ebx
 449:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 44f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 455:	89 04 24             	mov    %eax,(%esp)
 458:	e8 09 02 00 00       	call   666 <getpinfo>
 45d:	83 f8 ff             	cmp    $0xffffffff,%eax
 460:	0f 84 4d 01 00 00    	je     5b3 <ps+0x170>
    return;
  int i = 0;
 466:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 46d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 470:	89 d0                	mov    %edx,%eax
 472:	c1 e0 03             	shl    $0x3,%eax
 475:	01 d0                	add    %edx,%eax
 477:	c1 e0 02             	shl    $0x2,%eax
 47a:	8d 7d e8             	lea    -0x18(%ebp),%edi
 47d:	01 f8                	add    %edi,%eax
 47f:	2d 04 09 00 00       	sub    $0x904,%eax
 484:	8b 10                	mov    (%eax),%edx
 486:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 48c:	8b 50 04             	mov    0x4(%eax),%edx
 48f:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 495:	8b 50 08             	mov    0x8(%eax),%edx
 498:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 49e:	8b 50 0c             	mov    0xc(%eax),%edx
 4a1:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 4a7:	8b 50 10             	mov    0x10(%eax),%edx
 4aa:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 4b0:	8b 50 14             	mov    0x14(%eax),%edx
 4b3:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 4b9:	8b 50 18             	mov    0x18(%eax),%edx
 4bc:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 4c2:	8b 50 1c             	mov    0x1c(%eax),%edx
 4c5:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 4cb:	8b 40 20             	mov    0x20(%eax),%eax
 4ce:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 4d4:	c7 44 24 04 36 0c 00 	movl   $0xc36,0x4(%esp)
 4db:	00 
 4dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4e3:	e8 6e 02 00 00       	call   756 <printf>
  for(;p.pid != 0; p = table[i])
 4e8:	e9 b8 00 00 00       	jmp    5a5 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 4ed:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 4f4:	0f be d8             	movsbl %al,%ebx
 4f7:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 4fd:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 503:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 509:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 50f:	83 c6 10             	add    $0x10,%esi
 512:	89 74 24 18          	mov    %esi,0x18(%esp)
 516:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 51a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 51e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 522:	89 44 24 08          	mov    %eax,0x8(%esp)
 526:	c7 44 24 04 4f 0c 00 	movl   $0xc4f,0x4(%esp)
 52d:	00 
 52e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 535:	e8 1c 02 00 00       	call   756 <printf>
    i++;
 53a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 53e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 541:	89 d0                	mov    %edx,%eax
 543:	c1 e0 03             	shl    $0x3,%eax
 546:	01 d0                	add    %edx,%eax
 548:	c1 e0 02             	shl    $0x2,%eax
 54b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 54e:	01 c8                	add    %ecx,%eax
 550:	2d 04 09 00 00       	sub    $0x904,%eax
 555:	8b 10                	mov    (%eax),%edx
 557:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 55d:	8b 50 04             	mov    0x4(%eax),%edx
 560:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 566:	8b 50 08             	mov    0x8(%eax),%edx
 569:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 56f:	8b 50 0c             	mov    0xc(%eax),%edx
 572:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 578:	8b 50 10             	mov    0x10(%eax),%edx
 57b:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 581:	8b 50 14             	mov    0x14(%eax),%edx
 584:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 58a:	8b 50 18             	mov    0x18(%eax),%edx
 58d:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 593:	8b 50 1c             	mov    0x1c(%eax),%edx
 596:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 59c:	8b 40 20             	mov    0x20(%eax),%eax
 59f:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 5a5:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 5ab:	85 c0                	test   %eax,%eax
 5ad:	0f 85 3a ff ff ff    	jne    4ed <ps+0xaa>
  }
}
 5b3:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 5b9:	5b                   	pop    %ebx
 5ba:	5e                   	pop    %esi
 5bb:	5f                   	pop    %edi
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    

000005be <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5be:	b8 01 00 00 00       	mov    $0x1,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <exit>:
SYSCALL(exit)
 5c6:	b8 02 00 00 00       	mov    $0x2,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <wait>:
SYSCALL(wait)
 5ce:	b8 03 00 00 00       	mov    $0x3,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <pipe>:
SYSCALL(pipe)
 5d6:	b8 04 00 00 00       	mov    $0x4,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <read>:
SYSCALL(read)
 5de:	b8 05 00 00 00       	mov    $0x5,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <write>:
SYSCALL(write)
 5e6:	b8 10 00 00 00       	mov    $0x10,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <close>:
SYSCALL(close)
 5ee:	b8 15 00 00 00       	mov    $0x15,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <kill>:
SYSCALL(kill)
 5f6:	b8 06 00 00 00       	mov    $0x6,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <exec>:
SYSCALL(exec)
 5fe:	b8 07 00 00 00       	mov    $0x7,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <open>:
SYSCALL(open)
 606:	b8 0f 00 00 00       	mov    $0xf,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <mknod>:
SYSCALL(mknod)
 60e:	b8 11 00 00 00       	mov    $0x11,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <unlink>:
SYSCALL(unlink)
 616:	b8 12 00 00 00       	mov    $0x12,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <fstat>:
SYSCALL(fstat)
 61e:	b8 08 00 00 00       	mov    $0x8,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <link>:
SYSCALL(link)
 626:	b8 13 00 00 00       	mov    $0x13,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <mkdir>:
SYSCALL(mkdir)
 62e:	b8 14 00 00 00       	mov    $0x14,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <chdir>:
SYSCALL(chdir)
 636:	b8 09 00 00 00       	mov    $0x9,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <dup>:
SYSCALL(dup)
 63e:	b8 0a 00 00 00       	mov    $0xa,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <getpid>:
SYSCALL(getpid)
 646:	b8 0b 00 00 00       	mov    $0xb,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <sbrk>:
SYSCALL(sbrk)
 64e:	b8 0c 00 00 00       	mov    $0xc,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <sleep>:
SYSCALL(sleep)
 656:	b8 0d 00 00 00       	mov    $0xd,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <uptime>:
SYSCALL(uptime)
 65e:	b8 0e 00 00 00       	mov    $0xe,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <getpinfo>:
SYSCALL(getpinfo)
 666:	b8 16 00 00 00       	mov    $0x16,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <settickets>:
 66e:	b8 17 00 00 00       	mov    $0x17,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	83 ec 18             	sub    $0x18,%esp
 67c:	8b 45 0c             	mov    0xc(%ebp),%eax
 67f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 682:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 689:	00 
 68a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 68d:	89 44 24 04          	mov    %eax,0x4(%esp)
 691:	8b 45 08             	mov    0x8(%ebp),%eax
 694:	89 04 24             	mov    %eax,(%esp)
 697:	e8 4a ff ff ff       	call   5e6 <write>
}
 69c:	c9                   	leave  
 69d:	c3                   	ret    

0000069e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 69e:	55                   	push   %ebp
 69f:	89 e5                	mov    %esp,%ebp
 6a1:	56                   	push   %esi
 6a2:	53                   	push   %ebx
 6a3:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6a6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6ad:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6b1:	74 17                	je     6ca <printint+0x2c>
 6b3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6b7:	79 11                	jns    6ca <printint+0x2c>
    neg = 1;
 6b9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c3:	f7 d8                	neg    %eax
 6c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6c8:	eb 06                	jmp    6d0 <printint+0x32>
  } else {
    x = xx;
 6ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 6cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6d7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6da:	8d 41 01             	lea    0x1(%ecx),%eax
 6dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6e0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e6:	ba 00 00 00 00       	mov    $0x0,%edx
 6eb:	f7 f3                	div    %ebx
 6ed:	89 d0                	mov    %edx,%eax
 6ef:	0f b6 80 f8 0e 00 00 	movzbl 0xef8(%eax),%eax
 6f6:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6fa:	8b 75 10             	mov    0x10(%ebp),%esi
 6fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 700:	ba 00 00 00 00       	mov    $0x0,%edx
 705:	f7 f6                	div    %esi
 707:	89 45 ec             	mov    %eax,-0x14(%ebp)
 70a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 70e:	75 c7                	jne    6d7 <printint+0x39>
  if(neg)
 710:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 714:	74 10                	je     726 <printint+0x88>
    buf[i++] = '-';
 716:	8b 45 f4             	mov    -0xc(%ebp),%eax
 719:	8d 50 01             	lea    0x1(%eax),%edx
 71c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 71f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 724:	eb 1f                	jmp    745 <printint+0xa7>
 726:	eb 1d                	jmp    745 <printint+0xa7>
    putc(fd, buf[i]);
 728:	8d 55 dc             	lea    -0x24(%ebp),%edx
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	01 d0                	add    %edx,%eax
 730:	0f b6 00             	movzbl (%eax),%eax
 733:	0f be c0             	movsbl %al,%eax
 736:	89 44 24 04          	mov    %eax,0x4(%esp)
 73a:	8b 45 08             	mov    0x8(%ebp),%eax
 73d:	89 04 24             	mov    %eax,(%esp)
 740:	e8 31 ff ff ff       	call   676 <putc>
  while(--i >= 0)
 745:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 749:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 74d:	79 d9                	jns    728 <printint+0x8a>
}
 74f:	83 c4 30             	add    $0x30,%esp
 752:	5b                   	pop    %ebx
 753:	5e                   	pop    %esi
 754:	5d                   	pop    %ebp
 755:	c3                   	ret    

00000756 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 75c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 763:	8d 45 0c             	lea    0xc(%ebp),%eax
 766:	83 c0 04             	add    $0x4,%eax
 769:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 76c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 773:	e9 7c 01 00 00       	jmp    8f4 <printf+0x19e>
    c = fmt[i] & 0xff;
 778:	8b 55 0c             	mov    0xc(%ebp),%edx
 77b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77e:	01 d0                	add    %edx,%eax
 780:	0f b6 00             	movzbl (%eax),%eax
 783:	0f be c0             	movsbl %al,%eax
 786:	25 ff 00 00 00       	and    $0xff,%eax
 78b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 78e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 792:	75 2c                	jne    7c0 <printf+0x6a>
      if(c == '%'){
 794:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 798:	75 0c                	jne    7a6 <printf+0x50>
        state = '%';
 79a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7a1:	e9 4a 01 00 00       	jmp    8f0 <printf+0x19a>
      } else {
        putc(fd, c);
 7a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a9:	0f be c0             	movsbl %al,%eax
 7ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	89 04 24             	mov    %eax,(%esp)
 7b6:	e8 bb fe ff ff       	call   676 <putc>
 7bb:	e9 30 01 00 00       	jmp    8f0 <printf+0x19a>
      }
    } else if(state == '%'){
 7c0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7c4:	0f 85 26 01 00 00    	jne    8f0 <printf+0x19a>
      if(c == 'd'){
 7ca:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7ce:	75 2d                	jne    7fd <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7dc:	00 
 7dd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7e4:	00 
 7e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	89 04 24             	mov    %eax,(%esp)
 7ef:	e8 aa fe ff ff       	call   69e <printint>
        ap++;
 7f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f8:	e9 ec 00 00 00       	jmp    8e9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7fd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 801:	74 06                	je     809 <printf+0xb3>
 803:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 807:	75 2d                	jne    836 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 809:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80c:	8b 00                	mov    (%eax),%eax
 80e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 815:	00 
 816:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 81d:	00 
 81e:	89 44 24 04          	mov    %eax,0x4(%esp)
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	89 04 24             	mov    %eax,(%esp)
 828:	e8 71 fe ff ff       	call   69e <printint>
        ap++;
 82d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 831:	e9 b3 00 00 00       	jmp    8e9 <printf+0x193>
      } else if(c == 's'){
 836:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 83a:	75 45                	jne    881 <printf+0x12b>
        s = (char*)*ap;
 83c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 83f:	8b 00                	mov    (%eax),%eax
 841:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 844:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 848:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 84c:	75 09                	jne    857 <printf+0x101>
          s = "(null)";
 84e:	c7 45 f4 5f 0c 00 00 	movl   $0xc5f,-0xc(%ebp)
        while(*s != 0){
 855:	eb 1e                	jmp    875 <printf+0x11f>
 857:	eb 1c                	jmp    875 <printf+0x11f>
          putc(fd, *s);
 859:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85c:	0f b6 00             	movzbl (%eax),%eax
 85f:	0f be c0             	movsbl %al,%eax
 862:	89 44 24 04          	mov    %eax,0x4(%esp)
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	89 04 24             	mov    %eax,(%esp)
 86c:	e8 05 fe ff ff       	call   676 <putc>
          s++;
 871:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 875:	8b 45 f4             	mov    -0xc(%ebp),%eax
 878:	0f b6 00             	movzbl (%eax),%eax
 87b:	84 c0                	test   %al,%al
 87d:	75 da                	jne    859 <printf+0x103>
 87f:	eb 68                	jmp    8e9 <printf+0x193>
        }
      } else if(c == 'c'){
 881:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 885:	75 1d                	jne    8a4 <printf+0x14e>
        putc(fd, *ap);
 887:	8b 45 e8             	mov    -0x18(%ebp),%eax
 88a:	8b 00                	mov    (%eax),%eax
 88c:	0f be c0             	movsbl %al,%eax
 88f:	89 44 24 04          	mov    %eax,0x4(%esp)
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	89 04 24             	mov    %eax,(%esp)
 899:	e8 d8 fd ff ff       	call   676 <putc>
        ap++;
 89e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8a2:	eb 45                	jmp    8e9 <printf+0x193>
      } else if(c == '%'){
 8a4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8a8:	75 17                	jne    8c1 <printf+0x16b>
        putc(fd, c);
 8aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ad:	0f be c0             	movsbl %al,%eax
 8b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	89 04 24             	mov    %eax,(%esp)
 8ba:	e8 b7 fd ff ff       	call   676 <putc>
 8bf:	eb 28                	jmp    8e9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8c1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8c8:	00 
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 a2 fd ff ff       	call   676 <putc>
        putc(fd, c);
 8d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d7:	0f be c0             	movsbl %al,%eax
 8da:	89 44 24 04          	mov    %eax,0x4(%esp)
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	89 04 24             	mov    %eax,(%esp)
 8e4:	e8 8d fd ff ff       	call   676 <putc>
      }
      state = 0;
 8e9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8f0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8f4:	8b 55 0c             	mov    0xc(%ebp),%edx
 8f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fa:	01 d0                	add    %edx,%eax
 8fc:	0f b6 00             	movzbl (%eax),%eax
 8ff:	84 c0                	test   %al,%al
 901:	0f 85 71 fe ff ff    	jne    778 <printf+0x22>
    }
  }
}
 907:	c9                   	leave  
 908:	c3                   	ret    

00000909 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 909:	55                   	push   %ebp
 90a:	89 e5                	mov    %esp,%ebp
 90c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 90f:	8b 45 08             	mov    0x8(%ebp),%eax
 912:	83 e8 08             	sub    $0x8,%eax
 915:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 918:	a1 14 0f 00 00       	mov    0xf14,%eax
 91d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 920:	eb 24                	jmp    946 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 922:	8b 45 fc             	mov    -0x4(%ebp),%eax
 925:	8b 00                	mov    (%eax),%eax
 927:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 92a:	77 12                	ja     93e <free+0x35>
 92c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 932:	77 24                	ja     958 <free+0x4f>
 934:	8b 45 fc             	mov    -0x4(%ebp),%eax
 937:	8b 00                	mov    (%eax),%eax
 939:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 93c:	77 1a                	ja     958 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 941:	8b 00                	mov    (%eax),%eax
 943:	89 45 fc             	mov    %eax,-0x4(%ebp)
 946:	8b 45 f8             	mov    -0x8(%ebp),%eax
 949:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 94c:	76 d4                	jbe    922 <free+0x19>
 94e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 951:	8b 00                	mov    (%eax),%eax
 953:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 956:	76 ca                	jbe    922 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 958:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95b:	8b 40 04             	mov    0x4(%eax),%eax
 95e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 965:	8b 45 f8             	mov    -0x8(%ebp),%eax
 968:	01 c2                	add    %eax,%edx
 96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96d:	8b 00                	mov    (%eax),%eax
 96f:	39 c2                	cmp    %eax,%edx
 971:	75 24                	jne    997 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 973:	8b 45 f8             	mov    -0x8(%ebp),%eax
 976:	8b 50 04             	mov    0x4(%eax),%edx
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	8b 00                	mov    (%eax),%eax
 97e:	8b 40 04             	mov    0x4(%eax),%eax
 981:	01 c2                	add    %eax,%edx
 983:	8b 45 f8             	mov    -0x8(%ebp),%eax
 986:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 989:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98c:	8b 00                	mov    (%eax),%eax
 98e:	8b 10                	mov    (%eax),%edx
 990:	8b 45 f8             	mov    -0x8(%ebp),%eax
 993:	89 10                	mov    %edx,(%eax)
 995:	eb 0a                	jmp    9a1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 997:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99a:	8b 10                	mov    (%eax),%edx
 99c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a4:	8b 40 04             	mov    0x4(%eax),%eax
 9a7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b1:	01 d0                	add    %edx,%eax
 9b3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9b6:	75 20                	jne    9d8 <free+0xcf>
    p->s.size += bp->s.size;
 9b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bb:	8b 50 04             	mov    0x4(%eax),%edx
 9be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c1:	8b 40 04             	mov    0x4(%eax),%eax
 9c4:	01 c2                	add    %eax,%edx
 9c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cf:	8b 10                	mov    (%eax),%edx
 9d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d4:	89 10                	mov    %edx,(%eax)
 9d6:	eb 08                	jmp    9e0 <free+0xd7>
  } else
    p->s.ptr = bp;
 9d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9db:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9de:	89 10                	mov    %edx,(%eax)
  freep = p;
 9e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e3:	a3 14 0f 00 00       	mov    %eax,0xf14
}
 9e8:	c9                   	leave  
 9e9:	c3                   	ret    

000009ea <morecore>:

static Header*
morecore(uint nu)
{
 9ea:	55                   	push   %ebp
 9eb:	89 e5                	mov    %esp,%ebp
 9ed:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9f0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9f7:	77 07                	ja     a00 <morecore+0x16>
    nu = 4096;
 9f9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a00:	8b 45 08             	mov    0x8(%ebp),%eax
 a03:	c1 e0 03             	shl    $0x3,%eax
 a06:	89 04 24             	mov    %eax,(%esp)
 a09:	e8 40 fc ff ff       	call   64e <sbrk>
 a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a11:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a15:	75 07                	jne    a1e <morecore+0x34>
    return 0;
 a17:	b8 00 00 00 00       	mov    $0x0,%eax
 a1c:	eb 22                	jmp    a40 <morecore+0x56>
  hp = (Header*)p;
 a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a21:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a27:	8b 55 08             	mov    0x8(%ebp),%edx
 a2a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a30:	83 c0 08             	add    $0x8,%eax
 a33:	89 04 24             	mov    %eax,(%esp)
 a36:	e8 ce fe ff ff       	call   909 <free>
  return freep;
 a3b:	a1 14 0f 00 00       	mov    0xf14,%eax
}
 a40:	c9                   	leave  
 a41:	c3                   	ret    

00000a42 <malloc>:

void*
malloc(uint nbytes)
{
 a42:	55                   	push   %ebp
 a43:	89 e5                	mov    %esp,%ebp
 a45:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a48:	8b 45 08             	mov    0x8(%ebp),%eax
 a4b:	83 c0 07             	add    $0x7,%eax
 a4e:	c1 e8 03             	shr    $0x3,%eax
 a51:	83 c0 01             	add    $0x1,%eax
 a54:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a57:	a1 14 0f 00 00       	mov    0xf14,%eax
 a5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a63:	75 23                	jne    a88 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a65:	c7 45 f0 0c 0f 00 00 	movl   $0xf0c,-0x10(%ebp)
 a6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6f:	a3 14 0f 00 00       	mov    %eax,0xf14
 a74:	a1 14 0f 00 00       	mov    0xf14,%eax
 a79:	a3 0c 0f 00 00       	mov    %eax,0xf0c
    base.s.size = 0;
 a7e:	c7 05 10 0f 00 00 00 	movl   $0x0,0xf10
 a85:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a88:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8b:	8b 00                	mov    (%eax),%eax
 a8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a93:	8b 40 04             	mov    0x4(%eax),%eax
 a96:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a99:	72 4d                	jb     ae8 <malloc+0xa6>
      if(p->s.size == nunits)
 a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9e:	8b 40 04             	mov    0x4(%eax),%eax
 aa1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aa4:	75 0c                	jne    ab2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa9:	8b 10                	mov    (%eax),%edx
 aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aae:	89 10                	mov    %edx,(%eax)
 ab0:	eb 26                	jmp    ad8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab5:	8b 40 04             	mov    0x4(%eax),%eax
 ab8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 abb:	89 c2                	mov    %eax,%edx
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac6:	8b 40 04             	mov    0x4(%eax),%eax
 ac9:	c1 e0 03             	shl    $0x3,%eax
 acc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ad5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ad8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 adb:	a3 14 0f 00 00       	mov    %eax,0xf14
      return (void*)(p + 1);
 ae0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae3:	83 c0 08             	add    $0x8,%eax
 ae6:	eb 38                	jmp    b20 <malloc+0xde>
    }
    if(p == freep)
 ae8:	a1 14 0f 00 00       	mov    0xf14,%eax
 aed:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 af0:	75 1b                	jne    b0d <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 af2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af5:	89 04 24             	mov    %eax,(%esp)
 af8:	e8 ed fe ff ff       	call   9ea <morecore>
 afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b04:	75 07                	jne    b0d <malloc+0xcb>
        return 0;
 b06:	b8 00 00 00 00       	mov    $0x0,%eax
 b0b:	eb 13                	jmp    b20 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b10:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b16:	8b 00                	mov    (%eax),%eax
 b18:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b1b:	e9 70 ff ff ff       	jmp    a90 <malloc+0x4e>
}
 b20:	c9                   	leave  
 b21:	c3                   	ret    
