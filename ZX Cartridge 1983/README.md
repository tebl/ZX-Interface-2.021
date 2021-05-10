# ZX Cartridge 1.983
With the ZX Cartridge 2.021, I intentionally created a cartridge that wouldn't be compatible with any of the original cartridge interfaces released for the ZX Spectrum. The more known of these interfaces is the original *ZX Interface 2*, but Kempston also released one in the form of the *Kempston Pro Joystick Interface*. I've not had any luck in obtaining the former, but found the latter and I wanted to test it out so I had to make a cartridge for the old interfaces as well - this became the *ZX Cartridge 1.983* as it has all of the original limitations.

![ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_006.jpg)

I didn't want to build a 16K cartridge without any added features, so I figured that I'd look into being able to use even larger EEPROMs that what I'd used so far. The 27C020 is able to hold 16 of these images, which should give me enough room to work with - especially when considering that the system only had 10 officially released cartridges though there's a few [cassette conversions](http://www.fruitcake.plus.com/Sinclair/Interface2/Cartridges/Interface2_RC_New_3rdParty_GameConversions.htm) that can be used as well. With 16 images combinations I added 4 DIP-switches to select between them, then a HEX-decoder IC and 7segment display just to show the value as well - gloriously over-engineered, but completely optional. Smaller (E)EPROMs can still be used, you'd just need to install components to match.

- [1> Building the cartridge](#1-building-the-cartridge)
  - [1.1> Soldering it together](#11-soldering-it-together)
  - [1.2> Testing it out](#12-testing-it-out)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building the cartridge
Building the unit assumes you have at least minor experience soldering things together, recommended is at least a soldering station with adjustable temperature to get started - usually you'll want some 60/40 solder tin (if you can get that where you live). Given that we're going to be flashing data onto EPROM chips, you'll need an EPROM programmer suitable for this task - the one I'm using is a MiniPro TL866CS and so far it's surpassed my expectations for such a reasonably priced device. If you are going to use EPROM chips you will need an EPROM ereaser as well, but read on - you might not need that depending on the chips you purchase.

With the equipment sorted, now comes the shopping - so head on over to the [BOM](#3-bom)-section for some information on what you need. Note that with sites such as ebay, AliExpress and similar sites that sell cheap chinese components, you'll need to treat these as a suggested search term and look for something that matches the gallery pictures.

You'll need to order some EPROM chips as well. As previously mentioned, you can use anything from 27C128 up to 27C020 chips. One specific chip I can recommend looking for is the W27C512, W27C010 or W27C020 as that is actually an EEPROM with the compatible pin layouts, meaning you won't need the previously mentioned EPROM ereaser. The price difference is negligible unless you're going to make a lot of them.

## 1.1> Soldering it together
The construction of this unit should be straight-forward, there's only a few components to speak of - and none of them overlap in any way. I do however recommend that you build up the components in increasing size, that way you'll have an easier time getting everything on there straight.

![Build cartridge 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_001.jpg)
![Build cartridge 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_002.jpg)

As shown above, we've started by installing resistors as well as the single diode (note the polarity marking, the line should match up with the board). Before moving onto anything else, we need to figure out which (E)EPROM chips we're going to install, for the two larger options we'll need to use a 32-pin socket (reconsider your life choices if not installing sockets) - for anything 27C512 or smaller we can use the common 28-variety, making sure that we leave a gap of four holes at the **top** of the board. Solder the jumper marked *ROM_TYPE* according to the table (the square pad marks pin 1, N/C means leave unconnected).

| (E)EPROM | ROM_SEL   | ROM_TYPE |
| -------- | --------- | -------- |
| 27C020   | 4 way DIP | 1-2      |
| 27C010   | 3 way DIP | N/C      |
| 27C512   | 2 way DIP | 2-3      |     
| 27C256   | 1 way DIP | 2-3      |
| 27C128   |           | 2-3      |     

![Build cartridge 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_004.jpg)

The two capacitors aren't polarized, just get them stuck into the hole and you'll be ready to move along to a suitable beat. Next step is to put in the DIP-switches, but refer to the table above so that you use the correct one - mount it at the top, leaving empty holes towards the bottom of the board.

![Build cartridge 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_005.jpg)

With the end of the build in sight, we focus on the single remaining component - the 7-segment display. The display should have be a 0.56" one, it should have been sold to you as one with a common cathodes (C.K.). If in doubt whether you have the correct display, put your multimeter in diode testing mode (oftenly referred to as *continuity*-mode) and ensure that you can light up one segment by putting the negative lead on the bottom center pin. Using the display requires an old IC marked MC14495P1, it is the only one I've come across that can count displays digits above 9 without costing an arm and a leg (I bought mine on AliExpress).

## 1.2> Testing it out
I shouldn't have to say it at this point, but I'll do so anyway - cartridges are not memory cards, plugging them in or unplugging them while the system is powered on will **KILL** your equipment. If you've not already done so, you'll need to put something on your selected (E)EPROM - see separate document on [flashing an EEPROM](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md) for details on how to do this (in particular the part on combining 16K images). With that out of the way, just plug the cartridge into the slot  and power on the ZX Spectrum.

![Build cartridge 006](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_1983_006.jpg)

One thing that I've found with ZX Spectrum cartridges is that they tend to restart when program running on it crashes, which we can at times use to simply move the switches to swap games. Not all of them will work reliably, but as with everything ZX Spectrum - if in doubt, just reset the computer and everything should be back to normal again. If you don't have a reset button available, such as when using the old interfaces on a non-plussed computer, you'd need pull the power - just like we did in 1983.

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation/schematic) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). 

| Reference             | Item                                                              | Count | Order  |
| --------------------- | ----------------------------------------------------------------- | ----- | ------ |
| Cartridge PCB         | Fabricate using Gerber files                                      |     1 | [PCBWay]()
| AFF1 *                | 0.56" 7-segment display (C.K.)                                    |    (1)|
| C1,C2                 | 100nF ceramic capacitor (5mm pin spacing)                         |  1 (1)|
| D1                    | 1N4148 small signal diode (DO-35)                                 |     1 | 
| R1                    | 680 ohm resistor                                                  |     1 |
| R2-R5                 | 4k7 (4700) ohm resistor                                           |     4 |
| U1 **                 | 27C020 or smaller (E)EPROM (W27C020 recommended)                  |     1 |
| U1 *                  | MC14495P1 (DIP-16)                                                |    (1)|
| SW1 **                | 1-4 way DIP switch                                                |     1 |
| Mounting ***          | Nylon M3 hex standoffs 8mm                                        |    (4)|
| Mounting ***          | Nylon M3x6mm nylon screws                                         |    (4)|
| Mounting ***          | M3 nylon nut                                                      |    (4)|  

*) These are optional components that are just used to show the slot number. Cool, but not needed.

**) The DIP switch needs to match the size of the (E)EPROM that you wish to install on the board, for more information have a read-through of [1.1> Soldering it together](#11-soldering-it-together).

***) The easiest way of ordering these is to just one of the M3 nylon standoff kits on ebay, AliExpress or any similar sites. That way you'll get more than what you need in various sizes for future projects as well. Check out [faceplate](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates) section of this repository or [PCBWay shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021) for available options.