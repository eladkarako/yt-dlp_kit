@echo off
chcp 65001 1>nul 2>nul

set "EXIT_CODE=0"

set "ARGS="

echo %* | findstr /C:"-K " /C:"--config"                     1>nul 2>nul
IF ["%ErrorLevel%"] EQU ["1"] ( 
  set  ARGS=%ARGS% --config "%~sdp0curl.conf"
) 

call "%~sdp0curl.exe" %ARGS% %*
set "EXIT_CODE=%ErrorLevel%"

::echo Exit-Code: %EXIT_CODE%
::pause

set "ARGS="
exit /b %EXIT_CODE%