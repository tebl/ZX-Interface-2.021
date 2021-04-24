@echo off
pushd fonts
call assemble.bat
popd
if not exist font1.bin copy fonts\font_computer.bin font1.bin
if not exist font2.bin copy fonts\font_msx.bin font2.bin

sbasm.py selector.asm
REM type selector.list
sbasm.py loader.asm
REM type loader.list
sbasm.py blank_slot.asm