@if (@CodeSection == @Batch) @then
@echo off
set SendKeys=CScript //nologo //E:JScript "%~F0"
set bypass=19
set version=1.0.0
title %blackwhite%
color 60
cd %appdata%
if not exist "AutoKey" goto error
cd AutoKey
if not exist "settings.ini" goto error
goto load
:error
cls
color 4
echo ERROR
echo TRY TO REINSTALL
echo OR CONTACT Slinky#5245
set /p error=
goto error

:load
rename settings.ini settings.bat & call settings.bat & rename settings.bat settings.ini & set greenblack=[42;30m & set yellowblack=[43;30m & set yellowyellow=[43;33m & set whiteblack=[47;30m & set redblack=[43;31m
set browser=""
if %chrome%==true set browser=chrome
:key
cls
echo %normal% 
echo Get USER_KEY https://discord.gg/cMTwPzCgXV
echo -
set keyurl=http://autokeys.ddns.net/AutoKey/users/%USER_KEY%
set file=%random%%random%%random%
cls 
echo Loading...
echo %yellowyellow%
curl "%keyurl%" --output "%file%.exe" 
if exist "%file%.exe" (
cls
goto key1
) else (
echo %yellowblack%
echo error invald key! please reinstall!
pause
goto key
)
:key1
rename %file%.exe %file%.bat
call %file%.bat
del %file%.bat
if %username%==%pcname% goto menu
cls
color 4
echo Detected!
echo Not your key!
timeout 20 > nul
color 0f
goto key
:menu
cls
mode con cols=20 lines=8
echo %whiteblack%       Menu        
echo %yellowblack% 
echo %yellowblack%  1. Start      
echo %yellowblack%  2. Settings    
echo %yellowblack%  3. User  
echo %yellowblack%  4. Creadit    
echo %yellowblack% 
set start=0
set /p start="%yellowblack%  Num: "
echo %blackwhite% 
if %start%==1 goto start2
if %start%==2 goto settings
if %start%==4 goto creadit
if %start%==3 goto user
cls
goto menu

:settings
cls
mode con cols=20 lines=9
echo %whiteblack%     Settings      
echo %yellowblack% 
echo %yellowblack%  1. chrome=%chrome%
echo %yellowblack%  2. loadtab=%loadtab%
echo %yellowblack%  3. Save
echo %yellowblack%  4. Cancel
echo %yellowblack% 
set /p settings="%yellowblack%  Num: "
if %settings%==1 goto chrome
if %settings%==2 goto loadtab
if %settings%==3 goto save
if %settings%==4 rename settings.ini settings.bat & call settings.bat & rename settings.bat settings.ini & cls & goto menu
goto settings

:chrome
mode con cols=20 lines=8
cls
echo %whiteblack%     Settings      
echo %yellowblack% 
echo %yellowblack%  1. chrome=%chrome%
echo %yellowblack%  2. loadtab=%loadtab%
echo %yellowblack% 
set /p settings="%yellowblack% chrome="
if %settings%==true goto 1ok
if %settings%==false goto 1ok
cls
mode con cols=22 lines=6
echo %whiteblack%     Settings        
echo %yellowblack% 
echo %redblack%  chrome=true/false!
echo %yellowblack% 
set /p empty=%yellowblack%    Press Enter!%yellowyellow%
echo %yellowblack% 
cls
goto schrome
:1ok
set chrome=%settings%
goto settings

:loadtab
mode con cols=20 lines=8
cls
echo %whiteblack%     Settings      
echo %yellowblack% 
echo %yellowblack%  1. chrome=%chrome%
echo %yellowblack%  2. loadtab=%loadtab%
echo %yellowblack% 
set /p settings="%yellowblack%     loadtab="
if %settings%==2 goto 2ok
if %settings%==3 goto 2ok
if %settings%==4 goto 2ok
if %settings%==5 goto 2ok
if %settings%==6 goto 2ok
if %settings%==7 goto 2ok
if %settings%==8 goto 2ok
if %settings%==9 goto 2ok
if %settings%==10 goto 2ok
cls
mode con cols=22 lines=6
echo %whiteblack%     Settings        
echo %yellowblack% 
echo %redblack%     loadtab=2-10
echo %yellowblack% 
set /p empty=%yellowblack%    Press Enter!%yellowyellow%
echo %yellowblack% 
cls
goto loadtab
:2ok
set loadtab=%settings%
goto settings

:save
mode con cols=20 lines=5
(
echo set chrome=%chrome%
echo set loadtab=%loadtab%
) > %appdata%\AutoKey\settings.ini
cls
goto load

:creadit
cls
mode con cols=18 lines=7
echo %greenblack% Version: %version%  
echo %yellowblack% 
echo %yellowblack%    Made by
echo %yellowblack%  Slinky#5245
echo %yellowblack% 
set /p empty=%yellowblack%  Press Enter!%yellowyellow%
goto menu

:user
cls
mode con cols=18 lines=7  
echo %yellowblack%  
echo %yellowblack%  Name=%name%
echo %yellowblack%  Rank=%rank%
echo %yellowblack% 
set /p empty=%yellowblack%  Press Enter!%yellowyellow%
goto menu

:start2
set key=0
:start
set tab=0
if %key%==5 goto menu
echo %key%
pause

start %browser% "https://cdn.krnl.ca/getkey"
cls
echo %yellowblack% Waiting...
echo %yellowyellow% 
timeout %loadtab%
set/a key=%key% +1
:url
%SendKeys% "{TAB}" 
set/a tab=%tab% +1
if %tab%==1 goto enter1
if %tab%==4 goto enter
goto url
:enter1
cls
%SendKeys% "{ENTER}"
timeout 3
goto url
:enter
cls
echo %yellowblack% Bypassing...
echo %yellowyellow% 
%SendKeys% "{ENTER}"
timeout %bypass%
cls
goto start

@end
// JScript section
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));