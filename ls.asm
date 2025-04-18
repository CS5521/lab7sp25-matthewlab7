
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 f0 0f 00 00 	movl   $0xff0,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 f0 0f 00 00       	add    $0xff0,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 f0 0f 00 00       	mov    $0xff0,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 af 06 00 00       	call   77e <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 9a 0c 00 	movl   $0xc9a,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 db 07 00 00       	call   8ce <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 89 06 00 00       	call   796 <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 ae 0c 00 	movl   $0xcae,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 a2 07 00 00       	call   8ce <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 2f 06 00 00       	call   766 <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 c2 0c 00 	movl   $0xcc2,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 37 07 00 00       	call   8ce <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 cf 0c 00 	movl   $0xccf,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 09 07 00 00       	call   8ce <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 ae 0c 00 	movl   $0xcae,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 51 06 00 00       	call   8ce <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 c2 0c 00 	movl   $0xcc2,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 07 06 00 00       	call   8ce <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 72 04 00 00       	call   756 <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 6d 04 00 00       	call   766 <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 e2 0c 00 00 	movl   $0xce2,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 1a 04 00 00       	call   73e <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 e3 03 00 00       	call   73e <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 bf 02 00 00       	call   756 <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 82 02 00 00       	call   77e <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 78 02 00 00       	call   796 <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 3a 02 00 00       	call   766 <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <ps>:

void
ps()
{
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
 5c7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 09 02 00 00       	call   7de <getpinfo>
 5d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d8:	0f 84 4d 01 00 00    	je     72b <ps+0x170>
    return;
  int i = 0;
 5de:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
 5e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	c1 e0 03             	shl    $0x3,%eax
 5ed:	01 d0                	add    %edx,%eax
 5ef:	c1 e0 02             	shl    $0x2,%eax
 5f2:	8d 7d e8             	lea    -0x18(%ebp),%edi
 5f5:	01 f8                	add    %edi,%eax
 5f7:	2d 04 09 00 00       	sub    $0x904,%eax
 5fc:	8b 10                	mov    (%eax),%edx
 5fe:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 604:	8b 50 04             	mov    0x4(%eax),%edx
 607:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 60d:	8b 50 08             	mov    0x8(%eax),%edx
 610:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 616:	8b 50 0c             	mov    0xc(%eax),%edx
 619:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 61f:	8b 50 10             	mov    0x10(%eax),%edx
 622:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 628:	8b 50 14             	mov    0x14(%eax),%edx
 62b:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 631:	8b 50 18             	mov    0x18(%eax),%edx
 634:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 63a:	8b 50 1c             	mov    0x1c(%eax),%edx
 63d:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 643:	8b 40 20             	mov    0x20(%eax),%eax
 646:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 64c:	c7 44 24 04 e4 0c 00 	movl   $0xce4,0x4(%esp)
 653:	00 
 654:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 65b:	e8 6e 02 00 00       	call   8ce <printf>
  for(;p.pid != 0; p = table[i])
 660:	e9 b8 00 00 00       	jmp    71d <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
 665:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
 66c:	0f be d8             	movsbl %al,%ebx
 66f:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
 675:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
 67b:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 681:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
 687:	83 c6 10             	add    $0x10,%esi
 68a:	89 74 24 18          	mov    %esi,0x18(%esp)
 68e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 692:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 696:	89 54 24 0c          	mov    %edx,0xc(%esp)
 69a:	89 44 24 08          	mov    %eax,0x8(%esp)
 69e:	c7 44 24 04 fd 0c 00 	movl   $0xcfd,0x4(%esp)
 6a5:	00 
 6a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6ad:	e8 1c 02 00 00       	call   8ce <printf>
    i++;
 6b2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
 6b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 6b9:	89 d0                	mov    %edx,%eax
 6bb:	c1 e0 03             	shl    $0x3,%eax
 6be:	01 d0                	add    %edx,%eax
 6c0:	c1 e0 02             	shl    $0x2,%eax
 6c3:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 6c6:	01 c8                	add    %ecx,%eax
 6c8:	2d 04 09 00 00       	sub    $0x904,%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
 6d5:	8b 50 04             	mov    0x4(%eax),%edx
 6d8:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
 6de:	8b 50 08             	mov    0x8(%eax),%edx
 6e1:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
 6e7:	8b 50 0c             	mov    0xc(%eax),%edx
 6ea:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
 6f0:	8b 50 10             	mov    0x10(%eax),%edx
 6f3:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
 6f9:	8b 50 14             	mov    0x14(%eax),%edx
 6fc:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
 702:	8b 50 18             	mov    0x18(%eax),%edx
 705:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
 70b:	8b 50 1c             	mov    0x1c(%eax),%edx
 70e:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
 714:	8b 40 20             	mov    0x20(%eax),%eax
 717:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
 71d:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
 723:	85 c0                	test   %eax,%eax
 725:	0f 85 3a ff ff ff    	jne    665 <ps+0xaa>
  }
}
 72b:	81 c4 5c 09 00 00    	add    $0x95c,%esp
 731:	5b                   	pop    %ebx
 732:	5e                   	pop    %esi
 733:	5f                   	pop    %edi
 734:	5d                   	pop    %ebp
 735:	c3                   	ret    

