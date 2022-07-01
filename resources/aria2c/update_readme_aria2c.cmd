chcp 65001 1>nul 2>nul
echo.  1>"%~sdp0\readme_aria2c.nfo"
echo.------------------------------------------- 1>>"%~sdp0\readme_aria2c.nfo"
echo. 1>>"%~sdp0\readme_aria2c.nfo"


call "%~sdp0\aria2c.exe" "-v" 1>>"%~sdp0\readme_aria2c.nfo" 2>&1


echo. 1>>"%~sdp0\readme_aria2c.nfo"
echo.------------------------------------------- 1>>"%~sdp0\readme_aria2c.nfo"
echo. 1>>"%~sdp0\readme_aria2c.nfo"


call "%~sdp0\aria2c.exe" "-h#all" 1>>"%~sdp0\readme_aria2c.nfo" 2>&1


echo. >>"%~sdp0\readme_aria2c.nfo"
echo.------------------------------------------- 1>>"%~sdp0\readme_aria2c.nfo"
