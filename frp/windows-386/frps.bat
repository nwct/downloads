echo=1/*
goto windows

:windows

set date1=2018年9月23日

@echo off
title frps启动脚本 作者：☆夢幻煋涳☆ QQ:372763861  %date1% 
COLOR 02
cls
cd %~dp0
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (set IP=%%a)
goto version


:version
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      欢迎使用Windows平台的frps启动脚本，                                 ::
ECHO.::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                  ::
ECHO.::      转载请不要删除本信息！  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：☆夢幻煋涳☆        QQ:372763861      %date1%           ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO. 
echo  请选择程序版本：
echo      1、V0.9.3
echo      2、V0.16.1
echo      3、V0.21.0
echo.
echo     【注意：客户端与服务端版本保持一致，否则不兼容】
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
ECHO.::      欢迎使用Windows平台的frps启动脚本，                                 ::
ECHO.::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                  ::
ECHO.::      转载请不要删除本信息！  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：☆夢幻煋涳☆        QQ:372763861      %date1%           ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.   
echo  请选择你要的操作：
echo      1、配置服务端信息
echo      2、启动frps服务端
echo      3、删除之前的frps程序
echo      4、关闭后台frps程序 
echo      5、添加到开机自启动(需用管理员权限执行该BAT才能生效)
echo      6、错误排查
echo      7、退出
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
echo 下方是端口使用情况检查：
set bind_port=7000
set vhost_http_port=80
set vhost_https_port=443
set dashboard_port=7500

set /p bind_port=请输入你frps的绑定连接端口【默认：%bind_port%】：

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%bind_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. 进程【%%i】占用【%%b】
)
)
echo. 请按回车键继续检测
pause >nul
COLOR 02
echo.
set /p vhost_http_port=请输入你frps的HTTP端口【默认：%vhost_http_port%】：

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%vhost_http_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. 进程【%%i】占用【%%b】
)
)
echo. 请按回车键继续检测
pause >nul
COLOR 02
echo.
set /p vhost_https_port=请输入你frps的HTTPS端口【默认：%vhost_https_port%】：

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%vhost_https_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. 进程【%%i】占用【%%b】
)
)
echo. 请按回车键继续检测
pause >nul
COLOR 02
echo.
set /p dashboard_port=请输入你frps的查询连接状态端口【默认：%dashboard_port%】：

for /F "tokens=1-5 delims= " %%a in ( 'netstat  -aon ^|findstr "LISTENING"^|findstr ":%dashboard_port%"' ) do ( 
for /F "tokens=1-5 delims= " %%i in ( 'tasklist^|findstr "%%e"' ) do ( 
color 04
echo. 进程【%%i】占用【%%b】
)
)
echo. 请按回车键继续检测
pause >nul
COLOR 02

echo.
echo 下方是本机时间和frps版本号：
echo.
echo 版本：
cd %~dp0
frps -v
echo 时间：
echo %date%%time%
echo.
echo 请检查客户端和服务端是否一致
echo.
ECHO.       检查完成，按任意键返回菜单....      
pause >nul 
goto moshi



:server
ECHO.
ECHO.请输入frps服务器信息，如果使用默认值请直接回车！
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


set /p bind_addr=绑定IP地址【默认：%bind_addr%】：
set /p bind_port=绑定连接端口【默认：%bind_port%】：
set /p vhost_http_port=HTTP端口【默认：%vhost_http_port%】：
set /p vhost_https_port=HTTPS端口【默认：%vhost_https_port%】：
set /p dashboard_port=查询连接状态端口【默认：%dashboard_port%】：
set /p dashboard_user=查询连接状态的用户名【默认：%dashboard_user%】：
set /p dashboard_pwd=查询连接状态的密码【默认：%dashboard_pwd%】：
set /p log_max_days=日志记录天数【默认：%log_max_days%】：
if /i %version%==0.21.0 (
	set /p max_ports_per_client=允许客户端最大连接数:【默认：%max_ports_per_client%】：
	set /p token=连接密码【默认：%token%】：
	set /p allow_ports=可用端口范围【默认：%allow_ports%】：
) else (
	if /i %version%==0.9.3 (
	set /p privilege_mode=特权模式开关[true/flase]【默认：%privilege_mode%】：
	) 
	set /p privilege_token=连接密码【默认：%privilege_token%】：
	set /p privilege_allow_ports=可用端口范围【默认：%privilege_allow_ports%】：
	
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
ECHO.       配置已完成，按任意键继续选择....      
pause >nul 
ECHO.
goto moshi



:kaijiqidong
set lujing=%~dp0




  
:: BatchGotAdmin  
:-------------------------------------  
REM  --> 检查权限 
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
echo strDesktop = WshShell.SpecialFolders("Desktop") '特殊文件夹“桌面” >>frps.vbs
echo set oShellLink = WshShell.CreateShortcut("%lujing%frps.lnk") >>frps.vbs
echo oShellLink.TargetPath = "%lujing%frps.vbs"  '可执行文件路径 >>frps.vbs
echo oShellLink.Description = "由 ☆夢幻煋涳☆ 制作"  '备注 >>frps.vbs
echo oShellLink.WorkingDirectory = "%lujing%"  '起始位置 >>frps.vbs
echo oShellLink.Save  '创建保存快捷方式 >>frps.vbs
cscript.exe /e:vbscript frps.vbs >nul





echo CreateObject("WScript.Shell").Run "cmd /c frps.exe",0 >frps.vbs

echo REGEDIT4>frps.reg 
echo. 
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\run]>>frps.reg 
echo "frps"="%cd:\=\\%\\frps.lnk">>frps.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>frps.reg 
echo "frps"="%cd:\=\\%\\frps.lnk">>frps.reg 

regedit /s frps.reg &del frps.reg



echo  添加开机启动完成，请重启电脑测试，按任意键键返回。
echo.
echo.  
pause >nul 
goto moshi

:guanbihoutai
taskkill /f /im frps.exe 1>nul 2>nul
echo.
echo  关闭后台frps完成，按任意键键返回
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
echo  删除frps完成，按任意键键返回
pause >nul 
goto moshi


:download  
ECHO. 未检测到 frps.exe
ECHO.
rem echo 下载文件:      "%~1"  
rem echo 保存位置: "%~f2"  
ECHO. 开始下载 frps.exe . . .  
cscript -nologo -e:jscript "%~f0" "%~1" "%~2"  
ECHO.


for %%i in ("frps.exe") do (
set size=%%~zi
set /a KB=%\(%size/1024\) 2>nul
)
if %size% lss 1024 (

rem 执行A命令
ECHO. 下载失败！
ECHO. 
ECHO. 请到http://www.lu8.win手动下载，并将frps.exe程序放在与该脚本同目录下即可。
del frps.exe
ECHO. 
ECHO. 若要继续其它配置请按任意键继续 
) else (
rem 执行B命令
ECHO. 下载完成！
ECHO. 

echo. frps.exe文件大小为：%KB% KB
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
ECHO. 后台启动frps完成，若要退出frps后台运行，请按任意键后选择
echo.
ping 127.0.0.1 -n 6 >nul
ECHO.
ECHO. 下面是frps.log日志信息：
ECHO.
type "frps.log"
ECHO.
ECHO.
ECHO. 若日志信息提示 “系统找不到指定文件” 或 启动信息中出现 “error” 字样，请按任意键重新配置后再启动程序
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
