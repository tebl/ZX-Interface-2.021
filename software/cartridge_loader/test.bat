@echo off
taskkill /IM ZXSpin.exe 2> nul
START "" "ZXSpin\ZXSpin.exe"
pause
taskkill /IM ZXSpin.exe 2> nul