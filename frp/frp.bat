goto windows 2>nul

linux(){
ERR=""
rm -rf nul >/dev/null 2>&1
rm -rf nul? >/dev/null 2>&1
curl -# -k -o $(basename $0) https://raw.githubusercontent.com/nwct/downloads/master/frp/frp.bat
choose(){
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      æ¬¢è¿Žä½¿ç”¨linux & mac ç³»ç»Ÿçš„frpå¯åŠ¨è„šæœ¬ï¼Œ                             ::"
echo "::      æœ¬è„šæœ¬ç”±  â˜†å¤¢å¹»ç…‹æ¶³â˜†  ç¼–å†™ï¼Œå¦‚æœ‰ç–‘é—®è¯·è”ç³»æœ¬äººï¼                    ::"
echo "::      è½¬è½½è¯·ä¸è¦åˆ é™¤æœ¬ä¿¡æ¯ï¼      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      ä½œè€…ï¼šâ˜†å¤¢å¹»ç…‹æ¶³â˜†        QQç¾¤:114888319     2019å¹´4æœˆ25æ—¥            ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " è¯·é€‰æ‹©ä½ è¦çš„æ“ä½œï¼š"
echo "     1ã€æ­å»ºè‡ªå·±çš„frpsæœåŠ¡å™¨"
echo "     2ã€é…ç½®å¹¶è¿è¡Œfrpcå®¢æˆ·ç«¯"
echo "     3ã€é€€å‡º"
echo ""
echo "$ERR"
ERR=""
read num
case "$num" in
	1)
		rm -rf frps.bat	
		curl -# -k -o frps.bat https://raw.githubusercontent.com/nwct/downloads/master/frp/linux-386/frps.bat
		sh frps.bat			
		;;
	2)
		rm -rf frpc.bat	
		curl -# -k -o frpc.bat https://raw.githubusercontent.com/nwct/downloads/master/frp/linux-386/frpc.bat		
		sh frpc.bat			
		;;
	3)
			exit			
		;;
	
	*) 	
		ERR="è¾“å…¥é”™è¯¯ï¼Œè¯·é‡æ–°è¾“å…¥ï¼"
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
title frpÆô¶¯½Å±¾ ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î QQÈº:114888319  2019Äê4ÔÂ25ÈÕ 
COLOR 02
cls
%~d0
cd %~dp0
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/frp-version delete >nul
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/frp-version frp-version.bat >nul
call frp-version.bat
del frp-version.bat
set client=20190425
if "%server%" NEQ "%client%" ( 
echo ×îÐÂ°æ±¾£º%server%
echo ¼´½«¸üÐÂ 
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/frp.bat delete >nul
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/frp.bat %~nx0 >nul
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
ECHO.::      ×÷Õß£º¡î‰ô»ÃŸ“›ï¡î        QQÈº:114888319      2019Äê4ÔÂ25ÈÕ         ::
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
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/windows-386/%frp%.bat >nul
goto run

:run
call %frp%.bat
exit
