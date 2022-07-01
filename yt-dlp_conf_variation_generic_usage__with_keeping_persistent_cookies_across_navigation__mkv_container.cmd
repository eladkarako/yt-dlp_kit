@echo off
chcp 65001 1>nul 2>nul

::use date as "random" string. iso format. yyyymmddThhmmss (no milliseconds nor timezone).
set "_DATE="
set "_TIME="
For /f "tokens=2-4 delims=/ " %%a in ("%DATE%")  do ( set "_DATE=%%c%%a%%b" ) 
For /f "tokens=1-3 delims=/:" %%a in ("%TIME%")  do ( set "_TIME=%%a%%b%%c" )
For /f "tokens=1   delims=/." %%a in ("%_TIME%") do ( set "_TIME=%%a" )


::persistant cookies across location redirect, helps with CloudFlare
::just use mkv container at the end.
::by default, uses implicit --format "best" .

call "%~sdp0yt-dlp_conf_base.cmd" %* --cookies "%~sdp0yt-dlp_conf_variation_generic_usage__persistent_cookies__mkv_container_%_DATE%T%_TIME%.txt" --merge-output-format mkv --remux-video mkv

set "EXIT_CODE=%ErrorLevel%"

::------------ cleanup (comment it to keep the cookies, for debug)
if exist "%~sdp0yt-dlp_conf_variation_generic_usage__with_keeping_persistent_cookies_across_navigation__mkv_container_%_DATE%T%_TIME%.txt" ( 
  del /f /q "%~sdp0yt-dlp_conf_variation_generic_usage__with_keeping_persistent_cookies_across_navigation__mkv_container_%_DATE%T%_TIME%.txt"  1>nul 2>nul
) 

exit /b %EXIT_CODE%
