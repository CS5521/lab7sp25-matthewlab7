
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;

  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 c6 00 00 00       	jmp    d8 <grep+0xd8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 40 10 00 00       	add    $0x1040,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 40 10 00 00 	movl   $0x1040,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 51                	jmp    7d <grep+0x7d>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  35:	89 44 24 04          	mov    %eax,0x4(%esp)
  39:	8b 45 08             	mov    0x8(%ebp),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 bc 01 00 00       	call   200 <match>
  44:	85 c0                	test   %eax,%eax
  46:	74 2c                	je     74 <grep+0x74>
        *q = '\n';
  48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4b:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  51:	83 c0 01             	add    $0x1,%eax
  54:	89 c2                	mov    %eax,%edx
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	29 c2                	sub    %eax,%edx
  5b:	89 d0                	mov    %edx,%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  64:	89 44 24 04          	mov    %eax,0x4(%esp)
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	e8 ef 06 00 00       	call   763 <write>
      }
      p = q+1;
  74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  77:	83 c0 01             	add    $0x1,%eax
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  7d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  84:	00 
  85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  88:	89 04 24             	mov    %eax,(%esp)
  8b:	e8 af 03 00 00       	call   43f <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 40 10 00 00 	cmpl   $0x1040,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba 40 10 00 00       	mov    $0x1040,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
  d3:	e8 ab 04 00 00       	call   583 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 40 10 00 00    	add    $0x1040,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 5b 06 00 00       	call   75b <read>
 100:	89 45 ec             	mov    %eax,-0x14(%ebp)
 103:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 107:	0f 8f 05 ff ff ff    	jg     12 <grep+0x12>
    }
  }
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <main>:

