@echo off
chcp 65001 1>nul 2>nul

::example.
::adds '--batch-file' and runs 'yt-yt-dlp_conf_variation_generic_usage_limit_to_720p_and_prefer_m4a_audio_no_re_encoding_just_mux_all_to_mkv.cmd'

call "%~sdp0yt-yt-dlp_conf_variation_generic_usage_limit_to_720p_and_prefer_m4a_audio_no_re_encoding_just_mux_all_to_mkv.cmd" %* --batch-file "%~sdp0\yt-yt-dlp_conf_variation_generic_usage_limit_to_720p_and_prefer_m4a_audio_no_re_encoding_just_mux_all_to_mkv__list.txt"
set "EXIT_CODE=%ErrorLevel%"

exit /b %EXIT_CODE%
