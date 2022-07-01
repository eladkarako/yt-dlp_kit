@echo off
chcp 65001 1>nul 2>nul

::pushd "%~sdp0"

set "CONF_PATH=%~sdp0\aria2c.conf"
set "CONF_PATH=%CONF_PATH:\=/%"



set "ARGS="

::conf file's 'check-certificate=false' is not working. must be included in command-line.
echo %* | findstr /I /C:"--check-certificate=" 1>nul 2>nul
if ["%ErrorLevel%"] NEQ ["0"] ( 
  set ARGS=--check-certificate=false %ARGS%
) 


echo %* | findstr /I /C:"--conf-path=" 2>nul 1>nul
if ["%ErrorLevel%"] NEQ ["0"] ( 
  set ARGS=--no-conf "--conf-path=%CONF_PATH%" %ARGS%
) 

call "%~sdp0\aria2c_history.cmd" %*

echo "aria2c.exe" %ARGS% %*
echo. 1>&2
call "aria2c.exe" %ARGS% %*
set "EXIT_CODE=%ErrorLevel%"

::pause
popd
exit /b %EXIT_CODE%

:: https://github.com/q3aql/aria2-static-builds/releases
:: https://github.com/aria2/aria2/releases