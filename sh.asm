
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 cb 10 00 00       	call   10dc <exit>

  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 64 16 00 00 	mov    0x1664(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 38 16 00 00 	movl   $0x1638,(%esp)
      2b:	e8 27 03 00 00       	call   357 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 f4             	mov    -0xc(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 97 10 00 00       	call   10dc <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 f4             	mov    -0xc(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 b7 10 00 00       	call   1114 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 3f 16 00 	movl   $0x163f,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 f1 11 00 00       	call   126c <printf>
    break;
      7b:	e9 86 01 00 00       	jmp    206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 70 10 00 00       	call   1104 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 70 10 00 00       	call   111c <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 4f 16 00 	movl   $0x164f,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 9e 11 00 00       	call   126c <printf>
      exit();
      ce:	e8 09 10 00 00       	call   10dc <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 20 01 00 00       	jmp    206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 8c 02 00 00       	call   37d <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 dc 0f 00 00       	call   10e4 <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 eb 00 00 00       	jmp    206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 c0 0f 00 00       	call   10ec <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 5f 16 00 00 	movl   $0x165f,(%esp)
     137:	e8 1b 02 00 00       	call   357 <panic>
    if(fork1() == 0){
     13c:	e8 3c 02 00 00       	call   37d <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 b3 0f 00 00       	call   1104 <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 f8 0f 00 00       	call   1154 <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 9d 0f 00 00       	call   1104 <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 92 0f 00 00       	call   1104 <close>
      runcmd(pcmd->left);
     172:	8b 45 e8             	mov    -0x18(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 f8 01 00 00       	call   37d <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 6f 0f 00 00       	call   1104 <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 b4 0f 00 00       	call   1154 <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 59 0f 00 00       	call   1104 <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 4e 0f 00 00       	call   1104 <close>
      runcmd(pcmd->right);
     1b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 35 0f 00 00       	call   1104 <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 2a 0f 00 00       	call   1104 <close>
    wait();
     1da:	e8 05 0f 00 00       	call   10e4 <wait>
    wait();
     1df:	e8 00 0f 00 00       	call   10e4 <wait>
    break;
     1e4:	eb 20                	jmp    206 <runcmd+0x206>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 8c 01 00 00       	call   37d <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 10                	jne    205 <runcmd+0x205>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
     203:	eb 00                	jmp    205 <runcmd+0x205>
     205:	90                   	nop
  }
  exit();
     206:	e8 d1 0e 00 00       	call   10dc <exit>

0000020b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     20b:	55                   	push   %ebp
     20c:	89 e5                	mov    %esp,%ebp
     20e:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     211:	c7 44 24 04 7c 16 00 	movl   $0x167c,0x4(%esp)
     218:	00 
     219:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     220:	e8 47 10 00 00       	call   126c <printf>
  memset(buf, 0, nbuf);
     225:	8b 45 0c             	mov    0xc(%ebp),%eax
     228:	89 44 24 08          	mov    %eax,0x8(%esp)
     22c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     233:	00 
     234:	8b 45 08             	mov    0x8(%ebp),%eax
     237:	89 04 24             	mov    %eax,(%esp)
     23a:	e8 75 0b 00 00       	call   db4 <memset>
  gets(buf, nbuf);
     23f:	8b 45 0c             	mov    0xc(%ebp),%eax
     242:	89 44 24 04          	mov    %eax,0x4(%esp)
     246:	8b 45 08             	mov    0x8(%ebp),%eax
     249:	89 04 24             	mov    %eax,(%esp)
     24c:	e8 ba 0b 00 00       	call   e0b <gets>
  if(buf[0] == 0) // EOF
     251:	8b 45 08             	mov    0x8(%ebp),%eax
     254:	0f b6 00             	movzbl (%eax),%eax
     257:	84 c0                	test   %al,%al
     259:	75 07                	jne    262 <getcmd+0x57>
    return -1;
     25b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     260:	eb 05                	jmp    267 <getcmd+0x5c>
  return 0;
     262:	b8 00 00 00 00       	mov    $0x0,%eax
}
     267:	c9                   	leave  
     268:	c3                   	ret    

00000269 <main>:

int
main(void)
{
     269:	55                   	push   %ebp
     26a:	89 e5                	mov    %esp,%ebp
     26c:	83 e4 f0             	and    $0xfffffff0,%esp
     26f:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     272:	eb 15                	jmp    289 <main+0x20>
    if(fd >= 3){
     274:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     279:	7e 0e                	jle    289 <main+0x20>
      close(fd);
     27b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     27f:	89 04 24             	mov    %eax,(%esp)
     282:	e8 7d 0e 00 00       	call   1104 <close>
      break;
     287:	eb 1f                	jmp    2a8 <main+0x3f>
  while((fd = open("console", O_RDWR)) >= 0){
     289:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     290:	00 
     291:	c7 04 24 7f 16 00 00 	movl   $0x167f,(%esp)
     298:	e8 7f 0e 00 00       	call   111c <open>
     29d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2a6:	79 cc                	jns    274 <main+0xb>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2a8:	e9 89 00 00 00       	jmp    336 <main+0xcd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2ad:	0f b6 05 40 1c 00 00 	movzbl 0x1c40,%eax
     2b4:	3c 63                	cmp    $0x63,%al
     2b6:	75 5c                	jne    314 <main+0xab>
     2b8:	0f b6 05 41 1c 00 00 	movzbl 0x1c41,%eax
     2bf:	3c 64                	cmp    $0x64,%al
     2c1:	75 51                	jne    314 <main+0xab>
     2c3:	0f b6 05 42 1c 00 00 	movzbl 0x1c42,%eax
     2ca:	3c 20                	cmp    $0x20,%al
     2cc:	75 46                	jne    314 <main+0xab>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2ce:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
     2d5:	e8 b3 0a 00 00       	call   d8d <strlen>
     2da:	83 e8 01             	sub    $0x1,%eax
     2dd:	c6 80 40 1c 00 00 00 	movb   $0x0,0x1c40(%eax)
      if(chdir(buf+3) < 0)
     2e4:	c7 04 24 43 1c 00 00 	movl   $0x1c43,(%esp)
     2eb:	e8 5c 0e 00 00       	call   114c <chdir>
     2f0:	85 c0                	test   %eax,%eax
     2f2:	79 1e                	jns    312 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
     2f4:	c7 44 24 08 43 1c 00 	movl   $0x1c43,0x8(%esp)
     2fb:	00 
     2fc:	c7 44 24 04 87 16 00 	movl   $0x1687,0x4(%esp)
     303:	00 
     304:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     30b:	e8 5c 0f 00 00       	call   126c <printf>
      continue;
     310:	eb 24                	jmp    336 <main+0xcd>
     312:	eb 22                	jmp    336 <main+0xcd>
    }
    if(fork1() == 0)
     314:	e8 64 00 00 00       	call   37d <fork1>
     319:	85 c0                	test   %eax,%eax
     31b:	75 14                	jne    331 <main+0xc8>
      runcmd(parsecmd(buf));
     31d:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
     324:	e8 c9 03 00 00       	call   6f2 <parsecmd>
     329:	89 04 24             	mov    %eax,(%esp)
     32c:	e8 cf fc ff ff       	call   0 <runcmd>
    wait();
     331:	e8 ae 0d 00 00       	call   10e4 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     336:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     33d:	00 
     33e:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
     345:	e8 c1 fe ff ff       	call   20b <getcmd>
     34a:	85 c0                	test   %eax,%eax
     34c:	0f 89 5b ff ff ff    	jns    2ad <main+0x44>
  }
  exit();
     352:	e8 85 0d 00 00       	call   10dc <exit>

00000357 <panic>:
}

void
panic(char *s)
{
     357:	55                   	push   %ebp
     358:	89 e5                	mov    %esp,%ebp
     35a:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
     360:	89 44 24 08          	mov    %eax,0x8(%esp)
     364:	c7 44 24 04 95 16 00 	movl   $0x1695,0x4(%esp)
     36b:	00 
     36c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     373:	e8 f4 0e 00 00       	call   126c <printf>
  exit();
     378:	e8 5f 0d 00 00       	call   10dc <exit>

0000037d <fork1>:
}

int
fork1(void)
{
     37d:	55                   	push   %ebp
     37e:	89 e5                	mov    %esp,%ebp
     380:	83 ec 28             	sub    $0x28,%esp
  int pid;

  pid = fork();
     383:	e8 4c 0d 00 00       	call   10d4 <fork>
     388:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     38b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     38f:	75 0c                	jne    39d <fork1+0x20>
    panic("fork");
     391:	c7 04 24 99 16 00 00 	movl   $0x1699,(%esp)
     398:	e8 ba ff ff ff       	call   357 <panic>
  return pid;
     39d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3a0:	c9                   	leave  
     3a1:	c3                   	ret    

000003a2 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3a2:	55                   	push   %ebp
     3a3:	89 e5                	mov    %esp,%ebp
     3a5:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a8:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3af:	e8 a4 11 00 00       	call   1558 <malloc>
     3b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3b7:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3be:	00 
     3bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c6:	00 
     3c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3ca:	89 04 24             	mov    %eax,(%esp)
     3cd:	e8 e2 09 00 00       	call   db4 <memset>
  cmd->type = EXEC;
     3d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d5:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     3db:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3de:	c9                   	leave  
     3df:	c3                   	ret    

000003e0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e6:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ed:	e8 66 11 00 00       	call   1558 <malloc>
     3f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3f5:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3fc:	00 
     3fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     404:	00 
     405:	8b 45 f4             	mov    -0xc(%ebp),%eax
     408:	89 04 24             	mov    %eax,(%esp)
     40b:	e8 a4 09 00 00       	call   db4 <memset>
  cmd->type = REDIR;
     410:	8b 45 f4             	mov    -0xc(%ebp),%eax
     413:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     419:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41c:	8b 55 08             	mov    0x8(%ebp),%edx
     41f:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     422:	8b 45 f4             	mov    -0xc(%ebp),%eax
     425:	8b 55 0c             	mov    0xc(%ebp),%edx
     428:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42e:	8b 55 10             	mov    0x10(%ebp),%edx
     431:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     434:	8b 45 f4             	mov    -0xc(%ebp),%eax
     437:	8b 55 14             	mov    0x14(%ebp),%edx
     43a:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     43d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     440:	8b 55 18             	mov    0x18(%ebp),%edx
     443:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     446:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     449:	c9                   	leave  
     44a:	c3                   	ret    

0000044b <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     44b:	55                   	push   %ebp
     44c:	89 e5                	mov    %esp,%ebp
     44e:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     451:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     458:	e8 fb 10 00 00       	call   1558 <malloc>
     45d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     460:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     467:	00 
     468:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     46f:	00 
     470:	8b 45 f4             	mov    -0xc(%ebp),%eax
     473:	89 04 24             	mov    %eax,(%esp)
     476:	e8 39 09 00 00       	call   db4 <memset>
  cmd->type = PIPE;
     47b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47e:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     484:	8b 45 f4             	mov    -0xc(%ebp),%eax
     487:	8b 55 08             	mov    0x8(%ebp),%edx
     48a:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     490:	8b 55 0c             	mov    0xc(%ebp),%edx
     493:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     496:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     499:	c9                   	leave  
     49a:	c3                   	ret    

0000049b <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     49b:	55                   	push   %ebp
     49c:	89 e5                	mov    %esp,%ebp
     49e:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4a8:	e8 ab 10 00 00       	call   1558 <malloc>
     4ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4b0:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4b7:	00 
     4b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4bf:	00 
     4c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c3:	89 04 24             	mov    %eax,(%esp)
     4c6:	e8 e9 08 00 00       	call   db4 <memset>
  cmd->type = LIST;
     4cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ce:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d7:	8b 55 08             	mov    0x8(%ebp),%edx
     4da:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e0:	8b 55 0c             	mov    0xc(%ebp),%edx
     4e3:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4e9:	c9                   	leave  
     4ea:	c3                   	ret    

000004eb <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4eb:	55                   	push   %ebp
     4ec:	89 e5                	mov    %esp,%ebp
     4ee:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4f8:	e8 5b 10 00 00       	call   1558 <malloc>
     4fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     500:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     507:	00 
     508:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     50f:	00 
     510:	8b 45 f4             	mov    -0xc(%ebp),%eax
     513:	89 04 24             	mov    %eax,(%esp)
     516:	e8 99 08 00 00       	call   db4 <memset>
  cmd->type = BACK;
     51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51e:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     524:	8b 45 f4             	mov    -0xc(%ebp),%eax
     527:	8b 55 08             	mov    0x8(%ebp),%edx
     52a:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     530:	c9                   	leave  
     531:	c3                   	ret    

00000532 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     532:	55                   	push   %ebp
     533:	89 e5                	mov    %esp,%ebp
     535:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;

  s = *ps;
     538:	8b 45 08             	mov    0x8(%ebp),%eax
     53b:	8b 00                	mov    (%eax),%eax
     53d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     540:	eb 04                	jmp    546 <gettoken+0x14>
    s++;
     542:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     546:	8b 45 f4             	mov    -0xc(%ebp),%eax
     549:	3b 45 0c             	cmp    0xc(%ebp),%eax
     54c:	73 1d                	jae    56b <gettoken+0x39>
     54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     551:	0f b6 00             	movzbl (%eax),%eax
     554:	0f be c0             	movsbl %al,%eax
     557:	89 44 24 04          	mov    %eax,0x4(%esp)
     55b:	c7 04 24 08 1c 00 00 	movl   $0x1c08,(%esp)
     562:	e8 71 08 00 00       	call   dd8 <strchr>
     567:	85 c0                	test   %eax,%eax
     569:	75 d7                	jne    542 <gettoken+0x10>
  if(q)
     56b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     56f:	74 08                	je     579 <gettoken+0x47>
    *q = s;
     571:	8b 45 10             	mov    0x10(%ebp),%eax
     574:	8b 55 f4             	mov    -0xc(%ebp),%edx
     577:	89 10                	mov    %edx,(%eax)
  ret = *s;
     579:	8b 45 f4             	mov    -0xc(%ebp),%eax
     57c:	0f b6 00             	movzbl (%eax),%eax
     57f:	0f be c0             	movsbl %al,%eax
     582:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     585:	8b 45 f4             	mov    -0xc(%ebp),%eax
     588:	0f b6 00             	movzbl (%eax),%eax
     58b:	0f be c0             	movsbl %al,%eax
     58e:	83 f8 29             	cmp    $0x29,%eax
     591:	7f 14                	jg     5a7 <gettoken+0x75>
     593:	83 f8 28             	cmp    $0x28,%eax
     596:	7d 28                	jge    5c0 <gettoken+0x8e>
     598:	85 c0                	test   %eax,%eax
     59a:	0f 84 94 00 00 00    	je     634 <gettoken+0x102>
     5a0:	83 f8 26             	cmp    $0x26,%eax
     5a3:	74 1b                	je     5c0 <gettoken+0x8e>
     5a5:	eb 3c                	jmp    5e3 <gettoken+0xb1>
     5a7:	83 f8 3e             	cmp    $0x3e,%eax
     5aa:	74 1a                	je     5c6 <gettoken+0x94>
     5ac:	83 f8 3e             	cmp    $0x3e,%eax
     5af:	7f 0a                	jg     5bb <gettoken+0x89>
     5b1:	83 e8 3b             	sub    $0x3b,%eax
     5b4:	83 f8 01             	cmp    $0x1,%eax
     5b7:	77 2a                	ja     5e3 <gettoken+0xb1>
     5b9:	eb 05                	jmp    5c0 <gettoken+0x8e>
     5bb:	83 f8 7c             	cmp    $0x7c,%eax
     5be:	75 23                	jne    5e3 <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     5c4:	eb 6f                	jmp    635 <gettoken+0x103>
  case '>':
    s++;
     5c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     5ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5cd:	0f b6 00             	movzbl (%eax),%eax
     5d0:	3c 3e                	cmp    $0x3e,%al
     5d2:	75 0d                	jne    5e1 <gettoken+0xaf>
      ret = '+';
     5d4:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     5db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     5df:	eb 54                	jmp    635 <gettoken+0x103>
     5e1:	eb 52                	jmp    635 <gettoken+0x103>
  default:
    ret = 'a';
     5e3:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ea:	eb 04                	jmp    5f0 <gettoken+0xbe>
      s++;
     5ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5f3:	3b 45 0c             	cmp    0xc(%ebp),%eax
     5f6:	73 3a                	jae    632 <gettoken+0x100>
     5f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fb:	0f b6 00             	movzbl (%eax),%eax
     5fe:	0f be c0             	movsbl %al,%eax
     601:	89 44 24 04          	mov    %eax,0x4(%esp)
     605:	c7 04 24 08 1c 00 00 	movl   $0x1c08,(%esp)
     60c:	e8 c7 07 00 00       	call   dd8 <strchr>
     611:	85 c0                	test   %eax,%eax
     613:	75 1d                	jne    632 <gettoken+0x100>
     615:	8b 45 f4             	mov    -0xc(%ebp),%eax
     618:	0f b6 00             	movzbl (%eax),%eax
     61b:	0f be c0             	movsbl %al,%eax
     61e:	89 44 24 04          	mov    %eax,0x4(%esp)
     622:	c7 04 24 0e 1c 00 00 	movl   $0x1c0e,(%esp)
     629:	e8 aa 07 00 00       	call   dd8 <strchr>
     62e:	85 c0                	test   %eax,%eax
     630:	74 ba                	je     5ec <gettoken+0xba>
    break;
     632:	eb 01                	jmp    635 <gettoken+0x103>
    break;
     634:	90                   	nop
  }
  if(eq)
     635:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     639:	74 0a                	je     645 <gettoken+0x113>
    *eq = s;
     63b:	8b 45 14             	mov    0x14(%ebp),%eax
     63e:	8b 55 f4             	mov    -0xc(%ebp),%edx
     641:	89 10                	mov    %edx,(%eax)

  while(s < es && strchr(whitespace, *s))
     643:	eb 06                	jmp    64b <gettoken+0x119>
     645:	eb 04                	jmp    64b <gettoken+0x119>
    s++;
     647:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     64b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     64e:	3b 45 0c             	cmp    0xc(%ebp),%eax
     651:	73 1d                	jae    670 <gettoken+0x13e>
     653:	8b 45 f4             	mov    -0xc(%ebp),%eax
     656:	0f b6 00             	movzbl (%eax),%eax
     659:	0f be c0             	movsbl %al,%eax
     65c:	89 44 24 04          	mov    %eax,0x4(%esp)
     660:	c7 04 24 08 1c 00 00 	movl   $0x1c08,(%esp)
     667:	e8 6c 07 00 00       	call   dd8 <strchr>
     66c:	85 c0                	test   %eax,%eax
     66e:	75 d7                	jne    647 <gettoken+0x115>
  *ps = s;
     670:	8b 45 08             	mov    0x8(%ebp),%eax
     673:	8b 55 f4             	mov    -0xc(%ebp),%edx
     676:	89 10                	mov    %edx,(%eax)
  return ret;
     678:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     67b:	c9                   	leave  
     67c:	c3                   	ret    

0000067d <peek>:

int
peek(char **ps, char *es, char *toks)
{
     67d:	55                   	push   %ebp
     67e:	89 e5                	mov    %esp,%ebp
     680:	83 ec 28             	sub    $0x28,%esp
  char *s;

  s = *ps;
     683:	8b 45 08             	mov    0x8(%ebp),%eax
     686:	8b 00                	mov    (%eax),%eax
     688:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     68b:	eb 04                	jmp    691 <peek+0x14>
    s++;
     68d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     691:	8b 45 f4             	mov    -0xc(%ebp),%eax
     694:	3b 45 0c             	cmp    0xc(%ebp),%eax
     697:	73 1d                	jae    6b6 <peek+0x39>
     699:	8b 45 f4             	mov    -0xc(%ebp),%eax
     69c:	0f b6 00             	movzbl (%eax),%eax
     69f:	0f be c0             	movsbl %al,%eax
     6a2:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a6:	c7 04 24 08 1c 00 00 	movl   $0x1c08,(%esp)
     6ad:	e8 26 07 00 00       	call   dd8 <strchr>
     6b2:	85 c0                	test   %eax,%eax
     6b4:	75 d7                	jne    68d <peek+0x10>
  *ps = s;
     6b6:	8b 45 08             	mov    0x8(%ebp),%eax
     6b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6bc:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6be:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c1:	0f b6 00             	movzbl (%eax),%eax
     6c4:	84 c0                	test   %al,%al
     6c6:	74 23                	je     6eb <peek+0x6e>
     6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6cb:	0f b6 00             	movzbl (%eax),%eax
     6ce:	0f be c0             	movsbl %al,%eax
     6d1:	89 44 24 04          	mov    %eax,0x4(%esp)
     6d5:	8b 45 10             	mov    0x10(%ebp),%eax
     6d8:	89 04 24             	mov    %eax,(%esp)
     6db:	e8 f8 06 00 00       	call   dd8 <strchr>
     6e0:	85 c0                	test   %eax,%eax
     6e2:	74 07                	je     6eb <peek+0x6e>
     6e4:	b8 01 00 00 00       	mov    $0x1,%eax
     6e9:	eb 05                	jmp    6f0 <peek+0x73>
     6eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6f0:	c9                   	leave  
     6f1:	c3                   	ret    

000006f2 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     6f2:	55                   	push   %ebp
     6f3:	89 e5                	mov    %esp,%ebp
     6f5:	53                   	push   %ebx
     6f6:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     6f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6fc:	8b 45 08             	mov    0x8(%ebp),%eax
     6ff:	89 04 24             	mov    %eax,(%esp)
     702:	e8 86 06 00 00       	call   d8d <strlen>
     707:	01 d8                	add    %ebx,%eax
     709:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     70f:	89 44 24 04          	mov    %eax,0x4(%esp)
     713:	8d 45 08             	lea    0x8(%ebp),%eax
     716:	89 04 24             	mov    %eax,(%esp)
     719:	e8 60 00 00 00       	call   77e <parseline>
     71e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     721:	c7 44 24 08 9e 16 00 	movl   $0x169e,0x8(%esp)
     728:	00 
     729:	8b 45 f4             	mov    -0xc(%ebp),%eax
     72c:	89 44 24 04          	mov    %eax,0x4(%esp)
     730:	8d 45 08             	lea    0x8(%ebp),%eax
     733:	89 04 24             	mov    %eax,(%esp)
     736:	e8 42 ff ff ff       	call   67d <peek>
  if(s != es){
     73b:	8b 45 08             	mov    0x8(%ebp),%eax
     73e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     741:	74 27                	je     76a <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     743:	8b 45 08             	mov    0x8(%ebp),%eax
     746:	89 44 24 08          	mov    %eax,0x8(%esp)
     74a:	c7 44 24 04 9f 16 00 	movl   $0x169f,0x4(%esp)
     751:	00 
     752:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     759:	e8 0e 0b 00 00       	call   126c <printf>
    panic("syntax");
     75e:	c7 04 24 ae 16 00 00 	movl   $0x16ae,(%esp)
     765:	e8 ed fb ff ff       	call   357 <panic>
  }
  nulterminate(cmd);
     76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     76d:	89 04 24             	mov    %eax,(%esp)
     770:	e8 a3 04 00 00       	call   c18 <nulterminate>
  return cmd;
     775:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     778:	83 c4 24             	add    $0x24,%esp
     77b:	5b                   	pop    %ebx
     77c:	5d                   	pop    %ebp
     77d:	c3                   	ret    

0000077e <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     77e:	55                   	push   %ebp
     77f:	89 e5                	mov    %esp,%ebp
     781:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     784:	8b 45 0c             	mov    0xc(%ebp),%eax
     787:	89 44 24 04          	mov    %eax,0x4(%esp)
     78b:	8b 45 08             	mov    0x8(%ebp),%eax
     78e:	89 04 24             	mov    %eax,(%esp)
     791:	e8 bc 00 00 00       	call   852 <parsepipe>
     796:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     799:	eb 30                	jmp    7cb <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     79b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7a2:	00 
     7a3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7aa:	00 
     7ab:	8b 45 0c             	mov    0xc(%ebp),%eax
     7ae:	89 44 24 04          	mov    %eax,0x4(%esp)
     7b2:	8b 45 08             	mov    0x8(%ebp),%eax
     7b5:	89 04 24             	mov    %eax,(%esp)
     7b8:	e8 75 fd ff ff       	call   532 <gettoken>
    cmd = backcmd(cmd);
     7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7c0:	89 04 24             	mov    %eax,(%esp)
     7c3:	e8 23 fd ff ff       	call   4eb <backcmd>
     7c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7cb:	c7 44 24 08 b5 16 00 	movl   $0x16b5,0x8(%esp)
     7d2:	00 
     7d3:	8b 45 0c             	mov    0xc(%ebp),%eax
     7d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     7da:	8b 45 08             	mov    0x8(%ebp),%eax
     7dd:	89 04 24             	mov    %eax,(%esp)
     7e0:	e8 98 fe ff ff       	call   67d <peek>
     7e5:	85 c0                	test   %eax,%eax
     7e7:	75 b2                	jne    79b <parseline+0x1d>
  }
  if(peek(ps, es, ";")){
     7e9:	c7 44 24 08 b7 16 00 	movl   $0x16b7,0x8(%esp)
     7f0:	00 
     7f1:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f4:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f8:	8b 45 08             	mov    0x8(%ebp),%eax
     7fb:	89 04 24             	mov    %eax,(%esp)
     7fe:	e8 7a fe ff ff       	call   67d <peek>
     803:	85 c0                	test   %eax,%eax
     805:	74 46                	je     84d <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     807:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     80e:	00 
     80f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     816:	00 
     817:	8b 45 0c             	mov    0xc(%ebp),%eax
     81a:	89 44 24 04          	mov    %eax,0x4(%esp)
     81e:	8b 45 08             	mov    0x8(%ebp),%eax
     821:	89 04 24             	mov    %eax,(%esp)
     824:	e8 09 fd ff ff       	call   532 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     829:	8b 45 0c             	mov    0xc(%ebp),%eax
     82c:	89 44 24 04          	mov    %eax,0x4(%esp)
     830:	8b 45 08             	mov    0x8(%ebp),%eax
     833:	89 04 24             	mov    %eax,(%esp)
     836:	e8 43 ff ff ff       	call   77e <parseline>
     83b:	89 44 24 04          	mov    %eax,0x4(%esp)
     83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     842:	89 04 24             	mov    %eax,(%esp)
     845:	e8 51 fc ff ff       	call   49b <listcmd>
     84a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     850:	c9                   	leave  
     851:	c3                   	ret    

00000852 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     852:	55                   	push   %ebp
     853:	89 e5                	mov    %esp,%ebp
     855:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     858:	8b 45 0c             	mov    0xc(%ebp),%eax
     85b:	89 44 24 04          	mov    %eax,0x4(%esp)
     85f:	8b 45 08             	mov    0x8(%ebp),%eax
     862:	89 04 24             	mov    %eax,(%esp)
     865:	e8 68 02 00 00       	call   ad2 <parseexec>
     86a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     86d:	c7 44 24 08 b9 16 00 	movl   $0x16b9,0x8(%esp)
     874:	00 
     875:	8b 45 0c             	mov    0xc(%ebp),%eax
     878:	89 44 24 04          	mov    %eax,0x4(%esp)
     87c:	8b 45 08             	mov    0x8(%ebp),%eax
     87f:	89 04 24             	mov    %eax,(%esp)
     882:	e8 f6 fd ff ff       	call   67d <peek>
     887:	85 c0                	test   %eax,%eax
     889:	74 46                	je     8d1 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     88b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     892:	00 
     893:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     89a:	00 
     89b:	8b 45 0c             	mov    0xc(%ebp),%eax
     89e:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a2:	8b 45 08             	mov    0x8(%ebp),%eax
     8a5:	89 04 24             	mov    %eax,(%esp)
     8a8:	e8 85 fc ff ff       	call   532 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ad:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b0:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b4:	8b 45 08             	mov    0x8(%ebp),%eax
     8b7:	89 04 24             	mov    %eax,(%esp)
     8ba:	e8 93 ff ff ff       	call   852 <parsepipe>
     8bf:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c6:	89 04 24             	mov    %eax,(%esp)
     8c9:	e8 7d fb ff ff       	call   44b <pipecmd>
     8ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8d4:	c9                   	leave  
     8d5:	c3                   	ret    

000008d6 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8d6:	55                   	push   %ebp
     8d7:	89 e5                	mov    %esp,%ebp
     8d9:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8dc:	e9 f6 00 00 00       	jmp    9d7 <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     8e1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8e8:	00 
     8e9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8f0:	00 
     8f1:	8b 45 10             	mov    0x10(%ebp),%eax
     8f4:	89 44 24 04          	mov    %eax,0x4(%esp)
     8f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     8fb:	89 04 24             	mov    %eax,(%esp)
     8fe:	e8 2f fc ff ff       	call   532 <gettoken>
     903:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     906:	8d 45 ec             	lea    -0x14(%ebp),%eax
     909:	89 44 24 0c          	mov    %eax,0xc(%esp)
     90d:	8d 45 f0             	lea    -0x10(%ebp),%eax
     910:	89 44 24 08          	mov    %eax,0x8(%esp)
     914:	8b 45 10             	mov    0x10(%ebp),%eax
     917:	89 44 24 04          	mov    %eax,0x4(%esp)
     91b:	8b 45 0c             	mov    0xc(%ebp),%eax
     91e:	89 04 24             	mov    %eax,(%esp)
     921:	e8 0c fc ff ff       	call   532 <gettoken>
     926:	83 f8 61             	cmp    $0x61,%eax
     929:	74 0c                	je     937 <parseredirs+0x61>
      panic("missing file for redirection");
     92b:	c7 04 24 bb 16 00 00 	movl   $0x16bb,(%esp)
     932:	e8 20 fa ff ff       	call   357 <panic>
    switch(tok){
     937:	8b 45 f4             	mov    -0xc(%ebp),%eax
     93a:	83 f8 3c             	cmp    $0x3c,%eax
     93d:	74 0f                	je     94e <parseredirs+0x78>
     93f:	83 f8 3e             	cmp    $0x3e,%eax
     942:	74 38                	je     97c <parseredirs+0xa6>
     944:	83 f8 2b             	cmp    $0x2b,%eax
     947:	74 61                	je     9aa <parseredirs+0xd4>
     949:	e9 89 00 00 00       	jmp    9d7 <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     94e:	8b 55 ec             	mov    -0x14(%ebp),%edx
     951:	8b 45 f0             	mov    -0x10(%ebp),%eax
     954:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     95b:	00 
     95c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     963:	00 
     964:	89 54 24 08          	mov    %edx,0x8(%esp)
     968:	89 44 24 04          	mov    %eax,0x4(%esp)
     96c:	8b 45 08             	mov    0x8(%ebp),%eax
     96f:	89 04 24             	mov    %eax,(%esp)
     972:	e8 69 fa ff ff       	call   3e0 <redircmd>
     977:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     97a:	eb 5b                	jmp    9d7 <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     97c:	8b 55 ec             	mov    -0x14(%ebp),%edx
     97f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     982:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     989:	00 
     98a:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     991:	00 
     992:	89 54 24 08          	mov    %edx,0x8(%esp)
     996:	89 44 24 04          	mov    %eax,0x4(%esp)
     99a:	8b 45 08             	mov    0x8(%ebp),%eax
     99d:	89 04 24             	mov    %eax,(%esp)
     9a0:	e8 3b fa ff ff       	call   3e0 <redircmd>
     9a5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9a8:	eb 2d                	jmp    9d7 <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9b0:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9b7:	00 
     9b8:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9bf:	00 
     9c0:	89 54 24 08          	mov    %edx,0x8(%esp)
     9c4:	89 44 24 04          	mov    %eax,0x4(%esp)
     9c8:	8b 45 08             	mov    0x8(%ebp),%eax
     9cb:	89 04 24             	mov    %eax,(%esp)
     9ce:	e8 0d fa ff ff       	call   3e0 <redircmd>
     9d3:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9d6:	90                   	nop
  while(peek(ps, es, "<>")){
     9d7:	c7 44 24 08 d8 16 00 	movl   $0x16d8,0x8(%esp)
     9de:	00 
     9df:	8b 45 10             	mov    0x10(%ebp),%eax
     9e2:	89 44 24 04          	mov    %eax,0x4(%esp)
     9e6:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e9:	89 04 24             	mov    %eax,(%esp)
     9ec:	e8 8c fc ff ff       	call   67d <peek>
     9f1:	85 c0                	test   %eax,%eax
     9f3:	0f 85 e8 fe ff ff    	jne    8e1 <parseredirs+0xb>
    }
  }
  return cmd;
     9f9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     9fc:	c9                   	leave  
     9fd:	c3                   	ret    

000009fe <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     9fe:	55                   	push   %ebp
     9ff:	89 e5                	mov    %esp,%ebp
     a01:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a04:	c7 44 24 08 db 16 00 	movl   $0x16db,0x8(%esp)
     a0b:	00 
     a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a13:	8b 45 08             	mov    0x8(%ebp),%eax
     a16:	89 04 24             	mov    %eax,(%esp)
     a19:	e8 5f fc ff ff       	call   67d <peek>
     a1e:	85 c0                	test   %eax,%eax
     a20:	75 0c                	jne    a2e <parseblock+0x30>
    panic("parseblock");
     a22:	c7 04 24 dd 16 00 00 	movl   $0x16dd,(%esp)
     a29:	e8 29 f9 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a2e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a35:	00 
     a36:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a3d:	00 
     a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a41:	89 44 24 04          	mov    %eax,0x4(%esp)
     a45:	8b 45 08             	mov    0x8(%ebp),%eax
     a48:	89 04 24             	mov    %eax,(%esp)
     a4b:	e8 e2 fa ff ff       	call   532 <gettoken>
  cmd = parseline(ps, es);
     a50:	8b 45 0c             	mov    0xc(%ebp),%eax
     a53:	89 44 24 04          	mov    %eax,0x4(%esp)
     a57:	8b 45 08             	mov    0x8(%ebp),%eax
     a5a:	89 04 24             	mov    %eax,(%esp)
     a5d:	e8 1c fd ff ff       	call   77e <parseline>
     a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     a65:	c7 44 24 08 e8 16 00 	movl   $0x16e8,0x8(%esp)
     a6c:	00 
     a6d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a70:	89 44 24 04          	mov    %eax,0x4(%esp)
     a74:	8b 45 08             	mov    0x8(%ebp),%eax
     a77:	89 04 24             	mov    %eax,(%esp)
     a7a:	e8 fe fb ff ff       	call   67d <peek>
     a7f:	85 c0                	test   %eax,%eax
     a81:	75 0c                	jne    a8f <parseblock+0x91>
    panic("syntax - missing )");
     a83:	c7 04 24 ea 16 00 00 	movl   $0x16ea,(%esp)
     a8a:	e8 c8 f8 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a8f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a96:	00 
     a97:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a9e:	00 
     a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa6:	8b 45 08             	mov    0x8(%ebp),%eax
     aa9:	89 04 24             	mov    %eax,(%esp)
     aac:	e8 81 fa ff ff       	call   532 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab4:	89 44 24 08          	mov    %eax,0x8(%esp)
     ab8:	8b 45 08             	mov    0x8(%ebp),%eax
     abb:	89 44 24 04          	mov    %eax,0x4(%esp)
     abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac2:	89 04 24             	mov    %eax,(%esp)
     ac5:	e8 0c fe ff ff       	call   8d6 <parseredirs>
     aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ad0:	c9                   	leave  
     ad1:	c3                   	ret    

00000ad2 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     ad2:	55                   	push   %ebp
     ad3:	89 e5                	mov    %esp,%ebp
     ad5:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     ad8:	c7 44 24 08 db 16 00 	movl   $0x16db,0x8(%esp)
     adf:	00 
     ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
     ae7:	8b 45 08             	mov    0x8(%ebp),%eax
     aea:	89 04 24             	mov    %eax,(%esp)
     aed:	e8 8b fb ff ff       	call   67d <peek>
     af2:	85 c0                	test   %eax,%eax
     af4:	74 17                	je     b0d <parseexec+0x3b>
    return parseblock(ps, es);
     af6:	8b 45 0c             	mov    0xc(%ebp),%eax
     af9:	89 44 24 04          	mov    %eax,0x4(%esp)
     afd:	8b 45 08             	mov    0x8(%ebp),%eax
     b00:	89 04 24             	mov    %eax,(%esp)
     b03:	e8 f6 fe ff ff       	call   9fe <parseblock>
     b08:	e9 09 01 00 00       	jmp    c16 <parseexec+0x144>

  ret = execcmd();
     b0d:	e8 90 f8 ff ff       	call   3a2 <execcmd>
     b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b18:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     b1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     b22:	8b 45 0c             	mov    0xc(%ebp),%eax
     b25:	89 44 24 08          	mov    %eax,0x8(%esp)
     b29:	8b 45 08             	mov    0x8(%ebp),%eax
     b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
     b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b33:	89 04 24             	mov    %eax,(%esp)
     b36:	e8 9b fd ff ff       	call   8d6 <parseredirs>
     b3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     b3e:	e9 8f 00 00 00       	jmp    bd2 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b43:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b46:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b4a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b4d:	89 44 24 08          	mov    %eax,0x8(%esp)
     b51:	8b 45 0c             	mov    0xc(%ebp),%eax
     b54:	89 44 24 04          	mov    %eax,0x4(%esp)
     b58:	8b 45 08             	mov    0x8(%ebp),%eax
     b5b:	89 04 24             	mov    %eax,(%esp)
     b5e:	e8 cf f9 ff ff       	call   532 <gettoken>
     b63:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b66:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b6a:	75 05                	jne    b71 <parseexec+0x9f>
      break;
     b6c:	e9 83 00 00 00       	jmp    bf4 <parseexec+0x122>
    if(tok != 'a')
     b71:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     b75:	74 0c                	je     b83 <parseexec+0xb1>
      panic("syntax");
     b77:	c7 04 24 ae 16 00 00 	movl   $0x16ae,(%esp)
     b7e:	e8 d4 f7 ff ff       	call   357 <panic>
    cmd->argv[argc] = q;
     b83:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     b86:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b8c:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     b90:	8b 55 e0             	mov    -0x20(%ebp),%edx
     b93:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b96:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     b99:	83 c1 08             	add    $0x8,%ecx
     b9c:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     ba0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     ba4:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     ba8:	7e 0c                	jle    bb6 <parseexec+0xe4>
      panic("too many args");
     baa:	c7 04 24 fd 16 00 00 	movl   $0x16fd,(%esp)
     bb1:	e8 a1 f7 ff ff       	call   357 <panic>
    ret = parseredirs(ret, ps, es);
     bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb9:	89 44 24 08          	mov    %eax,0x8(%esp)
     bbd:	8b 45 08             	mov    0x8(%ebp),%eax
     bc0:	89 44 24 04          	mov    %eax,0x4(%esp)
     bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc7:	89 04 24             	mov    %eax,(%esp)
     bca:	e8 07 fd ff ff       	call   8d6 <parseredirs>
     bcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     bd2:	c7 44 24 08 0b 17 00 	movl   $0x170b,0x8(%esp)
     bd9:	00 
     bda:	8b 45 0c             	mov    0xc(%ebp),%eax
     bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
     be1:	8b 45 08             	mov    0x8(%ebp),%eax
     be4:	89 04 24             	mov    %eax,(%esp)
     be7:	e8 91 fa ff ff       	call   67d <peek>
     bec:	85 c0                	test   %eax,%eax
     bee:	0f 84 4f ff ff ff    	je     b43 <parseexec+0x71>
  }
  cmd->argv[argc] = 0;
     bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     bfa:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c01:	00 
  cmd->eargv[argc] = 0;
     c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c05:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c08:	83 c2 08             	add    $0x8,%edx
     c0b:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c12:	00 
  return ret;
     c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c16:	c9                   	leave  
     c17:	c3                   	ret    

00000c18 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c18:	55                   	push   %ebp
     c19:	89 e5                	mov    %esp,%ebp
     c1b:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c1e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c22:	75 0a                	jne    c2e <nulterminate+0x16>
    return 0;
     c24:	b8 00 00 00 00       	mov    $0x0,%eax
     c29:	e9 c9 00 00 00       	jmp    cf7 <nulterminate+0xdf>

  switch(cmd->type){
     c2e:	8b 45 08             	mov    0x8(%ebp),%eax
     c31:	8b 00                	mov    (%eax),%eax
     c33:	83 f8 05             	cmp    $0x5,%eax
     c36:	0f 87 b8 00 00 00    	ja     cf4 <nulterminate+0xdc>
     c3c:	8b 04 85 10 17 00 00 	mov    0x1710(,%eax,4),%eax
     c43:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c45:	8b 45 08             	mov    0x8(%ebp),%eax
     c48:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c52:	eb 14                	jmp    c68 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c54:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c57:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c5a:	83 c2 08             	add    $0x8,%edx
     c5d:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     c61:	c6 00 00             	movb   $0x0,(%eax)
    for(i=0; ecmd->argv[i]; i++)
     c64:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c6e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     c72:	85 c0                	test   %eax,%eax
     c74:	75 de                	jne    c54 <nulterminate+0x3c>
    break;
     c76:	eb 7c                	jmp    cf4 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c78:	8b 45 08             	mov    0x8(%ebp),%eax
     c7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     c7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c81:	8b 40 04             	mov    0x4(%eax),%eax
     c84:	89 04 24             	mov    %eax,(%esp)
     c87:	e8 8c ff ff ff       	call   c18 <nulterminate>
    *rcmd->efile = 0;
     c8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c8f:	8b 40 0c             	mov    0xc(%eax),%eax
     c92:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c95:	eb 5d                	jmp    cf4 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c97:	8b 45 08             	mov    0x8(%ebp),%eax
     c9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     c9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ca0:	8b 40 04             	mov    0x4(%eax),%eax
     ca3:	89 04 24             	mov    %eax,(%esp)
     ca6:	e8 6d ff ff ff       	call   c18 <nulterminate>
    nulterminate(pcmd->right);
     cab:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cae:	8b 40 08             	mov    0x8(%eax),%eax
     cb1:	89 04 24             	mov    %eax,(%esp)
     cb4:	e8 5f ff ff ff       	call   c18 <nulterminate>
    break;
     cb9:	eb 39                	jmp    cf4 <nulterminate+0xdc>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cc4:	8b 40 04             	mov    0x4(%eax),%eax
     cc7:	89 04 24             	mov    %eax,(%esp)
     cca:	e8 49 ff ff ff       	call   c18 <nulterminate>
    nulterminate(lcmd->right);
     ccf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cd2:	8b 40 08             	mov    0x8(%eax),%eax
     cd5:	89 04 24             	mov    %eax,(%esp)
     cd8:	e8 3b ff ff ff       	call   c18 <nulterminate>
    break;
     cdd:	eb 15                	jmp    cf4 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     cdf:	8b 45 08             	mov    0x8(%ebp),%eax
     ce2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     ce5:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ce8:	8b 40 04             	mov    0x4(%eax),%eax
     ceb:	89 04 24             	mov    %eax,(%esp)
     cee:	e8 25 ff ff ff       	call   c18 <nulterminate>
    break;
     cf3:	90                   	nop
  }
  return cmd;
     cf4:	8b 45 08             	mov    0x8(%ebp),%eax
}
     cf7:	c9                   	leave  
     cf8:	c3                   	ret    

00000cf9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     cf9:	55                   	push   %ebp
     cfa:	89 e5                	mov    %esp,%ebp
     cfc:	57                   	push   %edi
     cfd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     cfe:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d01:	8b 55 10             	mov    0x10(%ebp),%edx
     d04:	8b 45 0c             	mov    0xc(%ebp),%eax
     d07:	89 cb                	mov    %ecx,%ebx
     d09:	89 df                	mov    %ebx,%edi
     d0b:	89 d1                	mov    %edx,%ecx
     d0d:	fc                   	cld    
     d0e:	f3 aa                	rep stos %al,%es:(%edi)
     d10:	89 ca                	mov    %ecx,%edx
     d12:	89 fb                	mov    %edi,%ebx
     d14:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d17:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d1a:	5b                   	pop    %ebx
     d1b:	5f                   	pop    %edi
     d1c:	5d                   	pop    %ebp
     d1d:	c3                   	ret    

00000d1e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
     d1e:	55                   	push   %ebp
     d1f:	89 e5                	mov    %esp,%ebp
     d21:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d24:	8b 45 08             	mov    0x8(%ebp),%eax
     d27:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d2a:	90                   	nop
     d2b:	8b 45 08             	mov    0x8(%ebp),%eax
     d2e:	8d 50 01             	lea    0x1(%eax),%edx
     d31:	89 55 08             	mov    %edx,0x8(%ebp)
     d34:	8b 55 0c             	mov    0xc(%ebp),%edx
     d37:	8d 4a 01             	lea    0x1(%edx),%ecx
     d3a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     d3d:	0f b6 12             	movzbl (%edx),%edx
     d40:	88 10                	mov    %dl,(%eax)
     d42:	0f b6 00             	movzbl (%eax),%eax
     d45:	84 c0                	test   %al,%al
     d47:	75 e2                	jne    d2b <strcpy+0xd>
    ;
  return os;
     d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d4c:	c9                   	leave  
     d4d:	c3                   	ret    

00000d4e <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d4e:	55                   	push   %ebp
     d4f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d51:	eb 08                	jmp    d5b <strcmp+0xd>
    p++, q++;
     d53:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d57:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
     d5b:	8b 45 08             	mov    0x8(%ebp),%eax
     d5e:	0f b6 00             	movzbl (%eax),%eax
     d61:	84 c0                	test   %al,%al
     d63:	74 10                	je     d75 <strcmp+0x27>
     d65:	8b 45 08             	mov    0x8(%ebp),%eax
     d68:	0f b6 10             	movzbl (%eax),%edx
     d6b:	8b 45 0c             	mov    0xc(%ebp),%eax
     d6e:	0f b6 00             	movzbl (%eax),%eax
     d71:	38 c2                	cmp    %al,%dl
     d73:	74 de                	je     d53 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
     d75:	8b 45 08             	mov    0x8(%ebp),%eax
     d78:	0f b6 00             	movzbl (%eax),%eax
     d7b:	0f b6 d0             	movzbl %al,%edx
     d7e:	8b 45 0c             	mov    0xc(%ebp),%eax
     d81:	0f b6 00             	movzbl (%eax),%eax
     d84:	0f b6 c0             	movzbl %al,%eax
     d87:	29 c2                	sub    %eax,%edx
     d89:	89 d0                	mov    %edx,%eax
}
     d8b:	5d                   	pop    %ebp
     d8c:	c3                   	ret    

00000d8d <strlen>:

uint
strlen(const char *s)
{
     d8d:	55                   	push   %ebp
     d8e:	89 e5                	mov    %esp,%ebp
     d90:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     d93:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     d9a:	eb 04                	jmp    da0 <strlen+0x13>
     d9c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     da0:	8b 55 fc             	mov    -0x4(%ebp),%edx
     da3:	8b 45 08             	mov    0x8(%ebp),%eax
     da6:	01 d0                	add    %edx,%eax
     da8:	0f b6 00             	movzbl (%eax),%eax
     dab:	84 c0                	test   %al,%al
     dad:	75 ed                	jne    d9c <strlen+0xf>
    ;
  return n;
     daf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     db2:	c9                   	leave  
     db3:	c3                   	ret    

00000db4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     db4:	55                   	push   %ebp
     db5:	89 e5                	mov    %esp,%ebp
     db7:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     dba:	8b 45 10             	mov    0x10(%ebp),%eax
     dbd:	89 44 24 08          	mov    %eax,0x8(%esp)
     dc1:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc4:	89 44 24 04          	mov    %eax,0x4(%esp)
     dc8:	8b 45 08             	mov    0x8(%ebp),%eax
     dcb:	89 04 24             	mov    %eax,(%esp)
     dce:	e8 26 ff ff ff       	call   cf9 <stosb>
  return dst;
     dd3:	8b 45 08             	mov    0x8(%ebp),%eax
}
     dd6:	c9                   	leave  
     dd7:	c3                   	ret    

00000dd8 <strchr>:

char*
strchr(const char *s, char c)
{
     dd8:	55                   	push   %ebp
     dd9:	89 e5                	mov    %esp,%ebp
     ddb:	83 ec 04             	sub    $0x4,%esp
     dde:	8b 45 0c             	mov    0xc(%ebp),%eax
     de1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     de4:	eb 14                	jmp    dfa <strchr+0x22>
    if(*s == c)
     de6:	8b 45 08             	mov    0x8(%ebp),%eax
     de9:	0f b6 00             	movzbl (%eax),%eax
     dec:	3a 45 fc             	cmp    -0x4(%ebp),%al
     def:	75 05                	jne    df6 <strchr+0x1e>
      return (char*)s;
     df1:	8b 45 08             	mov    0x8(%ebp),%eax
     df4:	eb 13                	jmp    e09 <strchr+0x31>
  for(; *s; s++)
     df6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     dfa:	8b 45 08             	mov    0x8(%ebp),%eax
     dfd:	0f b6 00             	movzbl (%eax),%eax
     e00:	84 c0                	test   %al,%al
     e02:	75 e2                	jne    de6 <strchr+0xe>
  return 0;
     e04:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e09:	c9                   	leave  
     e0a:	c3                   	ret    

00000e0b <gets>:

char*
gets(char *buf, int max)
{
     e0b:	55                   	push   %ebp
     e0c:	89 e5                	mov    %esp,%ebp
     e0e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e18:	eb 4c                	jmp    e66 <gets+0x5b>
    cc = read(0, &c, 1);
     e1a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e21:	00 
     e22:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e25:	89 44 24 04          	mov    %eax,0x4(%esp)
     e29:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e30:	e8 bf 02 00 00       	call   10f4 <read>
     e35:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     e38:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e3c:	7f 02                	jg     e40 <gets+0x35>
      break;
     e3e:	eb 31                	jmp    e71 <gets+0x66>
    buf[i++] = c;
     e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e43:	8d 50 01             	lea    0x1(%eax),%edx
     e46:	89 55 f4             	mov    %edx,-0xc(%ebp)
     e49:	89 c2                	mov    %eax,%edx
     e4b:	8b 45 08             	mov    0x8(%ebp),%eax
     e4e:	01 c2                	add    %eax,%edx
     e50:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e54:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     e56:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e5a:	3c 0a                	cmp    $0xa,%al
     e5c:	74 13                	je     e71 <gets+0x66>
     e5e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e62:	3c 0d                	cmp    $0xd,%al
     e64:	74 0b                	je     e71 <gets+0x66>
  for(i=0; i+1 < max; ){
     e66:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e69:	83 c0 01             	add    $0x1,%eax
     e6c:	3b 45 0c             	cmp    0xc(%ebp),%eax
     e6f:	7c a9                	jl     e1a <gets+0xf>
      break;
  }
  buf[i] = '\0';
     e71:	8b 55 f4             	mov    -0xc(%ebp),%edx
     e74:	8b 45 08             	mov    0x8(%ebp),%eax
     e77:	01 d0                	add    %edx,%eax
     e79:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     e7c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e7f:	c9                   	leave  
     e80:	c3                   	ret    

00000e81 <stat>:

int
stat(const char *n, struct stat *st)
{
     e81:	55                   	push   %ebp
     e82:	89 e5                	mov    %esp,%ebp
     e84:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e87:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e8e:	00 
     e8f:	8b 45 08             	mov    0x8(%ebp),%eax
     e92:	89 04 24             	mov    %eax,(%esp)
     e95:	e8 82 02 00 00       	call   111c <open>
     e9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     e9d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea1:	79 07                	jns    eaa <stat+0x29>
    return -1;
     ea3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     ea8:	eb 23                	jmp    ecd <stat+0x4c>
  r = fstat(fd, st);
     eaa:	8b 45 0c             	mov    0xc(%ebp),%eax
     ead:	89 44 24 04          	mov    %eax,0x4(%esp)
     eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb4:	89 04 24             	mov    %eax,(%esp)
     eb7:	e8 78 02 00 00       	call   1134 <fstat>
     ebc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec2:	89 04 24             	mov    %eax,(%esp)
     ec5:	e8 3a 02 00 00       	call   1104 <close>
  return r;
     eca:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     ecd:	c9                   	leave  
     ece:	c3                   	ret    

00000ecf <atoi>:

int
atoi(const char *s)
{
     ecf:	55                   	push   %ebp
     ed0:	89 e5                	mov    %esp,%ebp
     ed2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     ed5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     edc:	eb 25                	jmp    f03 <atoi+0x34>
    n = n*10 + *s++ - '0';
     ede:	8b 55 fc             	mov    -0x4(%ebp),%edx
     ee1:	89 d0                	mov    %edx,%eax
     ee3:	c1 e0 02             	shl    $0x2,%eax
     ee6:	01 d0                	add    %edx,%eax
     ee8:	01 c0                	add    %eax,%eax
     eea:	89 c1                	mov    %eax,%ecx
     eec:	8b 45 08             	mov    0x8(%ebp),%eax
     eef:	8d 50 01             	lea    0x1(%eax),%edx
     ef2:	89 55 08             	mov    %edx,0x8(%ebp)
     ef5:	0f b6 00             	movzbl (%eax),%eax
     ef8:	0f be c0             	movsbl %al,%eax
     efb:	01 c8                	add    %ecx,%eax
     efd:	83 e8 30             	sub    $0x30,%eax
     f00:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     f03:	8b 45 08             	mov    0x8(%ebp),%eax
     f06:	0f b6 00             	movzbl (%eax),%eax
     f09:	3c 2f                	cmp    $0x2f,%al
     f0b:	7e 0a                	jle    f17 <atoi+0x48>
     f0d:	8b 45 08             	mov    0x8(%ebp),%eax
     f10:	0f b6 00             	movzbl (%eax),%eax
     f13:	3c 39                	cmp    $0x39,%al
     f15:	7e c7                	jle    ede <atoi+0xf>
  return n;
     f17:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f1a:	c9                   	leave  
     f1b:	c3                   	ret    

00000f1c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f1c:	55                   	push   %ebp
     f1d:	89 e5                	mov    %esp,%ebp
     f1f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
     f22:	8b 45 08             	mov    0x8(%ebp),%eax
     f25:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     f28:	8b 45 0c             	mov    0xc(%ebp),%eax
     f2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     f2e:	eb 17                	jmp    f47 <memmove+0x2b>
    *dst++ = *src++;
     f30:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f33:	8d 50 01             	lea    0x1(%eax),%edx
     f36:	89 55 fc             	mov    %edx,-0x4(%ebp)
     f39:	8b 55 f8             	mov    -0x8(%ebp),%edx
     f3c:	8d 4a 01             	lea    0x1(%edx),%ecx
     f3f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     f42:	0f b6 12             	movzbl (%edx),%edx
     f45:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
     f47:	8b 45 10             	mov    0x10(%ebp),%eax
     f4a:	8d 50 ff             	lea    -0x1(%eax),%edx
     f4d:	89 55 10             	mov    %edx,0x10(%ebp)
     f50:	85 c0                	test   %eax,%eax
     f52:	7f dc                	jg     f30 <memmove+0x14>
  return vdst;
     f54:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f57:	c9                   	leave  
     f58:	c3                   	ret    

00000f59 <ps>:

void
ps()
{
     f59:	55                   	push   %ebp
     f5a:	89 e5                	mov    %esp,%ebp
     f5c:	57                   	push   %edi
     f5d:	56                   	push   %esi
     f5e:	53                   	push   %ebx
     f5f:	81 ec 5c 09 00 00    	sub    $0x95c,%esp
  pstatTable table;
  if (getpinfo(&table) == -1)
     f65:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
     f6b:	89 04 24             	mov    %eax,(%esp)
     f6e:	e8 09 02 00 00       	call   117c <getpinfo>
     f73:	83 f8 ff             	cmp    $0xffffffff,%eax
     f76:	0f 84 4d 01 00 00    	je     10c9 <ps+0x170>
    return;
  int i = 0;
     f7c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  pstat_t p = table[i];
     f83:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     f86:	89 d0                	mov    %edx,%eax
     f88:	c1 e0 03             	shl    $0x3,%eax
     f8b:	01 d0                	add    %edx,%eax
     f8d:	c1 e0 02             	shl    $0x2,%eax
     f90:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f93:	01 f8                	add    %edi,%eax
     f95:	2d 04 09 00 00       	sub    $0x904,%eax
     f9a:	8b 10                	mov    (%eax),%edx
     f9c:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
     fa2:	8b 50 04             	mov    0x4(%eax),%edx
     fa5:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
     fab:	8b 50 08             	mov    0x8(%eax),%edx
     fae:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
     fb4:	8b 50 0c             	mov    0xc(%eax),%edx
     fb7:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
     fbd:	8b 50 10             	mov    0x10(%eax),%edx
     fc0:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
     fc6:	8b 50 14             	mov    0x14(%eax),%edx
     fc9:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
     fcf:	8b 50 18             	mov    0x18(%eax),%edx
     fd2:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
     fd8:	8b 50 1c             	mov    0x1c(%eax),%edx
     fdb:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
     fe1:	8b 40 20             	mov    0x20(%eax),%eax
     fe4:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
     fea:	c7 44 24 04 28 17 00 	movl   $0x1728,0x4(%esp)
     ff1:	00 
     ff2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ff9:	e8 6e 02 00 00       	call   126c <printf>
  for(;p.pid != 0; p = table[i])
     ffe:	e9 b8 00 00 00       	jmp    10bb <ps+0x162>
  {
    printf(1, "%d\t%d\t%d\t%c\t%s\n", p.pid, p.tickets, p.ticks, p.state, p.name);
    1003:	0f b6 85 e0 f6 ff ff 	movzbl -0x920(%ebp),%eax
    100a:	0f be d8             	movsbl %al,%ebx
    100d:	8b 8d cc f6 ff ff    	mov    -0x934(%ebp),%ecx
    1013:	8b 95 c4 f6 ff ff    	mov    -0x93c(%ebp),%edx
    1019:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
    101f:	8d b5 c0 f6 ff ff    	lea    -0x940(%ebp),%esi
    1025:	83 c6 10             	add    $0x10,%esi
    1028:	89 74 24 18          	mov    %esi,0x18(%esp)
    102c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    1030:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1034:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1038:	89 44 24 08          	mov    %eax,0x8(%esp)
    103c:	c7 44 24 04 41 17 00 	movl   $0x1741,0x4(%esp)
    1043:	00 
    1044:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104b:	e8 1c 02 00 00       	call   126c <printf>
    i++;
    1050:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  for(;p.pid != 0; p = table[i])
    1054:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1057:	89 d0                	mov    %edx,%eax
    1059:	c1 e0 03             	shl    $0x3,%eax
    105c:	01 d0                	add    %edx,%eax
    105e:	c1 e0 02             	shl    $0x2,%eax
    1061:	8d 4d e8             	lea    -0x18(%ebp),%ecx
    1064:	01 c8                	add    %ecx,%eax
    1066:	2d 04 09 00 00       	sub    $0x904,%eax
    106b:	8b 10                	mov    (%eax),%edx
    106d:	89 95 c0 f6 ff ff    	mov    %edx,-0x940(%ebp)
    1073:	8b 50 04             	mov    0x4(%eax),%edx
    1076:	89 95 c4 f6 ff ff    	mov    %edx,-0x93c(%ebp)
    107c:	8b 50 08             	mov    0x8(%eax),%edx
    107f:	89 95 c8 f6 ff ff    	mov    %edx,-0x938(%ebp)
    1085:	8b 50 0c             	mov    0xc(%eax),%edx
    1088:	89 95 cc f6 ff ff    	mov    %edx,-0x934(%ebp)
    108e:	8b 50 10             	mov    0x10(%eax),%edx
    1091:	89 95 d0 f6 ff ff    	mov    %edx,-0x930(%ebp)
    1097:	8b 50 14             	mov    0x14(%eax),%edx
    109a:	89 95 d4 f6 ff ff    	mov    %edx,-0x92c(%ebp)
    10a0:	8b 50 18             	mov    0x18(%eax),%edx
    10a3:	89 95 d8 f6 ff ff    	mov    %edx,-0x928(%ebp)
    10a9:	8b 50 1c             	mov    0x1c(%eax),%edx
    10ac:	89 95 dc f6 ff ff    	mov    %edx,-0x924(%ebp)
    10b2:	8b 40 20             	mov    0x20(%eax),%eax
    10b5:	89 85 e0 f6 ff ff    	mov    %eax,-0x920(%ebp)
    10bb:	8b 85 c8 f6 ff ff    	mov    -0x938(%ebp),%eax
    10c1:	85 c0                	test   %eax,%eax
    10c3:	0f 85 3a ff ff ff    	jne    1003 <ps+0xaa>
  }
}
    10c9:	81 c4 5c 09 00 00    	add    $0x95c,%esp
    10cf:	5b                   	pop    %ebx
    10d0:	5e                   	pop    %esi
    10d1:	5f                   	pop    %edi
    10d2:	5d                   	pop    %ebp
    10d3:	c3                   	ret    

000010d4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    10d4:	b8 01 00 00 00       	mov    $0x1,%eax
    10d9:	cd 40                	int    $0x40
    10db:	c3                   	ret    

000010dc <exit>:
SYSCALL(exit)
    10dc:	b8 02 00 00 00       	mov    $0x2,%eax
    10e1:	cd 40                	int    $0x40
    10e3:	c3                   	ret    

000010e4 <wait>:
SYSCALL(wait)
    10e4:	b8 03 00 00 00       	mov    $0x3,%eax
    10e9:	cd 40                	int    $0x40
    10eb:	c3                   	ret    

000010ec <pipe>:
SYSCALL(pipe)
    10ec:	b8 04 00 00 00       	mov    $0x4,%eax
    10f1:	cd 40                	int    $0x40
    10f3:	c3                   	ret    

000010f4 <read>:
SYSCALL(read)
    10f4:	b8 05 00 00 00       	mov    $0x5,%eax
    10f9:	cd 40                	int    $0x40
    10fb:	c3                   	ret    

000010fc <write>:
SYSCALL(write)
    10fc:	b8 10 00 00 00       	mov    $0x10,%eax
    1101:	cd 40                	int    $0x40
    1103:	c3                   	ret    

00001104 <close>:
SYSCALL(close)
    1104:	b8 15 00 00 00       	mov    $0x15,%eax
    1109:	cd 40                	int    $0x40
    110b:	c3                   	ret    

0000110c <kill>:
SYSCALL(kill)
    110c:	b8 06 00 00 00       	mov    $0x6,%eax
    1111:	cd 40                	int    $0x40
    1113:	c3                   	ret    

00001114 <exec>:
SYSCALL(exec)
    1114:	b8 07 00 00 00       	mov    $0x7,%eax
    1119:	cd 40                	int    $0x40
    111b:	c3                   	ret    

0000111c <open>:
SYSCALL(open)
    111c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1121:	cd 40                	int    $0x40
    1123:	c3                   	ret    

00001124 <mknod>:
SYSCALL(mknod)
    1124:	b8 11 00 00 00       	mov    $0x11,%eax
    1129:	cd 40                	int    $0x40
    112b:	c3                   	ret    

0000112c <unlink>:
SYSCALL(unlink)
    112c:	b8 12 00 00 00       	mov    $0x12,%eax
    1131:	cd 40                	int    $0x40
    1133:	c3                   	ret    

00001134 <fstat>:
SYSCALL(fstat)
    1134:	b8 08 00 00 00       	mov    $0x8,%eax
    1139:	cd 40                	int    $0x40
    113b:	c3                   	ret    

0000113c <link>:
SYSCALL(link)
    113c:	b8 13 00 00 00       	mov    $0x13,%eax
    1141:	cd 40                	int    $0x40
    1143:	c3                   	ret    

00001144 <mkdir>:
SYSCALL(mkdir)
    1144:	b8 14 00 00 00       	mov    $0x14,%eax
    1149:	cd 40                	int    $0x40
    114b:	c3                   	ret    

0000114c <chdir>:
SYSCALL(chdir)
    114c:	b8 09 00 00 00       	mov    $0x9,%eax
    1151:	cd 40                	int    $0x40
    1153:	c3                   	ret    

00001154 <dup>:
SYSCALL(dup)
    1154:	b8 0a 00 00 00       	mov    $0xa,%eax
    1159:	cd 40                	int    $0x40
    115b:	c3                   	ret    

0000115c <getpid>:
SYSCALL(getpid)
    115c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1161:	cd 40                	int    $0x40
    1163:	c3                   	ret    

00001164 <sbrk>:
SYSCALL(sbrk)
    1164:	b8 0c 00 00 00       	mov    $0xc,%eax
    1169:	cd 40                	int    $0x40
    116b:	c3                   	ret    

0000116c <sleep>:
SYSCALL(sleep)
    116c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1171:	cd 40                	int    $0x40
    1173:	c3                   	ret    

00001174 <uptime>:
SYSCALL(uptime)
    1174:	b8 0e 00 00 00       	mov    $0xe,%eax
    1179:	cd 40                	int    $0x40
    117b:	c3                   	ret    

0000117c <getpinfo>:
SYSCALL(getpinfo)
    117c:	b8 16 00 00 00       	mov    $0x16,%eax
    1181:	cd 40                	int    $0x40
    1183:	c3                   	ret    

00001184 <settickets>:
    1184:	b8 17 00 00 00       	mov    $0x17,%eax
    1189:	cd 40                	int    $0x40
    118b:	c3                   	ret    

0000118c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    118c:	55                   	push   %ebp
    118d:	89 e5                	mov    %esp,%ebp
    118f:	83 ec 18             	sub    $0x18,%esp
    1192:	8b 45 0c             	mov    0xc(%ebp),%eax
    1195:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1198:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    119f:	00 
    11a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    11a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11a7:	8b 45 08             	mov    0x8(%ebp),%eax
    11aa:	89 04 24             	mov    %eax,(%esp)
    11ad:	e8 4a ff ff ff       	call   10fc <write>
}
    11b2:	c9                   	leave  
    11b3:	c3                   	ret    

000011b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	56                   	push   %esi
    11b8:	53                   	push   %ebx
    11b9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    11bc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    11c3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    11c7:	74 17                	je     11e0 <printint+0x2c>
    11c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    11cd:	79 11                	jns    11e0 <printint+0x2c>
    neg = 1;
    11cf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    11d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d9:	f7 d8                	neg    %eax
    11db:	89 45 ec             	mov    %eax,-0x14(%ebp)
    11de:	eb 06                	jmp    11e6 <printint+0x32>
  } else {
    x = xx;
    11e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    11e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    11ed:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    11f0:	8d 41 01             	lea    0x1(%ecx),%eax
    11f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    11f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
    11f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    11fc:	ba 00 00 00 00       	mov    $0x0,%edx
    1201:	f7 f3                	div    %ebx
    1203:	89 d0                	mov    %edx,%eax
    1205:	0f b6 80 16 1c 00 00 	movzbl 0x1c16(%eax),%eax
    120c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1210:	8b 75 10             	mov    0x10(%ebp),%esi
    1213:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1216:	ba 00 00 00 00       	mov    $0x0,%edx
    121b:	f7 f6                	div    %esi
    121d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1220:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1224:	75 c7                	jne    11ed <printint+0x39>
  if(neg)
    1226:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    122a:	74 10                	je     123c <printint+0x88>
    buf[i++] = '-';
    122c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    122f:	8d 50 01             	lea    0x1(%eax),%edx
    1232:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1235:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    123a:	eb 1f                	jmp    125b <printint+0xa7>
    123c:	eb 1d                	jmp    125b <printint+0xa7>
    putc(fd, buf[i]);
    123e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1241:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1244:	01 d0                	add    %edx,%eax
    1246:	0f b6 00             	movzbl (%eax),%eax
    1249:	0f be c0             	movsbl %al,%eax
    124c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1250:	8b 45 08             	mov    0x8(%ebp),%eax
    1253:	89 04 24             	mov    %eax,(%esp)
    1256:	e8 31 ff ff ff       	call   118c <putc>
  while(--i >= 0)
    125b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    125f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1263:	79 d9                	jns    123e <printint+0x8a>
}
    1265:	83 c4 30             	add    $0x30,%esp
    1268:	5b                   	pop    %ebx
    1269:	5e                   	pop    %esi
    126a:	5d                   	pop    %ebp
    126b:	c3                   	ret    

0000126c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    126c:	55                   	push   %ebp
    126d:	89 e5                	mov    %esp,%ebp
    126f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1272:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1279:	8d 45 0c             	lea    0xc(%ebp),%eax
    127c:	83 c0 04             	add    $0x4,%eax
    127f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1282:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1289:	e9 7c 01 00 00       	jmp    140a <printf+0x19e>
    c = fmt[i] & 0xff;
    128e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1291:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1294:	01 d0                	add    %edx,%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	0f be c0             	movsbl %al,%eax
    129c:	25 ff 00 00 00       	and    $0xff,%eax
    12a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    12a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    12a8:	75 2c                	jne    12d6 <printf+0x6a>
      if(c == '%'){
    12aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    12ae:	75 0c                	jne    12bc <printf+0x50>
        state = '%';
    12b0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    12b7:	e9 4a 01 00 00       	jmp    1406 <printf+0x19a>
      } else {
        putc(fd, c);
    12bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12bf:	0f be c0             	movsbl %al,%eax
    12c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    12c6:	8b 45 08             	mov    0x8(%ebp),%eax
    12c9:	89 04 24             	mov    %eax,(%esp)
    12cc:	e8 bb fe ff ff       	call   118c <putc>
    12d1:	e9 30 01 00 00       	jmp    1406 <printf+0x19a>
      }
    } else if(state == '%'){
    12d6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    12da:	0f 85 26 01 00 00    	jne    1406 <printf+0x19a>
      if(c == 'd'){
    12e0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    12e4:	75 2d                	jne    1313 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    12e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12e9:	8b 00                	mov    (%eax),%eax
    12eb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    12f2:	00 
    12f3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    12fa:	00 
    12fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	89 04 24             	mov    %eax,(%esp)
    1305:	e8 aa fe ff ff       	call   11b4 <printint>
        ap++;
    130a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    130e:	e9 ec 00 00 00       	jmp    13ff <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1313:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1317:	74 06                	je     131f <printf+0xb3>
    1319:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    131d:	75 2d                	jne    134c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    131f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1322:	8b 00                	mov    (%eax),%eax
    1324:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    132b:	00 
    132c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1333:	00 
    1334:	89 44 24 04          	mov    %eax,0x4(%esp)
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	89 04 24             	mov    %eax,(%esp)
    133e:	e8 71 fe ff ff       	call   11b4 <printint>
        ap++;
    1343:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1347:	e9 b3 00 00 00       	jmp    13ff <printf+0x193>
      } else if(c == 's'){
    134c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1350:	75 45                	jne    1397 <printf+0x12b>
        s = (char*)*ap;
    1352:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1355:	8b 00                	mov    (%eax),%eax
    1357:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    135a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    135e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1362:	75 09                	jne    136d <printf+0x101>
          s = "(null)";
    1364:	c7 45 f4 51 17 00 00 	movl   $0x1751,-0xc(%ebp)
        while(*s != 0){
    136b:	eb 1e                	jmp    138b <printf+0x11f>
    136d:	eb 1c                	jmp    138b <printf+0x11f>
          putc(fd, *s);
    136f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1372:	0f b6 00             	movzbl (%eax),%eax
    1375:	0f be c0             	movsbl %al,%eax
    1378:	89 44 24 04          	mov    %eax,0x4(%esp)
    137c:	8b 45 08             	mov    0x8(%ebp),%eax
    137f:	89 04 24             	mov    %eax,(%esp)
    1382:	e8 05 fe ff ff       	call   118c <putc>
          s++;
    1387:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
    138b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    138e:	0f b6 00             	movzbl (%eax),%eax
    1391:	84 c0                	test   %al,%al
    1393:	75 da                	jne    136f <printf+0x103>
    1395:	eb 68                	jmp    13ff <printf+0x193>
        }
      } else if(c == 'c'){
    1397:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    139b:	75 1d                	jne    13ba <printf+0x14e>
        putc(fd, *ap);
    139d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13a0:	8b 00                	mov    (%eax),%eax
    13a2:	0f be c0             	movsbl %al,%eax
    13a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    13a9:	8b 45 08             	mov    0x8(%ebp),%eax
    13ac:	89 04 24             	mov    %eax,(%esp)
    13af:	e8 d8 fd ff ff       	call   118c <putc>
        ap++;
    13b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    13b8:	eb 45                	jmp    13ff <printf+0x193>
      } else if(c == '%'){
    13ba:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    13be:	75 17                	jne    13d7 <printf+0x16b>
        putc(fd, c);
    13c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13c3:	0f be c0             	movsbl %al,%eax
    13c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    13ca:	8b 45 08             	mov    0x8(%ebp),%eax
    13cd:	89 04 24             	mov    %eax,(%esp)
    13d0:	e8 b7 fd ff ff       	call   118c <putc>
    13d5:	eb 28                	jmp    13ff <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    13d7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    13de:	00 
    13df:	8b 45 08             	mov    0x8(%ebp),%eax
    13e2:	89 04 24             	mov    %eax,(%esp)
    13e5:	e8 a2 fd ff ff       	call   118c <putc>
        putc(fd, c);
    13ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13ed:	0f be c0             	movsbl %al,%eax
    13f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    13f4:	8b 45 08             	mov    0x8(%ebp),%eax
    13f7:	89 04 24             	mov    %eax,(%esp)
    13fa:	e8 8d fd ff ff       	call   118c <putc>
      }
      state = 0;
    13ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
    1406:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    140a:	8b 55 0c             	mov    0xc(%ebp),%edx
    140d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1410:	01 d0                	add    %edx,%eax
    1412:	0f b6 00             	movzbl (%eax),%eax
    1415:	84 c0                	test   %al,%al
    1417:	0f 85 71 fe ff ff    	jne    128e <printf+0x22>
    }
  }
}
    141d:	c9                   	leave  
    141e:	c3                   	ret    

