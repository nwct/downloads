echo=1/*
@echo off
title frp启动脚本 作者：☆夢幻煋涳☆ QQ群:114888319  2018年9月30日 
COLOR 02
cls

cd %~dp0
call :http http://www.lu8.win/downloads/frp/frp-version frp-version.bat
call frp-version.bat
del frp-version.bat
set client=20180930
if "%server%" NEQ "%client%" ( 
echo 最新版本：%server%
echo 即将更新 
call :http http://www.lu8.win/downloads/frp/frp.bat %~nx0
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      欢迎使用Windows平台的frp启动脚本，                                  ::
ECHO.::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                  ::
ECHO.::      转载请不要删除本信息！  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：☆夢幻煋涳☆        QQ群:114888319      2018年9月30日         ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  请选择你要的操作：
echo      1、搭建自己的frps服务器
echo      2、配置并运行frpc客户端
echo      3、退出
set num=0
set /p num=
if %num%==1 goto frps
if %num%==2 goto frpc
if %num%==3 exit

:frps
set frp=frps
goto start

:frpc
set frp=frpc
goto start

:start
cd %~dp0
del %frp%.bat
if exist %frp% goto run
cscript -nologo -e:jscript "%~f0" "http://www.lu8.win/downloads/frp/windows/%frp%.bat" "%frp%.bat"  
goto run


:run
call %frp%.bat
exit

:http
cscript -nologo -e:jscript "%~f0" "%~1" "%~2"
goto :eof

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
