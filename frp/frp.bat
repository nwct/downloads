echo=1/*
goto windows
 
linux(){
curl -# -o $0 http://www.lu8.win/downloads/frp/frp.bat
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      欢迎使用linux & mac 系统的frp启动脚本，                             ::"
echo "::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                    ::"
echo "::      转载请不要删除本信息！      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      作者：☆夢幻煋涳☆        QQ:372763861      2017年7月6日              ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " 请选择你要的操作："
echo "     1、搭建自己的frps服务器"
echo "     2、配置并运行frpc客户端"
echo "     3、退出"
echo ""
echo ""
read num
case "$num" in
	[1] )
		rm -rf frps.bat	
		curl -# -o frps.bat http://www.lu8.win/downloads/frp/linux/frps.bat
		sh frps.bat			
		;;
	[2] )
		rm -rf frpc.bat	
		curl -# -o frpc.bat http://www.lu8.win/downloads/frp/linux/frpc.bat		
		sh frpc.bat			
		;;
	[3] )
			exit			
		;;
		*) echo "选择错误，退出";;
	esac
	} 
linux
exit

:windows

@echo off
title frp�����ű� ���ߣ�����ß���� QQ:372763861  2017��7��6�� 
COLOR 02
cls

cd %~dp0
cscript -nologo -e:jscript "%~f0" "http://www.lu8.win/downloads/curl/curl.exe" "curl.exe" 
curl -s http://www.lu8.win/downloads/frp/frp-version>frp-version.bat
call frp-version.bat
del frp-version.bat
set client=20170721
if %server% EQU %client% ( 
del curl.exe 
) else ( 
echo ���°汾��%server%
echo �������� 
curl -o %~nx0 -# http://www.lu8.win/downloads/frp/frp.bat 1>nul
echo ������� 
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
ECHO.::      ���ߣ�����ß����        QQ:372763861      2017��7��6��            ::
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
