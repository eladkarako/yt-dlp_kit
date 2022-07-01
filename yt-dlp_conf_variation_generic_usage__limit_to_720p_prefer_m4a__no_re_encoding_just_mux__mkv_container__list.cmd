@echo off
chcp 65001 1>nul 2>nul

::example.
::adds '--batch-file' and runs 'yt-dlp_conf_variation_generic_usage__limit_to_720p_prefer_m4a__no_re_encoding_just_mux__mkv_container.cmd'

call "%~sdp0yt-dlp_conf_variation_generic_usage__limit_to_720p_prefer_m4a__no_re_encoding_just_mux__mkv_container.cmd" %* --batch-file "%~sdp0\yt-dlp_conf_variation_generic_usage__limit_to_720p_prefer_m4a__no_re_encoding_just_mux__mkv_container__list.txt"
set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
