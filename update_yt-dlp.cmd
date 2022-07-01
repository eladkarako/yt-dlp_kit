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
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\ytsubconverter"
set "TMP_PATH=%TMP_PATH%;%STARTING_FOLDER%\resources\yt-dlp_win"

set "PATH=%TMP_PATH%;%PATH%"
set "TMP_PATH="



::----------------------------------------------------------------------- not needed, but might be useful.
set "TEMP=%STARTING_FOLDER%\resources\TEMP"
set "TMP=%STARTING_FOLDER%\resources\TEMP"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pushd "%STARTING_FOLDER%\resources\yt-dlp_win"

del /f /q "yt-dlp_win.zip" 1>nul 2>nul

set "EXIT_CODE=0"

call "aria2c.exe" "--no-conf" "--check-certificate=false" "--out=yt-dlp_win.zip" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_win.zip"
set "EXIT_CODE=%ErrorLevel%"
if ["%EXIT_CODE%"] neq ["0"] ( goto ERROR_ARIA2C_DOWNLOAD )
echo [INFO] download success.

call "%STARTING_FOLDER%\resources\7z\7za.exe" x "yt-dlp_win.zip"   -y -o"." -bb3
set "EXIT_CODE=%ErrorLevel%"
if ["%EXIT_CODE%"] neq ["0"] ( goto ERROR_7Z_EXTRACT )
echo [INFO] extraction success.

del /f /q "yt-dlp_win.zip" 1>nul 2>nul
popd

pushd "%STARTING_FOLDER%"


echo [INFO] clearing NTFS streams.
call "%STARTING_FOLDER%\resources\streams\streams.exe" -nobanner -d -s "%STARTING_FOLDER%\*"


echo [INFO] updating readme and version.
call "%STARTING_FOLDER%\update_readme_and_version_nfo.cmd"

echo [INFO] done.
goto END


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:ERROR_ARIA2C_DOWNLOAD
  echo [ERROR] failed to download new update. 1>&2
  goto END
  
:ERROR_7Z_EXTRACT
  echo [ERROR] failed to extract new update. 1>&2
  goto END

:END
  echo EXIT_CODE: %EXIT_CODE%
  pause
  exit /b %EXIT_CODE%

ENDLOCAL

