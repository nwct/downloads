echo=1/*
@echo off
title frp�����ű� ���ߣ�����ß���� QQȺ:114888319  2018��9��30�� 
COLOR 02
cls

cd %~dp0
call :http http://www.lu8.win/downloads/frp/frp-version frp-version.bat
call frp-version.bat
del frp-version.bat
set client=20180930
if "%server%" NEQ "%client%" ( 
echo ���°汾��%server%
echo �������� 
call :http http://www.lu8.win/downloads/frp/frp.bat %~nx0
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��frp�����ű���                                  ::
ECHO.::      ���ű���  ����ß����  ��д��������������ϵ���ˣ�                  ::
ECHO.::      ת���벻Ҫɾ������Ϣ��  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ���ߣ�����ß����        QQȺ:114888319      2018��9��30��         ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  ��ѡ����Ҫ�Ĳ�����
echo      1����Լ���frps������
echo      2�����ò�����frpc�ͻ���
echo      3���˳�
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
