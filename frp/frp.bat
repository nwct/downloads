goto :windows 2>nul


linux(){
ERR=""
rm -rf nul >/dev/null 2>&1
rm -rf nul? >/dev/null 2>&1
curl -# -L -k -o $(basename $0) http://www.lu8.win/downloads/frp/frp.bat
choose(){
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      欢迎使用linux & mac 系统的frp启动脚本，                             ::"
echo "::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                    ::"
echo "::      转载请不要删除本信息！      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      作者：☆夢幻煋涳☆        QQ群:114888319     2020年05月05日           ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " 请选择你要的操作："
echo "     1、搭建自己的frps服务器"
echo "     2、配置并运行frpc客户端"
echo "     3、退出"
echo ""
echo "$ERR"
ERR=""
read num
case "$num" in
	1)
		rm -rf frps.bat	
		curl -# -L -k -o frps.bat  http://www.lu8.win/downloads/frp/linux-386/frps.bat
		sh frps.bat			
		;;
	2)
		rm -rf frpc.bat	
		curl -# -L -k -o frpc.bat  http://www.lu8.win/downloads/frp/linux-386/frpc.bat		
		sh frpc.bat			
		;;
	3)
			exit			
		;;
	
	*) 	
		ERR="输入错误，请重新输入！"
		choose
		;;
	esac
}
choose 
}
linux
exit

:windows
@echo off
set path=%SystemRoot%\system32;%path%
title frp�����ű� ���ߣ�����ß���� QQȺ:114888319  2020��05��05�� 
COLOR 02
cls
%~d0
cd /d %~dp0
certutil -urlcache -split -f http://www.lu8.win/downloads/frp/frp-version frp-version.bat >nul
call frp-version.bat
del frp-version.bat
set client=20200505
if "%server%" NEQ "%client%" ( 
echo ���°汾��%server%
echo �������� 
certutil -urlcache -split -f http://www.lu8.win/downloads/frp/frp.bat %~nx0 >nul
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
ECHO.::      ���ߣ�����ß����        QQȺ:114888319      2020��05��05��        ::
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
cd /d %~dp0
del %frp%.bat
if exist %frp% goto run
certutil -urlcache -split -f http://www.lu8.win/downloads/frp/windows-386/%frp%.bat >nul
goto run

:run
call %frp%.bat
exit
