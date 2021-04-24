@echo off
pushd ..\cartridge_loader
call assemble.bat > ../cartridge_creator/assemble.log
popd
call copy_loader.bat > copy_loader.log