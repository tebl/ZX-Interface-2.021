@echo off
taskkill /IM ZXSpin.exe 2> nul
START "" "C:\Code\ZXSpin\ZXSpin.exe"
pause
taskkill /IM ZXSpin.exe