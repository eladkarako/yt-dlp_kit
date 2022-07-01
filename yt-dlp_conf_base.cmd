@echo off
chcp 65001 1>nul 2>nul

::------------------------------------------------------------ work-around the CMD working-folder bug.
echo."%CD%" | findstr /I /C:"Windows\Sys" 1>nul 2>nul
if ["%ErrorLevel%"] EQU ["0"] ( pushd "%~dp0" )
::-----------------------------------------------------------------------------------------------



::----------------------------------------------------
::  - provides copy/paste input-box on empty args.
::  - stores history.
::  - uses 'yt-dlp_conf_base.conf'.
::  
::  note:
::    'yt-dlp_conf_base.conf' does not includes formats.
::    running 'yt-dlp_conf_base.cmd' (this file) will use default format ("best").
::    prefer using 'yt-dlp_conf_variation_video_mkv.cmd' for 
::-----------------------------


set "ARGS="

::--------------------------------------------- has URL (although it might be part of 'ref' header).
echo %* | findstr /I /C:"://" 1>nul 2>nul
IF ["%ErrorLevel%"] EQU ["0"] ( goto CONTINUE ) 

::--------------------------------------------- has list.
echo %* | findstr /I /C:"--batch-file " /I /C:" a " 1>nul 2>nul
IF ["%ErrorLevel%"] EQU ["0"] ( goto CONTINUE ) 


::----------------------------------------------------------- get url from user
set "URL="
for /f "tokens=*" %%a in (
  'call "%~sdp0\resources\inputbox\inputbox_with_default_values.cmd"'
) do (
  set "URL=%%a"
);

if ["%URL%"] EQU [""] ( 
  goto CONTINUE 
) 

set  ARGS=%ARGS% "%URL%"
set "URL="
::-----------------------------------------------------------------------------


:CONTINUE

set  ARGS=%ARGS% --ignore-config
set  ARGS=%ARGS% --config-location "%~sdp0yt-dlp_conf_base.conf"


call "%~sdp0\history_store.cmd" %ARGS% %*


call "%~sdp0yt-dlp.cmd" %ARGS% %*  2>&1 | "%~sdp0\resources\gnucoreutils\tee.exe" "%~sdp0\history_last_run.log"
set "EXIT_CODE=%ErrorLevel%"



:END
if ["%EXIT_CODE%"] NEQ ["0"] ( 
  echo [INFO] EXIT_CODE: %EXIT_CODE%
  pause
) 

popd
set "ARGS="
exit /b %EXIT_CODE%
