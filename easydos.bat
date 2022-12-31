@echo off
title easydos
color 21
mode con cols=80 lines=25
::初始化
set ver=11.0
::定义开始运行函数
:power on start
::判断/读取区
if exist c:\lastver.txt del /q c:\lastver.txt
if not exist data\syzt.eds echo:on>data\syzt.eds
if not exist system\nowver.ewu echo:%ver%>system\nowver.ewu
set /p syzt=<data\syzt.eds
::BIOS引导初始化
:bios 
::默认主题
set color=27
::创建文件夹
if not exist data\ md data\
cls
::函数定义区
set lock=解
set xuanzezhi=○
set cxz1=   
set cxz2=   
set cxz3=   
set cxz4=   
set cxz5=电脑已开机!
set cxz6=     
set gp=▂▄▆█
set menu1=:003022$a7 E.菜单 
::文件缺失判断区
if not exist system\easydospoweron.wav goto lanping
if not exist system\easydospoweroff.wav goto lanping
if not exist system\easydoslogon.wav goto lanping
if not exist system\mplayer_core.exe goto lanping
if not exist data\yjh.eds goto jihuoxt
if not exist data\setupok.eds goto hyyhld
if not exist data\poweroff.eds set cxz7="%time:~0,2%:%time:~3,2% 来自系统:检测到你上次没有正常关机，未保存的文件将会丢失!"&call :nopoweroff
if exist data\poweroff.eds del /q data\poweroff.eds
::读取用户文件/系统状态
set /p computermz=<data\computername.eds
set /p usermz=<data\username.eds
set /p usermima=<data\usermima.eds 
set sy=■
set /p computerdz1=<system\computerdz.eds
::定义电源动作变量，用于关机/重启确认窗口
set powercommand=    
::主要代码，在此时系统已成功初始化，电脑将控制权交给easydos主程序，BIOS休眠（引导完成）
::窗口标题
title easydos
::应用主题
color %color%
::窗口大小
mode con cols=80 lines=25
::开机画面
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 1 >nul 
echo:              ╔═══════╗
ping 127.1 -n 1 >nul
echo:              ║ ■■■■■■ ║               EasyDOS   %ver%   beta
ping 127.1 -n 1 >nul
echo:              ║ ■           ║
ping 127.1 -n 1 >nul
echo:              ║ ■           ║                 2020  By:jiqiushuo  
ping 127.1 -n 1 >nul
echo:              ║ ■■■■■■ ║
ping 127.1 -n 1 >nul
echo:              ║ ■           ║                Onew Studio 版权所有
ping 127.1 -n 1 >nul
echo:              ║ ■           ║               
ping 127.1 -n 1 >nul
echo:              ║ ■■■■■■ ║                 DeveloperPreview 1
ping 127.1 -n 1 >nul
echo               ╚═══════╝
call :kjsy
cls
::登录界面
:dl
title easydos---登录
call :tempdq
cls
echo.
echo.
echo.
echo.
echo.
echo:                           welcome to easydos ver%ver%
set /p user=                         #请输入用户名:
if /i "%user%"=="%usermz%" goto mima
if /i "%user%"=="root" goto hy
if /i "%user%"=="" goto dl
echo:                                 用户名错误!
ping 127.1 -n 3 >nul
goto dl
:mima
set /p mima=               #请输入密码,输入tpmima进入图片密码!:
if /i "%mima%"=="%usermima%" goto hy
if /i "%mima%"=="tpmima" goto tpmmyz
echo:                                  密码错误!
ping 127.1 -n 3 >nul
goto dl
::登录成功，欢迎
:hy
title easydos---欢迎
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                   欢迎%user%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :dlsy
goto zjm
::主界面，jde桌面环境
:zjm
cls
::读取要显示的系统状态
set /p syzt=<data\syzt.eds
::窗口标题
title easydos 当前用户:%user%
::再次应用主题，用于应用新设置
color %color%
::读取已保存主题
call :tempdq
::循环创建变量，用于星期
set xhcs=1
:setxq:
set /a xhcs=xhcs+=1
set x%xhcs%= 
if /i %xhcs% == 7 goto next
goto setxq
::显示部分
:next
call :xingqi
set menu1=:003022$a7 E.菜单 
echo: ╔═════════════════════════════════════╗
echo: ║          EasyDOSX                  %date:~0,4%年%date:~5,2%月%date:~8,2%日                        ║
echo: ╠═════════════════════════════════════╣
echo: ╠════╦══════════════════════════[桌面]═══╣
echo: ╠════╣                                                                ║
echo: ║        ║                                                                ║
echo: ║        ║                                                                ║
echo: ║    ║       ╔═══╗      ╔══╗     ╔════╗     ╔══╗   ║
echo: ║    ║     ①║计算器║    ②║设置║   ③║插件管理║   ④║帮助║   ║
echo: ║        ║       ╚═══╝      ╚══╝     ╚════╝     ╚══╝   ║
echo: ║[已解锁]║                                                                ║
echo: ║        ║       ╔════╗    ╔═══╗     ╔═══╗     ╔══╗   ║
echo: ║    ║     ⑤║开发通道║  ⑥║程序表║   ⑦║ 文字 ║   ⑧║apps║   ║
echo: ║    ║       ╚════╝    ╚═══╝     ╚═══╝     ╚══╝   ║
echo: ║        ║                                                                ║
echo: ║        ║       ╔════╗    ╔═════╗    ╔════════╗   ║
echo: ╠════╣     ⑨║图形密码║  #A║系统消息栏║  #B║EasyDOS系统更新.║   ║
echo: ║        ║       ╚════╝    ╚═════╝    ╚════════╝   ║
echo: ║当前选择║                                                                ║
echo: ║   %xuanzezhi%   ║                                                                ║
echo: ║        ║                          U.上锁   EasyDOS X 1.8.0a confidential║
echo: ╠════╬════════════════════════════════╣
echo: ║ E.菜单 ║    beta3                               R.回收站     s.声音:%sy%  ║
echo: ╚════╩════════════════════════════════╝
system\gcdsyba /v menu1
::添加键盘事件侦测
choice /c 123456789ABousre /n >nul
::键盘事件判断
if /i "%errorlevel%"=="1" set xuanzezhi=①&set fanhui=%errorlevel%
if /i "%errorlevel%"=="2" set xuanzezhi=②&set fanhui=%errorlevel%
if /i "%errorlevel%"=="3" set xuanzezhi=③&set fanhui=%errorlevel%
if /i "%errorlevel%"=="4" set xuanzezhi=④&set fanhui=%errorlevel%
if /i "%errorlevel%"=="5" set xuanzezhi=⑤&set fanhui=%errorlevel%
if /i "%errorlevel%"=="6" set xuanzezhi=⑥&set fanhui=%errorlevel%
if /i "%errorlevel%"=="7" set xuanzezhi=⑦&set fanhui=%errorlevel%
if /i "%errorlevel%"=="8" set xuanzezhi=⑧&set fanhui=%errorlevel%
if /i "%errorlevel%"=="9" set xuanzezhi=⑨&set fanhui=%errorlevel%
if /i "%errorlevel%"=="10" set xuanzezhi=#A&set fanhui=%errorlevel%
if /i "%errorlevel%"=="11" set xuanzezhi=#B&set fanhui=%errorlevel%
::此行用于执行键盘指令对应的程序（或设置）
if /i "%errorlevel%"=="12" goto panduan
if /i "%errorlevel%"=="13" goto onlock
if /i "%errorlevel%"=="14" goto sycz
if /i "%errorlevel%"=="15" set xuanzezhi=#R&set fanhui=%errorlevel%
if /i "%errorlevel%"=="16" goto kscd
goto zjm
:s1
cls
title easydos---计算器 
echo. 
echo                    ╭——————╮ 
echo            ╭———┤ easy计算器 ├———╮ 
echo            │      ╰——————╯      │ 
echo            │                            │ 
echo            │                            │ 
echo            │ 请选择:                    │ 
echo            │                            │ 
echo            │ 1 - 普通＋－×÷           │ 
echo            │ 2 - 求N次方                │ 
echo            │ 3 - 求阶乘                 │ 
echo            │ h - 帮助                   │ 
echo            │ q - 退出                   │ 
echo            │                            │ 
echo            ╰——————————————╯  
echo. 
set UserChoice="" 
set /p UserChoice=请选择: 
if /I %UserChoice%==q goto end 
if /I %UserChoice%==h goto help 
if %UserChoice%==1 goto normal 
if %UserChoice%==2 goto fang 
if %UserChoice%==3 goto jiecheng 
goto error 

