::@echo off
chcp 65001 1>nul 2>nul

pushd "%sdp0"

for %%e in (*.exe) do ( 
  call "%%e" --help   1>"readme_%%e.nfo" 2>&1
  echo. 1>>"readme_%%e.nfo" 2>&1
  echo. 1>>"readme_%%e.nfo" 2>&1
  echo.------------------------------------- 1>>"readme_%%e.nfo" 2>&1
  echo. 1>>"readme_%%e.nfo" 2>&1
  echo. 1>>"readme_%%e.nfo" 2>&1
  call "%%e" i   1>>"readme_%%e.nfo" 2>&1
) 

popd
exit /b 0