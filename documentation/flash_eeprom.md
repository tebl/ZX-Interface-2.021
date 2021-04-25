# Flash (E)PROM
The various cartridges for the *ZX Interface 2.021* utilizes common (E)EPROM chips of varying sizes, from 27C128 to 27C512. These are commonly EPROMs, meaning that they are UV-erasable programmable ROM chips - this requires a separate device to consistently erase the contents of the chips. Personally, I tend to instead look for EEPROMs as they are electrically ereasable instead - a common alternative is the W27C512, which is also the one I recommend purchasing unless you already have suitable chips in a drawer somewhere.

Flashing contents onto the chip requires a dedicated programmer for this, the one I recommend purchasing is the MiniPro TL866CS if you can find it. It doesn't support all of the extremely old ROM chips, but it will support just about anything that is commonly available for a reasonable price. I've not had any need to look for anything else, so I can't cover any of the other tools available. The remainder of this document will therefore assume the use of a MiniPro TL866, for anything else I'll just assume you know how to use it.

- [1> Combining images](#1-combining-images)
  - [1.1> Combining ROMs](#11-combining-roms)
  - [1.2> Padding out images](#12-padding-out-images)
- [2> Using MiniPro TL866](#2-using-minipro-tl866)

# 1> Combining images
The ZX Spectrum cartridge format has a hardware-defined 16K size, more modern cartridge alternatives as well as the ones I've created for the *ZX Interface 2.021* are still required to handle data in chunks of 16K segments. You can switch out the segment that the CPU currently sees by using a technique called [bank switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md). Most of the software, in particular the original releases will therefore be available as 16K files with a rom extension though you might come across files that are less than this - especially when first starting to develop your own programs in machine code. See [1.2> Padding out images](#12-padding-out-images) if you are looking for an easy way to pad it out to 16k in size.

If all of this sounds like it's a bit more work than you'd like to deal with, then I've got news for you - I did so too. So I made the [Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator), it takes care of assembling the image for you and taking care of updating menu titles and so forth. The following sub-sections deal with doing this in a more manual fashion, either because you want to assemble it yourself or because you don't want my fancy loader and want something else instead. A ready-made cartridge, in form of the [So BASIC!](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator/cartridges/basic) cartridge is available as an example of the cartridges this generates.

When you're ready to continue, meaning that you have your *.bin* or *.hex* file ready to go, skip on over to [Using MiniPro TL866](#2-using-minipro-tl866) for instructions on how to flash those onto an (E)EPROM.

# 1.1> Combining ROMs
There are many ways of combining binary files, but as MS Windows is among the most problematic when it comes to doing simple command line tasks it is the one I'll be covering. You can use the *COPY* command with a parameter for treating the data as binary, then you'll list each of the filenames with a plus in between - ending with the filename you need. Ensure that the resulting file has a reasonable file, meaning it's 32K or 64K - depending on the ROM size used. 
```
copy /B file1.rom + file2.rom 27c256_image.bin
copy /B file1.rom + file2.rom + file3.rom + file4.rom 27c512_image.bin
```
![Combining files](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_001.jpg)

# 1.2> Padding out images
I've encountered a few ROM-files that have a size smaller than 16k, usually this just means that unused data has been left out - when combining files we do however need those empty bytes. The easiest way of handling this is following the steps in [2> Using MiniPro TL866](#2-using-minipro-tl866), configuring the chip to be a 16K variant such as the 27C128 and then loading the image into the memory using *File -> Open*. Then just save the image using *File -> Save*, specify bin as the file type and you'll have a perfectly padded 16K file.

# 2> Using MiniPro TL866
In order to flash data onto the ROM chip we'll need a suitable file in either BIN- or HEX-file format, see [1.1> Combining ROMs](#11-combining-roms) if you don't have any of them ready to go. You could always just use a 16K image by itself with a larger chips, it just means that all of the other ROM banks will have nothing in them.

![Flash 002](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_002.jpg)

Starting with the *MiniPro Programmer* software, it'll look something like what is shown above. There'll be the name of a specific ROM chip under the section titled *Select IC* - more than likely it'll be the wrong one (you need to match the chip as well as manufacturer information exactly or you will get errors along the way). Click the button to get the dialog as shown below, enter a search term such as W27C512 - it's a Winbond manufactured part.

![Flash 003](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_003.jpg)

The main window will now be updated, the main data display will be blanked out as well (in case you had tried loading data into it earlier) and updated to reflect the exact size of the chip. You're now ready to load data into the program, just use *File -> Open* and find the file you've already prepared for this.

![Flash 004](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_004.jpg)

The next dialog just allows you to specify how the file is loaded into the program, mainly it should detect automatically what you need to do here. The only interesting bit here is, if you want to use *MiniPro Programmer* to combine images instead of the method described in [1.2> Combining ROMs](#12-combining-roms) - in which case you need to specify a new address in the *To Buffer Strat. Addr(HEX)* value to a different starting point (usually $0000, $4000, $8000 or $C000), then set *Clear Buffer when loading the file* to *Disabled*.

![Flash 005](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_005.jpg)

Verify that the data window shows data where you expect it to be, but as it is Z80 machine code most will be unreadable thought you'll probably see some recognizable text here and there. Given a 64K ROM, you should see individual 16K banks starting at $0000, $4000, $8000 and $C000.

![Flash 006](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_006.jpg)

![Flash 007](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_007.jpg)

The final steps is actually flashing the chips, use *Device -> Program* to open up the programming dialog as shown below. You'll then need to put the ROM chip into the programmer, matching the pin layout as shown. Finally, click *Program* to actually program the chip.

![Flash 008](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_008.jpg)
![Flash 009](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_009.jpg)
![Flash 010](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_flash_010.jpg)

Hopefully the chip will have programmed successfully as shown in the screenshot above. If you get a chip ID error, then that usually means that either you've selected the wrong manufacturer for the chip you have - or - the chip you have was rebadged at some point, in which case you should get your money back. If the data verification failed, meaning the data read back from the chip was not the same as was written - then you've got a bad chip and need to get another one.