@echo off
chcp 65001 1>nul 2>nul

::----------------------------------------------
:: bug. on some cases.
::----------------------------------------------
:: GHOST CHAPTERS bug (v2022.06.22.1)
:: https://github.com/yt-dlp/yt-dlp/issues/4192
::----------------------------------------------
:: in-case the video has chapters after the cropping point,  
:: those would still be registered in the video,  
:: even if there is no data at that point.
::---------------------------------------------- 



:: based on 
::   yt-dlp_conf_variation_audio_only__prefer_m4a__no_re_encoding_just_mux__mkv_container.cmd
:: adds 
::   time-range limitation.
:: result is not re-encoded, only muxed (ffmpeg ... -c copy).


call "%~sdp0yt-dlp_conf_variation_audio_only__prefer_m4a__no_re_encoding_just_mux__mkv_container.cmd" --download-sections "*00:00:00-00:07:14"  %*

set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
