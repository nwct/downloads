echo=1/*
goto windows
 
linux(){
curl -# -o $0 http://www.lu8.win/downloads/frp/frp.bat
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      æ¬¢è¿Žä½¿ç”¨linux & mac ç³»ç»Ÿçš„frpå¯åŠ¨è„šæœ¬ï¼Œ                             ::"
echo "::      æœ¬è„šæœ¬ç”±  â˜†å¤¢å¹»ç…‹æ¶³â˜†  ç¼–å†™ï¼Œå¦‚æœ‰ç–‘é—®è¯·è”ç³»æœ¬äººï¼                    ::"
echo "::      è½¬è½½è¯·ä¸è¦åˆ é™¤æœ¬ä¿¡æ¯ï¼      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      ä½œè€…ï¼šâ˜†å¤¢å¹»ç…‹æ¶³â˜†        QQ:372763861      2017å¹´7æœˆ6æ—¥              ::"
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
		*) echo "é€‰æ‹©é”™è¯¯ï¼Œé€€å‡º";;
	esac
	} 
linux
exit

:windows

@echo off
title frpÆô¶¯½Å±¾ ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î QQ:372763861  2017Äê7ÔÂ6ÈÕ 
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
echo ×îÐÂ°æ±¾£º%server%
echo ¼´½«¸üÐÂ 
curl -o %~nx0 -# http://www.lu8.win/downloads/frp/frp.bat 1>nul
echo ¸üÐÂÍê³É 
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      »¶Ó­Ê¹ÓÃWindowsÆ½Ì¨µÄfrpÆô¶¯½Å±¾£¬                                  ::
ECHO.::      ±¾½Å±¾ÓÉ  ¡î‰ô»ÃŸ“›ï¡î  ±àÐ´£¬ÈçÓÐÒÉÎÊÇëÁªÏµ±¾ÈË£¡                  ::
ECHO.::      ×ªÔØÇë²»ÒªÉ¾³ý±¾ÐÅÏ¢£¡  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î        QQ:372763861      2017Äê7ÔÂ6ÈÕ            ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  ÇëÑ¡ÔñÄãÒªµÄ²Ù×÷£º
echo      1¡¢´î½¨×Ô¼ºµÄfrps·þÎñÆ÷
echo      2¡¢ÅäÖÃ²¢ÔËÐÐfrpc¿Í»§¶Ë
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