0000141f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    141f:	55                   	push   %ebp
    1420:	89 e5                	mov    %esp,%ebp
    1422:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1425:	8b 45 08             	mov    0x8(%ebp),%eax
    1428:	83 e8 08             	sub    $0x8,%eax
    142b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    142e:	a1 ac 1c 00 00       	mov    0x1cac,%eax
    1433:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1436:	eb 24                	jmp    145c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1438:	8b 45 fc             	mov    -0x4(%ebp),%eax
    143b:	8b 00                	mov    (%eax),%eax
    143d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1440:	77 12                	ja     1454 <free+0x35>
    1442:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1445:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1448:	77 24                	ja     146e <free+0x4f>
    144a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    144d:	8b 00                	mov    (%eax),%eax
    144f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1452:	77 1a                	ja     146e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1454:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1457:	8b 00                	mov    (%eax),%eax
    1459:	89 45 fc             	mov    %eax,-0x4(%ebp)
    145c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    145f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1462:	76 d4                	jbe    1438 <free+0x19>
    1464:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1467:	8b 00                	mov    (%eax),%eax
    1469:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    146c:	76 ca                	jbe    1438 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    146e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1471:	8b 40 04             	mov    0x4(%eax),%eax
    1474:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    147b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    147e:	01 c2                	add    %eax,%edx
    1480:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1483:	8b 00                	mov    (%eax),%eax
    1485:	39 c2                	cmp    %eax,%edx
    1487:	75 24                	jne    14ad <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1489:	8b 45 f8             	mov    -0x8(%ebp),%eax
    148c:	8b 50 04             	mov    0x4(%eax),%edx
    148f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1492:	8b 00                	mov    (%eax),%eax
    1494:	8b 40 04             	mov    0x4(%eax),%eax
    1497:	01 c2                	add    %eax,%edx
    1499:	8b 45 f8             	mov    -0x8(%ebp),%eax
    149c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    149f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14a2:	8b 00                	mov    (%eax),%eax
    14a4:	8b 10                	mov    (%eax),%edx
    14a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14a9:	89 10                	mov    %edx,(%eax)
    14ab:	eb 0a                	jmp    14b7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    14ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14b0:	8b 10                	mov    (%eax),%edx
    14b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14b5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    14b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14ba:	8b 40 04             	mov    0x4(%eax),%eax
    14bd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    14c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14c7:	01 d0                	add    %edx,%eax
    14c9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    14cc:	75 20                	jne    14ee <free+0xcf>
    p->s.size += bp->s.size;
    14ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14d1:	8b 50 04             	mov    0x4(%eax),%edx
    14d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14d7:	8b 40 04             	mov    0x4(%eax),%eax
    14da:	01 c2                	add    %eax,%edx
    14dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    14e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14e5:	8b 10                	mov    (%eax),%edx
    14e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14ea:	89 10                	mov    %edx,(%eax)
    14ec:	eb 08                	jmp    14f6 <free+0xd7>
  } else
    p->s.ptr = bp;
    14ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14f1:	8b 55 f8             	mov    -0x8(%ebp),%edx
    14f4:	89 10                	mov    %edx,(%eax)
  freep = p;
    14f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14f9:	a3 ac 1c 00 00       	mov    %eax,0x1cac
}
    14fe:	c9                   	leave  
    14ff:	c3                   	ret    