REM 普通运算 
:normal 
cls 
echo. 
echo. 
echo. 
echo ╭—————————╮ 
echo │ 普通＋－×÷运算 │ 
echo ╰—————————╯ 
echo. 
set /p UserInput=请输入表达式: 
REM 检测表达式 
echo %UserInput% | findstr "[0-9]">nul || goto error 
echo %UserInput% | findstr /I "[a-z]">nul && goto error 
echo %UserInput% | find ".">nul && goto error 
echo %UserInput% | findstr "+ - * /">nul || goto error 
echo %UserInput% | find "+">nul && goto add 
echo %UserInput% | find "-">nul && goto minus 
echo %UserInput% | find "*">nul && goto multiply 
echo %UserInput% | find "/">nul && goto divide 
REM 实际运算 
:add 
for /f "tokens=1,2 delims=+" %%a in ("%UserInput%") do set /a result=%%a+%%b 
echo 计算结果=%result% 
goto refresh 
:minus 
for /f "tokens=1,2 delims=-" %%a in ("%UserInput%") do set /a result=%%a-%%b 
echo 计算结果=%result% 
goto refresh 
:multiply 
for /f "tokens=1,2 delims=*" %%a in ("%UserInput%") do set /a result=%%a*%%b 
echo 计算结果=%result% 
goto refresh 
:devide 
for /f "tokens=1,2 delims=/" %%a in ("%UserInput%") do set /a result=%%a/%%b 
echo 计算结果=%result% 
goto refresh 

