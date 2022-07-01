@echo off
chcp 65001 1>nul 2>nul

::result will be mp3 file.
:: - limits download to audio only if possible (fallback to whatever possible).
:: - extracts audio stream, and if not mp3 encoded, it re-encodes it (192K).
:: - container is mp3.

call "%~sdp0yt-dlp_conf_base.cmd" %* --format "bestaudio[ext=mp3]/bestaudio[ext=m4a]/bestaudio/best" --extract-audio --audio-format "mp3" --audio-quality "192K"

set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