int
main(int argc, char *argv[])
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	83 e4 f0             	and    $0xfffffff0,%esp
 115:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
 118:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 11c:	7f 19                	jg     137 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 11e:	c7 44 24 04 98 0c 00 	movl   $0xc98,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 99 07 00 00       	call   8cb <printf>
    exit();
 132:	e8 0c 06 00 00       	call   743 <exit>
  }
  pattern = argv[1];
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8b 40 04             	mov    0x4(%eax),%eax
 13d:	89 44 24 18          	mov    %eax,0x18(%esp)

  if(argc <= 2){
 141:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 145:	7f 19                	jg     160 <main+0x51>
    grep(pattern, 0);
 147:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14e:	00 
 14f:	8b 44 24 18          	mov    0x18(%esp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 a5 fe ff ff       	call   0 <grep>
    exit();
 15b:	e8 e3 05 00 00       	call   743 <exit>
  }

  for(i = 2; i < argc; i++){
 160:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 167:	00 
 168:	e9 81 00 00 00       	jmp    1ee <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
 16d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 171:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 178:	8b 45 0c             	mov    0xc(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	8b 00                	mov    (%eax),%eax
 17f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 186:	00 
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 f4 05 00 00       	call   783 <open>
 18f:	89 44 24 14          	mov    %eax,0x14(%esp)
 193:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 198:	79 2f                	jns    1c9 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 1a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	8b 00                	mov    (%eax),%eax
 1ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b0:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 07 07 00 00       	call   8cb <printf>
      exit();
 1c4:	e8 7a 05 00 00       	call   743 <exit>
    }
    grep(pattern, fd);
 1c9:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 23 fe ff ff       	call   0 <grep>
    close(fd);
 1dd:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 82 05 00 00       	call   76b <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 43 05 00 00       	call   743 <exit>

00000200 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 5e                	cmp    $0x5e,%al
 20e:	75 17                	jne    227 <match+0x27>
    return matchhere(re+1, text);
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	8b 45 0c             	mov    0xc(%ebp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	89 14 24             	mov    %edx,(%esp)
 220:	e8 36 00 00 00       	call   25b <matchhere>
 225:	eb 32                	jmp    259 <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 22 00 00 00       	call   25b <matchhere>
 239:	85 c0                	test   %eax,%eax
 23b:	74 07                	je     244 <match+0x44>
      return 1;
 23d:	b8 01 00 00 00       	mov    $0x1,%eax
 242:	eb 15                	jmp    259 <match+0x59>
  }while(*text++ != '\0');
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 0c             	mov    %edx,0xc(%ebp)
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 d3                	jne    227 <match+0x27>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	84 c0                	test   %al,%al
 269:	75 0a                	jne    275 <matchhere+0x1a>
    return 1;
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	e9 9b 00 00 00       	jmp    310 <matchhere+0xb5>
  if(re[1] == '*')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	3c 2a                	cmp    $0x2a,%al
 280:	75 24                	jne    2a6 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 48 02             	lea    0x2(%eax),%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	8b 55 0c             	mov    0xc(%ebp),%edx
 294:	89 54 24 08          	mov    %edx,0x8(%esp)
 298:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 6e 00 00 00       	call   312 <matchstar>
 2a4:	eb 6a                	jmp    310 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	3c 24                	cmp    $0x24,%al
 2ae:	75 1d                	jne    2cd <matchhere+0x72>
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	84 c0                	test   %al,%al
 2bb:	75 10                	jne    2cd <matchhere+0x72>
    return *text == '\0';
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	0f b6 c0             	movzbl %al,%eax
 2cb:	eb 43                	jmp    310 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	0f b6 00             	movzbl (%eax),%eax
 2d3:	84 c0                	test   %al,%al
 2d5:	74 34                	je     30b <matchhere+0xb0>
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	3c 2e                	cmp    $0x2e,%al
 2df:	74 10                	je     2f1 <matchhere+0x96>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	75 1a                	jne    30b <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 52 ff ff ff       	call   25b <matchhere>
 309:	eb 05                	jmp    310 <matchhere+0xb5>
  return 0;
 30b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 04 24             	mov    %eax,(%esp)
 325:	e8 31 ff ff ff       	call   25b <matchhere>
 32a:	85 c0                	test   %eax,%eax
 32c:	74 07                	je     335 <matchstar+0x23>
      return 1;
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	eb 29                	jmp    35e <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	84 c0                	test   %al,%al
 33d:	74 1a                	je     359 <matchstar+0x47>
 33f:	8b 45 10             	mov    0x10(%ebp),%eax
 342:	8d 50 01             	lea    0x1(%eax),%edx
 345:	89 55 10             	mov    %edx,0x10(%ebp)
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	0f be c0             	movsbl %al,%eax
 34e:	3b 45 08             	cmp    0x8(%ebp),%eax
 351:	74 c5                	je     318 <matchstar+0x6>
 353:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 357:	74 bf                	je     318 <matchstar+0x6>
  return 0;
 359:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
 368:	8b 55 10             	mov    0x10(%ebp),%edx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 cb                	mov    %ecx,%ebx
 370:	89 df                	mov    %ebx,%edi
 372:	89 d1                	mov    %edx,%ecx
 374:	fc                   	cld    
 375:	f3 aa                	rep stos %al,%es:(%edi)
 377:	89 ca                	mov    %ecx,%edx
 379:	89 fb                	mov    %edi,%ebx
 37b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 37e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 381:	5b                   	pop    %ebx
 382:	5f                   	pop    %edi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 391:	90                   	nop
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 50 01             	lea    0x1(%eax),%edx
 398:	89 55 08             	mov    %edx,0x8(%ebp)
 39b:	8b 55 0c             	mov    0xc(%ebp),%edx
 39e:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	88 10                	mov    %dl,(%eax)
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strcpy+0xd>
    ;
  return os;
 3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b8:	eb 08                	jmp    3c2 <strcmp+0xd>
    p++, q++;
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3be:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	84 c0                	test   %al,%al
 3ca:	74 10                	je     3dc <strcmp+0x27>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 10             	movzbl (%eax),%edx
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	38 c2                	cmp    %al,%dl
 3da:	74 de                	je     3ba <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 d0             	movzbl %al,%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	29 c2                	sub    %eax,%edx
 3f0:	89 d0                	mov    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 401:	eb 04                	jmp    407 <strlen+0x13>
 403:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 407:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	01 d0                	add    %edx,%eax
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	75 ed                	jne    403 <strlen+0xf>
    ;
  return n;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <memset>:

void*
memset(void *dst, int c, uint n)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 44 24 08          	mov    %eax,0x8(%esp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	89 44 24 04          	mov    %eax,0x4(%esp)
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 04 24             	mov    %eax,(%esp)
 435:	e8 26 ff ff ff       	call   360 <stosb>
  return dst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <strchr>:

char*
strchr(const char *s, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44b:	eb 14                	jmp    461 <strchr+0x22>
    if(*s == c)
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 00             	movzbl (%eax),%eax
 453:	3a 45 fc             	cmp    -0x4(%ebp),%al
 456:	75 05                	jne    45d <strchr+0x1e>
      return (char*)s;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	eb 13                	jmp    470 <strchr+0x31>
  for(; *s; s++)
 45d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	84 c0                	test   %al,%al
 469:	75 e2                	jne    44d <strchr+0xe>
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <gets>:

char*
gets(char *buf, int max)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47f:	eb 4c                	jmp    4cd <gets+0x5b>
    cc = read(0, &c, 1);
 481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 488:	00 
 489:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 497:	e8 bf 02 00 00       	call   75b <read>
 49c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a3:	7f 02                	jg     4a7 <gets+0x35>
      break;
 4a5:	eb 31                	jmp    4d8 <gets+0x66>
    buf[i++] = c;
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	01 c2                	add    %eax,%edx
 4b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 13                	je     4d8 <gets+0x66>
 4c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c9:	3c 0d                	cmp    $0xd,%al
 4cb:	74 0b                	je     4d8 <gets+0x66>
  for(i=0; i+1 < max; ){
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	83 c0 01             	add    $0x1,%eax
 4d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d6:	7c a9                	jl     481 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 82 02 00 00       	call   783 <open>
 501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 78 02 00 00       	call   79b <fstat>
 523:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 3a 02 00 00       	call   76b <close>
  return r;
 531:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 25                	jmp    56a <atoi+0x34>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c1                	mov    %eax,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	8d 50 01             	lea    0x1(%eax),%edx
 559:	89 55 08             	mov    %edx,0x8(%ebp)
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	01 c8                	add    %ecx,%eax
 564:	83 e8 30             	sub    $0x30,%eax
 567:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	3c 2f                	cmp    $0x2f,%al
 572:	7e 0a                	jle    57e <atoi+0x48>
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	3c 39                	cmp    $0x39,%al
 57c:	7e c7                	jle    545 <atoi+0xf>
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 595:	eb 17                	jmp    5ae <memmove+0x2b>
    *dst++ = *src++;
 597:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a9:	0f b6 12             	movzbl (%edx),%edx
 5ac:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5ae:	8b 45 10             	mov    0x10(%ebp),%eax
 5b1:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b4:	89 55 10             	mov    %edx,0x10(%ebp)
 5b7:	85 c0                	test   %eax,%eax
 5b9:	7f dc                	jg     597 <memmove+0x14>
  return vdst;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <ps>:

void
ps()
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 5cc:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5d2:	89 04 24             	mov    %eax,(%esp)
 5d5:	e8 09 02 00 00       	call   7e3 <getpinfo>
 5da:	83 f8 ff             	cmp    $0xffffffff,%eax
 5dd:	0f 84 4d 01 00 00    	je     730 <ps+0x170>
    return;
  int i = 0;
 5e3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 5ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5ed:	89 d0                	mov    %edx,%eax
 5ef:	c1 e0 03             	shl    $0x3,%eax
 5f2:	01 d0                	add    %edx,%eax
 5f4:	c1 e0 02             	shl    $0x2,%eax
 5f7:	8d 7d e8             	lea    -0x18(%ebp),%edi
 5fa:	01 f8                	add    %edi,%eax
 5fc:	2d 04 09 00 00       	sub    $0x904,%eax
 601:	8b 10                	mov    (%eax),%edx
 603:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 609:	8b 50 04             	mov    0x4(%eax),%edx
 60c:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 612:	8b 50 08             	mov    0x8(%eax),%edx
 615:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 61b:	8b 50 0c             	mov    0xc(%eax),%edx
 61e:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 624:	8b 50 10             	mov    0x10(%eax),%edx
 627:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 62d:	8b 50 14             	mov    0x14(%eax),%edx
 630:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 636:	8b 50 18             	mov    0x18(%eax),%edx
 639:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 63f:	8b 50 1c             	mov    0x1c(%eax),%edx
 642:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 648:	8b 40 20             	mov    0x20(%eax),%eax
 64b:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 651:	c7 44 24 04 ce 0c 00 	movl   $0xcce,0x4(%esp)
 658:	00 
 659:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 660:	e8 66 02 00 00       	call   8cb <printf>
  for(;p.pid != 0; p = table[i])
 665:	e9 b8 00 00 00       	jmp    722 <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 66a:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 671:	0f be d8             	movsbl %al,%ebx
 674:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 67a:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 680:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 686:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 68c:	83 c6 10             	add    $0x10,%esi
 68f:	89 74 24 18          	mov    %esi,0x18(%esp)
 693:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 697:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 69b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 69f:	89 44 24 08          	mov    %eax,0x8(%esp)
 6a3:	c7 44 24 04 e7 0c 00 	movl   $0xce7,0x4(%esp)
 6aa:	00 
 6ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6b2:	e8 14 02 00 00       	call   8cb <printf>
    i++;
 6b7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 6bb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 6be:	89 d0                	mov    %edx,%eax
 6c0:	c1 e0 03             	shl    $0x3,%eax
 6c3:	01 d0                	add    %edx,%eax
 6c5:	c1 e0 02             	shl    $0x2,%eax
 6c8:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 6cb:	01 c8                	add    %ecx,%eax
 6cd:	2d 04 09 00 00       	sub    $0x904,%eax
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 6da:	8b 50 04             	mov    0x4(%eax),%edx
 6dd:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 6e3:	8b 50 08             	mov    0x8(%eax),%edx
 6e6:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 6ec:	8b 50 0c             	mov    0xc(%eax),%edx
 6ef:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 6f5:	8b 50 10             	mov    0x10(%eax),%edx
 6f8:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 6fe:	8b 50 14             	mov    0x14(%eax),%edx
 701:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 707:	8b 50 18             	mov    0x18(%eax),%edx
 70a:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 710:	8b 50 1c             	mov    0x1c(%eax),%edx
 713:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 719:	8b 40 20             	mov    0x20(%eax),%eax
 71c:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 722:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 728:	85 c0                	test   %eax,%eax
 72a:	0f 85 3a ff ff ff    	jne    66a <ps+0xaa>
  }
}
 730:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    

0000073b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 73b:	b8 01 00 00 00       	mov    $0x1,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <exit>:
SYSCALL(exit)
 743:	b8 02 00 00 00       	mov    $0x2,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <wait>:
SYSCALL(wait)
 74b:	b8 03 00 00 00       	mov    $0x3,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <pipe>:
SYSCALL(pipe)
 753:	b8 04 00 00 00       	mov    $0x4,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <read>:
SYSCALL(read)
 75b:	b8 05 00 00 00       	mov    $0x5,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <write>:
SYSCALL(write)
 763:	b8 10 00 00 00       	mov    $0x10,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <close>:
SYSCALL(close)
 76b:	b8 15 00 00 00       	mov    $0x15,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <kill>:
SYSCALL(kill)
 773:	b8 06 00 00 00       	mov    $0x6,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <exec>:
SYSCALL(exec)
 77b:	b8 07 00 00 00       	mov    $0x7,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <open>:
SYSCALL(open)
 783:	b8 0f 00 00 00       	mov    $0xf,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <mknod>:
SYSCALL(mknod)
 78b:	b8 11 00 00 00       	mov    $0x11,%eax
 790:	cd 40                	int    $0x40
 792:	c3                   	ret    

00000793 <unlink>:
SYSCALL(unlink)
 793:	b8 12 00 00 00       	mov    $0x12,%eax
 798:	cd 40                	int    $0x40
 79a:	c3                   	ret    

0000079b <fstat>:
SYSCALL(fstat)
 79b:	b8 08 00 00 00       	mov    $0x8,%eax
 7a0:	cd 40                	int    $0x40
 7a2:	c3                   	ret    

000007a3 <link>:
SYSCALL(link)
 7a3:	b8 13 00 00 00       	mov    $0x13,%eax
 7a8:	cd 40                	int    $0x40
 7aa:	c3                   	ret    

000007ab <mkdir>:
SYSCALL(mkdir)
 7ab:	b8 14 00 00 00       	mov    $0x14,%eax
 7b0:	cd 40                	int    $0x40
 7b2:	c3                   	ret    

000007b3 <chdir>:
SYSCALL(chdir)
 7b3:	b8 09 00 00 00       	mov    $0x9,%eax
 7b8:	cd 40                	int    $0x40
 7ba:	c3                   	ret    

000007bb <dup>:
SYSCALL(dup)
 7bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <getpid>:
SYSCALL(getpid)
 7c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <sbrk>:
SYSCALL(sbrk)
 7cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <sleep>:
SYSCALL(sleep)
 7d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <uptime>:
SYSCALL(uptime)
 7db:	b8 0e 00 00 00       	mov    $0xe,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <getpinfo>:
SYSCALL(getpinfo)
 7e3:	b8 16 00 00 00       	mov    $0x16,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7eb:	55                   	push   %ebp
 7ec:	89 e5                	mov    %esp,%ebp
 7ee:	83 ec 18             	sub    $0x18,%esp
 7f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7f7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7fe:	00 
 7ff:	8d 45 f4             	lea    -0xc(%ebp),%eax
 802:	89 44 24 04          	mov    %eax,0x4(%esp)
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	89 04 24             	mov    %eax,(%esp)
 80c:	e8 52 ff ff ff       	call   763 <write>
}
 811:	c9                   	leave  
 812:	c3                   	ret    

00000813 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 813:	55                   	push   %ebp
 814:	89 e5                	mov    %esp,%ebp
 816:	56                   	push   %esi
 817:	53                   	push   %ebx
 818:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 81b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 822:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 826:	74 17                	je     83f <printint+0x2c>
 828:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 82c:	79 11                	jns    83f <printint+0x2c>
    neg = 1;
 82e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 835:	8b 45 0c             	mov    0xc(%ebp),%eax
 838:	f7 d8                	neg    %eax
 83a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 83d:	eb 06                	jmp    845 <printint+0x32>
  } else {
    x = xx;
 83f:	8b 45 0c             	mov    0xc(%ebp),%eax
 842:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 845:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 84c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 84f:	8d 41 01             	lea    0x1(%ecx),%eax
 852:	89 45 f4             	mov    %eax,-0xc(%ebp)
 855:	8b 5d 10             	mov    0x10(%ebp),%ebx
 858:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85b:	ba 00 00 00 00       	mov    $0x0,%edx
 860:	f7 f3                	div    %ebx
 862:	89 d0                	mov    %edx,%eax
 864:	0f b6 80 f4 0f 00 00 	movzbl 0xff4(%eax),%eax
 86b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 86f:	8b 75 10             	mov    0x10(%ebp),%esi
 872:	8b 45 ec             	mov    -0x14(%ebp),%eax
 875:	ba 00 00 00 00       	mov    $0x0,%edx
 87a:	f7 f6                	div    %esi
 87c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 87f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 883:	75 c7                	jne    84c <printint+0x39>
  if(neg)
 885:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 889:	74 10                	je     89b <printint+0x88>
    buf[i++] = '-';
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	8d 50 01             	lea    0x1(%eax),%edx
 891:	89 55 f4             	mov    %edx,-0xc(%ebp)
 894:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 899:	eb 1f                	jmp    8ba <printint+0xa7>
 89b:	eb 1d                	jmp    8ba <printint+0xa7>
    putc(fd, buf[i]);
 89d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 8a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a3:	01 d0                	add    %edx,%eax
 8a5:	0f b6 00             	movzbl (%eax),%eax
 8a8:	0f be c0             	movsbl %al,%eax
 8ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 8af:	8b 45 08             	mov    0x8(%ebp),%eax
 8b2:	89 04 24             	mov    %eax,(%esp)
 8b5:	e8 31 ff ff ff       	call   7eb <putc>
  while(--i >= 0)
 8ba:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c2:	79 d9                	jns    89d <printint+0x8a>
}
 8c4:	83 c4 30             	add    $0x30,%esp
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5d                   	pop    %ebp
 8ca:	c3                   	ret    

000008cb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8cb:	55                   	push   %ebp
 8cc:	89 e5                	mov    %esp,%ebp
 8ce:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8d8:	8d 45 0c             	lea    0xc(%ebp),%eax
 8db:	83 c0 04             	add    $0x4,%eax
 8de:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8e8:	e9 7c 01 00 00       	jmp    a69 <printf+0x19e>
    c = fmt[i] & 0xff;
 8ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 8f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f3:	01 d0                	add    %edx,%eax
 8f5:	0f b6 00             	movzbl (%eax),%eax
 8f8:	0f be c0             	movsbl %al,%eax
 8fb:	25 ff 00 00 00       	and    $0xff,%eax
 900:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 903:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 907:	75 2c                	jne    935 <printf+0x6a>
      if(c == '%'){
 909:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 90d:	75 0c                	jne    91b <printf+0x50>
        state = '%';
 90f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 916:	e9 4a 01 00 00       	jmp    a65 <printf+0x19a>
      } else {
        putc(fd, c);
 91b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 91e:	0f be c0             	movsbl %al,%eax
 921:	89 44 24 04          	mov    %eax,0x4(%esp)
 925:	8b 45 08             	mov    0x8(%ebp),%eax
 928:	89 04 24             	mov    %eax,(%esp)
 92b:	e8 bb fe ff ff       	call   7eb <putc>
 930:	e9 30 01 00 00       	jmp    a65 <printf+0x19a>
      }
    } else if(state == '%'){
 935:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 939:	0f 85 26 01 00 00    	jne    a65 <printf+0x19a>
      if(c == 'd'){
 93f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 943:	75 2d                	jne    972 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 945:	8b 45 e8             	mov    -0x18(%ebp),%eax
 948:	8b 00                	mov    (%eax),%eax
 94a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 951:	00 
 952:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 959:	00 
 95a:	89 44 24 04          	mov    %eax,0x4(%esp)
 95e:	8b 45 08             	mov    0x8(%ebp),%eax
 961:	89 04 24             	mov    %eax,(%esp)
 964:	e8 aa fe ff ff       	call   813 <printint>
        ap++;
 969:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 96d:	e9 ec 00 00 00       	jmp    a5e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 972:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 976:	74 06                	je     97e <printf+0xb3>
 978:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 97c:	75 2d                	jne    9ab <printf+0xe0>
        printint(fd, *ap, 16, 0);
 97e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 981:	8b 00                	mov    (%eax),%eax
 983:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 98a:	00 
 98b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 992:	00 
 993:	89 44 24 04          	mov    %eax,0x4(%esp)
 997:	8b 45 08             	mov    0x8(%ebp),%eax
 99a:	89 04 24             	mov    %eax,(%esp)
 99d:	e8 71 fe ff ff       	call   813 <printint>
        ap++;
 9a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9a6:	e9 b3 00 00 00       	jmp    a5e <printf+0x193>
      } else if(c == 's'){
 9ab:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 9af:	75 45                	jne    9f6 <printf+0x12b>
        s = (char*)*ap;
 9b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9b4:	8b 00                	mov    (%eax),%eax
 9b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 9b9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 9bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9c1:	75 09                	jne    9cc <printf+0x101>
          s = "(null)";
 9c3:	c7 45 f4 f7 0c 00 00 	movl   $0xcf7,-0xc(%ebp)
        while(*s != 0){
 9ca:	eb 1e                	jmp    9ea <printf+0x11f>
 9cc:	eb 1c                	jmp    9ea <printf+0x11f>
          putc(fd, *s);
 9ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d1:	0f b6 00             	movzbl (%eax),%eax
 9d4:	0f be c0             	movsbl %al,%eax
 9d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 9db:	8b 45 08             	mov    0x8(%ebp),%eax
 9de:	89 04 24             	mov    %eax,(%esp)
 9e1:	e8 05 fe ff ff       	call   7eb <putc>
          s++;
 9e6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 9ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ed:	0f b6 00             	movzbl (%eax),%eax
 9f0:	84 c0                	test   %al,%al
 9f2:	75 da                	jne    9ce <printf+0x103>
 9f4:	eb 68                	jmp    a5e <printf+0x193>
        }
      } else if(c == 'c'){
 9f6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9fa:	75 1d                	jne    a19 <printf+0x14e>
        putc(fd, *ap);
 9fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9ff:	8b 00                	mov    (%eax),%eax
 a01:	0f be c0             	movsbl %al,%eax
 a04:	89 44 24 04          	mov    %eax,0x4(%esp)
 a08:	8b 45 08             	mov    0x8(%ebp),%eax
 a0b:	89 04 24             	mov    %eax,(%esp)
 a0e:	e8 d8 fd ff ff       	call   7eb <putc>
        ap++;
 a13:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a17:	eb 45                	jmp    a5e <printf+0x193>
      } else if(c == '%'){
 a19:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 a1d:	75 17                	jne    a36 <printf+0x16b>
        putc(fd, c);
 a1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a22:	0f be c0             	movsbl %al,%eax
 a25:	89 44 24 04          	mov    %eax,0x4(%esp)
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
 a2c:	89 04 24             	mov    %eax,(%esp)
 a2f:	e8 b7 fd ff ff       	call   7eb <putc>
 a34:	eb 28                	jmp    a5e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a36:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 a3d:	00 
 a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 a41:	89 04 24             	mov    %eax,(%esp)
 a44:	e8 a2 fd ff ff       	call   7eb <putc>
        putc(fd, c);
 a49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a4c:	0f be c0             	movsbl %al,%eax
 a4f:	89 44 24 04          	mov    %eax,0x4(%esp)
 a53:	8b 45 08             	mov    0x8(%ebp),%eax
 a56:	89 04 24             	mov    %eax,(%esp)
 a59:	e8 8d fd ff ff       	call   7eb <putc>
      }
      state = 0;
 a5e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a65:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a69:	8b 55 0c             	mov    0xc(%ebp),%edx
 a6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6f:	01 d0                	add    %edx,%eax
 a71:	0f b6 00             	movzbl (%eax),%eax
 a74:	84 c0                	test   %al,%al
 a76:	0f 85 71 fe ff ff    	jne    8ed <printf+0x22>
    }
  }
}
 a7c:	c9                   	leave  
 a7d:	c3                   	ret    