REM 计算N次方 
:fang 
cls 
echo. 
echo. 
echo. 
echo ╭—————————╮ 
echo │ 求 N 次 方       │ 
echo ╰—————————╯ 
echo. 
set /p UserInput=请输入表达式: 
REM 检测表达式 
echo %UserInput% | findstr "[0-9]">nul || goto error 
echo %UserInput% | findstr /I "[a-z]">nul && goto error 
echo %UserInput% | find ".">nul && goto error 
echo %UserInput% | find "_">nul || goto error 
set num= 
set n= 
set /a result=1 
for /f "tokens=1,2 delims=_" %%a in ("%UserInput%") do set /a num=%%a & set /a n=%%b 
if %n%==0 goto showfang 
for /L %%i in (1,1,%n%) do set /a result*=%num% 
:showfang 
echo 计算结果=%result% 
goto refresh 

REM 计算阶乘 
:jiecheng 
cls 
echo. 
echo. 
echo. 
echo ╭—————————╮ 
echo │ 求 阶 乘         │ 
echo ╰—————————╯ 
echo. 
set /p UserInput=请输入要求阶乘的整数: 
REM 检测表达式 
echo %UserInput% | findstr "[0-9]">nul || goto error 
echo %UserInput% | findstr /I "[a-z]">nul && goto error 
echo %UserInput% | find ".">nul && goto error 
set /a result=1 
REM 不可以直接判断UserInput是否为0 
set num=%UserInput% 
if %num%==0 goto showjiecheng 
for /L %%i in (%num%,-1,1) do set /a result*=%%i 
:showjiecheng 
echo 计算结果=%result% 
goto refresh 

REM 错误 
:error 
cls 
echo. 
echo. 
echo. 
echo ╭————————————╮ 
echo │ 输入错误,请参考帮助！  │ 
echo ╰————————————╯ 
echo. 

REM 刷新 
:refresh 
echo. 
set UserChoice="" 
set /p UserChoice=请按任意键继续,退出请按q,帮助请按h: 
if /I %UserChoice%==q goto end 
if /I %UserChoice%==h goto help 
goto s1

REM 帮助 
:help 
cls  
echo. 
echo         ╭——————╮ 
echo ╭————┤ 帮 助 ├————╮ 
echo │      ╰——————╯     │ 
echo │                           │ 
echo │ 1.普通运算请使用以下形式: │ 
echo │ 4+1 5-2 2*3 6/2           │ 
echo │                           │ 
echo │ 2.计算N次方请使用以下形式:│ 
echo │ 2_5 (求2的5次方)          │ 
echo │                           │ 
echo │ 3.只支持整数运算          │ 
echo │                           │ 
echo │ 4.输入部分特殊符号可能会  │ 
echo │ 导致意外退出              │ 
echo │                           │ 
echo ╰————————————— ╯ 
goto refresh 

REM 退出 
:end 
cls 
echo. 
echo. 
echo. 
echo ╭————————————————╮ 
echo │                                │ 
echo │ 非常感谢您的使用,再见！        │ 
echo │                                │ 
echo ╰————————————————╯ 
ping -n 2 127.1>nul 
goto zjm
:s2
cls
call :tempdq
title easydos---设置
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                  easy dos 设置
echo.
echo:                     1.系统属性 2.更改主题 3.调整时间 4.返回
echo.
echo:                     5.更改用户名 6.更改密码 7.恢复出厂设置!
echo.
echo.
echo.
echo.
echo.
echo.
echo.     
set /p shezhi=请选择:
if /i "%shezhi%"=="1" goto setshe1
if /i "%shezhi%"=="2" goto setshe2
if /i "%shezhi%"=="3" goto setshe3
if /i "%shezhi%"=="4" goto setshe4
if /i "%shezhi%"=="5" goto setuser
if /i "%shezhi%"=="6" goto setnmima
if /i "%shezhi%"=="7" goto reset
goto :s2
:setshe1
cls
echo:eeeee      a      sssss  y   y      d          sssss   =    =      ■
echo:e         a a     s       y y       d          s       =    =      ■
echo:eeeee    aaaaa    sssss    y    ddddd   ooooo  sssss   =    =      ■
echo:e       a     a       s    y    d   d   o   o      s   =    =             
echo:eeeee  a       a  sssss    y    ddddd   ooooo  sssss   =    =      ●
echo:
echo:Easydos v%ver%!(Developer Preview)
echo.
echo:Code Name "rapier" 2.00a
echo.
echo:2021 by jiqiushuo Onew Studio
echo.
echo:主人:%usermz%
echo.
echo:电脑名:%computermz%
echo.
echo:版权所有:jiqiushuo ！ 
echo.
echo:此软件为预览版本,使用造成的后果Onew Studio不负责!
pause
goto s2
:setshe4
set cxz2="%time:~0,2%:%time:~3,2% 来自设置:%user%修改了设置!
call :set ok
%msgsy%
goto zjm
:setshe2
cls
echo.
echo                             颜色设置                              
echo.
echo ================================================================
echo.
echo                              颜色表
echo                      ━━━━━┯━━━━━ 
echo                      0 = 黑色  │8 = 灰色 
echo                      1 = 蓝色  │9 = 淡蓝色 
echo                      2 = 绿色  │A = 淡绿色 
echo                      3 = 浅绿色│B = 淡浅绿色 
echo                      4 = 红色  │C = 淡红色 
echo                      5 = 紫色  │D = 淡紫色 
echo                      6 = 黄色  ︱E = 淡黄色 
echo                      7 = 白色  │F = 亮白色 
echo                      ━━━━━┷━━━━━
echo.
set /p 前景色=请输入前景色：
echo.
set /p 背景色=请输入背景色：
set color=%背景色%%前景色%
echo:%背景色%%前景色%>data\temp.eds
echo.
echo 颜色设置成功！按任意键返回……
pause>nul

