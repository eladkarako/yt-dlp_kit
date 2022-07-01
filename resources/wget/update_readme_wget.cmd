@echo off
chcp 65001 1>nul 2>nul
call "%~sdp0\wget.exe" --version  1>"%~sdp0\readme_wget.nfo" 2>&1
echo.                            1>>"%~sdp0\readme_wget.nfo"
call "%~sdp0\wget.exe" --help    1>>"%~sdp0\readme_wget.nfo" 2>&1