00000a7e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a7e:	55                   	push   %ebp
 a7f:	89 e5                	mov    %esp,%ebp
 a81:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a84:	8b 45 08             	mov    0x8(%ebp),%eax
 a87:	83 e8 08             	sub    $0x8,%eax
 a8a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a8d:	a1 28 10 00 00       	mov    0x1028,%eax
 a92:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a95:	eb 24                	jmp    abb <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a97:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9a:	8b 00                	mov    (%eax),%eax
 a9c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a9f:	77 12                	ja     ab3 <free+0x35>
 aa1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 aa7:	77 24                	ja     acd <free+0x4f>
 aa9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aac:	8b 00                	mov    (%eax),%eax
 aae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ab1:	77 1a                	ja     acd <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab6:	8b 00                	mov    (%eax),%eax
 ab8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 abb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 abe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ac1:	76 d4                	jbe    a97 <free+0x19>
 ac3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac6:	8b 00                	mov    (%eax),%eax
 ac8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 acb:	76 ca                	jbe    a97 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 acd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad0:	8b 40 04             	mov    0x4(%eax),%eax
 ad3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ada:	8b 45 f8             	mov    -0x8(%ebp),%eax
 add:	01 c2                	add    %eax,%edx
 adf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae2:	8b 00                	mov    (%eax),%eax
 ae4:	39 c2                	cmp    %eax,%edx
 ae6:	75 24                	jne    b0c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 ae8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aeb:	8b 50 04             	mov    0x4(%eax),%edx
 aee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af1:	8b 00                	mov    (%eax),%eax
 af3:	8b 40 04             	mov    0x4(%eax),%eax
 af6:	01 c2                	add    %eax,%edx
 af8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 afb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 afe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b01:	8b 00                	mov    (%eax),%eax
 b03:	8b 10                	mov    (%eax),%edx
 b05:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b08:	89 10                	mov    %edx,(%eax)
 b0a:	eb 0a                	jmp    b16 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 b0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b0f:	8b 10                	mov    (%eax),%edx
 b11:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b14:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 b16:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b19:	8b 40 04             	mov    0x4(%eax),%eax
 b1c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 b23:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b26:	01 d0                	add    %edx,%eax
 b28:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b2b:	75 20                	jne    b4d <free+0xcf>
    p->s.size += bp->s.size;
 b2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b30:	8b 50 04             	mov    0x4(%eax),%edx
 b33:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b36:	8b 40 04             	mov    0x4(%eax),%eax
 b39:	01 c2                	add    %eax,%edx
 b3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b3e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b41:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b44:	8b 10                	mov    (%eax),%edx
 b46:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b49:	89 10                	mov    %edx,(%eax)
 b4b:	eb 08                	jmp    b55 <free+0xd7>
  } else
    p->s.ptr = bp;
 b4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b50:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b53:	89 10                	mov    %edx,(%eax)
  freep = p;
 b55:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b58:	a3 28 10 00 00       	mov    %eax,0x1028
}
 b5d:	c9                   	leave  
 b5e:	c3                   	ret    