goto s2
:setshe3
set /p newtime=输入新时间(xx:xx):
@time %newtime%
echo:完成!
pause
goto s2
:s3
cls
echo:easydos插件管理器v1.0
echo.
echo:已安装的第三方插件:
dir system\apps\chajian
echo.
set /p chcj=请选择(1.安装 2.卸载 3.退出):
if /i "%chcj%"=="1" goto install
if /i "%chcj%"=="2" goto uninstall
if /i "%chcj%"=="3" goto zjm
goto s3
:install
cls
echo.
set /p cjlj=请选择插件路径:
copy %cjlj% system\apps\chajian
echo:*****ok!*****
cd %computerdz1%
pause
cd 
goto s3
:uninstall
cls
echo.
dir system\apps\chajian
set /p cjlju=请选择:
del /q system\apps\chajian\%cjlju%
echo:*****ok!*****
cd %computerdz1%
pause
goto s3
:s4
title easydos---帮助
cls
echo.
echo:欢迎使用帮助! ver1.0
echo.
echo:下面的内容可能对你有所帮助:
echo.
echo:1.遇到蓝屏?一般是文件丢失,可以手动复原文件
echo.
echo:2.应用安装后遇到问题?重启无效?
echo:一般是在初始配置第一步:输入的路径有问题
echo:在安装时复制地址栏路径!进入设置,恢复出厂设置
echo:之后,在恢复出厂后重新填写正确的安装路径！
echo.
echo:====没有更多了!====
pause
goto zjm
:s5
title easydos---开发者验证
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                   开发者验证
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
set cxz1="%time% 来自开发者验证:%user%请求验证开发者身份!"
msg*"%time% 来自开发者验证:%user%请求验证开发者身份!"
:shuruzhanghao
cls
set /p kfry=输入开发者账号:
set /p kfmima=输入密码:
if /i "%kfry%"=="kaifa#1" goto kaifayz
echo:                                    验证失败
ping 127.1 -n 3 >nul
goto shuruzhanghao 
:kaifayz
if /i "%kfmima%"=="kfmima" goto hykf
echo:                                    验证失败
ping 127.1 -n 3 >nul
goto shuruzhanghao 
:hykf
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                            验证成功,进入开发者模式
echo:                             输入"返回"回到EasyDOS
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
cls
echo:EasyDOS ver10.0 2020 by jiqiushuo
:minglingshuru
set /p zhiling=请输命令:
if /i "%zhiling%"=="返回" goto zjm
%zhiling%
goto minglingshuru
:s6
cls
echo: %date:~0,4%/%date:~5,2%/%date:~8,2%                                                     Ewap:%gp%
echo:===============================================================[更多]===========
echo:                                   程序列表
echo:===============================================================================
echo.
echo:a.Ewap网页浏览器
echo.
echo:①.文件管理
echo.
echo:②.图像密码设置
echo.
echo:③.同步软件
echo.
echo:④.返回主界面
echo.
echo:M.音乐播放器
choice /c 1234am /n >nul
if /i "%errorlevel%"=="1" goto explorereasy
if /i "%errorlevel%"=="2" goto txmm
if /i "%errorlevel%"=="4" goto zjm
if /i "%errorlevel%"=="5" goto ewapexp
if /i "%errorlevel%"=="3" goto tongb
if /i "%errorlevel%"=="6" goto music
:yinga2
goto zjm
:s7
title easydos---文字
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                   Easy文字
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
:wenzizjm
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                  1.新建文档
echo:                                  2.退出程序
echo:                                  3.打开文档
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p wenzidyhsr=请选择:
if /i "%wenzidyhsr%"=="2" goto zjm
if /i "%wenzidyhsr%"=="1" goto inputshur
if /i "%wenzidyhsr%"=="3" goto dakaiwendang
goto wenzizjm
:inputshur
cls
set /p wenzi=请输入内容:
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                  1.保存内容
echo:                                  2.退出程序
echo:                                  3.重新输入
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p wenzixuanze=请选择:
if /i "%wenzixuanze%"=="1" goto wz1
if /i "%wenzixuanze%"=="2" goto zjm
if /i "%wenzixuanze%"=="3" goto inputshur
:wz1
cls
set /p bcwjm=请键入文件名:
set /p bchjm=请输入后缀名:
echo:%wenzi%>%bcwjm%.%bchjm%
set cxz3="%time:~0,2%:%time:~3,2% 来自easy文字:%user%创建了文字文件%bcwjm%.%bchjm%
call :msgsy
call :file ok
echo:************************************保存完成************************************
pause
goto zjm
:dakaiwendang
cls
set /p dkdwj=请拖入文档:
set /p dkwd=<%dkdwj%
echo:%dkwd%
pause
goto wenzizjm
:s8
title apps
cls
echo:正加载软件列表....
echo.
echo:目前安装的软件:
echo.
cd %computerdz1%
dir system\apps
echo.
set /p startlj=请选择软件,输入install安装,输入uninstall卸载,输入quit退出:
if /i %startlj%==install goto installapp
if /i %startlj%==uninstall goto uninstallapp
if /i %startlj%==quit goto zjm
if not exist %startlj% goto s8
call system\run.bat
pause
cd %computerdz1%
goto zjm
:kscd
title easydos---电源菜单
set menu1=:003022$97 E.菜单 
system\gcdsyba /v menu1
set kscddnr=:003010$67                    ;$67  EasyDOS ver10.2   ;$67                    ;$67    1.关闭计算机    ;$67                    ;$67    2.重启计算机    ;$67                    ;$67    3.注销此用户    ;$67                    ;$67    4.切换新用户    ;$67                    
system\gcdsyba /v kscddnr
choice /c 1234e /n >nul
cls
set kaishi=%errorlevel%
if /i "%kaishi%"=="1" goto power off
if /i "%kaishi%"=="2" goto chongqi
if /i "%kaishi%"=="3" goto log off
if /i "%kaishi%"=="4" goto qhyh
if /i "%kaishi%"=="5" goto zjm
cls
echo:错误
pause
goto kscd
:power off
mode con cols=80 lines=25
set powercommand=关机
call :电源指令确认
set cxz5="%time:~0,2%:%time:~3,2% %user%执行了命令:关机
echo.
echo.
echo.
echo.
echo.
echo. 
echo:              eeeee      a      sssss  y   y      d          sssss
echo:              e         a a     s       y y       d          s
echo:              eeeee    aaaaa    sssss    y    ddddd   ooooo  sssss
echo:              e       a     a       s    y    d   d   o   o      s
echo:              eeeee  a       a  sssss    y    ddddd   ooooo  sssss
echo.
echo.
echo.
echo.
echo:                         Easy Dos ver %ver% shuting down.....
call :gjsy
echo:a>data\poweroff.eds
exit
:chongqi
mode con cols=80 lines=25
set powercommand=重启
call :电源指令确认
set cxz5="%time:~0,2%:%time:~3,2% %user%执行了命令:重启
echo.
echo.
echo.
echo.
echo.
echo. 
echo:              eeeee      a      sssss  y   y      d          sssss
echo:              e         a a     s       y y       d          s
echo:              eeeee    aaaaa    sssss    y    ddddd   ooooo  sssss
echo:              e       a     a       s    y    d   d   o   o      s
echo:              eeeee  a       a  sssss    y    ddddd   ooooo  sssss
echo.
echo.
echo.
echo.
echo:                         Easy Dos ver %ver% restart.....
call :gjsy
echo:abcd>>data\poweroff.eds
goto power on start
:log off
mode con cols=80 lines=25
set powercommand=注销
call :电源指令确认
set cxz5="%time:~0,2%:%time:~3,2% %user%执行了命令:注销
echo.
echo.
echo.
echo.
echo.
echo. 
echo:              eeeee      a      sssss  y   y      d          sssss
echo:              e         a a     s       y y       d          s
echo:              eeeee    aaaaa    sssss    y    ddddd   ooooo  sssss
echo:              e       a     a       s    y    d   d   o   o      s
echo:              eeeee  a       a  sssss    y    ddddd   ooooo  sssss
echo.
echo.
echo.
echo.
echo:                           Easy Dos ver %ver% logingoff.....
ping 127.1 -n 5 >nul
goto dl
:qhyh
if /i "%user%"=="root" goto gaibian1
if /i "%user%"=="%usermz%" goto gaibian2
:gaibian1
set dqh=%usermz%
goto qhcd
:gaibian2
set dqh=root
goto qhcd
:qhcd
cls
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo:                           easy dos %ver%  #  切换用户
echo.
echo:                             现在登陆的用户为%user%
echo.
echo:                               请选择一个新用户:
echo.
echo:                             1.%dqh%#     2.其他用户
set /p qiehuan=:
if /i "%qiehuan%"=="1" goto dluser
if /i "%qiehuan%"=="2" goto dl
:dluser
if /i "%dqh%"=="root" set user=root
if /i "%dqh%"=="%usermz%" set user=%usermz%
set cxz5="%time:~0,2%:%time:~3,2% %user%切换了用户!
if /i "%dqh%"=="root" goto hy
cls
echo:您需要验证用户 %dqh% 的密码!
set /p yianmima=请输入 %dqh% 的密码:
if /i "%yianmima%"=="%usermima%" goto hy
echo:密码错误!系统无法让您登陆!
pause
goto dluser
:lanping
cls
color 1f
echo.
echo:Sorry,EasyDOS is stop working!
echo.
echo:*****System Error*****
echo.
echo:code:001 SysFile is Lost!
echo.
echo:Please contact the administrator
ping 127.1 -n 60 >nul
goto lanping
:jihuoxt
title easydos---激活
color 17
mode con cols=80 lines=25
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                   EasyDOS 激活
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
:jhtianxie
cls
echo:检测到您是第一次使用!
echo.
echo:你需要输入激活码来验证真品
echo.
echo:激活码在"真品证书"上
echo.
echo:请输入你的激活码(区分大小写)
echo.
echo:输入"退出"退出EasyDOS
echo.
ping 127.1 -n 5 >nul
set /p jihuoma=请输入:
if /i "%jihuoma%"=="12345-67890-12345-67890-12345-#B" goto jihuocg
if /i "%jihuoma%"=="退出" goto exit
cls
echo.
echo:激活码或输入错误,请检查证书是否失效
echo.
echo:激活失败(00001a 010a22)
echo.
echo:请重新输入!
ping 127.1 -n 3 >nul
goto jhtianxie
:jihuocg
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                激活成功,可以使用
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
echo:ok>>data\yjh.eds
goto hyyhld
:easydos help
cls
title easydos------消息
echo:==========================================================
echo:                        系统消息栏
echo:==========================================================
echo:以下为系统消息:
echo:%cxz1%
echo:%cxz2%
echo:%cxz3%
echo:%cxz5%
echo:%cxz6%
echo:%cxz7%
pause
goto zjm
:hyyhld
title welcome
cls
mode con cols=80 lines=25
color 27
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                               welocome                                   ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                            welocome                                      ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                         welocome                                         ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                      welocome                                            ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                   welocome                                               ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                welocome                                                  ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║             welocome                                                     ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║          welocome                                                        ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║       welocome                                                           ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║                                                                          ║
echo: ║    welocome                                                              ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome                                                                 ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
ping 127.1 -n 2 >nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║    欢迎使用EasyDOS!                                                      ║
echo: ║                                                                          ║
echo: ║    本向导将帮助你完成基础设置!                                           ║
echo: ║                                                                          ║
echo: ║    按下任意键继续!                                                       ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                               EasyDOS v10.8              ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║[请按任意键继续] →                                                       ║
echo: ╚═════════════════════════════════════╝
pause>nul
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║   请输入精确到磁盘盘符的安装路径(本程序的位置):                          ║
echo: ║                                                                          ║
echo: ║   如:C:\EasyDOS                                                          ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
set /p computerdz=请输入:
echo:%computerdz%>system\computerdz.eds
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║   请输入这台电脑的名称:                                                  ║
echo: ║                                                                          ║
echo: ║   如:Jorn's computer  不宜过长                                           ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
set /p computermz=请输入:
echo:%computermz%>data\computername.eds
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║   请输入用户的名称:                                                      ║
echo: ║                                                                          ║
echo: ║   如:Jorn  不宜过长                                                      ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
set /p usermz=请输入:
echo:%usermz%>data\username.eds
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║   请输入用户的密码:                                                      ║
echo: ║                                                                          ║
echo: ║   如:123456  不建议太简单,也可不填                                       ║
echo: ║                                                                          ║
echo: ╚═════════════════════════════════════╝
set /p usermima=请输入:
echo:%usermima%>data\usermima.eds
cls
echo: ╔═════════════════════════════════════╗
echo: ║ welocome-欢迎!                                                   beta    ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║    恭喜你!                                                               ║
echo: ║                                                                          ║
echo: ║    你已经完成了基础设置！                                                ║
echo: ║                                                                          ║
echo: ║    再次感谢你使用EasyDOS                                                 ║
echo: ║                                                                          ║
echo: ║    系统将重启,以保存设置                                                 ║
echo: ║                                                                          ║
echo: ║    按下任意键继续....                                                    ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║                                               EasyDOS v10.8              ║
echo: ║                                                                          ║
echo: ║                                                                          ║
echo: ║[请按任意键继续] →                                                       ║
echo: ╚═════════════════════════════════════╝
pause>nul
set cxz6="%time:~0,2%:%time:~3,2% 来自新手配置:%computermz%的设置已完善!
echo:1>data\poweroff.eds
echo:ok>data\setupok.eds
goto power on start
:panduan
if /i "%fanhui%"=="1" goto s1
if /i "%fanhui%"=="2" goto s2
if /i "%fanhui%"=="3" goto s3
if /i "%fanhui%"=="4" goto s4
if /i "%fanhui%"=="5" goto s5
if /i "%fanhui%"=="6" goto s6
if /i "%fanhui%"=="7" goto s7
if /i "%fanhui%"=="8" goto s8
if /i "%fanhui%"=="9" goto txmm
if /i "%fanhui%"=="10" goto easydos help
if /i "%fanhui%"=="11" goto xtgx
if /i "%fanhui%"=="15" goto hszcx
pause
goto zjm
:xtgx
title easydos---检查更新
color 27
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                   EasyDOS 更新
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 5 >nul
:ksgx
set xtgx=正在检查
echo:edos>updata\oldname.eds
cls
set downloadtime=0
if exist c:\lastver.txt del /q c:\lastver.txt
echo:在线更新v1.0 2021 by OnewTeam
echo.
echo:===========================================================================
echo:=                       在线系统更新 状态:正在检查                        =
echo:=                   说明:本程序会自动通过网络检查更新                     =
echo:=                      如出现等待超时,请重启本应用!                       =
echo:=                     或是检查"软件源"设置项是否生效                      =
echo:===========================================================================
set /p oldver=<system\nowver.ewu
echo:当前版本:%oldver%
echo:              ============***[下面是系统日志]***============
echo:正检查更新....
start bitsadmin /transfer update https://github.com/jiqiushuo/EasyDOS/releases/download/v1.20u/lastver.txt c:\lastver.txt
echo.
echo:正在链接....
:testupdate
set /a downloadtime=downloadtime+=1
ping 127.1 -n 2 >nul
if exist c:\lastver.txt goto downloadok
if /i %downloadtime%==20 goto chaoshi
goto testupdate
:downloadok
set /p newver=<c:\lastver.txt
echo:最新版本:%newver%
echo.
if %oldver% neq %newver% goto updateonlinenow
if /i %oldver% == %newver% echo:已经是最新版本!
pause
goto zjm
:explorereasy
cls
set /p wzlj=输入路径:
dir %wzlj%
pause
goto zjm
:txmm
cls
if /i %user%==root echo:你是root,不能创建密码!&pause&goto zjm
if not exist txmm\ md txmm\
echo:     ╔═╦═╦═╗
echo:     ║#1║#2║#3║
echo:     ╠═╬═╬═╣
echo:     ║#4║#5║#6║
echo:     ╠═╬═╬═╣
echo:     ║#7║#8║#9║
echo:     ╚═╩═╩═╝
echo.
echo:连三个格子!
echo.
set /p gz1=输入第1个格子:
echo:%gz1%>txmm\gz1.eds
set /p gz2=输入第2个格子:
echo:%gz2%>txmm\gz2.eds
set /p gz3=输入第3个格子:
echo:%gz3%>txmm\gz3.eds
echo.
echo:完成，格子为%gz1% %gz2% %gz3%
echo.
pause
goto zjm 
:tpmmyz
cls
if not exist txmm\gz1.eds echo:您没有图片密码!&pause&goto dl
if not exist txmm\gz2.eds echo:您没有图片密码!&pause&goto dl
if not exist txmm\gz3.eds echo:您没有图片密码!&pause&goto dl
set /p gza=<txmm\gz1.eds
set /p gzb=<txmm\gz2.eds
set /p gzc=<txmm\gz3.eds
echo:     ╔═╦═╦═╗
echo:     ║#1║#2║#3║
echo:     ╠═╬═╬═╣
echo:     ║#4║#5║#6║
echo:     ╠═╬═╬═╣
echo:     ║#7║#8║#9║
echo:     ╚═╩═╩═╝
echo.
set /p srtp=输入格子代号(不加#,例如123):
if /i %srtp% == %gza%%gzb%%gzc% goto hy
cls
echo:图片密码错误!
pause
goto tpmmyz
:ewapexp
cls
echo:正在连接中.....
ping 127.1 -n 5 >nul
echo:已连接Ewap!
ping 127.1 -n 3 >nul
echo:%time:~0,2%:%time:~3,2% 正宽带连接 至Ewap!
ping 127.1 -n 3 >nul
echo:成功!
:laq
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                  1.打开网页
echo:                                  2.添加书签
echo:                                  3.退出程序
echo:                                  4.查看书签
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
choice /c 1234 /n >nul
if /i "%errorlevel%"=="1" goto openwap
if /i "%errorlevel%"=="2" goto tjsq
if /i "%errorlevel%"=="3" goto zjm
if /i "%errorlevel%"=="4" goto sqck
:openwap
cls
echo baidu(百度)
echo bing(必应)
echo exit(退出)
echo.
set /p b=输入你想使用的搜索引擎：
goto %b%
:baidu
set /p c=输入你想搜索的关键字：
start http://www.baidu.com/s?wd=%c%
goto zjm
:bing
set /p c=输入你想搜索的关键字：
start http://cn.bing.com/search?q=%a%&ie=utf-8
goto zjm
:exit
goto zjm
:tjsq
cls
echo:☆添加书签程序
echo.
set /p sqwz=请输入书签网址:
echo.
set /p sqmz=请输入书签名字:
echo:"\%sqwz%>>e.sq
echo:%sqmz%>e.sqmz
echo.
echo:已完成!
echo.
pause
goto laq
:sqck
if not exist e.sq echo:您没有添加书签&pause&goto laq
set /p sqwj=<e.sq
set /p tjsqmz=<e.sqmz
echo:您添加的书签有:
echo:name:%tjsqmz%
echo:%sqwj%
pause
goto laq
:onlock
cls
set var=:025007$9f                              ;$9f                              ;$9f            $96已锁定            ;$9f                              ;$9f                          ;$9f          u.[解锁]        ;$9f                              
system\gcdsyba /v var
choice /c u /n >nul
if /i %errorlevel%==1 goto zjm
goto onlock
:sycz
cls
title easydos---声音设置
echo.
echo:请设置系统声音是否打开:
echo.
echo:1.系统声音开
echo.
echo:2.系统声音关
choice /c 12 /n >nul
if /i "%errorlevel%"=="2" goto gsy
if /i "%errorlevel%"=="1" goto ksy
:gsy
echo:off>data\syzt.eds
set sy=□
goto zjm
:ksy
echo:on>data\syzt.eds
set sy=■
goto zjm
:gjsy
if /i %syzt%==on system\mplayer_core system\easydospoweroff.wav>nul 2>nul&ping 127.1 -n 1.5 >nul&set sy=■&goto :eof
set sy=□
ping 127.1 -n 5 >nul
goto :eof
:dlsy
if /i %syzt%==on system\mplayer_core system\easydoslogon.wav>nul 2>nul&set sy=■&goto :eof
set sy=□
ping 127.1 -n 3 >nul
goto :eof
:kjsy
if /i %syzt%==on system\mplayer_core system\easydospoweron.wav>nul 2>nul&set sy=■&goto :eof
set sy=□
ping 127.1 -n 5 >nul
goto :eof
:msgsy
if /i %syzt%==on system\mplayer_core system\easydosmsg.wav>nul 2>nul&set sy=■&goto :eof
set sy=□
ping 127.1 -n 5 >nul
goto :eof
:tongb
cls
echo.
set /p tbmm=password:
set computermz1=%computermz%
set user1=%user%
set tbmm1=%tbmm%
echo.
echo:computer:%computermz%
echo.
echo:user:%user%
echo.
start gsm.bat
pause
goto zjm
:xingqi
if /i %date:~12% == 一 set x1=*
if /i %date:~12% == 二 set x2=*
if /i %date:~12% == 三 set x3=*
if /i %date:~12% == 四 set x4=*
if /i %date:~12% == 五 set x5=*
if /i %date:~12% == 六 set x6=*
if /i %date:~12% == 日 set x7=*
goto eof
:hszcx
cls
if not exist system\recyclebin\ md system\recyclebin
echo:%user%的回收站中有:
dir system\recyclebin
echo:请选择:1.添加文件  2.清空回收站  3.退出
set /p hsz=请选择：
if /i %hsz%==1 goto tjhswj
if /i %hsz%==2 goto qingkong
if /i %hsz%==3 goto zjm
goto hszcx
:tjhswj
cls
echo:请拖入回收文件:
set /p kshs=:
copy %kshs% system\recyclebin
echo:回收了一个文件：
echo:%kshs%
del /f /q %kshs%
pause
goto hszcx
:qingkong
cls
set /p xuanzeyn=你确定要清空吗？(y/n):
if /i %xuanzeyn%==y goto delwj
if /i %xuanzeyn%==n goto hszcx
goto qingkong
:delwj
del /f /q system\recyclebin
md system\recyclebin\
echo:完成!
pause
goto hszcx
:setuser
cls
set /p usermz=输入您的新用户名:
echo:%usermz%>data\username.eds
echo.
echo:好,您的新用户名为%usermz%
echo.
echo:下次启动时将生效!
echo.
pause
goto s2
:setnmima
cls
set /p yhumima=输入你的新密码(也可不输):
echo:%yhumima%>data\usermima.eds
echo.
echo:您的新密码是%yhumima%
echo.
echo:下次启动时将生效!
echo.
pause
goto s2
:reset
cls
set /p resetxz=你确定要恢复出厂设置吗?(y/n):
if /i %resetxz%==y goto huifu
if /i %resetxz%==n goto s2
goto reset
:huifu
echo:正在恢复......
ping 127.1 -n 3 >nul
echo.
del /f /q data\
echo:完成，正在重新加载.....
ping 127.1 -n 3 >nul
echo.
md data\
echo:即将重启.....
ping 127.1 -n 3 >nul
goto power on start
:tempdq
if not exist data\temp.eds goto :eof
set /p color=<data\temp.eds
color %color%
goto :eof
:nopoweroff
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f    $47 ! $9f   $9c上次没有正常关机!   ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto eof
goto no poweroff
:file ok
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f        $37 i $9f      $9a已保存       ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto :eof
goto flie ok
:电源指令确认
cls
set var=:025007$9f                              ;$9f                              ;$9f       $9a 您确定要$9c%powercommand%$9a吗?       ;$9f                              ;$9f                              ;$9f       y.[yes]    n.[no]      ;$9f                              
system\gcdsyba /v var
choice /c yn /n >nul
if /i %errorlevel%==1 cls&goto :eof
if /i %errorlevel%==2 cls&goto zjm
goto 电源指令确认
:set ok
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f       $37 i $9f    $9a设置已改变      ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto :eof
goto set ok
:music
cls
echo:欢迎使用音乐播放器。
echo.
echo:输入quit退出!
echo.
set /p musiclj=     请拖入音频:
if /i %musiclj%==quit goto s6
echo.
echo:正在播放%musiclj%,按回车停止播放!
echo.
system\mplayer_core %musiclj%>nul 2>nul
echo:播放完成,按任意键返回!
echo.
pause
goto music
:installapp
cls
echo.
set/p appsins=请输入安装包的路径:
echo.
echo:正拷贝安装包.....
copy %appsins% system\apps
echo.
echo:完成!
cd %computerdz1%
pause
goto s8
:uninstallapp
cls
dir system\apps
set /p unins=请选择:
del /q system\apps\%unins%
echo:****完成!****
cd %computerdz1%
pause
goto s8
:chaoshi
cls
echo.
echo:下载超时,失败! 请检查软件源!
pause
goto zjm
:updateonlinenow
cls
echo.
echo:有新的版本可用:EasyDOS %newver%
echo.
set/p ifupdatenow=您要更新吗(y/n):
if /i %ifupdatenow%==y goto yesupdate
pause
goto zjm
:yesupdate
start bitsadmin /transfer update https://github.com/jiqiushuo/EasyDOS/releases/download/v1.20u/update.bat c:\update.bat
echo.
echo:正在链接....
ping 127.1 -n 5 >nul
bitsadmin /setpriority update foreground
set downloadup1=30
:testupdate1
set downloadup1=%downloadup1%-1
if exist c:\update.bat goto downloadok1
if /i %downloadup1%==0 goto chaoshi
goto testupdate1
:downloadok1
cls
echo:下载已完成!
echo.
echo:即将启动更新器
echo.
pause
echo:%newver%>system\nowver.ewu
system\updateman.bat