00000736 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 736:	b8 01 00 00 00       	mov    $0x1,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <exit>:
SYSCALL(exit)
 73e:	b8 02 00 00 00       	mov    $0x2,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <wait>:
SYSCALL(wait)
 746:	b8 03 00 00 00       	mov    $0x3,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <pipe>:
SYSCALL(pipe)
 74e:	b8 04 00 00 00       	mov    $0x4,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <read>:
SYSCALL(read)
 756:	b8 05 00 00 00       	mov    $0x5,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <write>:
SYSCALL(write)
 75e:	b8 10 00 00 00       	mov    $0x10,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <close>:
SYSCALL(close)
 766:	b8 15 00 00 00       	mov    $0x15,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <kill>:
SYSCALL(kill)
 76e:	b8 06 00 00 00       	mov    $0x6,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <exec>:
SYSCALL(exec)
 776:	b8 07 00 00 00       	mov    $0x7,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <open>:
SYSCALL(open)
 77e:	b8 0f 00 00 00       	mov    $0xf,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    

00000786 <mknod>:
SYSCALL(mknod)
 786:	b8 11 00 00 00       	mov    $0x11,%eax
 78b:	cd 40                	int    $0x40
 78d:	c3                   	ret    

0000078e <unlink>:
SYSCALL(unlink)
 78e:	b8 12 00 00 00       	mov    $0x12,%eax
 793:	cd 40                	int    $0x40
 795:	c3                   	ret    

00000796 <fstat>:
SYSCALL(fstat)
 796:	b8 08 00 00 00       	mov    $0x8,%eax
 79b:	cd 40                	int    $0x40
 79d:	c3                   	ret    

0000079e <link>:
SYSCALL(link)
 79e:	b8 13 00 00 00       	mov    $0x13,%eax
 7a3:	cd 40                	int    $0x40
 7a5:	c3                   	ret    

000007a6 <mkdir>:
SYSCALL(mkdir)
 7a6:	b8 14 00 00 00       	mov    $0x14,%eax
 7ab:	cd 40                	int    $0x40
 7ad:	c3                   	ret    

000007ae <chdir>:
SYSCALL(chdir)
 7ae:	b8 09 00 00 00       	mov    $0x9,%eax
 7b3:	cd 40                	int    $0x40
 7b5:	c3                   	ret    

000007b6 <dup>:
SYSCALL(dup)
 7b6:	b8 0a 00 00 00       	mov    $0xa,%eax
 7bb:	cd 40                	int    $0x40
 7bd:	c3                   	ret    

000007be <getpid>:
SYSCALL(getpid)
 7be:	b8 0b 00 00 00       	mov    $0xb,%eax
 7c3:	cd 40                	int    $0x40
 7c5:	c3                   	ret    

000007c6 <sbrk>:
SYSCALL(sbrk)
 7c6:	b8 0c 00 00 00       	mov    $0xc,%eax
 7cb:	cd 40                	int    $0x40
 7cd:	c3                   	ret    

000007ce <sleep>:
SYSCALL(sleep)
 7ce:	b8 0d 00 00 00       	mov    $0xd,%eax
 7d3:	cd 40                	int    $0x40
 7d5:	c3                   	ret    

000007d6 <uptime>:
SYSCALL(uptime)
 7d6:	b8 0e 00 00 00       	mov    $0xe,%eax
 7db:	cd 40                	int    $0x40
 7dd:	c3                   	ret    

