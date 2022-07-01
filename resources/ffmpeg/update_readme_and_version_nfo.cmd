@echo off
chcp 65001 1>nul 2>nul

call "%~sdp0\ffmpeg.exe"  -version               1>"%~sdp0\version.nfo"                2>&1
call "%~sdp0\ffmpeg.exe"  -hide_banner -h full   1>"%~sdp0\readme_ffmpeg.nfo"          2>&1
call "%~sdp0\ffmpeg.exe"  -hide_banner -filters  1>"%~sdp0\readme_ffmpeg_filters.nfo"  2>&1
call "%~sdp0\ffmpeg.exe"  -hide_banner -formats  1>"%~sdp0\readme_ffmpeg_formats.nfo"  2>&1
call "%~sdp0\ffmpeg.exe"  -hide_banner -codecs   1>"%~sdp0\readme_ffmpeg_formats.nfo"  2>&1

call "%~sdp0\ffplay.exe"  -hide_banner -h full   1>"%~sdp0\readme_ffplay.nfo"          2>&1
call "%~sdp0\ffprobe.exe" -hide_banner -h full   1>"%~sdp0\readme_ffprobe.nfo"         2>&1

