@echo on
copy ..\cartridge_loader\loader.rom .
copy ..\cartridge_loader\blank_slot.rom .
copy ..\snapshot_loader\snapshot.rom .
if not exist fonts mkdir fonts
copy ..\cartridge_loader\fonts\*.bin fonts
