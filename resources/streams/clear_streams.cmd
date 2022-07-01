@echo off

call "%~sdp0\streams.exe" -nobanner -d -s "..\*"
set "EXIT_CODE=%ErrorLevel%"

echo EXIT_CODE: %EXIT_CODE%
pause

exit /b %EXIT_CODE%