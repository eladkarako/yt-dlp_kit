@echo off
chcp 65001 1>nul 2>nul

set "ARGS="

echo %* | findstr /C:"-4 " /C:"--inet4-only" /C:"-6 " /C:"--inet6-only" 1>nul 2>nul
IF ["%ErrorLevel%"] EQU ["1"] ( 
  set  ARGS=%ARGS% --inet4-only
) 

echo %* | findstr /I /C:"--secure-protocol" 1>nul 2>nul
if ["%ErrorLevel%"] NEQ ["0"] ( 
  set ARGS=%ARGS% --secure-protocol=TLSv1_2
) 

echo %* | findstr /I /C:"--no-check-certificate" 1>nul 2>nul
if ["%ErrorLevel%"] NEQ ["0"] ( 
  set ARGS=%ARGS% --no-check-certificate
) 

echo %* | findstr /I /C:"-c " /C:"--continue" 1>nul 2>nul
if ["%ErrorLevel%"] NEQ ["0"] ( 
  set ARGS=%ARGS% --continue
) 

call "%~dp0wget.exe" %ARGS% %*
set "EXIT_CODE=%ErrorLevel%"

::echo [INFO] EXIT_CODE: %EXIT_CODE%
::pause

set "ARGS="
exit /b %EXIT_CODE%
