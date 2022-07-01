@echo off
chcp 65001 1>nul 2>nul

call "%~sdp0\InputBox.exe" -prompt="enter url" -title="yt-dlp" -default="https://www.youtube.com/watch?v="
set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%


::---------------------------------------------- this is how to capture the STDOUT of this batch-file (as alternative input to ytdl.cmd)
:: if ["%~1"] NEQ [""] ( goto CONTINUE )
::
:: set "URL="
::
:: for /f "tokens=*" %%a in (
::   "resources\inputbox\inputbox.cmd"
:: ) do (
::   set "URL=%%a"
:: );
::
:: :CONTINUE
::----------------------------------------------
