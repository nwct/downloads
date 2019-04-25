goto windows
:windows
set date1=2019年4月25日
%~d0
@echo off
title frp启动脚本 作者：☆夢幻煋涳☆ QQ群:114888319  %date1%  
COLOR 02
cls
cd %~dp0
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (set IP=%%a)
if %IP%=="默认" (
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
ECHO.::      欢迎使用Windows平台的frpc启动脚本，                                 ::
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
ECHO.::      欢迎使用Windows平台的frpc启动脚本，                                 ::
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
echo      1、配置要连接的服务器
echo      2、配置隧道协议
echo      3、配置完成后台启动
echo      4、删除之前的frpc版本
echo      5、关闭后台frpc程序 
echo      6、添加到开机自启动(需用管理员权限执行该BAT才能生效)
echo      7、错误排查 
echo      8、退出
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
echo 下方是本机时间和frpc版本号：
echo.
echo 版本：
cd %~dp0
frpc -v
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
ECHO.请输入frp服务器信息，如果使用免费服务器或默认值请直接回车！
ECHO.
set server_addr=frp.lu8.win
set server_port=7000
set privilege_token=frp888
set token=frp888
set login_fail_exit=true
set protocol=tcp


set /p server_addr=服务器地址【默认：%server_addr%】：
set /p server_port=服务器端口【默认：%server_port%】：
if /i %version%==0.21.0 (
	set /p token=连接密码【默认：%token%】：
	set /p login_fail_exit=断线后自动重连开关[true/flase]【默认：%login_fail_exit%】：
	set /p protocol=连接使用的协议[tcp/kcp]【默认：%protocol%】：
) else ( 
	set /p privilege_token=连接密码【默认：%privilege_token%】：
	if /i %version%==0.16.1 (
	set /p login_fail_exit=断线后自动重连开关[true/flase]【默认：%login_fail_exit%】：
	set /p protocol=连接使用的协议[tcp/kcp]【默认：%protocol%】：
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
ECHO.       配置已完成，按任意键继续选择....      
pause >nul 
ECHO.
goto moshi

:type
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      欢迎使用Windows平台的frpc启动脚本，                                 ::
ECHO.::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                  ::
ECHO.::      转载请不要删除本信息！  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：☆夢幻煋涳☆        QQ:372763861      2017年12月10日          ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
echo  请继续配置隧道所使用的协议：
echo      1、配置http模式映射
echo      2、配置https模式映射
echo      3、配置tcp模式映射
echo      4、配置udp模式映射
if not %version%==0.9.3 (
echo      5、配置stcp模式映射
echo      6、配置xtcp模式映射
)
echo      7、配置完成返回上级选项
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
ECHO.请输入要被映射的本地信息，如果使用默认值请直接回车！
ECHO.
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set custom_domains=%suiji%.%server_addr%
set /p custom_domains=域名【默认：%custom_domains%】：
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
ECHO.       配置已完成，按任意键继续选择....      
pause >nul 
ECHO.
goto type


:https
set type=https
set local_ip=%IP%
set local_port=443
set suiji=%random%
ECHO.
ECHO.请输入要被映射的本地信息，如果使用默认值请直接回车！
ECHO.
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set custom_domains=%suiji%.%server_addr%
set /p custom_domains=域名【默认：%custom_domains%】：
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
ECHO.       配置已完成，按任意键继续选择....      
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
ECHO.请输入要被映射的本地信息，如果使用默认值请直接回车！
ECHO.
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set /p remote_port=远程端口【默认：%remote_port%】：
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
ECHO.       配置已完成，按任意键继续选择....      
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
ECHO.请输入要被映射的本地信息，如果使用默认值请直接回车！
ECHO.
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set /p remote_port=远程端口【默认：%remote_port%】：
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
ECHO.       配置已完成，按任意键继续选择....      
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
ECHO.请选择【默认：服务端】：
ECHO.

set /p num=要配置 %type% 模式的访问端请输入v, 否则直接回车配置为服务端:
if %num%==v set role=visitor
if %role%==visitor set /p server_name=请输入要访问的服务端隧道名称:
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set /p sk=sk【默认：%sk%】：
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
ECHO.       配置已完成，按任意键继续选择....      
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
ECHO.请选择【默认：服务端】：
ECHO.

set /p num=要配置 %type% 模式的访问端请输入v, 否则直接回车配置为服务端:
if %num%==v set role=visitor
if %role%==visitor set /p server_name=请输入要访问的服务端隧道名称:
set /p local_ip=本地IP【默认：%local_ip%】：
set /p local_port=本地端口【默认：%local_port%】：
set /p sk=sk【默认：%sk%】：
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
ECHO.       配置已完成，按任意键继续选择....      
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

echo Set WshShell = WScript.CreateObject("WScript.Shell") >frpc.vbs
echo strDesktop = WshShell.SpecialFolders("Desktop") '特殊文件夹“桌面” >>frpc.vbs
echo set oShellLink = WshShell.CreateShortcut("%lujing%frpc.lnk") >>frpc.vbs
echo oShellLink.TargetPath = "%lujing%frpc.vbs"  '可执行文件路径 >>frpc.vbs
echo oShellLink.Description = "由 ☆夢幻煋涳☆ 制作"  '备注 >>frpc.vbs
echo oShellLink.WorkingDirectory = "%lujing%"  '起始位置 >>frpc.vbs
echo oShellLink.Save  '创建保存快捷方式 >>frpc.vbs
cscript.exe /e:vbscript frpc.vbs >nul





echo CreateObject("WScript.Shell").Run "cmd /c frpc.exe",0 >frpc.vbs

echo REGEDIT4>frpc.reg 
echo. 
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\run]>>frpc.reg 
echo "frpc"="%cd:\=\\%\\frpc.lnk">>frpc.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>frpc.reg 
echo "frpc"="%cd:\=\\%\\frpc.lnk">>frpc.reg 

regedit /s frpc.reg &del frpc.reg



echo  添加开机启动完成，请重启电脑测试，按任意键键返回。
echo.
echo.  
pause >nul 
goto moshi

:delete
taskkill /f /im frpc.exe 1>nul 2>nul
echo.
del frpc.exe
echo  删除frpc完成，按任意键键返回
pause >nul 
goto moshi


:guanbihoutai
taskkill /f /im frpc.exe 1>nul 2>nul
echo.
echo  关闭后台frpc完成，按任意键键返回
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
ECHO.正在启动frpc，请稍后......
ping 127.0.0.1 -n 15 >nul
ECHO.
ECHO. 下面是frpc.log日志信息：
ECHO.
type "frpc.log"
ECHO.
findstr /c:"start proxy error" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.启动失败，请检查配置或重新配置！
ECHO.
)
findstr /c:"Start to send heartbeat to frps" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.后台启动frpc完成！
ECHO.
)
findstr /c:"login to server success" frpc.log >nul
if %errorlevel% equ 0 (
ECHO.
ECHO.后台启动frpc完成！
ECHO.
)
findstr /c:"login to server failed: i/o timeout" frpc.log >nul
if %errorlevel% equ 0 (
frpc.exe -v >v.txt
for /f %%i in (v.txt) do (
ECHO.
ECHO. 启动失败，你目前使用的客户端frpc版本为：%%i，请使用版本为：0.9.3的老客户端来连接此服务器！
ECHO.
) 
del v.txt
)
findstr /c:"read from server error" frpc.log >nul
if %errorlevel% equ 0 (
frpc.exe -v >v.txt
for /f %%i in (v.txt) do (
ECHO.
ECHO. 启动失败，你目前使用的客户端frpc版本为：%%i，请使用新版本客户端来连接此服务器！
ECHO.
) 
del v.txt
)
pause >nul 
goto moshi
