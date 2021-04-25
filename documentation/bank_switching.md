# Bank switching
The cartridges I've designed can utilize (E)EPROM chips with a size larger than the original 16k, but while the program put into the first 16K of the ROM will start automatically as you would normally expect - accessing software placed in the other 16K banks requires something more than that. An essential bit of information to start with, is that the ZX Spectrum was never designed with any knowledge of the cartridge system added later. Additionally, inserting a cartridge completely deactivates the ROM found within the machine - it's simply not there anymore, taking with it all hope of sharing routines between them without straight out copying them into your own program.

That solution is creating a small launcher program that goes into the first bank, it would then ensure that each cartridge can be started properly - setting up CPU registers, RAM contents and so on. What we've got now is a ZX Spectrum running code from the first bank, but when the bank is switched out - it'll still attempt to execute reading instructions from the same ROM location. The CPU is completely oblivious to the fact that the program previously stored there has disappeared and more problematically, something else has appeared there instead. That's a recipe for a crashed CPU - no actual damage, it just won't be doing anything sensible until we reset the computer. The launcher program should solve this by copying itself into RAM, then start executing it from there before doing any of the actual bank switching. 

The [Cartridge Loader](#2-cartridge-loader) program is my solution for all this, it is also described in more detail later in this document. If you would like to learn a bit more about the bank switching routine, I recommend playing around with the functionality in a more direct fashion - check out the [Doing it manually](#1-doing-it-manually) section for this.

# 1> Doing it manually
Doing it manually is a bit hit and miss for the reasons previously explained, but it does allow us to learn about the interface when doing so. We'll need a program in the first bank that'll actually allow us to do something, so we'll need some sort of basic ROM in the first slot. You can use a copy of the original ZX Spectrum ROM, alternatively you can use any of the rather excellent replacements instead. Both [OpenSE BASIC](https://sourceforge.net/projects/sebasic/) or the [Gosh wonderful ROM](https://k1.spdns.de/Vintage/Sinclair/82/Sinclair%20ZX%20Spectrum/ROMs/gw03%20'gosh%2C%20wonderful'%20(Geoff%20Wearmouth)/gw03%20info.htm) will be perfectly suited for this task.

When booted up into either of the basics, you can then do a write to port 31 in order to manaully control the bank switching logic. You need to enter the value in the form of a decimal number, but it will be easiest to list it up as individual bits (as each bit is used for different things):

| BIT |    0 |    1 |    2 |    3 |    4 |    5 |        6 |        7 |
| --- | ---- | ---- | ---- | ---- | ---- | ---- | -------- | -------- |
|     | BA14 | BA15 | BA16 | BA17 | BA18 |  /EN | ROM_SEL0 | ROM_SEL1 |

The *ROM_SEL* bits can be used to select one of four ROM chips addressed on a cartridge, bits 0 through 4 is used to select the 16K bank within the chip (not all of which may be available, depending on the type of ROMs installed on the cartridge). Bit 5 deactivates the cartridge, effectively reactivating the ROM chip found within the ZX Spectrum computer.

For now we'll just attempt to select between the four 16K images flashed onto a 27C512 (64K) (E)EPROM, it has then been inserted into the *ROM 0* socket on a *ZX Spectrum 2.021* cartridge. The 27C512 only has two extra address lines, so only values written to BA14 and BA15 will have an effect on the bank switching. ROM banks can be selected by writing a value between 0 and 3, to select the second bank we'll write a 1 to port 31:
```
OUT 31,1
```
Either it works or it just crashed the basic, try hitting the *NMI* button to see if that fixes it. Using the reset button will reset the bank switching circuit, returning us to whatever we had in the first bank.

Try some of the other values until you find something to have fun with. Setting bit 6 high allows you to access banks on the *ROM 1* socket, meaning you'd write value from 64 through 67 instead.

# 2> Cartridge Loader
As previously mentioned, the Cartridge Loader is a program intended for flashing into the first 16K bank of any of the regular ZX Interface 2.021 cartridges - it is the first thing that runs when the computer is powered up with the cartridge inserted. Because I couldn't help myself and had already commited to using the entire 16K bank for this purpuse, I added a pretty little boot screen to it as well. Note that there is also a specific [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) page, this is where you'll find more information on tools used to assemble the code.

![Boot screen](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-25%2001.12.02.jpg)

The loader functions in a two-stage manner, the first thing it'll do is copy itself out of the ROM and into the computers RAM then it'll start executing instructions from that location - this is done while the boot screen is being displayed. Relocating the code to RAM avoids the common bank switching pitfalls, as the RAM stays where it is while we switch around the ROM banks. Once all of that is done, the program will display a menu - allowing the user to select from any of the other 16K banks (using either a joystick or the keyboard keys as listed on the screen).

![Boot screen](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-25%2001.12.04.jpg)

You can find the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) as a file named [loader.rom](https://github.com/tebl/ZX-Interface-2.021/blob/main/software/cartridge_loader/loader.rom), make sure that you click the *Download*-button on that page instead of right-clicking and selecting *save link as* - we want to save a copy of the ROM and not a web page describing it. You can refer to the document [Flash (E)PROM](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md) for more details on manually combining ROM-files and then flashing them onto an (E)EPROM.

The [So BASIC!](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator/cartridges/basic) cartridge can be found at the link provided, this is suitable for flashing onto a single 27C512 or W27C512 (E)EPROM. As I did not want to manaully edit assembly files in order to create a new cartridge such as this one, I've also created a [Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator) tool - this takes care of assembling the images into the correct positions, updating titles and even changing the boot screen.