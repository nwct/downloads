goto windows
:windows
set date1=2019��4��25��
%~d0
@echo off
title frp�����ű� ���ߣ�����ß���� QQȺ:114888319  %date1%  
COLOR 02
cls
cd %~dp0
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (set IP=%%a)
if %IP%=="Ĭ��" (
set IP="127.0.0.1"
) 
if %IP%=="Default" (
set IP="127.0.0.1"
) 
goto version

lu8
:version
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��frpc�����ű���                                 ::
ECHO.::      ���ű���  ����ß����  ��д��������������ϵ���ˣ�                  ::
ECHO.::      ת���벻Ҫɾ������Ϣ��  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ���ߣ�����ß����        QQ:372763861      %date1%           ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO. 
echo  ��ѡ�����汾��
echo      1��V0.9.3
echo      2��V0.16.1
echo      3��V0.21.0
echo.
echo     ��ע�⣺�ͻ��������˰汾����һ�£����򲻼��ݡ�
set num=0
set /p num=
if %num%==1 set version=0.9.3
if %num%==2 set version=0.16.1
if %num%==3 set version=0.21.0
if /i not %num%==1 (
if /i not %num%==2 (
if /i not %num%==3 (
goto version 
)
)
)
goto moshi


:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��frpc�����ű���                                 ::
ECHO.::      ���ű���  ����ß����  ��д��������������ϵ���ˣ�                  ::
ECHO.::      ת���벻Ҫɾ������Ϣ��  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ���ߣ�����ß����        QQ:372763861      %date1%           ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.   
echo  ��ѡ����Ҫ�Ĳ�����
echo      1������Ҫ���ӵķ�����
echo      2���������Э��
echo      3��������ɺ�̨����
echo      4��ɾ��֮ǰ��frpc�汾
echo      5���رպ�̨frpc���� 
echo      6����ӵ�����������(���ù���ԱȨ��ִ�и�BAT������Ч)
echo      7�������Ų� 
echo      8���˳�
set num=0
set /p num=
if %num%==1 goto server
if %num%==2 goto type
if %num%==3 goto start
if %num%==4 goto delete
if %num%==5 goto guanbihoutai
if %num%==6 goto kaijiqidong
if %num%==7 goto check
if %num%==8 exit | del frpc.bat
goto moshi

:check
echo.
echo �·��Ǳ���ʱ���frpc�汾�ţ�
echo.
echo �汾��
cd %~dp0
frpc -v
echo ʱ�䣺
echo %date%%time%
echo.
echo ����ͻ��˺ͷ�����Ƿ�һ��
echo.
ECHO.       �����ɣ�����������ز˵�....      
pause >nul 
goto moshi


:server
ECHO.
ECHO.������frp��������Ϣ�����ʹ����ѷ�������Ĭ��ֵ��ֱ�ӻس���
ECHO.
set server_addr=frp.lu8.win
set server_port=7000
set privilege_token=frp888
set token=frp888
set login_fail_exit=true
set protocol=tcp


set /p server_addr=��������ַ��Ĭ�ϣ�%server_addr%����
set /p server_port=�������˿ڡ�Ĭ�ϣ�%server_port%����
if /i %version%==0.21.0 (
	set /p token=�������롾Ĭ�ϣ�%token%����
	set /p login_fail_exit=���ߺ��Զ���������[true/flase]��Ĭ�ϣ�%login_fail_exit%����
	set /p protocol=����ʹ�õ�Э��[tcp/kcp]��Ĭ�ϣ�%protocol%����
) else ( 
	set /p privilege_token=�������롾Ĭ�ϣ�%privilege_token%����
	if /i %version%==0.16.1 (
	set /p login_fail_exit=���ߺ��Զ���������[true/flase]��Ĭ�ϣ�%login_fail_exit%����
	set /p protocol=����ʹ�õ�Э��[tcp/kcp]��Ĭ�ϣ�%protocol%����
	)
	
)