00001500 <morecore>:

static Header*
morecore(uint nu)
{
    1500:	55                   	push   %ebp
    1501:	89 e5                	mov    %esp,%ebp
    1503:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1506:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    150d:	77 07                	ja     1516 <morecore+0x16>
    nu = 4096;
    150f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1516:	8b 45 08             	mov    0x8(%ebp),%eax
    1519:	c1 e0 03             	shl    $0x3,%eax
    151c:	89 04 24             	mov    %eax,(%esp)
    151f:	e8 40 fc ff ff       	call   1164 <sbrk>
    1524:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1527:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    152b:	75 07                	jne    1534 <morecore+0x34>
    return 0;
    152d:	b8 00 00 00 00       	mov    $0x0,%eax
    1532:	eb 22                	jmp    1556 <morecore+0x56>
  hp = (Header*)p;
    1534:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1537:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    153a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    153d:	8b 55 08             	mov    0x8(%ebp),%edx
    1540:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1543:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1546:	83 c0 08             	add    $0x8,%eax
    1549:	89 04 24             	mov    %eax,(%esp)
    154c:	e8 ce fe ff ff       	call   141f <free>
  return freep;
    1551:	a1 ac 1c 00 00       	mov    0x1cac,%eax
}
    1556:	c9                   	leave  
    1557:	c3                   	ret    