00000b5f <morecore>:

static Header*
morecore(uint nu)
{
 b5f:	55                   	push   %ebp
 b60:	89 e5                	mov    %esp,%ebp
 b62:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b65:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b6c:	77 07                	ja     b75 <morecore+0x16>
    nu = 4096;
 b6e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b75:	8b 45 08             	mov    0x8(%ebp),%eax
 b78:	c1 e0 03             	shl    $0x3,%eax
 b7b:	89 04 24             	mov    %eax,(%esp)
 b7e:	e8 48 fc ff ff       	call   7cb <sbrk>
 b83:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b86:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b8a:	75 07                	jne    b93 <morecore+0x34>
    return 0;
 b8c:	b8 00 00 00 00       	mov    $0x0,%eax
 b91:	eb 22                	jmp    bb5 <morecore+0x56>
  hp = (Header*)p;
 b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b96:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9c:	8b 55 08             	mov    0x8(%ebp),%edx
 b9f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 ba2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba5:	83 c0 08             	add    $0x8,%eax
 ba8:	89 04 24             	mov    %eax,(%esp)
 bab:	e8 ce fe ff ff       	call   a7e <free>
  return freep;
 bb0:	a1 28 10 00 00       	mov    0x1028,%eax
}
 bb5:	c9                   	leave  
 bb6:	c3                   	ret    

