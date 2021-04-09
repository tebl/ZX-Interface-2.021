# ZX Cartridge 2.021
The ZX Cartridge 2.021, simply referred to as *cartridge* for the remainder of this document, is a modified version of the one released by Sinclair back in 1983. The original cartridge design was limited to 16K without any of the signals required to easily build a larger one, so the *ZX Cartridge 2.01* set out to fix that - simply by extending the length of the cartridge. This does mean that you can't use it with the original *Sinclair ZX Interface 2*, you can only use it with the *ZX Interface 2.021*.

![ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_004.jpg)

Though the interface itself is able to address ROM chips in sizes up to 512K, four of them actually, the cartridge itself was designed with the ROM chips ranging from 27C128 up to 27C512. I might make a monster cartridge at some point, but given that there were only around 10 cartridges released for the original system - having the space for 8 of them is a good starting point.

Note that there are various faceplates available for the cartridges, these complete the look of the cartridge as well as help them balance on top of the interface. Check out the [faceplates](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates) section for an overview over the ones that have been made available, also see [PCBWay shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021).

- [1> Building the cartridge](#1-building-the-cartridge)
  - [1.1> Soldering it together](#11-soldering-it-together)
  - [1.2> Assembling the unit](#12-assembling-the-unit)
  - [1.3> Testing it out](#13-testing-it-out)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building the cartridge
Building the unit assumes you have at least minor experience soldering things together, recommended is at least a soldering station with adjustable temperature to get started - usually you'll want some 60/40 solder tin (if you can get that where you live). Given that we're going to be flashing data onto EPROM chips, you'll need an EPROM programmer suitable for this task - the one I'm using is a MiniPro TL866CS and so far it's surpassed my expectations for such a reasonably priced device. If you are going to use EPROM chips you will need an EPROM ereaser as well, but read on - you might not need that depending on the chips you purchase.

With the equipment sorted, now comes the shopping - so head on over to the [BOM](#3-bom)-section for some information on what you need. Note that with sites such as ebay, AliExpress and similar sites that sell cheap chinese components, you'll need to treat these as a suggested search term and look for something that matches the gallery pictures.

You'll need to order some EPROM chips as well. As previously mentioned, you can use anything from 27C128 up to 27C512 chips. One specific chip I can recommend looking for is the W27C512 chip as that is actually an EEPROM with the same pin layout, meaning you won't need the previously mentioned EPROM ereaser. The price difference is negligible unless you're going to make a lot of them.

## 1.1> Soldering it together
The construction of this unit should be straight-forward, specifically as there are only a handful of components to deal with. If you are only going to install a single (E)EPROM into the board, you just need to solder in the left socket and the capacitor next to it.

![Build cartridge 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_001.jpg)

There are two solder jumpers on the right side of the cartridge, these are clearly labelled A14 and A15 with pin 1 identifiable as the square pad. You need to add some solder to bridge between two of the pins, this is dependent on the type of (E)EPROM you are going to install into the slots (they need to be of the same kind so no mixing and matching).

| (E)EPROM | A15 | A14 |
| -------- | --- | --- |
| 27C512   | 1-2 | 1-2 |     
| 27C256   | 2-3 | 1-2 |     
| 27C128   | 2-3 | 2-3 |     

A completed unit with the jumpers soldered in for the installed 27C512 chip can be seen below, this is mainly all there is to it. The rest of the components that are usually associated with ZX Spectrum cartridges are integrated into the *ZX Interface 2.021* instead - meaning you can quickly solder together all the cartridges you'll ever need in just a few minutes.

![ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_004.jpg)

## 1.2> Assembling the unit
There isn't all that much that can be said for assembling the unit, chances are you've already finished the entire thing by this point. The only remaining step would just be to add a [faceplate](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates), it helps keep the cartridge from flopping around in the cartridge slot while adding quite a bit of visual flair to it.

The faceplate is just a simple PCB, the suggested way of attaching it is by using components found in cheap *M3 nylon hex* kits. It will look at its best when using an 8mm nylon hex standoff (F-F), then adding screws from both sides. If, on the other hand, you want to stay within the kit - then I suggest using the 8mm M-F standoffs, add M3 nuts on the bottom and snip off the remaining part of the nylon screw that'll poke through. Add screws on top.

## 1.3> Testing it out
I shouldn't have to say it at this point, but I'll do so anyway - cartridges are not memory cards, plugging them in or unplugging them while the system is powered on will **KILL** your equipment. With that out of the way, just plug the cartridge into the slot and then apply power to see if whatever you put into the first 16K of the (E)EPROM starts up as expected.

The ZX Spectrum doesn't actually have any knowledge of any of the bank switching logic installed on the interface, in fact the ROM in your computer will be completely disabled when any cartridge is inserted into the interface. So in order to access any of the other banks available we'll need to come up with something else, but that is described separately in [bank_switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md) that have been included as part of the [documentation](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation).

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation/schematic) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). Note that with some titles, like *Basic Programming* and *synthcart* you're required to have two controllers - so plan on buying twice the amount of parts listed.

| Reference             | Item                                                              | Count | Order  |
| --------------------- | ----------------------------------------------------------------- | ----- | ------ |
| Cartridge PCB         | Fabricate using Gerber files                                      |     1 | PCBWay
| Faceplate PCB         | Fabricate using Gerber files                                      |    (1)| PCBWay
| U1,U2 *               | 27C128,27C256 or 27C512. W27C512 with 28-pin socket recommended   |  1 (1)|
| C1,C2 *               | 100nF ceramic capacitor (5mm pin spacing)                         |  1 (1)|
| Mounting **           | Nylon M3 hex standoffs 8mm                                        |    (4)|
| Mounting **           | Nylon M3x6mm nylon screws                                         |    (4)|
| Mounting **           | M3 nylon nut                                                      |    (4)|  

*) Only a single (E)EPROM is required to build a cartridge, components U2 and C2 are therefore listed as optional. Installing 28-pin wide DIP sockets is highly recommended rather than soldering the (E)EPROM directly to the board.

**) The easiest way of ordering these is to just one of the M3 nylon standoff kits on ebay, AliExpress or any similar sites. That way you'll get more than what you need in various sizes for future projects as well.