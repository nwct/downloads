echo=1/*
goto windows

:windows

set date1=2018��9��23��

@echo off
title frps�����ű� ���ߣ�����ß���� QQ:372763861  %date1% 
COLOR 02
cls
cd %~dp0
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (set IP=%%a)
goto version


:version
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��frps�����ű���                                 ::
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
if %num%==2 set version=0.14.1
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
ECHO.::      ��ӭʹ��Windowsƽ̨��frps�����ű���                                 ::
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
echo      1�����÷������Ϣ
echo      2������frps�����
echo      3��ɾ��֮ǰ��frps����
echo      4���رպ�̨frps���� 
echo      5����ӵ�����������(���ù���ԱȨ��ִ�и�BAT������Ч)
echo      6�������Ų�
echo      7���˳�
set num=0
set /p num=
if %num%==1 goto server
if %num%==2 goto start
if %num%==3 goto delete
if %num%==4 goto guanbihoutai
if %num%==5 goto kaijiqidong
if %num%==6 goto check
if %num%==7 exit|del frps.bat
goto moshi

:check
echo �·��Ƕ˿�ʹ�������飺
set bind_port=7000
set vhost_http_port=80
set vhost_https_port=443
set dashboard_port=7500

set /p bind_port=��������frps�İ����Ӷ˿ڡ�Ĭ�ϣ�%bind_port%����

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%bind_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. ���̡�%%i��ռ�á�%%b��
)
)
echo. �밴�س����������
pause >nul
COLOR 02
echo.
set /p vhost_http_port=��������frps��HTTP�˿ڡ�Ĭ�ϣ�%vhost_http_port%����

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%vhost_http_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. ���̡�%%i��ռ�á�%%b��
)
)
echo. �밴�س����������
pause >nul
COLOR 02
echo.
set /p vhost_https_port=��������frps��HTTPS�˿ڡ�Ĭ�ϣ�%vhost_https_port%����

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%vhost_https_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. ���̡�%%i��ռ�á�%%b��
)
)
echo. �밴�س����������
pause >nul
COLOR 02
echo.
set /p dashboard_port=��������frps�Ĳ�ѯ����״̬�˿ڡ�Ĭ�ϣ�%dashboard_port%����

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%dashboard_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. ���̡�%%i��ռ�á�%%b��
)
)
echo. �밴�س����������
pause >nul
COLOR 02

echo.
echo �·��Ǳ���ʱ���frps�汾�ţ�
echo.
echo �汾��
cd %~dp0
frps -v
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
ECHO.������frps��������Ϣ�����ʹ��Ĭ��ֵ��ֱ�ӻس���
ECHO.


if %version%==0.21.0 (
set privilege=
set token=frp888
set allow_ports=1-65535
) else (
set privilege_mode=true
set privilege_token=frp888
set privilege_allow_ports=1-65535
set privilege=privilege_
)

set bind_addr=0.0.0.0
set bind_port=7000
set bind_udp_port=7001
set kcp_bind_port=7000
set vhost_http_port=80
set vhost_https_port=443
set dashboard_port=7500
set dashboard_user=admin
set dashboard_pwd=admin
set log_max_days=7
set max_ports_per_client=5


set /p bind_addr=��IP��ַ��Ĭ�ϣ�%bind_addr%����
set /p bind_port=�����Ӷ˿ڡ�Ĭ�ϣ�%bind_port%����
set /p vhost_http_port=HTTP�˿ڡ�Ĭ�ϣ�%vhost_http_port%����
set /p vhost_https_port=HTTPS�˿ڡ�Ĭ�ϣ�%vhost_https_port%����
set /p dashboard_port=��ѯ����״̬�˿ڡ�Ĭ�ϣ�%dashboard_port%����
set /p dashboard_user=��ѯ����״̬���û�����Ĭ�ϣ�%dashboard_user%����
set /p dashboard_pwd=��ѯ����״̬�����롾Ĭ�ϣ�%dashboard_pwd%����
set /p log_max_days=��־��¼������Ĭ�ϣ�%log_max_days%����
if /i %version%==0.21.0 (
	set /p max_ports_per_client=����ͻ������������:��Ĭ�ϣ�%max_ports_per_client%����
	set /p token=�������롾Ĭ�ϣ�%token%����
	set /p allow_ports=���ö˿ڷ�Χ��Ĭ�ϣ�%allow_ports%����
) else (
	if /i %version%==0.9.3 (
	set /p privilege_mode=��Ȩģʽ����[true/flase]��Ĭ�ϣ�%privilege_mode%����
	) 
	set /p privilege_token=�������롾Ĭ�ϣ�%privilege_token%����
	set /p privilege_allow_ports=���ö˿ڷ�Χ��Ĭ�ϣ�%privilege_allow_ports%����
	
)


ECHO [common] >"frps.ini"
ECHO bind_addr = %bind_addr% >>"frps.ini"
ECHO bind_port = %bind_port% >>"frps.ini"
ECHO bind_udp_port = %bind_udp_port% >>"frps.ini"
ECHO kcp_bind_port = %bind_port% >>"frps.ini"
ECHO vhost_http_port = %vhost_http_port% >>"frps.ini"
ECHO vhost_https_port = %vhost_https_port% >>"frps.ini"
ECHO dashboard_port = %dashboard_port% >>"frps.ini"
ECHO dashboard_user = %dashboard_user% >>"frps.ini"
ECHO dashboard_pwd = %dashboard_pwd% >>"frps.ini"
ECHO log_max_days = %log_max_days% >>"frps.ini"

if /i %version%==0.21.0 (
ECHO max_ports_per_client = %max_ports_per_client% >>"frps.ini"
ECHO token = %token% >>"frps.ini"
ECHO allow_ports = %allow_ports% >>"frps.ini"
) else (
if /i %version%==0.9.3 (
ECHO privilege_mode = %privilege_mode% >>"frps.ini"
)
ECHO privilege_token = %privilege_token% >>"frps.ini"
ECHO privilege_allow_ports = %privilege_allow_ports% >>"frps.ini"
)

ECHO authentication_timeout = 900 >>"frps.ini"
ECHO max_pool_count = 100 >>"frps.ini"
ECHO log_file = frps.log >>"frps.ini"
ECHO log_level = info >>"frps.ini"
ECHO.
ECHO.       ��������ɣ������������ѡ��....      
pause >nul 
ECHO.
goto moshi



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

echo Set WshShell = WScript.CreateObject("WScript.Shell") >frps.vbs
echo strDesktop = WshShell.SpecialFolders("Desktop") '�����ļ��С����桱 >>frps.vbs
echo set oShellLink = WshShell.CreateShortcut("%lujing%frps.lnk") >>frps.vbs
echo oShellLink.TargetPath = "%lujing%frps.vbs"  '��ִ���ļ�·�� >>frps.vbs
echo oShellLink.Description = "�� ����ß���� ����"  '��ע >>frps.vbs
echo oShellLink.WorkingDirectory = "%lujing%"  '��ʼλ�� >>frps.vbs
echo oShellLink.Save  '���������ݷ�ʽ >>frps.vbs
cscript.exe /e:vbscript frps.vbs >nul





echo CreateObject("WScript.Shell").Run "cmd /c frps.exe",0 >frps.vbs

echo REGEDIT4>frps.reg 
echo. 
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\run]>>frps.reg 
echo "frps"="%cd:\=\\%\\frps.lnk">>frps.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>frps.reg 
echo "frps"="%cd:\=\\%\\frps.lnk">>frps.reg 

regedit /s frps.reg &del frps.reg



echo  ��ӿ���������ɣ����������Բ��ԣ�������������ء�
echo.
echo.  
pause >nul 
goto moshi

:guanbihoutai
taskkill /f /im frps.exe 1>nul 2>nul
echo.
echo  �رպ�̨frps��ɣ��������������
pause >nul 
goto moshi


:start
cd %~dp0
if exist frps.exe goto run
call :download "http://www.lu8.win/downloads/frp/windows/%version%/frps.exe" frps.exe
goto start


:delete
taskkill /f /im frps.exe 1>nul 2>nul
echo.
del frps.exe
echo  ɾ��frps��ɣ��������������
pause >nul 
goto moshi


:download  
ECHO. δ��⵽ frps.exe
ECHO.
rem echo �����ļ�:      "%~1"  
rem echo ����λ��: "%~f2"  
ECHO. ��ʼ���� frps.exe . . .  
cscript -nologo -e:jscript "%~f0" "%~1" "%~2"  
ECHO.


for %%i in ("frps.exe") do (
set size=%%~zi
set /a KB=%\(%size/1024\) 2>nul
)
if %size% lss 1024 (

rem ִ��A����
ECHO. ����ʧ�ܣ�
ECHO. 
ECHO. �뵽http://www.lu8.win�ֶ����أ�����frps.exe���������ýű�ͬĿ¼�¼��ɡ�
del frps.exe
ECHO. 
ECHO. ��Ҫ�������������밴��������� 
) else (
rem ִ��B����
ECHO. ������ɣ�
ECHO. 

echo. frps.exe�ļ���СΪ��%KB% KB
ECHO. 
goto run
ECHO. 
)
ECHO.
ECHO. 
pause >nul 
goto moshi


:run
echo.
ECHO.
cd %~dp0
taskkill /f /im frps.exe 1>nul 2>nul
del frps.log 1>nul 2>nul
echo CreateObject("WScript.Shell").Run "cmd /c frps.exe -c frps.ini",0 >frps.vbs
cscript.exe /e:vbscript frps.vbs >nul
del frps.vbs
echo.
ECHO. ��̨����frps��ɣ���Ҫ�˳�frps��̨���У��밴�������ѡ��
echo.
ping 127.0.0.1 -n 6 >nul
ECHO.
ECHO. ������frps.log��־��Ϣ��
ECHO.
type "frps.log"
ECHO.
ECHO.
ECHO. ����־��Ϣ��ʾ ��ϵͳ�Ҳ���ָ���ļ��� �� ������Ϣ�г��� ��error�� �������밴������������ú�����������
ECHO.    
ECHO.
pause >nul 
goto moshi

*/ 
var iLocal,iRemote,xPost,sGet;  
iLocal =WScript.Arguments(1);   
iRemote = WScript.Arguments(0);   
iLocal=iLocal.toLowerCase();  
iRemote=iRemote.toLowerCase();  
xPost = new ActiveXObject("Microsoft"+String.fromCharCode(0x2e)+"XMLHTTP");  
xPost.Open("GET",iRemote,0);  
xPost.Send(); 
sGet = new ActiveXObject("ADODB"+String.fromCharCode(0x2e)+"Stream");  
sGet.Mode = 3;  
sGet.Type = 1;   
sGet.Open();   
sGet.Write(xPost.responseBody);  
sGet.SaveToFile(iLocal,2);   
