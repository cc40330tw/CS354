    
    
Disassembly of section .init:
        
    00001000 <_init>:
        1000:    f3 0f 1e fb              endbr32
        1004:    53                       push   %ebx
        1005:    83 ec 08                 sub    $0x8,%esp
        1008:    e8 03 01 00 00           call   1110
        100d:    81 c3 c3 2f 00 00        add    $0x2fc3,%ebx
        1013:    8b 83 24 00 00 00        mov    0x24(%ebx),%eax
        1019:    85 c0                    test   %eax,%eax
        101b:    74 02                    je     101f <_init+0x1f>
        101d:    ff d0                    call   *%eax
        101f:    83 c4 08                 add    $0x8,%esp
        1022:    5b                       pop    %ebx
        1023:    c3                       ret
    
Disassembly of section .plt:
    
    00001030 <.plt>:
        1030:    ff b3 04 00 00 00        pushl  0x4(%ebx)
        1036:    ff a3 08 00 00 00        jmp    *0x8(%ebx)
        103c:    0f 1f 40 00              nopl   0x0(%eax)
        1040:    f3 0f 1e fb              endbr32
        1044:    68 00 00 00 00           push   $0x0
        1049:    e9 e2 ff ff ff           jmp    1030 <.plt>
        104e:    66 90                    xchg   %ax,%ax
        1050:    f3 0f 1e fb              endbr32
        1054:    68 08 00 00 00           push   $0x8
        1059:    e9 d2 ff ff ff           jmp    1030 <.plt>
        105e:    66 90                    xchg   %ax,%ax
        1060:    f3 0f 1e fb              endbr32
        1064:    68 10 00 00 00           push   $0x10
        1069:    e9 c2 ff ff ff           jmp    1030 <.plt>
        106e:    66 90                    xchg   %ax,%ax
        1070:    f3 0f 1e fb              endbr32
        1074:    68 18 00 00 00           push   $0x18
        1079:    e9 b2 ff ff ff           jmp    1030 <.plt>
        107e:    66 90                    xchg   %ax,%ax
    
Disassembly of section .plt.got:
    
    00001080 <__cxa_finalize@plt>:
        1080:    f3 0f 1e fb              endbr32
        1084:    ff a3 20 00 00 00        jmp    *0x20(%ebx)
        108a:    66 0f 1f 44 00 00        nopw   0x0(%eax,%eax,1)
    
Disassembly of section .plt.sec:
    
    00001090 <printf@plt>:
        1090:    f3 0f 1e fb              endbr32
        1094:    ff a3 0c 00 00 00        jmp    *0xc(%ebx)
        109a:    66 0f 1f 44 00 00        nopw   0x0(%eax,%eax,1)
    
    000010a0 <puts@plt>:
        10a0:    f3 0f 1e fb              endbr32
        10a4:    ff a3 10 00 00 00        jmp    *0x10(%ebx)
        10aa:    66 0f 1f 44 00 00        nopw   0x0(%eax,%eax,1)
    
    000010b0 <__libc_start_main@plt>:
        10b0:    f3 0f 1e fb              endbr32
        10b4:    ff a3 14 00 00 00        jmp    *0x14(%ebx)
        10ba:    66 0f 1f 44 00 00        nopw   0x0(%eax,%eax,1)
    
    000010c0 <__isoc99_scanf@plt>:
        10c0:    f3 0f 1e fb              endbr32
        10c4:    ff a3 18 00 00 00        jmp    *0x18(%ebx)
        10ca:    66 0f 1f 44 00 00        nopw   0x0(%eax,%eax,1)
    