00001558 <malloc>:

void*
malloc(uint nbytes)
{
    1558:	55                   	push   %ebp
    1559:	89 e5                	mov    %esp,%ebp
    155b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    155e:	8b 45 08             	mov    0x8(%ebp),%eax
    1561:	83 c0 07             	add    $0x7,%eax
    1564:	c1 e8 03             	shr    $0x3,%eax
    1567:	83 c0 01             	add    $0x1,%eax
    156a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    156d:	a1 ac 1c 00 00       	mov    0x1cac,%eax
    1572:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1575:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1579:	75 23                	jne    159e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    157b:	c7 45 f0 a4 1c 00 00 	movl   $0x1ca4,-0x10(%ebp)
    1582:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1585:	a3 ac 1c 00 00       	mov    %eax,0x1cac
    158a:	a1 ac 1c 00 00       	mov    0x1cac,%eax
    158f:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
    base.s.size = 0;
    1594:	c7 05 a8 1c 00 00 00 	movl   $0x0,0x1ca8
    159b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    159e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15a1:	8b 00                	mov    (%eax),%eax
    15a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    15a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a9:	8b 40 04             	mov    0x4(%eax),%eax
    15ac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15af:	72 4d                	jb     15fe <malloc+0xa6>
      if(p->s.size == nunits)
    15b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b4:	8b 40 04             	mov    0x4(%eax),%eax
    15b7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15ba:	75 0c                	jne    15c8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    15bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15bf:	8b 10                	mov    (%eax),%edx
    15c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15c4:	89 10                	mov    %edx,(%eax)
    15c6:	eb 26                	jmp    15ee <malloc+0x96>
      else {
        p->s.size -= nunits;
    15c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15cb:	8b 40 04             	mov    0x4(%eax),%eax
    15ce:	2b 45 ec             	sub    -0x14(%ebp),%eax
    15d1:	89 c2                	mov    %eax,%edx
    15d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15d6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    15d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15dc:	8b 40 04             	mov    0x4(%eax),%eax
    15df:	c1 e0 03             	shl    $0x3,%eax
    15e2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    15e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15eb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    15ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15f1:	a3 ac 1c 00 00       	mov    %eax,0x1cac
      return (void*)(p + 1);
    15f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f9:	83 c0 08             	add    $0x8,%eax
    15fc:	eb 38                	jmp    1636 <malloc+0xde>
    }
    if(p == freep)
    15fe:	a1 ac 1c 00 00       	mov    0x1cac,%eax
    1603:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1606:	75 1b                	jne    1623 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1608:	8b 45 ec             	mov    -0x14(%ebp),%eax
    160b:	89 04 24             	mov    %eax,(%esp)
    160e:	e8 ed fe ff ff       	call   1500 <morecore>
    1613:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1616:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    161a:	75 07                	jne    1623 <malloc+0xcb>
        return 0;
    161c:	b8 00 00 00 00       	mov    $0x0,%eax
    1621:	eb 13                	jmp    1636 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1623:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1626:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1629:	8b 45 f4             	mov    -0xc(%ebp),%eax
    162c:	8b 00                	mov    (%eax),%eax
    162e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
    1631:	e9 70 ff ff ff       	jmp    15a6 <malloc+0x4e>
}
    1636:	c9                   	leave  
    1637:	c3                   	ret    