000007de <getpinfo>:
SYSCALL(getpinfo)
 7de:	b8 16 00 00 00       	mov    $0x16,%eax
 7e3:	cd 40                	int    $0x40
 7e5:	c3                   	ret    

000007e6 <settickets>:
 7e6:	b8 17 00 00 00       	mov    $0x17,%eax
 7eb:	cd 40                	int    $0x40
 7ed:	c3                   	ret    

000007ee <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7ee:	55                   	push   %ebp
 7ef:	89 e5                	mov    %esp,%ebp
 7f1:	83 ec 18             	sub    $0x18,%esp
 7f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 801:	00 
 802:	8d 45 f4             	lea    -0xc(%ebp),%eax
 805:	89 44 24 04          	mov    %eax,0x4(%esp)
 809:	8b 45 08             	mov    0x8(%ebp),%eax
 80c:	89 04 24             	mov    %eax,(%esp)
 80f:	e8 4a ff ff ff       	call   75e <write>
}
 814:	c9                   	leave  
 815:	c3                   	ret    

00000816 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 816:	55                   	push   %ebp
 817:	89 e5                	mov    %esp,%ebp
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 81e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 825:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 829:	74 17                	je     842 <printint+0x2c>
 82b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 82f:	79 11                	jns    842 <printint+0x2c>
    neg = 1;
 831:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 838:	8b 45 0c             	mov    0xc(%ebp),%eax
 83b:	f7 d8                	neg    %eax
 83d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 840:	eb 06                	jmp    848 <printint+0x32>
  } else {
    x = xx;
 842:	8b 45 0c             	mov    0xc(%ebp),%eax
 845:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 848:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 84f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 852:	8d 41 01             	lea    0x1(%ecx),%eax
 855:	89 45 f4             	mov    %eax,-0xc(%ebp)
 858:	8b 5d 10             	mov    0x10(%ebp),%ebx
 85b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85e:	ba 00 00 00 00       	mov    $0x0,%edx
 863:	f7 f3                	div    %ebx
 865:	89 d0                	mov    %edx,%eax
 867:	0f b6 80 dc 0f 00 00 	movzbl 0xfdc(%eax),%eax
 86e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 872:	8b 75 10             	mov    0x10(%ebp),%esi
 875:	8b 45 ec             	mov    -0x14(%ebp),%eax
 878:	ba 00 00 00 00       	mov    $0x0,%edx
 87d:	f7 f6                	div    %esi
 87f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 882:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 886:	75 c7                	jne    84f <printint+0x39>
  if(neg)
 888:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 88c:	74 10                	je     89e <printint+0x88>
    buf[i++] = '-';
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	8d 50 01             	lea    0x1(%eax),%edx
 894:	89 55 f4             	mov    %edx,-0xc(%ebp)
 897:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 89c:	eb 1f                	jmp    8bd <printint+0xa7>
 89e:	eb 1d                	jmp    8bd <printint+0xa7>
    putc(fd, buf[i]);
 8a0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 8a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a6:	01 d0                	add    %edx,%eax
 8a8:	0f b6 00             	movzbl (%eax),%eax
 8ab:	0f be c0             	movsbl %al,%eax
 8ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	89 04 24             	mov    %eax,(%esp)
 8b8:	e8 31 ff ff ff       	call   7ee <putc>
  while(--i >= 0)
 8bd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c5:	79 d9                	jns    8a0 <printint+0x8a>
}
 8c7:	83 c4 30             	add    $0x30,%esp
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5d                   	pop    %ebp
 8cd:	c3                   	ret    