Disassembly of section .text:
    
    000010d0 <_start>:
        10d0:    f3 0f 1e fb              endbr32
        10d4:    31 ed                    xor    %ebp,%ebp
        10d6:    5e                       pop    %esi
        10d7:    89 e1                    mov    %esp,%ecx
        10d9:    83 e4 f0                 and    $0xfffffff0,%esp
        10dc:    50                       push   %eax
        10dd:    54                       push   %esp
        10de:    52                       push   %edx
        10df:    e8 22 00 00 00           call   1106 <_start+0x36>
        10e4:    81 c3 ec 2e 00 00        add    $0x2eec,%ebx
        10ea:    8d 83 40 d6 ff ff        lea    -0x29c0(%ebx),%eax
        10f0:    50                       push   %eax
        10f1:    8d 83 d0 d5 ff ff        lea    -0x2a30(%ebx),%eax
        10f7:    50                       push   %eax
        10f8:    51                       push   %ecx
        10f9:    56                       push   %esi
        10fa:    ff b3 28 00 00 00        pushl  0x28(%ebx)
        1100:    e8 ab ff ff ff           call   10b0 <__libc_start_main@plt>
        1105:    f4                       hlt
        1106:    8b 1c 24                 mov    (%esp),%ebx
        1109:    c3                       ret
        110a:    66 90                    xchg   %ax,%ax
        110c:    66 90                    xchg   %ax,%ax
        110e:    66 90                    xchg   %ax,%ax
    
    00001110 <__x86.get_pc_thunk.bx>:
        1110:    8b 1c 24                 mov    (%esp),%ebx
        1113:    c3                       ret
        1114:    66 90                    xchg   %ax,%ax
        1116:    66 90                    xchg   %ax,%ax
        1118:    66 90                    xchg   %ax,%ax
        111a:    66 90                    xchg   %ax,%ax
        111c:    66 90                    xchg   %ax,%ax
        111e:    66 90                    xchg   %ax,%ax
    
    00001120 <deregister_tm_clones>:
        1120:    e8 e4 00 00 00           call   1209 <__x86.get_pc_thunk.dx>
        1125:    81 c2 ab 2e 00 00        add    $0x2eab,%edx
        112b:    8d 8a 38 00 00 00        lea    0x38(%edx),%ecx
        1131:    8d 82 38 00 00 00        lea    0x38(%edx),%eax
        1137:    39 c8                    cmp    %ecx,%eax
        1139:    74 1d                    je     1158 <deregister_tm_clones+0x38>
        113b:    8b 82 1c 00 00 00        mov    0x1c(%edx),%eax
        1141:    85 c0                    test   %eax,%eax
        1143:    74 13                    je     1158 <deregister_tm_clones+0x38>
        1145:    55                       push   %ebp
        1146:    89 e5                    mov    %esp,%ebp
        1148:    83 ec 14                 sub    $0x14,%esp
        114b:    51                       push   %ecx
        114c:    ff d0                    call   *%eax
        114e:    83 c4 10                 add    $0x10,%esp
        1151:    c9                       leave
        1152:    c3                       ret
        1153:    8d 74 26 00              lea    0x0(%esi,%eiz,1),%esi
        1157:    90                       nop
        1158:    c3                       ret
        1159:    8d b4 26 00 00 00 00     lea    0x0(%esi,%eiz,1),%esi
    
    00001160 <register_tm_clones>:
        1160:    e8 a4 00 00 00           call   1209 <__x86.get_pc_thunk.dx>
        1165:    81 c2 6b 2e 00 00        add    $0x2e6b,%edx
        116b:    55                       push   %ebp
        116c:    89 e5                    mov    %esp,%ebp
        116e:    53                       push   %ebx
        116f:    8d 8a 38 00 00 00        lea    0x38(%edx),%ecx
        1175:    8d 82 38 00 00 00        lea    0x38(%edx),%eax
        117b:    83 ec 04                 sub    $0x4,%esp
        117e:    29 c8                    sub    %ecx,%eax
        1180:    89 c3                    mov    %eax,%ebx
        1182:    c1 e8 1f                 shr    $0x1f,%eax
        1185:    c1 fb 02                 sar    $0x2,%ebx
        1188:    01 d8                    add    %ebx,%eax
        118a:    d1 f8                    sar    %eax
        118c:    74 14                    je     11a2 <register_tm_clones+0x42>
        118e:    8b 92 2c 00 00 00        mov    0x2c(%edx),%edx
        1194:    85 d2                    test   %edx,%edx
        1196:    74 0a                    je     11a2 <register_tm_clones+0x42>
        1198:    83 ec 08                 sub    $0x8,%esp
        119b:    50                       push   %eax
        119c:    51                       push   %ecx
        119d:    ff d2                    call   *%edx
        119f:    83 c4 10                 add    $0x10,%esp
        11a2:    8b 5d fc                 mov    -0x4(%ebp),%ebx
        11a5:    c9                       leave
        11a6:    c3                       ret
        11a7:    8d b4 26 00 00 00 00     lea    0x0(%esi,%eiz,1),%esi
        11ae:    66 90                    xchg   %ax,%ax
    
    000011b0 <__do_global_dtors_aux>:
        11b0:    f3 0f 1e fb              endbr32
        11b4:    55                       push   %ebp
        11b5:    89 e5                    mov    %esp,%ebp
        11b7:    53                       push   %ebx
        11b8:    e8 53 ff ff ff           call   1110 <__x86.get_pc_thunk.bx>
        11bd:    81 c3 13 2e 00 00        add    $0x2e13,%ebx
        11c3:    83 ec 04                 sub    $0x4,%esp
        11c6:    80 bb 38 00 00 00 00     cmpb   $0x0,0x38(%ebx)
        11cd:    75 27                    jne    11f6 <__do_global_dtors_aux+0x46>
        11cf:    8b 83 20 00 00 00        mov    0x20(%ebx),%eax
        11d5:    85 c0                    test   %eax,%eax
        11d7:    74 11                    je     11ea <__do_global_dtors_aux+0x3a>
        11d9:    83 ec 0c                 sub    $0xc,%esp
        11dc:    ff b3 34 00 00 00        pushl  0x34(%ebx)
        11e2:    e8 99 fe ff ff           call   1080 <__cxa_finalize@plt>
        11e7:    83 c4 10                 add    $0x10,%esp
        11ea:    e8 31 ff ff ff           call   1120 <deregister_tm_clones>
        11ef:    c6 83 38 00 00 00 01     movb   $0x1,0x38(%ebx)
        11f6:    8b 5d fc                 mov    -0x4(%ebp),%ebx
        11f9:    c9                       leave
        11fa:    c3                       ret
        11fb:    8d 74 26 00              lea    0x0(%esi,%eiz,1),%esi
        11ff:    90                       nop
    
    00001200 <frame_dummy>:
        1200:    f3 0f 1e fb              endbr32
        1204:    e9 57 ff ff ff           jmp    1160 <register_tm_clones>
    
    00001209 <__x86.get_pc_thunk.dx>:
        1209:    8b 14 24                 mov    (%esp),%edx
        120c:    c3                       ret
    
    0000120d <Is_Number_Correct>:
        120d:    f3 0f 1e fb              endbr32
        1211:    55                       push   %ebp
        1212:    89 e5                    mov    %esp,%ebp
        1214:    83 ec 08                 sub    $0x8,%esp

        1217:    8b 45 08                 mov    0x8(%ebp),%eax//parameter n1
        121a:    3b 45 0c                 cmp    0xc(%ebp),%eax//comp parameter n2, n1
        121d:    75 1a                    jne    1239 <Is_Number_Correct+0x2c>//n1!=n2

        121f:    83 ec 08                 sub    $0x8,%esp
        1222:    ff 75 10                 pushl  0x10(%ebp)//push n
        1225:    68 08 20 00 00           push   $0x2008//string
        122a:    e8 fc ff ff ff           call   122b <Is_Number_Correct+0x1e>printf()
        122f:    83 c4 10                 add    $0x10,%esp//remove reserved spcae
        1232:    b8 01 00 00 00           mov    $0x1,%eax//mode=1
        1237:    eb 18                    jmp    1251 <Is_Number_Correct+0x44>//return

        1239:    83 ec 08                 sub    $0x8,%esp
        123c:    ff 75 10                 pushl  0x10(%ebp)//n
        123f:    68 27 20 00 00           push   $0x2027//string
        1244:    e8 fc ff ff ff           call   1245 <Is_Number_Correct+0x38>//printf ()
        1249:    83 c4 10                 add    $0x10,%esp//remove reserved spcae
        124c:    b8 00 00 00 00           mov    $0x0,%eax//mode=0

        1251:    c9                       leave
        1252:    c3                       ret
    
    00001253 <f0>:
        1253:    f3 0f 1e fb              endbr32
        1257:    55                       push   %ebp
        1258:    89 e5                    mov    %esp,%ebp
        125a:    b8 f6 13 02 00           mov    $0x213f6,%eax//136182
        125f:    5d                       pop    %ebp
        1260:    c3                       ret
    
    00001261 <f1>:
        1261:    f3 0f 1e fb              endbr32
        1265:    55                       push   %ebp
        1266:    89 e5                    mov    %esp,%ebp
        1268:    83 ec 10                 sub    $0x10,%esp//-16 from %esp
        126b:    c7 45 fc 47 4e ac 01     movl   $0x1ac4e47,-0x4(%ebp)//n1--28069447
        1272:    c7 45 f8 be 70 02 00     movl   $0x270be,-0x8(%ebp)//n2--159934
        1279:    c7 45 f4 ce ff 01 00     movl   $0x1ffce,-0xc(%ebp)//n3--131022
        1280:    c7 45 f0 ed 27 03 00     movl   $0x327ed,-0x10(%ebp)//n4--206829
        1287:    8b 55 f8                 mov    -0x8(%ebp),%edx//n2 to %edx
        128a:    8b 45 f4                 mov    -0xc(%ebp),%eax//n3 to %eax
        128d:    01 d0                    add    %edx,%eax//n2+n3--eax
        128f:    39 45 fc                 cmp    %eax,-0x4(%ebp)//n1-(n2+n3)
        1292:    7e 18                    jle    12ac <f1+0x4b>//n1-(n2+n3)<=0 jump

        1294:    8b 45 f8                 mov    -0x8(%ebp),%eax    //n2=eax
        1297:    3b 45 f0                 cmp    -0x10(%ebp),%eax   //comp n4 n2
        129a:    75 08                    jne    12a4 <f1+0x43>     //n2!= n4

        129c:    8b 45 fc                 mov    -0x4(%ebp),%eax    //n1=eax
        129f:    23 45 f8                 and    -0x8(%ebp),%eax    //n2&n2
        12a2:    eb 27                    jmp    12cb <f1+0x6a>     //return

        12a4:    8b 45 f4                 mov    -0xc(%ebp),%eax    //n3=eax    if(n2 != n4)
        12a7:    c1 f8 02                 sar    $0x2,%eax          //n3>>2
        12aa:    eb 1f                    jmp    12cb <f1+0x6a>     //return

        12ac:    8b 45 f8                 mov    -0x8(%ebp),%eax//n2 --%eax
        12af:    3b 45 f4                 cmp    -0xc(%ebp),%eax//comp n2-n3
        12b2:    7f 08                    jg     12bc <f1+0x5b>// if n2>n3

        12b4:    8b 45 f8                 mov    -0x8(%ebp),%eax    //n2---eax
        12b7:    3b 45 f0                 cmp    -0x10(%ebp),%eax   //comp n4 n2
        12ba:    7e 08                    jle    12c4 <f1+0x63>     //n2<=n4 jump

        12bc:    8b 45 f4                 mov    -0xc(%ebp),%eax //n3 ---%eax
        12bf:    33 45 f0                 xor    -0x10(%ebp),%eax//n3^n4
        12c2:    eb 07                    jmp    12cb <f1+0x6a>//return

        12c4:    8b 45 fc                 mov    -0x4(%ebp),%eax    //n1 eax
        12c7:    99                       cltd
        12c8:    f7 7d f8                 idivl  -0x8(%ebp)     //n1/n2



        12cb:    c9                       leave
        12cc:    c3                       ret
    
    000012cd <f2>:
        12cd:    f3 0f 1e fb              endbr32
        12d1:    55                       push   %ebp
        12d2:    89 e5                    mov    %esp,%ebp
        12d4:    83 ec 10                 sub    $0x10,%esp

        12d7:    c7 45 fc 00 00 00 00     movl   $0x0,-0x4(%ebp)//i=0
        12de:    c7 45 f8 00 00 00 00     movl   $0x0,-0x8(%ebp)//nRet=0
        12e5:    eb 14                    jmp    12fb <f2+0x2e>

        12e7:    8b 45 fc                 mov    -0x4(%ebp),%eax//i= eax
        12ea:    0f af c0                 imul   %eax,%eax//i*i
        12ed:    89 c2                    mov    %eax,%edx//i*i edx
        12ef:    8b 45 08                 mov    0x8(%ebp),%eax// n eax
        12f2:    01 d0                    add    %edx,%eax//a*a +n
        12f4:    01 45 f8                 add    %eax,-0x8(%ebp) //i * i + n
        12f7:    83 45 fc 01              addl   $0x1,-0x4(%ebp)    //i+=1

        12fb:    83 7d fc 15              cmpl   $0x15,-0x4(%ebp)//i-21
        12ff:    7e e6                    jle    12e7 <f2+0x1a>//if(i-21<=0)
        1301:    8b 45 f8                 mov    -0x8(%ebp),%eax//return nRet
        1304:    c9                       leave
        1305:    c3                       ret
    
    00001306 <f3>:
        1306:    f3 0f 1e fb              endbr32
        130a:    55                       push   %ebp
        130b:    89 e5                    mov    %esp,%ebp

        130d:    8b 45 0c                 mov    0xc(%ebp),%eax//*pn
        1310:    8b 00                    mov    (%eax),%eax//**pn   eax

        1312:    8b 55 08                 mov    0x8(%ebp),%edx//n  edx

        1315:    c1 e2 03                 shl    $0x3,%edx  //n<<3 equal to n*8
        1318:    01 c2                    add    %eax,%edx  //**pn + n*8
        131a:    8b 45 0c                 mov    0xc(%ebp),%eax//*pn-->eax
        131d:    89 10                    mov    %edx,(%eax)//*pn=*pn + n*8

        131f:    8b 45 0c                 mov    0xc(%ebp),%eax//*pn-->%eax
        1322:    8b 08                    mov    (%eax),%ecx//**pn---%ecx

        1324:    ba 56 55 55 55           mov    $0x55555556,%edx//%edx=0x55555556
        1329:    89 c8                    mov    %ecx,%eax//**pn-->%eax
        132b:    f7 ea                    imul   %edx//0x55555556*(**pn)
        132d:    89 c8                    mov    %ecx,%eax//**pn-->%eax
        132f:    c1 f8 1f                 sar    $0x1f,%eax//(**pN >> 0x1f)shift right 31 arithmetic
        1332:    29 c2                    sub    %eax,%edx//(0x55555556 * (*pN))) >> 32) -(*pN >> 0x1f)

        1334:    8b 45 0c                 mov    0xc(%ebp),%eax//*pn-->eax
        1337:    89 10                    mov    %edx,(%eax)//*pn=*pn/3

        1339:    90                       nop
        133a:    5d                       pop    %ebp
        133b:    c3                       ret
    
    0000133c <f4_helper>:
        133c:    f3 0f 1e fb              endbr32
        1340:    55                       push   %ebp
        1341:    89 e5                    mov    %esp,%ebp
        1343:    83 ec 10                 sub    $0x10,%esp

        1346:    c7 45 fc 02 00 00 00     movl   $0x2,-0x4(%ebp)//m=2

        134d:    8b 45 08                 mov    0x8(%ebp),%eax//n=eax
        1350:    0f af 45 fc              imul   -0x4(%ebp),%eax//m*n
        1354:    c9                       leave//return
        1355:    c3                       ret
    
    00001356 <f4>:
        1356:    f3 0f 1e fb              endbr32
        135a:    55                       push   %ebp
        135b:    89 e5                    mov    %esp,%ebp

        135d:    ff 75 08                 pushl  0x8(%ebp)//x1
        1360:    e8 d7 ff ff ff           call   133c <f4_helper>//f4_helper(x1)
        1365:    83 c4 04                 add    $0x4,%esp//stack +4
        1368:    89 45 08                 mov    %eax,0x8(%ebp)//return

        136b:    ff 75 0c                 pushl  0xc(%ebp)//x2
        136e:    e8 c9 ff ff ff           call   133c <f4_helper>//f4_helper(x2)
        1373:    83 c4 04                 add    $0x4,%esp
        1376:    89 45 0c                 mov    %eax,0xc(%ebp)//return

        1379:    ff 75 10                 pushl  0x10(%ebp)//x3
        137c:    e8 bb ff ff ff           call   133c <f4_helper>//f4_helper(x3)
        1381:    83 c4 04                 add    $0x4,%esp
        1384:    89 45 10                 mov    %eax,0x10(%ebp)

        1387:    8b 55 08                 mov    0x8(%ebp),%edx //f4_helper(n1)-->edx
        138a:    8b 45 0c                 mov    0xc(%ebp),%eax //f4_helper(n2)-->eax
        138d:    01 c2                    add    %eax,%edx      //f4_helper(n1)+f4_helper(n2)-->edx
        138f:    8b 45 10                 mov    0x10(%ebp),%eax  //f4_helper(n3)-->eax
        1392:    01 d0                    add    %edx,%eax      //f4_helper(n1)+f4_helper(n2)+f4_helper(n3)
        1394:    c9                       leave
        1395:    c3                       ret
    
    00001396 <f5>:
        1396:    f3 0f 1e fb              endbr32
        139a:    55                       push   %ebp
        139b:    89 e5                    mov    %esp,%ebp
        139d:    83 ec 30                 sub    $0x30,%esp
        

        //nArray[9]
        13a0:    c7 45 d4 84 24 00 00     movl   $0x2484,-0x2c(%ebp)//9348---nArray[0]
        13a7:    c7 45 d8 75 0f 00 00     movl   $0xf75,-0x28(%ebp)//3957--nArray[1]
        13ae:    c7 45 dc 21 0b 00 00     movl   $0xb21,-0x24(%ebp)//2849--nArray[2]
        13b5:    c7 45 e0 00 08 00 00     movl   $0x800,-0x20(%ebp)//2048--nArray[3]
        13bc:    c7 45 e4 1c 1d 00 00     movl   $0x1d1c,-0x1c(%ebp)//7452--nArray[4]
        13c3:    c7 45 e8 84 24 00 00     movl   $0x2484,-0x18(%ebp)//9348--nArray[5]
        13ca:    c7 45 ec 75 0f 00 00     movl   $0xf75,-0x14(%ebp)//3957--nArray[6]
        13d1:    c7 45 f0 21 0b 00 00     movl   $0xb21,-0x10(%ebp)//2849--nArray[7]
        13d8:    c7 45 f4 00 08 00 00     movl   $0x800,-0xc(%ebp)//2048--nArray[8]

        13df:    c7 45 fc 00 00 00 00     movl   $0x0,-0x4(%ebp)//n=0
        13e6:    c7 45 f8 00 00 00 00     movl   $0x0,-0x8(%ebp)//i=0

        13ed:    eb 0e                    jmp    13fd <f5+0x67>

        13ef:    8b 45 f8                 mov    -0x8(%ebp),%eax// i -->eax
        13f2:    8b 44 85 d4              mov    -0x2c(%ebp,%eax,4),%eax//nArray[0+i] or *(nArray+4*i)--%eax
        13f6:    01 45 fc                 add    %eax,-0x4(%ebp)//n=nArray[i]+n
        13f9:    83 45 f8 01              addl   $0x1,-0x8(%ebp)//i++

        13fd:    83 7d f8 04              cmpl   $0x4,-0x8(%ebp)//comp i-4
        1401:    7e ec                    jle    13ef <f5+0x59>//i<=4

        1403:    8b 45 08                 mov    0x8(%ebp),%eax//*pN    (parameter)
        1406:    8d 50 14                 lea    0x14(%eax),%edx//pN+20--->%edx
        1409:    8b 45 fc                 mov    -0x4(%ebp),%eax//n--->%eax
        140c:    89 02                    mov    %eax,(%edx)// *(pn+20) 或pn[5]   =n

        140e:    90                       nop
        140f:    c9                       leave
        1410:    c3                       ret
    
    00001411 <main>:
        1411:    f3 0f 1e fb              endbr32
        1415:    8d 4c 24 04              lea    0x4(%esp),%ecx
        1419:    83 e4 f0                 and    $0xfffffff0,%esp
        141c:    ff 71 fc                 pushl  -0x4(%ecx)
        141f:    55                       push   %ebp
        1420:    89 e5                    mov    %esp,%ebp
        1422:    57                       push   %edi
        1423:    56                       push   %esi
        1424:    53                       push   %ebx
        1425:    51                       push   %ecx
        1426:    83 ec 48                 sub    $0x48,%esp
        1429:    c7 45 e0 00 00 00 00     movl   $0x0,-0x20(%ebp)//nCent
        
        1430:    83 ec 0c                 sub    $0xc,%esp
        1433:    68 3d 20 00 00           push   $0x203d//string
        1438:    e8 fc ff ff ff           call   1439 <main+0x28>//printf()
        143d:    83 c4 10                 add    $0x10,%esp//remove reserved space

        1440:    c7 45 e4 00 00 00 00     movl   $0x0,-0x1c(%ebp)//i=0
        1447:    eb 20                    jmp    1469 <main+0x58>

        1449:    8d 45 c8                 lea    -0x38(%ebp),%eax
        144c:    8b 55 e4                 mov    -0x1c(%ebp),%edx//i -->edx
        144f:    c1 e2 02                 shl    $0x2,%edx//i<<2
        1452:    01 d0                    add    %edx,%eax
        1454:    83 ec 08                 sub    $0x8,%esp
        1457:    50                       push   %eax
        1458:    68 51 20 00 00           push   $0x2051//string
        145d:    e8 fc ff ff ff           call   145e <main+0x4d>//printf()
        1462:    83 c4 10                 add    $0x10,%esp//remove reserved space

        1465:    83 45 e4 01              addl   $0x1,-0x1c(%ebp)//i++

        1469:    83 7d e4 05              cmpl   $0x5,-0x1c(%ebp)//comp i, 5
        146d:    7e da                    jle    1449 <main+0x38>//i<=5


        //printf statment
        146f:    8b 7d dc                 mov    -0x24(%ebp),%edi//arrayA[0]
        1472:    8b 75 d8                 mov    -0x28(%ebp),%esi//arrayA[1]
        1475:    8b 5d d4                 mov    -0x2c(%ebp),%ebx//arrayA[2]
        1478:    8b 4d d0                 mov    -0x30(%ebp),%ecx//arrayA[3]
        147b:    8b 55 cc                 mov    -0x34(%ebp),%edx//arrayA[4]
        147e:    8b 45 c8                 mov    -0x38(%ebp),%eax//arrayA[5]
        1481:    83 ec 04                 sub    $0x4,%esp
        1484:    57                       push   %edi//push arrayA[0]
        1485:    56                       push   %esi//push arrayA[1]
        1486:    53                       push   %ebx//push arrayA[2]
        1487:    51                       push   %ecx//push arrayA[3]
        1488:    52                       push   %edx//push arrayA[4]
        1489:    50                       push   %eax//push arrayA[5]
        148a:    68 54 20 00 00           push   $0x2054//string
        148f:    e8 fc ff ff ff           call   1490 <main+0x7f>//printf()
        1494:    83 c4 20                 add    $0x20,%esp//remove reserved spcae

        1497:    e8 b7 fd ff ff           call   1253 <f0>
        149c:    89 45 b0                 mov    %eax,-0x50(%ebp)//arrayB[0]=f0()

        149f:    e8 bd fd ff ff           call   1261 <f1>
        14a4:    89 45 b4                 mov    %eax,-0x4c(%ebp)//arrayB[1]=f1()

        14a7:    83 ec 0c                 sub    $0xc,%esp
        14aa:    ff 75 e4                 pushl  -0x1c(%ebp)//push i
        14ad:    e8 1b fe ff ff           call   12cd <f2>//f2(i)
        14b2:    83 c4 10                 add    $0x10,%esp
        14b5:    89 45 b8                 mov    %eax,-0x48(%ebp)//arrayB[2]=f2(i)

        14b8:    c7 45 bc d6 8e 00 00     movl   $0x8ed6,-0x44(%ebp)//arrayB[3]=36566
        14bf:    8b 45 bc                 mov    -0x44(%ebp),%eax

        14c2:    83 ec 08                 sub    $0x8,%esp
        14c5:    8d 55 b0                 lea    -0x50(%ebp),%edx//&arrayB[0]
        14c8:    83 c2 0c                 add    $0xc,%edx//&arrayB[3]
        14cb:    52                       push   %edx//&arrayB[3]
        14cc:    50                       push   %eax//36566
        14cd:    e8 34 fe ff ff           call   1306 <f3>//f3 (36566,&arrayB[3])
        14d2:    83 c4 10                 add    $0x10,%esp//ermove reserved space

        14d5:    83 ec 04                 sub    $0x4,%esp
        14d8:    68 d7 03 00 00           push   $0x3d7//983
        14dd:    68 46 03 00 00           push   $0x346//838
        14e2:    68 0f 03 00 00           push   $0x30f//783
        14e7:    e8 6a fe ff ff           call   1356 <f4>//f4 (783,838,983)
        14ec:    83 c4 10                 add    $0x10,%esp//remove reserve space
        14ef:    89 45 c0                 mov    %eax,-0x40(%ebp)//arrayB[4]=f4 (783,838,983)

        14f2:    83 ec 0c                 sub    $0xc,%esp
        14f5:    8d 45 b0                 lea    -0x50(%ebp),%eax//&arrayB[0]
        14f8:    50                       push   %eax//push &arrayB[0]
        14f9:    e8 98 fe ff ff           call   1396 <f5>//f5(&arrayB[0])
        14fe:    83 c4 10                 add    $0x10,%esp//remove reserved space

        1501:    c7 45 e4 00 00 00 00     movl   $0x0,-0x1c(%ebp)//i
        1508:    eb 25                    jmp    152f <main+0x11e>

        150a:    8b 45 e4                 mov    -0x1c(%ebp),%eax//i-->%eax
        150d:    8b 54 85 b0              mov    -0x50(%ebp,%eax,4),%edx//arrayB[i]
        1511:    8b 45 e4                 mov    -0x1c(%ebp),%eax//i-->%eax
        1514:    8b 44 85 c8              mov    -0x38(%ebp,%eax,4),%eax//arrayA[i]
        1518:    83 ec 04                 sub    $0x4,%esp
        151b:    ff 75 e4                 pushl  -0x1c(%ebp)//i
        151e:    52                       push   %edx//arrayB[i]
        151f:    50                       push   %eax//arrayA[i]
        1520:    e8 e8 fc ff ff           call   120d <Is_Number_Correct>//Is_Number_Correct (arrayA[i],arrayB[i],i)
        1525:    83 c4 10                 add    $0x10,%esp//remove reserve space
        1528:    01 45 e0                 add    %eax,-0x20(%ebp)//nCnt=nCnt+Is_Number_Correct (arrayA[i],arrayB[i],i)
        152b:    83 45 e4 01              addl   $0x1,-0x1c(%ebp)//i++

        152f:    83 7d e4 05              cmpl   $0x5,-0x1c(%ebp)//comp i,5
        1533:    7e d5                    jle    150a <main+0xf9>//i<=5

        1535:    83 7d e0 00              cmpl   $0x0,-0x20(%ebp)//nCnt=0
        1539:    75 10                    jne    154b <main+0x13a>//nCnt!=0

        153b:    83 ec 0c                 sub    $0xc,%esp
        153e:    68 80 20 00 00           push   $0x2080//string
        1543:    e8 fc ff ff ff           call   1544 <main+0x133>//printf()
        1548:    83 c4 10                 add    $0x10,%esp//remove reserve spcae

        154b:    83 7d e0 00              cmpl   $0x0,-0x20(%ebp)
        154f:    7e 19                    jle    156a <main+0x159>

        1551:    83 7d e0 05              cmpl   $0x5,-0x20(%ebp)//
        1555:    7f 13                    jg     156a <main+0x159>//5 >= nCnt
        1557:    83 ec 08                 sub    $0x8,%esp
        155a:    ff 75 e0                 pushl  -0x20(%ebp)//push nCnt
        155d:    68 b8 20 00 00           push   $0x20b8//push stirng
        1562:    e8 fc ff ff ff           call   1563 <main+0x152>//printf()
        1567:    83 c4 10                 add    $0x10,%esp//remove reserve space

        156a:    83 7d e0 06              cmpl   $0x6,-0x20(%ebp)//6==nCnt
        156e:    75 10                    jne    1580 <main+0x16f>//not equal return

        1570:    83 ec 0c                 sub    $0xc,%esp
        1573:    68 e8 20 00 00           push   $0x20e8//string
        1578:    e8 fc ff ff ff           call   1579 <main+0x168>//printf()
        157d:    83 c4 10                 add    $0x10,%esp//remove reserve spcae

        1580:    b8 00 00 00 00           mov    $0x0,%eax//return
        1585:    8d 65 f0                 lea    -0x10(%ebp),%esp
        1588:    59                       pop    %ecx
        1589:    5b                       pop    %ebx
        158a:    5e                       pop    %esi
        158b:    5f                       pop    %edi
        158c:    5d                       pop    %ebp
        158d:    8d 61 fc                 lea    -0x4(%ecx),%esp

        1590:    c3                       ret
        1591:    66 90                    xchg   %ax,%ax
        1593:    66 90                    xchg   %ax,%ax
        1595:    66 90                    xchg   %ax,%ax
        1597:    66 90                    xchg   %ax,%ax
        1599:    66 90                    xchg   %ax,%ax
        159b:    66 90                    xchg   %ax,%ax
        159d:    66 90                    xchg   %ax,%ax
        159f:    90                       nop
    
    000015a0 <__libc_csu_init>:
        15a0:    f3 0f 1e fb              endbr32
        15a4:    55                       push   %ebp
        15a5:    e8 6b 00 00 00           call   1615 <__x86.get_pc_thunk.bp>
        15aa:    81 c5 26 2a 00 00        add    $0x2a26,%ebp
        15b0:    57                       push   %edi
        15b1:    56                       push   %esi
        15b2:    53                       push   %ebx
        15b3:    83 ec 0c                 sub    $0xc,%esp
        15b6:    89 eb                    mov    %ebp,%ebx
        15b8:    8b 7c 24 28              mov    0x28(%esp),%edi
        15bc:    e8 3f fa ff ff           call   1000 <_init>
        15c1:    8d 9d fc fe ff ff        lea    -0x104(%ebp),%ebx
        15c7:    8d 85 f8 fe ff ff        lea    -0x108(%ebp),%eax
        15cd:    29 c3                    sub    %eax,%ebx
        15cf:    c1 fb 02                 sar    $0x2,%ebx
        15d2:    74 29                    je     15fd <__libc_csu_init+0x5d>
        15d4:    31 f6                    xor    %esi,%esi
        15d6:    8d b4 26 00 00 00 00     lea    0x0(%esi,%eiz,1),%esi
        15dd:    8d 76 00                 lea    0x0(%esi),%esi
        15e0:    83 ec 04                 sub    $0x4,%esp
        15e3:    57                       push   %edi
        15e4:    ff 74 24 2c              pushl  0x2c(%esp)
        15e8:    ff 74 24 2c              pushl  0x2c(%esp)
        15ec:    ff 94 b5 f8 fe ff ff     call   *-0x108(%ebp,%esi,4)
        15f3:    83 c6 01                 add    $0x1,%esi
        15f6:    83 c4 10                 add    $0x10,%esp
        15f9:    39 f3                    cmp    %esi,%ebx
        15fb:    75 e3                    jne    15e0 <__libc_csu_init+0x40>
        15fd:    83 c4 0c                 add    $0xc,%esp
        1600:    5b                       pop    %ebx
        1601:    5e                       pop    %esi
        1602:    5f                       pop    %edi
        1603:    5d                       pop    %ebp
        1604:    c3                       ret
        1605:    8d b4 26 00 00 00 00     lea    0x0(%esi,%eiz,1),%esi
        160c:    8d 74 26 00              lea    0x0(%esi,%eiz,1),%esi
    
    00001610 <__libc_csu_fini>:
        1610:    f3 0f 1e fb              endbr32
        1614:    c3                       ret
    
    00001615 <__x86.get_pc_thunk.bp>:
        1615:    8b 2c 24                 mov    (%esp),%ebp
        1618:    c3                       ret
    
Disassembly of section .fini:
    
    0000161c <_fini>:
        161c:    f3 0f 1e fb              endbr32
        1620:    53                       push   %ebx
        1621:    83 ec 08                 sub    $0x8,%esp
        1624:    e8 e7 fa ff ff           call   1110 <__x86.get_pc_thunk.bx>
        1629:    81 c3 a7 29 00 00        add    $0x29a7,%ebx
        162f:    83 c4 08                 add    $0x8,%esp
        1632:    5b                       pop    %ebx
        1633:    c3                       ret
    
    