00000bb7 <malloc>:

void*
malloc(uint nbytes)
{
 bb7:	55                   	push   %ebp
 bb8:	89 e5                	mov    %esp,%ebp
 bba:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bbd:	8b 45 08             	mov    0x8(%ebp),%eax
 bc0:	83 c0 07             	add    $0x7,%eax
 bc3:	c1 e8 03             	shr    $0x3,%eax
 bc6:	83 c0 01             	add    $0x1,%eax
 bc9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 bcc:	a1 28 10 00 00       	mov    0x1028,%eax
 bd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bd4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bd8:	75 23                	jne    bfd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 bda:	c7 45 f0 20 10 00 00 	movl   $0x1020,-0x10(%ebp)
 be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 be4:	a3 28 10 00 00       	mov    %eax,0x1028
 be9:	a1 28 10 00 00       	mov    0x1028,%eax
 bee:	a3 20 10 00 00       	mov    %eax,0x1020
    base.s.size = 0;
 bf3:	c7 05 24 10 00 00 00 	movl   $0x0,0x1024
 bfa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c00:	8b 00                	mov    (%eax),%eax
 c02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c08:	8b 40 04             	mov    0x4(%eax),%eax
 c0b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c0e:	72 4d                	jb     c5d <malloc+0xa6>
      if(p->s.size == nunits)
 c10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c13:	8b 40 04             	mov    0x4(%eax),%eax
 c16:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c19:	75 0c                	jne    c27 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c1e:	8b 10                	mov    (%eax),%edx
 c20:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c23:	89 10                	mov    %edx,(%eax)
 c25:	eb 26                	jmp    c4d <malloc+0x96>
      else {
        p->s.size -= nunits;
 c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2a:	8b 40 04             	mov    0x4(%eax),%eax
 c2d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 c30:	89 c2                	mov    %eax,%edx
 c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c35:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3b:	8b 40 04             	mov    0x4(%eax),%eax
 c3e:	c1 e0 03             	shl    $0x3,%eax
 c41:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c44:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c47:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c4a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c50:	a3 28 10 00 00       	mov    %eax,0x1028
      return (void*)(p + 1);
 c55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c58:	83 c0 08             	add    $0x8,%eax
 c5b:	eb 38                	jmp    c95 <malloc+0xde>
    }
    if(p == freep)
 c5d:	a1 28 10 00 00       	mov    0x1028,%eax
 c62:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c65:	75 1b                	jne    c82 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c67:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c6a:	89 04 24             	mov    %eax,(%esp)
 c6d:	e8 ed fe ff ff       	call   b5f <morecore>
 c72:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c79:	75 07                	jne    c82 <malloc+0xcb>
        return 0;
 c7b:	b8 00 00 00 00       	mov    $0x0,%eax
 c80:	eb 13                	jmp    c95 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c85:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8b:	8b 00                	mov    (%eax),%eax
 c8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c90:	e9 70 ff ff ff       	jmp    c05 <malloc+0x4e>
}
 c95:	c9                   	leave  
 c96:	c3                   	ret    