000008ce <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8ce:	55                   	push   %ebp
 8cf:	89 e5                	mov    %esp,%ebp
 8d1:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8db:	8d 45 0c             	lea    0xc(%ebp),%eax
 8de:	83 c0 04             	add    $0x4,%eax
 8e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8eb:	e9 7c 01 00 00       	jmp    a6c <printf+0x19e>
    c = fmt[i] & 0xff;
 8f0:	8b 55 0c             	mov    0xc(%ebp),%edx
 8f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f6:	01 d0                	add    %edx,%eax
 8f8:	0f b6 00             	movzbl (%eax),%eax
 8fb:	0f be c0             	movsbl %al,%eax
 8fe:	25 ff 00 00 00       	and    $0xff,%eax
 903:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 906:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 90a:	75 2c                	jne    938 <printf+0x6a>
      if(c == '%'){
 90c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 910:	75 0c                	jne    91e <printf+0x50>
        state = '%';
 912:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 919:	e9 4a 01 00 00       	jmp    a68 <printf+0x19a>
      } else {
        putc(fd, c);
 91e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 921:	0f be c0             	movsbl %al,%eax
 924:	89 44 24 04          	mov    %eax,0x4(%esp)
 928:	8b 45 08             	mov    0x8(%ebp),%eax
 92b:	89 04 24             	mov    %eax,(%esp)
 92e:	e8 bb fe ff ff       	call   7ee <putc>
 933:	e9 30 01 00 00       	jmp    a68 <printf+0x19a>
      }
    } else if(state == '%'){
 938:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 93c:	0f 85 26 01 00 00    	jne    a68 <printf+0x19a>
      if(c == 'd'){
 942:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 946:	75 2d                	jne    975 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 948:	8b 45 e8             	mov    -0x18(%ebp),%eax
 94b:	8b 00                	mov    (%eax),%eax
 94d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 954:	00 
 955:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 95c:	00 
 95d:	89 44 24 04          	mov    %eax,0x4(%esp)
 961:	8b 45 08             	mov    0x8(%ebp),%eax
 964:	89 04 24             	mov    %eax,(%esp)
 967:	e8 aa fe ff ff       	call   816 <printint>
        ap++;
 96c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 970:	e9 ec 00 00 00       	jmp    a61 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 975:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 979:	74 06                	je     981 <printf+0xb3>
 97b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 97f:	75 2d                	jne    9ae <printf+0xe0>
        printint(fd, *ap, 16, 0);
 981:	8b 45 e8             	mov    -0x18(%ebp),%eax
 984:	8b 00                	mov    (%eax),%eax
 986:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 98d:	00 
 98e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 995:	00 
 996:	89 44 24 04          	mov    %eax,0x4(%esp)
 99a:	8b 45 08             	mov    0x8(%ebp),%eax
 99d:	89 04 24             	mov    %eax,(%esp)
 9a0:	e8 71 fe ff ff       	call   816 <printint>
        ap++;
 9a5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9a9:	e9 b3 00 00 00       	jmp    a61 <printf+0x193>
      } else if(c == 's'){
 9ae:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 9b2:	75 45                	jne    9f9 <printf+0x12b>
        s = (char*)*ap;
 9b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9b7:	8b 00                	mov    (%eax),%eax
 9b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 9bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 9c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9c4:	75 09                	jne    9cf <printf+0x101>
          s = "(null)";
 9c6:	c7 45 f4 0d 0d 00 00 	movl   $0xd0d,-0xc(%ebp)
        while(*s != 0){
 9cd:	eb 1e                	jmp    9ed <printf+0x11f>
 9cf:	eb 1c                	jmp    9ed <printf+0x11f>
          putc(fd, *s);
 9d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d4:	0f b6 00             	movzbl (%eax),%eax
 9d7:	0f be c0             	movsbl %al,%eax
 9da:	89 44 24 04          	mov    %eax,0x4(%esp)
 9de:	8b 45 08             	mov    0x8(%ebp),%eax
 9e1:	89 04 24             	mov    %eax,(%esp)
 9e4:	e8 05 fe ff ff       	call   7ee <putc>
          s++;
 9e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 9ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f0:	0f b6 00             	movzbl (%eax),%eax
 9f3:	84 c0                	test   %al,%al
 9f5:	75 da                	jne    9d1 <printf+0x103>
 9f7:	eb 68                	jmp    a61 <printf+0x193>
        }
      } else if(c == 'c'){
 9f9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9fd:	75 1d                	jne    a1c <printf+0x14e>
        putc(fd, *ap);
 9ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 a02:	8b 00                	mov    (%eax),%eax
 a04:	0f be c0             	movsbl %al,%eax
 a07:	89 44 24 04          	mov    %eax,0x4(%esp)
 a0b:	8b 45 08             	mov    0x8(%ebp),%eax
 a0e:	89 04 24             	mov    %eax,(%esp)
 a11:	e8 d8 fd ff ff       	call   7ee <putc>
        ap++;
 a16:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a1a:	eb 45                	jmp    a61 <printf+0x193>
      } else if(c == '%'){
 a1c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 a20:	75 17                	jne    a39 <printf+0x16b>
        putc(fd, c);
 a22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a25:	0f be c0             	movsbl %al,%eax
 a28:	89 44 24 04          	mov    %eax,0x4(%esp)
 a2c:	8b 45 08             	mov    0x8(%ebp),%eax
 a2f:	89 04 24             	mov    %eax,(%esp)
 a32:	e8 b7 fd ff ff       	call   7ee <putc>
 a37:	eb 28                	jmp    a61 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a39:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 a40:	00 
 a41:	8b 45 08             	mov    0x8(%ebp),%eax
 a44:	89 04 24             	mov    %eax,(%esp)
 a47:	e8 a2 fd ff ff       	call   7ee <putc>
        putc(fd, c);
 a4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a4f:	0f be c0             	movsbl %al,%eax
 a52:	89 44 24 04          	mov    %eax,0x4(%esp)
 a56:	8b 45 08             	mov    0x8(%ebp),%eax
 a59:	89 04 24             	mov    %eax,(%esp)
 a5c:	e8 8d fd ff ff       	call   7ee <putc>
      }
      state = 0;
 a61:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a68:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a6c:	8b 55 0c             	mov    0xc(%ebp),%edx
 a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a72:	01 d0                	add    %edx,%eax
 a74:	0f b6 00             	movzbl (%eax),%eax
 a77:	84 c0                	test   %al,%al
 a79:	0f 85 71 fe ff ff    	jne    8f0 <printf+0x22>
    }
  }
}
 a7f:	c9                   	leave  
 a80:	c3                   	ret    

