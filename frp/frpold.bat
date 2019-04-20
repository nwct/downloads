echo=1/*
goto windows

linux(){
curl -# -o frp.bat http://www.lu8.win/downloads/frp/frp.bat
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      æ¬¢è¿ä½¿ç”¨linux & mac ç³»ç»Ÿçš„frpå¯åŠ¨è„šæœ¬ï¼Œ                             ::"
echo "::      æœ¬è„šæœ¬ç”±  â˜†å¤¢å¹»ç…‹æ¶³â˜†  ç¼–å†™ï¼Œå¦‚æœ‰ç–‘é—®è¯·è”ç³»æœ¬äººï¼                    ::"
echo "::      è½¬è½½è¯·ä¸è¦åˆ é™¤æœ¬ä¿¡æ¯ï¼      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      ä½œè€…ï¼šâ˜†å¤¢å¹»ç…‹æ¶³â˜†        QQç¾¤:114888319     2018å¹´9æœˆ30æ—¥            ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " è¯·é€‰æ‹©ä½ è¦çš„æ“ä½œï¼š"
echo "     1ã€æ­å»ºè‡ªå·±çš„frpsæœåŠ¡å™¨"
echo "     2ã€é…ç½®å¹¶è¿è¡Œfrpcå®¢æˆ·ç«¯"
echo "     3ã€é€€å‡º"
echo ""
echo ""
read num
case "$num" in
	1)
		rm -rf frps.bat	
		curl -# -o frps.bat http://www.lu8.win/downloads/frp/linux/frps.bat
		sh frps.bat			
		;;
	2)
		rm -rf frpc.bat	
		curl -# -o frpc.bat http://www.lu8.win/downloads/frp/linux/frpc.bat		
		sh frpc.bat			
		;;
	3)
			exit			
		;;
	*) 	
		echo "è¾“å…¥é”™è¯¯ï¼Œè¯·é‡æ–°è¾“å…¥ï¼"
		linux
		;;
	esac
	} 
linux
exit

:windows

@echo off
title frpÆô¶¯½Å±¾ ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î QQÈº:114888319  2018Äê9ÔÂ30ÈÕ 
COLOR 02
cls

cd %~dp0
call :http http://www.lu8.win/downloads/frp/frp-version frp-version.bat
call frp-version.bat
del frp-version.bat
set client=20180930
if "%server%" NEQ "%client%" ( 
echo ×îĞÂ°æ±¾£º%server%
echo ¼´½«¸üĞÂ 
call :http http://www.lu8.win/downloads/frp/frp.bat %~nx0
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      »¶Ó­Ê¹ÓÃWindowsÆ½Ì¨µÄfrpÆô¶¯½Å±¾£¬                                  ::
ECHO.::      ±¾½Å±¾ÓÉ  ¡î‰ô»ÃŸ“›ï¡î  ±àĞ´£¬ÈçÓĞÒÉÎÊÇëÁªÏµ±¾ÈË£¡                  ::
ECHO.::      ×ªÔØÇë²»ÒªÉ¾³ı±¾ĞÅÏ¢£¡  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î        QQÈº:114888319      2018Äê9ÔÂ30ÈÕ         ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  ÇëÑ¡ÔñÄãÒªµÄ²Ù×÷£º
echo      1¡¢´î½¨×Ô¼ºµÄfrps·şÎñÆ÷
echo      2¡¢ÅäÖÃ²¢ÔËĞĞfrpc¿Í»§¶Ë
echo      3¡¢ÍË³ö
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