ECHO [common] >"frpc.ini"
ECHO server_addr = %server_addr% >>"frpc.ini"
if /i %version%==0.21.0 (
ECHO token = %token% >>"frpc.ini"
ECHO login_fail_exit = %login_fail_exit% >>"frpc.ini"
ECHO protocol = %protocol% >>"frpc.ini"
) else ( 
ECHO privilege_token = %privilege_token% >>"frpc.ini"
if /i %version%==0.16.1 (
ECHO login_fail_exit = %login_fail_exit% >>"frpc.ini"
ECHO protocol = %protocol% >>"frpc.ini"
)
)

ECHO server_port = %server_port% >>"frpc.ini"
ECHO log_file = frpc.log >>"frpc.ini"
ECHO log_level = info >>"frpc.ini"
ECHO log_max_days = 7 >>"frpc.ini"
ECHO.
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto moshi

:type
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��frpc�����ű���                                 ::
ECHO.::      ���ű���  ����ß����  ��д��������������ϵ���ˣ�                  ::
ECHO.::      ת���벻Ҫɾ������Ϣ��  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ���ߣ�����ß����        QQ:372763861      2017��12��10��          ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
echo  ��������������ʹ�õ�Э�飺
echo      1������httpģʽӳ��
echo      2������httpsģʽӳ��
echo      3������tcpģʽӳ��
echo      4������udpģʽӳ��
if not %version%==0.9.3 (
echo      5������stcpģʽӳ��
echo      6������xtcpģʽӳ��
)
echo      7��������ɷ����ϼ�ѡ��
set num=0
set /p num=
if %num%==1 goto http
if %num%==2 goto https
if %num%==3 goto tcp
if %num%==4 goto udp
if not %version%==0.9.3 (
if %num%==5 goto stcp
if %num%==6 goto xtcp
)
if %num%==7 goto moshi
goto type


:http
set type=http
set local_ip=%IP%
set local_port=80
set suiji=%random%
ECHO.
ECHO.������Ҫ��ӳ��ı�����Ϣ�����ʹ��Ĭ��ֵ��ֱ�ӻس���
ECHO.
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set custom_domains=%suiji%.%server_addr%
set /p custom_domains=������Ĭ�ϣ�%custom_domains%����
ECHO.>>"frpc.ini"
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO custom_domains = %custom_domains% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
if /i %version%==0.9.3 (
ECHO privilege_mode = true >>"frpc.ini"
ECHO use_gzip = true >>"frpc.ini"
) else (
ECHO use_compression = true >>"frpc.ini"
)
ECHO use_encryption = true >>"frpc.ini"
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type


:https
set type=https
set local_ip=%IP%
set local_port=443
set suiji=%random%
ECHO.
ECHO.������Ҫ��ӳ��ı�����Ϣ�����ʹ��Ĭ��ֵ��ֱ�ӻس���
ECHO.
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set custom_domains=%suiji%.%server_addr%
set /p custom_domains=������Ĭ�ϣ�%custom_domains%����
ECHO.>>"frpc.ini"
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO custom_domains = %custom_domains% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
if /i %version%==0.9.3 (
ECHO privilege_mode = true >>"frpc.ini"
) else (
ECHO use_compression = true >>"frpc.ini"
)
ECHO use_encryption = true >>"frpc.ini"
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type

:tcp
set type=tcp
set local_ip=%IP%
set local_port=22
set suiji=%random%
set remote_port=%suiji%
ECHO.
ECHO.������Ҫ��ӳ��ı�����Ϣ�����ʹ��Ĭ��ֵ��ֱ�ӻس���
ECHO.
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set /p remote_port=Զ�̶˿ڡ�Ĭ�ϣ�%remote_port%����
ECHO.>>"frpc.ini"
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO remote_port = %remote_port% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
if /i %version%==0.9.3 (
ECHO privilege_mode = true >>"frpc.ini"
) else (
ECHO use_compression = true >>"frpc.ini"
)
ECHO use_encryption = true >>"frpc.ini"
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type