00000a81 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a81:	55                   	push   %ebp
 a82:	89 e5                	mov    %esp,%ebp
 a84:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	83 e8 08             	sub    $0x8,%eax
 a8d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a90:	a1 08 10 00 00       	mov    0x1008,%eax
 a95:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a98:	eb 24                	jmp    abe <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9d:	8b 00                	mov    (%eax),%eax
 a9f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 aa2:	77 12                	ja     ab6 <free+0x35>
 aa4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 aaa:	77 24                	ja     ad0 <free+0x4f>
 aac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aaf:	8b 00                	mov    (%eax),%eax
 ab1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ab4:	77 1a                	ja     ad0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab9:	8b 00                	mov    (%eax),%eax
 abb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 abe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ac4:	76 d4                	jbe    a9a <free+0x19>
 ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac9:	8b 00                	mov    (%eax),%eax
 acb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ace:	76 ca                	jbe    a9a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad3:	8b 40 04             	mov    0x4(%eax),%eax
 ad6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 add:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae0:	01 c2                	add    %eax,%edx
 ae2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae5:	8b 00                	mov    (%eax),%eax
 ae7:	39 c2                	cmp    %eax,%edx
 ae9:	75 24                	jne    b0f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 aeb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aee:	8b 50 04             	mov    0x4(%eax),%edx
 af1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af4:	8b 00                	mov    (%eax),%eax
 af6:	8b 40 04             	mov    0x4(%eax),%eax
 af9:	01 c2                	add    %eax,%edx
 afb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 afe:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 b01:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b04:	8b 00                	mov    (%eax),%eax
 b06:	8b 10                	mov    (%eax),%edx
 b08:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b0b:	89 10                	mov    %edx,(%eax)
 b0d:	eb 0a                	jmp    b19 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 b0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b12:	8b 10                	mov    (%eax),%edx
 b14:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b17:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 b19:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b1c:	8b 40 04             	mov    0x4(%eax),%eax
 b1f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 b26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b29:	01 d0                	add    %edx,%eax
 b2b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b2e:	75 20                	jne    b50 <free+0xcf>
    p->s.size += bp->s.size;
 b30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b33:	8b 50 04             	mov    0x4(%eax),%edx
 b36:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b39:	8b 40 04             	mov    0x4(%eax),%eax
 b3c:	01 c2                	add    %eax,%edx
 b3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b41:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b44:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b47:	8b 10                	mov    (%eax),%edx
 b49:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b4c:	89 10                	mov    %edx,(%eax)
 b4e:	eb 08                	jmp    b58 <free+0xd7>
  } else
    p->s.ptr = bp;
 b50:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b53:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b56:	89 10                	mov    %edx,(%eax)
  freep = p;
 b58:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b5b:	a3 08 10 00 00       	mov    %eax,0x1008
}
 b60:	c9                   	leave  
 b61:	c3                   	ret    

