@echo off

set "FILE_LOG=%~sdp0\history.log"

::-------------------------------------------------------------figure out data time format.
set "_DATE="
set "_TIME="

For /f "tokens=2-4 delims=/ " %%a in ("%DATE%") do ( set "_DATE=%%c/%%a/%%b" ) 
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do ( set "_TIME=%%a:%%b"     )
::--------------------------------------------------------------------------------------------

::-------------------------------------------------------------- actual content
echo.-=-=-=-=-=-=-=-=-=-==-=-=-=-=-  1>"%FILE_LOG%.tmp"
echo.%_DATE% %_TIME%                1>>"%FILE_LOG%.tmp"
echo.%*                             1>>"%FILE_LOG%.tmp"
echo.                               1>>"%FILE_LOG%.tmp"
::-------------------------------------------------------------- previous content, pushed to end of file.
type %FILE_LOG%                     1>>"%FILE_LOG%.tmp"
::--------------------------------------------------------------

::-------------------------------------------------------------- rename, cleanup.
copy /b /y /z "%FILE_LOG%.tmp" "%FILE_LOG%" 1>nul 2>nul
del /f /q "%FILE_LOG%.tmp"
::--------------------------------------------------------------


exit /b 0