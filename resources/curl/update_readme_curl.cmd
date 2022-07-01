@echo off
call "%~sdp0\curl.exe" --version   >"%~sdp0\readme_curl.nfo"
echo. >>"%~sdp0\readme_curl.nfo"
call "%~sdp0\curl.exe" --help all >>"%~sdp0\readme_curl.nfo"