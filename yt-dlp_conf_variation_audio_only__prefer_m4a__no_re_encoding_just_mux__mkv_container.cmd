@echo off
chcp 65001 1>nul 2>nul

:: if you don't need to play the file on portable-player (iPod), 
:: this batch file will download best audio quality it can find, 
:: fallback to any format it can find, if it finds video it will extract the audio stream from it and use it.
:: the container is a modern MKV container, which allows thumbnail, chapters and subtitles.
:: works well if you need it for your K-Lite media-player classic on your PC.
::
:: no re-encoding, so - fast.

call "%~sdp0yt-dlp_conf_base.cmd" %* --format "bestaudio[ext=m4a]/bestaudio/best" --extract-audio --merge-output-format mkv --remux-video mkv

set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