:udp
set type=udp
set local_ip=%IP%
set local_port=53
set suiji=%random%
set remote_port=%suiji%
ECHO.
ECHO.������Ҫ��ӳ��ı�����Ϣ�����ʹ��Ĭ��ֵ��ֱ�ӻس���
ECHO.
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set /p remote_port=Զ�̶˿ڡ�Ĭ�ϣ�%remote_port%����
ECHO.>>"frpc.ini"
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO remote_port = %remote_port% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
if /i %version%==0.9.3 (
ECHO privilege_mode = true >>"frpc.ini"
) else (
ECHO use_compression = true >>"frpc.ini"
)
ECHO use_encryption = true >>"frpc.ini"
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type

:stcp
set type=stcp
set local_ip=%IP%
set local_port=22
set role=server
set suiji=%random%
set sk=%suiji%
ECHO.
ECHO.��ѡ��Ĭ�ϣ�����ˡ���
ECHO.

set /p num=Ҫ���� %type% ģʽ�ķ��ʶ�������v, ����ֱ�ӻس�����Ϊ�����:
if %num%==v set role=visitor
if %role%==visitor set /p server_name=������Ҫ���ʵķ�����������:
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set /p sk=sk��Ĭ�ϣ�%sk%����
ECHO.>>"frpc.ini"
if %role%==server (
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO sk = %sk% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
) else (
ECHO [%type%_%suiji%_visitor] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO role = visitor >>"frpc.ini"
ECHO sk = %sk% >>"frpc.ini"
ECHO server_name = %server_name% >>"frpc.ini"
ECHO bind_addr = %local_ip% >>"frpc.ini"
ECHO bind_port = %local_port% >>"frpc.ini"
)
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type

:xtcp
set type=xtcp
set local_ip=%IP%
set local_port=22
set role=server
set suiji=%random%
set sk=%suiji%
ECHO.
ECHO.��ѡ��Ĭ�ϣ�����ˡ���
ECHO.

set /p num=Ҫ���� %type% ģʽ�ķ��ʶ�������v, ����ֱ�ӻس�����Ϊ�����:
if %num%==v set role=visitor
if %role%==visitor set /p server_name=������Ҫ���ʵķ�����������:
set /p local_ip=����IP��Ĭ�ϣ�%local_ip%����
set /p local_port=���ض˿ڡ�Ĭ�ϣ�%local_port%����
set /p sk=sk��Ĭ�ϣ�%sk%����
ECHO.>>"frpc.ini"
if %role%==server (
ECHO [%type%_%suiji%] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO sk = %sk% >>"frpc.ini"
ECHO local_ip = %local_ip% >>"frpc.ini"
ECHO local_port = %local_port% >>"frpc.ini"
) else (
ECHO [%type%_%suiji%_visitor] >>"frpc.ini"
ECHO type = %type% >>"frpc.ini"
ECHO role = visitor >>"frpc.ini"
ECHO sk = %sk% >>"frpc.ini"
ECHO server_name = %server_name% >>"frpc.ini"
ECHO bind_addr = %local_ip% >>"frpc.ini"
ECHO bind_port = %local_port% >>"frpc.ini"
)
ECHO.      
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto type



:start
cd %~dp0
if exist frpc.exe goto run
set lujing=%~dp0
bitsadmin /reset /allusers
bitsadmin /transfer frpc%version% /PRIORITY FOREGROUND "https://raw.githubusercontent.com/nwct/downloads/master/frp/windows-386/%version%/frpc.exe" "%lujing%frpc.exe"
goto start


:kaijiqidong
set lujing=%~dp0
  
:: BatchGotAdmin  
:-------------------------------------  
REM  --> ���Ȩ�� 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
  

