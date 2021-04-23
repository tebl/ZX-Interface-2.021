@echo off
if not exist fonts call copy_loader.bat
if not exist loader.rom call copy_loader.bat

python cartridge.py --verify arcade --process arcade
REM python cartridge.py --help
REM python cartridge.py --chip-size 512 --chip-count 2 --create blank --verify blank --process blank