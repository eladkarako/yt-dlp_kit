@echo off
chcp 65001 1>nul 2>nul

::best for youtube. upper-limited to 720p video. tries to fetch audio-video mp4, fallback to various combinations, favoring m4a audio (sounds better), fallback to whatever available. uses modern MKV container and whatever streams recived (can contain subtitles, thumbnail, chapters).

call "%~sdp0yt-dlp_conf_base.cmd" %* --format "best[ext=mp4][height <=? 720]/bestvideo[ext=mp4][height <=? 720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height <=? 720]+bestaudio/best[height <=? 720]/best[height <=? 720]/best" --merge-output-format mkv --remux-video mkv

set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
