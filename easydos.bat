@echo off
title easydos
color 21
mode con cols=80 lines=25
::��ʼ��
set ver=11.0
::���忪ʼ���к���
:power on start
::�ж�/��ȡ��
if exist c:\lastver.txt del /q c:\lastver.txt
if not exist data\syzt.eds echo:on>data\syzt.eds
if not exist system\nowver.ewu echo:%ver%>system\nowver.ewu
set /p syzt=<data\syzt.eds
::BIOS������ʼ��
:bios 
::Ĭ������
set color=27
::�����ļ���
if not exist data\ md data\
cls
::����������
set lock=��
set xuanzezhi=��
set cxz1=   
set cxz2=   
set cxz3=   
set cxz4=   
set cxz5=�����ѿ���!
set cxz6=     
set gp=�y�{�}��
set menu1=:003022$a7 E.�˵� 
::�ļ�ȱʧ�ж���
if not exist system\easydospoweron.wav goto lanping
if not exist system\easydospoweroff.wav goto lanping
if not exist system\easydoslogon.wav goto lanping
if not exist system\mplayer_core.exe goto lanping
if not exist data\yjh.eds goto jihuoxt
if not exist data\setupok.eds goto hyyhld
if not exist data\poweroff.eds set cxz7="%time:~0,2%:%time:~3,2% ����ϵͳ:��⵽���ϴ�û�������ػ���δ������ļ����ᶪʧ!"&call :nopoweroff
if exist data\poweroff.eds del /q data\poweroff.eds
::��ȡ�û��ļ�/ϵͳ״̬
set /p computermz=<data\computername.eds
set /p usermz=<data\username.eds
set /p usermima=<data\usermima.eds 
set sy=��
set /p computerdz1=<system\computerdz.eds
::�����Դ�������������ڹػ�/����ȷ�ϴ���
set powercommand=    
::��Ҫ���룬�ڴ�ʱϵͳ�ѳɹ���ʼ�������Խ�����Ȩ����easydos������BIOS���ߣ�������ɣ�
::���ڱ���
title easydos
::Ӧ������
color %color%
::���ڴ�С
mode con cols=80 lines=25
::��������
echo.
echo.
echo.
echo.
echo.
echo.
ping 127.1 -n 1 >nul 
echo:              �X�T�T�T�T�T�T�T�[
ping 127.1 -n 1 >nul
echo:              �U ������������ �U               EasyDOS   %ver%   beta
ping 127.1 -n 1 >nul
echo:              �U ��           �U
ping 127.1 -n 1 >nul
echo:              �U ��           �U                 2020  By:jiqiushuo  
ping 127.1 -n 1 >nul
echo:              �U ������������ �U
ping 127.1 -n 1 >nul
echo:              �U ��           �U                Onew Studio ��Ȩ����
ping 127.1 -n 1 >nul
echo:              �U ��           �U               
ping 127.1 -n 1 >nul
echo:              �U ������������ �U                 DeveloperPreview 1
ping 127.1 -n 1 >nul
echo               �^�T�T�T�T�T�T�T�a
call :kjsy
cls
::��¼����
:dl
title easydos---��¼
call :tempdq
cls
echo.
echo.
echo.
echo.
echo.
echo:                           welcome to easydos ver%ver%
set /p user=                         #�������û���:
if /i "%user%"=="%usermz%" goto mima
if /i "%user%"=="root" goto hy
if /i "%user%"=="" goto dl
echo:                                 �û�������!
ping 127.1 -n 3 >nul
goto dl
:mima
set /p mima=               #����������,����tpmima����ͼƬ����!:
if /i "%mima%"=="%usermima%" goto hy
if /i "%mima%"=="tpmima" goto tpmmyz
echo:                                  �������!
ping 127.1 -n 3 >nul
goto dl
::��¼�ɹ�����ӭ
:hy
title easydos---��ӭ
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
echo:                                   ��ӭ%user%
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
::�����棬jde���滷��
:zjm
cls
::��ȡҪ��ʾ��ϵͳ״̬
set /p syzt=<data\syzt.eds
::���ڱ���
title easydos ��ǰ�û�:%user%
::�ٴ�Ӧ�����⣬����Ӧ��������
color %color%
::��ȡ�ѱ�������
call :tempdq
::ѭ��������������������
set xhcs=1
:setxq:
set /a xhcs=xhcs+=1
set x%xhcs%= 
if /i %xhcs% == 7 goto next
goto setxq
::��ʾ����
:next
call :xingqi
set menu1=:003022$a7 E.�˵� 
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U          EasyDOSX                  %date:~0,4%��%date:~5,2%��%date:~8,2%��                        �U
echo: �d�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�g
echo: �d�T�T�T�T�j�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T[����]�T�T�T�g
echo: �d�T�T�T�T�g                                                                �U
echo: �U        �U                                                                �U
echo: �U        �U                                                                �U
echo: �U  ����  �U       �X�T�T�T�[      �X�T�T�[     �X�T�T�T�T�[     �X�T�T�[   �U
echo: �U  ����  �U     �٨U�������U    �ڨU���èU   �ۨU�������U   �ܨU�����U   �U
echo: �U        �U       �^�T�T�T�a      �^�T�T�a     �^�T�T�T�T�a     �^�T�T�a   �U
echo: �U[�ѽ���]�U                                                                �U
echo: �U        �U       �X�T�T�T�T�[    �X�T�T�T�[     �X�T�T�T�[     �X�T�T�[   �U
echo: �U  �ͪ�  �U     �ݨU����ͨ���U  �ިU�����U   �ߨU ���� �U   ��Uapps�U   �U
echo: �U  �Ϫ�  �U       �^�T�T�T�T�a    �^�T�T�T�a     �^�T�T�T�a     �^�T�T�a   �U
echo: �U        �U                                                                �U
echo: �U        �U       �X�T�T�T�T�[    �X�T�T�T�T�T�[    �X�T�T�T�T�T�T�T�T�[   �U
echo: �d�T�T�T�T�g     ��Uͼ������U  #A�Uϵͳ��Ϣ���U  #B�UEasyDOSϵͳ����.�U   �U
echo: �U        �U       �^�T�T�T�T�a    �^�T�T�T�T�T�a    �^�T�T�T�T�T�T�T�T�a   �U
echo: �U��ǰѡ��U                                                                �U
echo: �U   %xuanzezhi%   �U                                                                �U
echo: �U        �U                          U.����   EasyDOS X 1.8.0a confidential�U
echo: �d�T�T�T�T�p�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�g
echo: �U E.�˵� �U    beta3                               R.����վ     s.����:%sy%  �U
echo: �^�T�T�T�T�m�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
system\gcdsyba /v menu1
::��Ӽ����¼����
choice /c 123456789ABousre /n >nul
::�����¼��ж�
if /i "%errorlevel%"=="1" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="2" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="3" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="4" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="5" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="6" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="7" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="8" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="9" set xuanzezhi=��&set fanhui=%errorlevel%
if /i "%errorlevel%"=="10" set xuanzezhi=#A&set fanhui=%errorlevel%
if /i "%errorlevel%"=="11" set xuanzezhi=#B&set fanhui=%errorlevel%
::��������ִ�м���ָ���Ӧ�ĳ��򣨻����ã�
if /i "%errorlevel%"=="12" goto panduan
if /i "%errorlevel%"=="13" goto onlock
if /i "%errorlevel%"=="14" goto sycz
if /i "%errorlevel%"=="15" set xuanzezhi=#R&set fanhui=%errorlevel%
if /i "%errorlevel%"=="16" goto kscd
goto zjm
:s1
cls
title easydos---������ 
echo. 
echo                    �q�������������r 
echo            �q�������� easy������ ���������r 
echo            ��      �t�������������s      �� 
echo            ��                            �� 
echo            ��                            �� 
echo            �� ��ѡ��:                    �� 
echo            ��                            �� 
echo            �� 1 - ��ͨ��������           �� 
echo            �� 2 - ��N�η�                �� 
echo            �� 3 - ��׳�                 �� 
echo            �� h - ����                   �� 
echo            �� q - �˳�                   �� 
echo            ��                            �� 
echo            �t�����������������������������s  
echo. 
set UserChoice="" 
set /p UserChoice=��ѡ��: 
if /I %UserChoice%==q goto end 
if /I %UserChoice%==h goto help 
if %UserChoice%==1 goto normal 
if %UserChoice%==2 goto fang 
if %UserChoice%==3 goto jiecheng 
goto error 

REM ��ͨ���� 
:normal 
cls 
echo. 
echo. 
echo. 
echo �q�������������������r 
echo �� ��ͨ������������ �� 
echo �t�������������������s 
echo. 
set /p UserInput=��������ʽ: 
REM �����ʽ 
echo %UserInput% | findstr "[0-9]">nul || goto error 
echo %UserInput% | findstr /I "[a-z]">nul && goto error 
echo %UserInput% | find ".">nul && goto error 
echo %UserInput% | findstr "+ - * /">nul || goto error 
echo %UserInput% | find "+">nul && goto add 
echo %UserInput% | find "-">nul && goto minus 
echo %UserInput% | find "*">nul && goto multiply 
echo %UserInput% | find "/">nul && goto divide 
REM ʵ������ 
:add 
for /f "tokens=1,2 delims=+" %%a in ("%UserInput%") do set /a result=%%a+%%b 
echo ������=%result% 
goto refresh 
:minus 
for /f "tokens=1,2 delims=-" %%a in ("%UserInput%") do set /a result=%%a-%%b 
echo ������=%result% 
goto refresh 
:multiply 
for /f "tokens=1,2 delims=*" %%a in ("%UserInput%") do set /a result=%%a*%%b 
echo ������=%result% 
goto refresh 
:devide 
for /f "tokens=1,2 delims=/" %%a in ("%UserInput%") do set /a result=%%a/%%b 
echo ������=%result% 
goto refresh 

REM ����N�η� 
:fang 
cls 
echo. 
echo. 
echo. 
echo �q�������������������r 
echo �� �� N �� ��       �� 
echo �t�������������������s 
echo. 
set /p UserInput=��������ʽ: 
REM �����ʽ 
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
echo ������=%result% 
goto refresh 

REM ����׳� 
:jiecheng 
cls 
echo. 
echo. 
echo. 
echo �q�������������������r 
echo �� �� �� ��         �� 
echo �t�������������������s 
echo. 
set /p UserInput=������Ҫ��׳˵�����: 
REM �����ʽ 
echo %UserInput% | findstr "[0-9]">nul || goto error 
echo %UserInput% | findstr /I "[a-z]">nul && goto error 
echo %UserInput% | find ".">nul && goto error 
set /a result=1 
REM ������ֱ���ж�UserInput�Ƿ�Ϊ0 
set num=%UserInput% 
if %num%==0 goto showjiecheng 
for /L %%i in (%num%,-1,1) do set /a result*=%%i 
:showjiecheng 
echo ������=%result% 
goto refresh 

REM ���� 
:error 
cls 
echo. 
echo. 
echo. 
echo �q�������������������������r 
echo �� �������,��ο�������  �� 
echo �t�������������������������s 
echo. 

REM ˢ�� 
:refresh 
echo. 
set UserChoice="" 
set /p UserChoice=�밴���������,�˳��밴q,�����밴h: 
if /I %UserChoice%==q goto end 
if /I %UserChoice%==h goto help 
goto s1

REM ���� 
:help 
cls  
echo. 
echo         �q�������������r 
echo �q���������� �� �� �����������r 
echo ��      �t�������������s     �� 
echo ��                           �� 
echo �� 1.��ͨ������ʹ��������ʽ: �� 
echo �� 4+1 5-2 2*3 6/2           �� 
echo ��                           �� 
echo �� 2.����N�η���ʹ��������ʽ:�� 
echo �� 2_5 (��2��5�η�)          �� 
echo ��                           �� 
echo �� 3.ֻ֧����������          �� 
echo ��                           �� 
echo �� 4.���벿��������ſ��ܻ�  �� 
echo �� ���������˳�              �� 
echo ��                           �� 
echo �t�������������������������� �s 
goto refresh 

REM �˳� 
:end 
cls 
echo. 
echo. 
echo. 
echo �q���������������������������������r 
echo ��                                �� 
echo �� �ǳ���л����ʹ��,�ټ���        �� 
echo ��                                �� 
echo �t���������������������������������s 
ping -n 2 127.1>nul 
goto zjm
:s2
cls
call :tempdq
title easydos---����
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo:                                  easy dos ����
echo.
echo:                     1.ϵͳ���� 2.�������� 3.����ʱ�� 4.����
echo.
echo:                     5.�����û��� 6.�������� 7.�ָ���������!
echo.
echo.
echo.
echo.
echo.
echo.
echo.     
set /p shezhi=��ѡ��:
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
echo:eeeee      a      sssss  y   y      d          sssss   =    =      ��
echo:e         a a     s       y y       d          s       =    =      ��
echo:eeeee    aaaaa    sssss    y    ddddd   ooooo  sssss   =    =      ��
echo:e       a     a       s    y    d   d   o   o      s   =    =             
echo:eeeee  a       a  sssss    y    ddddd   ooooo  sssss   =    =      ��
echo:
echo:Easydos v%ver%!(Developer Preview)
echo.
echo:Code Name "rapier" 2.00a
echo.
echo:2021 by jiqiushuo Onew Studio
echo.
echo:����:%usermz%
echo.
echo:������:%computermz%
echo.
echo:��Ȩ����:jiqiushuo �� 
echo.
echo:�����ΪԤ���汾,ʹ����ɵĺ��Onew Studio������!
pause
goto s2
:setshe4
set cxz2="%time:~0,2%:%time:~3,2% ��������:%user%�޸�������!
call :set ok
%msgsy%
goto zjm
:setshe2
cls
echo.
echo                             ��ɫ����                              
echo.
echo ================================================================
echo.
echo                              ��ɫ��
echo                      �����������ө��������� 
echo                      0 = ��ɫ  ��8 = ��ɫ 
echo                      1 = ��ɫ  ��9 = ����ɫ 
echo                      2 = ��ɫ  ��A = ����ɫ 
echo                      3 = ǳ��ɫ��B = ��ǳ��ɫ 
echo                      4 = ��ɫ  ��C = ����ɫ 
echo                      5 = ��ɫ  ��D = ����ɫ 
echo                      6 = ��ɫ  ��E = ����ɫ 
echo                      7 = ��ɫ  ��F = ����ɫ 
echo                      �����������۩���������
echo.
set /p ǰ��ɫ=������ǰ��ɫ��
echo.
set /p ����ɫ=�����뱳��ɫ��
set color=%����ɫ%%ǰ��ɫ%
echo:%����ɫ%%ǰ��ɫ%>data\temp.eds
echo.
echo ��ɫ���óɹ�������������ء���
pause>nul

goto s2
:setshe3
set /p newtime=������ʱ��(xx:xx):
@time %newtime%
echo:���!
pause
goto s2
:s3
cls
echo:easydos���������v1.0
echo.
echo:�Ѱ�װ�ĵ��������:
dir system\apps\chajian
echo.
set /p chcj=��ѡ��(1.��װ 2.ж�� 3.�˳�):
if /i "%chcj%"=="1" goto install
if /i "%chcj%"=="2" goto uninstall
if /i "%chcj%"=="3" goto zjm
goto s3
:install
cls
echo.
set /p cjlj=��ѡ����·��:
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
set /p cjlju=��ѡ��:
del /q system\apps\chajian\%cjlju%
echo:*****ok!*****
cd %computerdz1%
pause
goto s3
:s4
title easydos---����
cls
echo.
echo:��ӭʹ�ð���! ver1.0
echo.
echo:��������ݿ��ܶ�����������:
echo.
echo:1.��������?һ�����ļ���ʧ,�����ֶ���ԭ�ļ�
echo.
echo:2.Ӧ�ð�װ����������?������Ч?
echo:һ�����ڳ�ʼ���õ�һ��:�����·��������
echo:�ڰ�װʱ���Ƶ�ַ��·��!��������,�ָ���������
echo:֮��,�ڻָ�������������д��ȷ�İ�װ·����
echo.
echo:====û�и�����!====
pause
goto zjm
:s5
title easydos---��������֤
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
echo:                                   ��������֤
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
set cxz1="%time% ���Կ�������֤:%user%������֤���������!"
msg*"%time% ���Կ�������֤:%user%������֤���������!"
:shuruzhanghao
cls
set /p kfry=���뿪�����˺�:
set /p kfmima=��������:
if /i "%kfry%"=="kaifa#1" goto kaifayz
echo:                                    ��֤ʧ��
ping 127.1 -n 3 >nul
goto shuruzhanghao 
:kaifayz
if /i "%kfmima%"=="kfmima" goto hykf
echo:                                    ��֤ʧ��
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
echo:                            ��֤�ɹ�,���뿪����ģʽ
echo:                             ����"����"�ص�EasyDOS
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
set /p zhiling=��������:
if /i "%zhiling%"=="����" goto zjm
%zhiling%
goto minglingshuru
:s6
cls
echo: %date:~0,4%/%date:~5,2%/%date:~8,2%                                                     Ewap:%gp%
echo:===============================================================[����]===========
echo:                                   �����б�
echo:===============================================================================
echo.
echo:a.Ewap��ҳ�����
echo.
echo:��.�ļ�����
echo.
echo:��.ͼ����������
echo.
echo:��.ͬ�����
echo.
echo:��.����������
echo.
echo:M.���ֲ�����
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
title easydos---����
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
echo:                                   Easy����
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
echo:                                  1.�½��ĵ�
echo:                                  2.�˳�����
echo:                                  3.���ĵ�
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
set /p wenzidyhsr=��ѡ��:
if /i "%wenzidyhsr%"=="2" goto zjm
if /i "%wenzidyhsr%"=="1" goto inputshur
if /i "%wenzidyhsr%"=="3" goto dakaiwendang
goto wenzizjm
:inputshur
cls
set /p wenzi=����������:
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
echo:                                  1.��������
echo:                                  2.�˳�����
echo:                                  3.��������
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
set /p wenzixuanze=��ѡ��:
if /i "%wenzixuanze%"=="1" goto wz1
if /i "%wenzixuanze%"=="2" goto zjm
if /i "%wenzixuanze%"=="3" goto inputshur
:wz1
cls
set /p bcwjm=������ļ���:
set /p bchjm=�������׺��:
echo:%wenzi%>%bcwjm%.%bchjm%
set cxz3="%time:~0,2%:%time:~3,2% ����easy����:%user%�����������ļ�%bcwjm%.%bchjm%
call :msgsy
call :file ok
echo:************************************�������************************************
pause
goto zjm
:dakaiwendang
cls
set /p dkdwj=�������ĵ�:
set /p dkwd=<%dkdwj%
echo:%dkwd%
pause
goto wenzizjm
:s8
title apps
cls
echo:����������б�....
echo.
echo:Ŀǰ��װ�����:
echo.
cd %computerdz1%
dir system\apps
echo.
set /p startlj=��ѡ�����,����install��װ,����uninstallж��,����quit�˳�:
if /i %startlj%==install goto installapp
if /i %startlj%==uninstall goto uninstallapp
if /i %startlj%==quit goto zjm
if not exist %startlj% goto s8
call system\run.bat
pause
cd %computerdz1%
goto zjm
:kscd
title easydos---��Դ�˵�
set menu1=:003022$97 E.�˵� 
system\gcdsyba /v menu1
set kscddnr=:003010$67                    ;$67  EasyDOS ver10.2   ;$67                    ;$67    1.�رռ����    ;$67                    ;$67    2.���������    ;$67                    ;$67    3.ע�����û�    ;$67                    ;$67    4.�л����û�    ;$67                    
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
echo:����
pause
goto kscd
:power off
mode con cols=80 lines=25
set powercommand=�ػ�
call :��Դָ��ȷ��
set cxz5="%time:~0,2%:%time:~3,2% %user%ִ��������:�ػ�
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
set powercommand=����
call :��Դָ��ȷ��
set cxz5="%time:~0,2%:%time:~3,2% %user%ִ��������:����
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
set powercommand=ע��
call :��Դָ��ȷ��
set cxz5="%time:~0,2%:%time:~3,2% %user%ִ��������:ע��
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
echo:                           easy dos %ver%  #  �л��û�
echo.
echo:                             ���ڵ�½���û�Ϊ%user%
echo.
echo:                               ��ѡ��һ�����û�:
echo.
echo:                             1.%dqh%#     2.�����û�
set /p qiehuan=:
if /i "%qiehuan%"=="1" goto dluser
if /i "%qiehuan%"=="2" goto dl
:dluser
if /i "%dqh%"=="root" set user=root
if /i "%dqh%"=="%usermz%" set user=%usermz%
set cxz5="%time:~0,2%:%time:~3,2% %user%�л����û�!
if /i "%dqh%"=="root" goto hy
cls
echo:����Ҫ��֤�û� %dqh% ������!
set /p yianmima=������ %dqh% ������:
if /i "%yianmima%"=="%usermima%" goto hy
echo:�������!ϵͳ�޷�������½!
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
title easydos---����
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
echo:                                   EasyDOS ����
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
echo:��⵽���ǵ�һ��ʹ��!
echo.
echo:����Ҫ���뼤��������֤��Ʒ
echo.
echo:��������"��Ʒ֤��"��
echo.
echo:��������ļ�����(���ִ�Сд)
echo.
echo:����"�˳�"�˳�EasyDOS
echo.
ping 127.1 -n 5 >nul
set /p jihuoma=������:
if /i "%jihuoma%"=="12345-67890-12345-67890-12345-#B" goto jihuocg
if /i "%jihuoma%"=="�˳�" goto exit
cls
echo.
echo:��������������,����֤���Ƿ�ʧЧ
echo.
echo:����ʧ��(00001a 010a22)
echo.
echo:����������!
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
echo:                                ����ɹ�,����ʹ��
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
title easydos------��Ϣ
echo:==========================================================
echo:                        ϵͳ��Ϣ��
echo:==========================================================
echo:����Ϊϵͳ��Ϣ:
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
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                               welocome                                   �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                            welocome                                      �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                         welocome                                         �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                      welocome                                            �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                   welocome                                               �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                welocome                                                  �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U             welocome                                                     �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U          welocome                                                        �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U       welocome                                                           �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U                                                                          �U
echo: �U    welocome                                                              �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome                                                                 �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
ping 127.1 -n 2 >nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U    ��ӭʹ��EasyDOS!                                                      �U
echo: �U                                                                          �U
echo: �U    ���򵼽���������ɻ�������!                                           �U
echo: �U                                                                          �U
echo: �U    �������������!                                                       �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                               EasyDOS v10.8              �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U[�밴���������] ��                                                       �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
pause>nul
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U   �����뾫ȷ�������̷��İ�װ·��(�������λ��):                          �U
echo: �U                                                                          �U
echo: �U   ��:C:\EasyDOS                                                          �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
set /p computerdz=������:
echo:%computerdz%>system\computerdz.eds
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U   ��������̨���Ե�����:                                                  �U
echo: �U                                                                          �U
echo: �U   ��:Jorn's computer  ���˹���                                           �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
set /p computermz=������:
echo:%computermz%>data\computername.eds
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U   �������û�������:                                                      �U
echo: �U                                                                          �U
echo: �U   ��:Jorn  ���˹���                                                      �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
set /p usermz=������:
echo:%usermz%>data\username.eds
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U   �������û�������:                                                      �U
echo: �U                                                                          �U
echo: �U   ��:123456  ������̫��,Ҳ�ɲ���                                       �U
echo: �U                                                                          �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
set /p usermima=������:
echo:%usermima%>data\usermima.eds
cls
echo: �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo: �U welocome-��ӭ!                                                   beta    �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U    ��ϲ��!                                                               �U
echo: �U                                                                          �U
echo: �U    ���Ѿ�����˻������ã�                                                �U
echo: �U                                                                          �U
echo: �U    �ٴθ�л��ʹ��EasyDOS                                                 �U
echo: �U                                                                          �U
echo: �U    ϵͳ������,�Ա�������                                                 �U
echo: �U                                                                          �U
echo: �U    �������������....                                                    �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U                                               EasyDOS v10.8              �U
echo: �U                                                                          �U
echo: �U                                                                          �U
echo: �U[�밴���������] ��                                                       �U
echo: �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
pause>nul
set cxz6="%time:~0,2%:%time:~3,2% ������������:%computermz%������������!
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
title easydos---������
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
echo:                                   EasyDOS ����
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
set xtgx=���ڼ��
echo:edos>updata\oldname.eds
cls
set downloadtime=0
if exist c:\lastver.txt del /q c:\lastver.txt
echo:���߸���v1.0 2021 by OnewTeam
echo.
echo:===========================================================================
echo:=                       ����ϵͳ���� ״̬:���ڼ��                        =
echo:=                   ˵��:��������Զ�ͨ�����������                     =
echo:=                      ����ֵȴ���ʱ,��������Ӧ��!                       =
echo:=                     ���Ǽ��"���Դ"�������Ƿ���Ч                      =
echo:===========================================================================
set /p oldver=<system\nowver.ewu
echo:��ǰ�汾:%oldver%
echo:              ============***[������ϵͳ��־]***============
echo:��������....
start bitsadmin /transfer update https://github.com/jiqiushuo/EasyDOS/releases/download/v1.20u/lastver.txt c:\lastver.txt
echo.
echo:��������....
:testupdate
set /a downloadtime=downloadtime+=1
ping 127.1 -n 2 >nul
if exist c:\lastver.txt goto downloadok
if /i %downloadtime%==20 goto chaoshi
goto testupdate
:downloadok
set /p newver=<c:\lastver.txt
echo:���°汾:%newver%
echo.
if %oldver% neq %newver% goto updateonlinenow
if /i %oldver% == %newver% echo:�Ѿ������°汾!
pause
goto zjm
:explorereasy
cls
set /p wzlj=����·��:
dir %wzlj%
pause
goto zjm
:txmm
cls
if /i %user%==root echo:����root,���ܴ�������!&pause&goto zjm
if not exist txmm\ md txmm\
echo:     �X�T�j�T�j�T�[
echo:     �U#1�U#2�U#3�U
echo:     �d�T�p�T�p�T�g
echo:     �U#4�U#5�U#6�U
echo:     �d�T�p�T�p�T�g
echo:     �U#7�U#8�U#9�U
echo:     �^�T�m�T�m�T�a
echo.
echo:����������!
echo.
set /p gz1=�����1������:
echo:%gz1%>txmm\gz1.eds
set /p gz2=�����2������:
echo:%gz2%>txmm\gz2.eds
set /p gz3=�����3������:
echo:%gz3%>txmm\gz3.eds
echo.
echo:��ɣ�����Ϊ%gz1% %gz2% %gz3%
echo.
pause
goto zjm 
:tpmmyz
cls
if not exist txmm\gz1.eds echo:��û��ͼƬ����!&pause&goto dl
if not exist txmm\gz2.eds echo:��û��ͼƬ����!&pause&goto dl
if not exist txmm\gz3.eds echo:��û��ͼƬ����!&pause&goto dl
set /p gza=<txmm\gz1.eds
set /p gzb=<txmm\gz2.eds
set /p gzc=<txmm\gz3.eds
echo:     �X�T�j�T�j�T�[
echo:     �U#1�U#2�U#3�U
echo:     �d�T�p�T�p�T�g
echo:     �U#4�U#5�U#6�U
echo:     �d�T�p�T�p�T�g
echo:     �U#7�U#8�U#9�U
echo:     �^�T�m�T�m�T�a
echo.
set /p srtp=������Ӵ���(����#,����123):
if /i %srtp% == %gza%%gzb%%gzc% goto hy
cls
echo:ͼƬ�������!
pause
goto tpmmyz
:ewapexp
cls
echo:����������.....
ping 127.1 -n 5 >nul
echo:������Ewap!
ping 127.1 -n 3 >nul
echo:%time:~0,2%:%time:~3,2% ��������� ��Ewap!
ping 127.1 -n 3 >nul
echo:�ɹ�!
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
echo:                                  1.����ҳ
echo:                                  2.�����ǩ
echo:                                  3.�˳�����
echo:                                  4.�鿴��ǩ
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
echo baidu(�ٶ�)
echo bing(��Ӧ)
echo exit(�˳�)
echo.
set /p b=��������ʹ�õ��������棺
goto %b%
:baidu
set /p c=�������������Ĺؼ��֣�
start http://www.baidu.com/s?wd=%c%
goto zjm
:bing
set /p c=�������������Ĺؼ��֣�
start http://cn.bing.com/search?q=%a%&ie=utf-8
goto zjm
:exit
goto zjm
:tjsq
cls
echo:�������ǩ����
echo.
set /p sqwz=��������ǩ��ַ:
echo.
set /p sqmz=��������ǩ����:
echo:"\%sqwz%>>e.sq
echo:%sqmz%>e.sqmz
echo.
echo:�����!
echo.
pause
goto laq
:sqck
if not exist e.sq echo:��û�������ǩ&pause&goto laq
set /p sqwj=<e.sq
set /p tjsqmz=<e.sqmz
echo:����ӵ���ǩ��:
echo:name:%tjsqmz%
echo:%sqwj%
pause
goto laq
:onlock
cls
set var=:025007$9f                              ;$9f                              ;$9f            $96������            ;$9f                              ;$9f                   ����       ;$9f          u.[����] ����       ;$9f                              
system\gcdsyba /v var
choice /c u /n >nul
if /i %errorlevel%==1 goto zjm
goto onlock
:sycz
cls
title easydos---��������
echo.
echo:������ϵͳ�����Ƿ��:
echo.
echo:1.ϵͳ������
echo.
echo:2.ϵͳ������
choice /c 12 /n >nul
if /i "%errorlevel%"=="2" goto gsy
if /i "%errorlevel%"=="1" goto ksy
:gsy
echo:off>data\syzt.eds
set sy=��
goto zjm
:ksy
echo:on>data\syzt.eds
set sy=��
goto zjm
:gjsy
if /i %syzt%==on system\mplayer_core system\easydospoweroff.wav>nul 2>nul&ping 127.1 -n 1.5 >nul&set sy=��&goto :eof
set sy=��
ping 127.1 -n 5 >nul
goto :eof
:dlsy
if /i %syzt%==on system\mplayer_core system\easydoslogon.wav>nul 2>nul&set sy=��&goto :eof
set sy=��
ping 127.1 -n 3 >nul
goto :eof
:kjsy
if /i %syzt%==on system\mplayer_core system\easydospoweron.wav>nul 2>nul&set sy=��&goto :eof
set sy=��
ping 127.1 -n 5 >nul
goto :eof
:msgsy
if /i %syzt%==on system\mplayer_core system\easydosmsg.wav>nul 2>nul&set sy=��&goto :eof
set sy=��
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
if /i %date:~12% == һ set x1=*
if /i %date:~12% == �� set x2=*
if /i %date:~12% == �� set x3=*
if /i %date:~12% == �� set x4=*
if /i %date:~12% == �� set x5=*
if /i %date:~12% == �� set x6=*
if /i %date:~12% == �� set x7=*
goto eof
:hszcx
cls
if not exist system\recyclebin\ md system\recyclebin
echo:%user%�Ļ���վ����:
dir system\recyclebin
echo:��ѡ��:1.����ļ�  2.��ջ���վ  3.�˳�
set /p hsz=��ѡ��
if /i %hsz%==1 goto tjhswj
if /i %hsz%==2 goto qingkong
if /i %hsz%==3 goto zjm
goto hszcx
:tjhswj
cls
echo:����������ļ�:
set /p kshs=:
copy %kshs% system\recyclebin
echo:������һ���ļ���
echo:%kshs%
del /f /q %kshs%
pause
goto hszcx
:qingkong
cls
set /p xuanzeyn=��ȷ��Ҫ�����(y/n):
if /i %xuanzeyn%==y goto delwj
if /i %xuanzeyn%==n goto hszcx
goto qingkong
:delwj
del /f /q system\recyclebin
md system\recyclebin\
echo:���!
pause
goto hszcx
:setuser
cls
set /p usermz=�����������û���:
echo:%usermz%>data\username.eds
echo.
echo:��,�������û���Ϊ%usermz%
echo.
echo:�´�����ʱ����Ч!
echo.
pause
goto s2
:setnmima
cls
set /p yhumima=�������������(Ҳ�ɲ���):
echo:%yhumima%>data\usermima.eds
echo.
echo:������������%yhumima%
echo.
echo:�´�����ʱ����Ч!
echo.
pause
goto s2
:reset
cls
set /p resetxz=��ȷ��Ҫ�ָ�����������?(y/n):
if /i %resetxz%==y goto huifu
if /i %resetxz%==n goto s2
goto reset
:huifu
echo:���ڻָ�......
ping 127.1 -n 3 >nul
echo.
del /f /q data\
echo:��ɣ��������¼���.....
ping 127.1 -n 3 >nul
echo.
md data\
echo:��������.....
ping 127.1 -n 3 >nul
goto power on start
:tempdq
if not exist data\temp.eds goto :eof
set /p color=<data\temp.eds
color %color%
goto :eof
:nopoweroff
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f    $47 ! $9f   $9c�ϴ�û�������ػ�!   ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto eof
goto no poweroff
:file ok
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f        $37 i $9f      $9a�ѱ���       ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto :eof
goto flie ok
:��Դָ��ȷ��
cls
set var=:025007$9f                              ;$9f                              ;$9f       $9a ��ȷ��Ҫ$9c%powercommand%$9a��?       ;$9f                              ;$9f                              ;$9f       y.[yes]    n.[no]      ;$9f                              
system\gcdsyba /v var
choice /c yn /n >nul
if /i %errorlevel%==1 cls&goto :eof
if /i %errorlevel%==2 cls&goto zjm
goto ��Դָ��ȷ��
:set ok
cls
set var=:025007$af [system]                  $67ok$a7 ;$9f                              ;$9f                              ;$9f       $37 i $9f    $9a�����Ѹı�      ;$9f                              ;$9f            y.[ok]            ;$9f                              
system\gcdsyba /v var
choice /c y /n >nul
if /i %errorlevel%==1 cls&goto :eof
goto set ok
:music
cls
echo:��ӭʹ�����ֲ�������
echo.
echo:����quit�˳�!
echo.
set /p musiclj=     ��������Ƶ:
if /i %musiclj%==quit goto s6
echo.
echo:���ڲ���%musiclj%,���س�ֹͣ����!
echo.
system\mplayer_core %musiclj%>nul 2>nul
echo:�������,�����������!
echo.
pause
goto music
:installapp
cls
echo.
set/p appsins=�����밲װ����·��:
echo.
echo:��������װ��.....
copy %appsins% system\apps
echo.
echo:���!
cd %computerdz1%
pause
goto s8
:uninstallapp
cls
dir system\apps
set /p unins=��ѡ��:
del /q system\apps\%unins%
echo:****���!****
cd %computerdz1%
pause
goto s8
:chaoshi
cls
echo.
echo:���س�ʱ,ʧ��! �������Դ!
pause
goto zjm
:updateonlinenow
cls
echo.
echo:���µİ汾����:EasyDOS %newver%
echo.
set/p ifupdatenow=��Ҫ������(y/n):
if /i %ifupdatenow%==y goto yesupdate
pause
goto zjm
:yesupdate
start bitsadmin /transfer update https://github.com/jiqiushuo/EasyDOS/releases/download/v1.20u/update.bat c:\update.bat
echo.
echo:��������....
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
echo:���������!
echo.
echo:��������������
echo.
pause
echo:%newver%>system\nowver.ewu
system\updateman.bat