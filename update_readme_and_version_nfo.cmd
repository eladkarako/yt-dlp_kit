@echo off
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
chcp 65001 1>nul 2>nul


::-----------------------------------------------this directory (8.3 name) no '\' suffix.
set "STARTING_FOLDER=%~sdp0"
set "STARTING_FOLDER=%STARTING_FOLDER%##"
set "STARTING_FOLDER=%STARTING_FOLDER:\##=%"
set "STARTING_FOLDER=%STARTING_FOLDER:##=%"
::-----------------------------------------------------------------------------------------------

::------------------------------------------------------------ work-around the CMD working-folder bug.
echo."%CD%" | findstr /I /C:"Windows\Sys" 1>nul 2>nul
if ["%ErrorLevel%"] EQU ["0"] ( pushd "%STARTING_FOLDER%" )
::-----------------------------------------------------------------------------------------------

::----------------------------------------------------------------------- first items in PATH are prefered.
set "TMP_PATH=%STARTING_FOLDER%\resources"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\7z"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\aria2c"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\atomicparsley"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\curl"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\ffmpeg"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\gnucoreutils"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\inputbox"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\mpv"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\phantomjs"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\rtmpdump"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\wget"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\yt-dlp_win"

set "PATH=%TMP_PATH%;%PATH%"
set "TMP_PATH="



::----------------------------------------------------------------------- not needed, but might be useful.
set "TEMP=%STARTING_FOLDER%\resources\TEMP"
set "TMP=%STARTING_FOLDER%\resources\TEMP"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::-------- extended help
@echo on
call "%STARTING_FOLDER%\resources\yt-dlp_win\yt-dlp.exe"  --verbose --help  >"%STARTING_FOLDER%\readme_yt-dlp.nfo"
@echo off
call "%STARTING_FOLDER%\resources\gnutools\unix2dos.exe" --quiet --remove-bom "%STARTING_FOLDER%\readme_yt-dlp.nfo" 1>nul 2>nul

::-------- version
@echo on
call "%STARTING_FOLDER%\resources\yt-dlp_win\yt-dlp.exe"  --verbose 2>&1  |  "%STARTING_FOLDER%\resources\gnucoreutils\tail.exe" -n "+2"  |  "%STARTING_FOLDER%\resources\gnucoreutils\head.exe" -n "-4"  |  "%STARTING_FOLDER%\resources\gnucoreutils\sed.exe" "s#\[debug\]\ ##g"  >"%STARTING_FOLDER%\version.nfo"

@echo off
call "%STARTING_FOLDER%\resources\gnutools\unix2dos.exe" --quiet --remove-bom "%STARTING_FOLDER%\version.nfo" 1>nul 2>nul


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


ENDLOCAL

::pause
exit /b 0
