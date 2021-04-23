@echo off
copy ..\cartridge_loader\loader.rom .
if not exist fonts mkdir fonts
copy ..\cartridge_loader\fonts\*.bin fonts
pause
