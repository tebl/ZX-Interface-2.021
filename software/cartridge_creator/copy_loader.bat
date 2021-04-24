@echo off
copy ..\cartridge_loader\loader.rom .
copy ..\cartridge_loader\blank_slot.rom .
if not exist fonts mkdir fonts
copy ..\cartridge_loader\fonts\*.bin fonts