if '%errorlevel%' NEQ '0' (  
    goto UACPrompt  
) else ( goto gotAdmin )  
  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
  
    "%temp%\getadmin.vbs"  
    exit /B  
  
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%"  
    CD /D "%~dp0"
      
:--------------------------------------


set lujing=%~dp0

echo Set WshShell = WScript.CreateObject("WScript.Shell") >frpc.vbs
echo strDesktop = WshShell.SpecialFolders("Desktop") '�����ļ��С����桱 >>frpc.vbs
echo set oShellLink = WshShell.CreateShortcut("%lujing%frpc.lnk") >>frpc.vbs
echo oShellLink.TargetPath = "%lujing%frpc.vbs"  '��ִ���ļ�·�� >>frpc.vbs
echo oShellLink.Description = "�� ����ß���� ����"  '��ע >>frpc.vbs
echo oShellLink.WorkingDirectory = "%lujing%"  '��ʼλ�� >>frpc.vbs
echo oShellLink.Save  '���������ݷ�ʽ >>frpc.vbs
cscript.exe /e:vbscript frpc.vbs >nul





echo CreateObject("WScript.Shell").Run "cmd /c frpc.exe",0 >frpc.vbs

echo REGEDIT4>frpc.reg 
echo. 
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\run]>>frpc.reg 
echo "frpc"="%cd:\=\\%\\frpc.lnk">>frpc.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>frpc.reg 
echo "frpc"="%cd:\=\\%\\frpc.lnk">>frpc.reg 

regedit /s frpc.reg &del frpc.reg



echo  ��ӿ���������ɣ����������Բ��ԣ�������������ء�
echo.
echo.  
pause >nul 
goto moshi

:delete
taskkill /f /im frpc.exe 1>nul 2>nul
echo.
del frpc.exe
echo  ɾ��frpc��ɣ��������������
pause >nul 
goto moshi


:guanbihoutai
taskkill /f /im frpc.exe 1>nul 2>nul
echo.
echo  �رպ�̨frpc��ɣ��������������
pause >nul 
goto moshi

:run
echo.
ECHO.
cd %~dp0
taskkill /f /im frpc.exe 1>nul 2>nul
del frpc.log 1>nul 2>nul


echo CreateObject("WScript.Shell").Run "cmd /c frpc.exe -c frpc.ini",0 >frpc.vbs
cscript.exe /e:vbscript frpc.vbs >nul
del frpc.vbs
ECHO.��������frpc�����Ժ�......
ping 127.0.0.1 -n 15 >nul
ECHO.
ECHO. ������frpc.log��־��Ϣ��
ECHO.
type "frpc.log"
ECHO.
findstr /c:"start proxy error" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.����ʧ�ܣ��������û��������ã�
ECHO.
)
findstr /c:"Start to send heartbeat to frps" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.��̨����frpc��ɣ�
ECHO.
)
findstr /c:"login to server success" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.��̨����frpc��ɣ�
ECHO.
)
findstr /c:"login to server failed: i/o timeout" frpc.log >nul
if %errorlevel% equ 0 (
frpc.exe -v >v.txt
for /f %%i in (v.txt) do (
ECHO.
ECHO. ����ʧ�ܣ���Ŀǰʹ�õĿͻ���frpc�汾Ϊ��%%i����ʹ�ð汾Ϊ��0.9.3���Ͽͻ��������Ӵ˷�������
ECHO.
) 
del v.txt
)
findstr /c:"read from server error" frpc.log >nul
if %errorlevel% equ 0 (
frpc.exe -v >v.txt
for /f %%i in (v.txt) do (
ECHO.
ECHO. ����ʧ�ܣ���Ŀǰʹ�õĿͻ���frpc�汾Ϊ��%%i����ʹ���°汾�ͻ��������Ӵ˷�������
ECHO.
) 
del v.txt
)
pause >nul 
goto moshi
