@echo off
chcp 65001 1>nul 2>nul
set "EXIT_CODE=0"

::pushd "%~dp1"

call "%~dp0aria2c.cmd" --input-file=%*
set "EXIT_CODE=%ErrorLevel%"

popd
exit /b %EXIT_CODE%