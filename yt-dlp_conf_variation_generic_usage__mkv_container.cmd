@echo off
chcp 65001 1>nul 2>nul

::just use mkv container at the end.
::by default, uses implicit --format "best" .

call "%~sdp0yt-dlp_conf_base.cmd" %* --merge-output-format mkv --remux-video mkv

set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
