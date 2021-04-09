# Bank switching
The cartridges I've designed can utilize (E)EPROM chips with a size larger than the original 16k, but while the program put into the first 16K of the ROM will start automatically as you would normally expect. Accessing other pieces of software placed into the other 16K banks is another story entirely, mainly because the ZX Spectrum was never designed to be able to detect a new cartridge being inserted. In fact, no part of the ZX Spectrum ROM will be available when the cartridge is activated - it completely deactivates the ROM found within the machine - so we'll need another solution.

That solution is creating a small launcher program that should go into the first bank, it would then ensure that each cartridge can be started - setting up CPU registers, RAM contents and so on. What we've got now is a ZX Spectrum running code from the first bank, but when the bank is changed it'll attempt to keep reading code from the same memory location - completely oblivious to the fact that the program stored there is something else entirely - more than likely just crashing it. It might work, but that'd be more by accident than by design. Unfortunately, that program does not exist yet - so we'll just attempt to have fun until that get's done.

# Doing it manually
Doing it manually is a bit hit and miss for the reasons previously explained, but it does allow us to learn about the interface when doing so. We'll need a program in the first bank that'll actually allow us to do something, so we'll need some sort of basic ROM in the first slot. You can use a copy of the original ZX Spectrum ROM, alternatively you can use any of the rather excellent replacements instead. Both [OpenSE BASIC](https://sourceforge.net/projects/sebasic/) or the [Gosh wonderful ROM](https://k1.spdns.de/Vintage/Sinclair/82/Sinclair%20ZX%20Spectrum/ROMs/gw03%20'gosh%2C%20wonderful'%20(Geoff%20Wearmouth)/gw03%20info.htm) will be suited for this task.

When booted up into either of the basics, you can then do a write to port 31 in order to manaully control the bank switching logic. You need to enter the value in the form of a decimal number, but it will be easiest to list it up as individual bits (as each bit is used for different things):

| BIT |    0 |    1 |    2 |    3 |    4 |    5 |        6 |        7 |
| --- | ---- | ---- | ---- | ---- | ---- | ---- | -------- | -------- |
|     | BA14 | BA15 | BA16 | BA17 | BA18 |  /EN | ROM_SEL0 | ROM_SEL1 |

The *ROM_SEL* bits can be used to select one of four ROM chips addressed on a cartridge, bits 0 through 4 is used to select the 16K bank within the chip (not all of which may be available, depending on the type of ROMs installed on the cartridge). Bit 5 deactivates the cartridge, effectively reactivating the ROM chip found within the ZX Spectrum computer.

For now we'll just attempt to select between the four 16K images flashed onto a 27C512 (64K) (E)EPROM, it has then been inserted into the *ROM 0* socket on a *ZX Spectrum 2.021* cartridge. The 27C512 only has two extra address lines, so only values written to BA14 and BA15 will have an effect on the bank switching. ROM banks can be selected by writing a value between 0 and 3, to select the second bank we'll write a 1 to port 31:
```
OUT 31,1
```
Either it works or it just crashed the basic, try hitting the NMI button to see if that fixes it. Using the reset button will reset the bank switching circuit, returning us to whatever we had in the first bank.

Try some of the other values until you find something to have fun with. Setting bit 6 high allows you to access banks on the *ROM 1* socket, meaning you'd write value from 64 through 67 instead.