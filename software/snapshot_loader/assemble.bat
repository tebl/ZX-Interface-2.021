@echo off
sbasm.py placeholder.asm
sbasm.py snapshot.asm
type snapshot.list
copy /B snapshot.rom + snapshot.rom + snapshot.rom + snapshot.rom snapshot_64k.rom