00000b62 <morecore>:

static Header*
morecore(uint nu)
{
 b62:	55                   	push   %ebp
 b63:	89 e5                	mov    %esp,%ebp
 b65:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b68:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b6f:	77 07                	ja     b78 <morecore+0x16>
    nu = 4096;
 b71:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b78:	8b 45 08             	mov    0x8(%ebp),%eax
 b7b:	c1 e0 03             	shl    $0x3,%eax
 b7e:	89 04 24             	mov    %eax,(%esp)
 b81:	e8 40 fc ff ff       	call   7c6 <sbrk>
 b86:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b89:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b8d:	75 07                	jne    b96 <morecore+0x34>
    return 0;
 b8f:	b8 00 00 00 00       	mov    $0x0,%eax
 b94:	eb 22                	jmp    bb8 <morecore+0x56>
  hp = (Header*)p;
 b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b99:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9f:	8b 55 08             	mov    0x8(%ebp),%edx
 ba2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 ba5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba8:	83 c0 08             	add    $0x8,%eax
 bab:	89 04 24             	mov    %eax,(%esp)
 bae:	e8 ce fe ff ff       	call   a81 <free>
  return freep;
 bb3:	a1 08 10 00 00       	mov    0x1008,%eax
}
 bb8:	c9                   	leave  
 bb9:	c3                   	ret    

00000bba <malloc>:

void*
malloc(uint nbytes)
{
 bba:	55                   	push   %ebp
 bbb:	89 e5                	mov    %esp,%ebp
 bbd:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc0:	8b 45 08             	mov    0x8(%ebp),%eax
 bc3:	83 c0 07             	add    $0x7,%eax
 bc6:	c1 e8 03             	shr    $0x3,%eax
 bc9:	83 c0 01             	add    $0x1,%eax
 bcc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 bcf:	a1 08 10 00 00       	mov    0x1008,%eax
 bd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bd7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bdb:	75 23                	jne    c00 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 bdd:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
 be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 be7:	a3 08 10 00 00       	mov    %eax,0x1008
 bec:	a1 08 10 00 00       	mov    0x1008,%eax
 bf1:	a3 00 10 00 00       	mov    %eax,0x1000
    base.s.size = 0;
 bf6:	c7 05 04 10 00 00 00 	movl   $0x0,0x1004
 bfd:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c03:	8b 00                	mov    (%eax),%eax
 c05:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 c08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c0b:	8b 40 04             	mov    0x4(%eax),%eax
 c0e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c11:	72 4d                	jb     c60 <malloc+0xa6>
      if(p->s.size == nunits)
 c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c16:	8b 40 04             	mov    0x4(%eax),%eax
 c19:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c1c:	75 0c                	jne    c2a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 c1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c21:	8b 10                	mov    (%eax),%edx
 c23:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c26:	89 10                	mov    %edx,(%eax)
 c28:	eb 26                	jmp    c50 <malloc+0x96>
      else {
        p->s.size -= nunits;
 c2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2d:	8b 40 04             	mov    0x4(%eax),%eax
 c30:	2b 45 ec             	sub    -0x14(%ebp),%eax
 c33:	89 c2                	mov    %eax,%edx
 c35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c38:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3e:	8b 40 04             	mov    0x4(%eax),%eax
 c41:	c1 e0 03             	shl    $0x3,%eax
 c44:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c4d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c50:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c53:	a3 08 10 00 00       	mov    %eax,0x1008
      return (void*)(p + 1);
 c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c5b:	83 c0 08             	add    $0x8,%eax
 c5e:	eb 38                	jmp    c98 <malloc+0xde>
    }
    if(p == freep)
 c60:	a1 08 10 00 00       	mov    0x1008,%eax
 c65:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c68:	75 1b                	jne    c85 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c6d:	89 04 24             	mov    %eax,(%esp)
 c70:	e8 ed fe ff ff       	call   b62 <morecore>
 c75:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c78:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c7c:	75 07                	jne    c85 <malloc+0xcb>
        return 0;
 c7e:	b8 00 00 00 00       	mov    $0x0,%eax
 c83:	eb 13                	jmp    c98 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c88:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8e:	8b 00                	mov    (%eax),%eax
 c90:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c93:	e9 70 ff ff ff       	jmp    c08 <malloc+0x4e>
}
 c98:	c9                   	leave  
 c99:	c3                   	ret    
