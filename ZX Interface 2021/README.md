# ZX Interface 2.021
This is the module that the project is named after, the actual implementation of the the *ZX Interface 2.021*. Part of the hardware used within the *ZX Interface 2.021* has been designed to be functionally similar to available diagnostic cartridges, but I've also added a Sinclair joystick interface that should functionally work the same way as the original *ZX Interface 2*. 

![ZX Interface 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-01%2015.55.21.jpg)

While the original interface only supported 16K cartridges, severely limiting the amount of titles that could have been released for it, I didn't want to design a new interface without addressing those shortcomings. This was solved by adding a new section of pins to the end of the cartridge - these'll probably get in the way of original cartridges, but I can't afford any of those so unless someone straight-up sends me some I can't design anything for them. In theory, it should work without any changes.

![ZX Diagnostic 2.021 (no faceplate)](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_010.jpg)

Note that there are various faceplates available for the interface as well as the cartridges, these complete the look as well as add some sturdyness to the design. Check out the [faceplates](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates) section for an overview over the ones that have been made available, also see [PCBWay shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021).

- [1> Building the interface](#1-building-the-interface)
  - [1.1> Soldering it together](#11-soldering-it-together)
  - [1.2> Card edge connectors](#12-card-edge-connectors)
  - [1.3> Assembling the unit](#13-assembling-the-unit)
  - [1.4> Testing it out](#14-testing-it-out)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building the interface
Building an interface such as this assumes you have at least minor experience soldering things together, recommended is that you at least have access to a soldering station with adjustable temperature - if you can get it, you should probably start with 60/40 solder tin as the lead-free alternatives tends to be harder to work with though it's certainly a category that can be considered too cheap.

With the equipment sorted, now comes the shopping - so head on over to the [BOM](#3-bom)-section for some information on what you need. Note that with sites such as ebay, AliExpress and similar sites that sell cheap chinese components, you'll need to treat these as a suggested search term and look for something that matches the gallery pictures.

This document will only cover the actual interface, there are separate documents for the various cartridges available - at a minimum I recommend starting with the *ZX Diagnostic 2.021*, it has a few extra features that you can easily have silly amounts of fun with.

## 1.1> Soldering it together
The construction of this unit should be fairly straight-forward, just take your time in order to make sure everything goes into place - more or less straight. I usually recommend starting by having a good look at the PCBs, try to figure out where all of the listed components go and in which orientation they go in (all of this should be clearly marked on the silkscreen). 

![Build 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_001.jpg)

I will usually try to install components sorted by their physical size, doing it this way means you'll have an easier time keeping everything from looking somewhat crooked. This is your board, your build and you want it perfect - don't you? If you said no, then go sit in the corner because I worked hard creating this for myself and whoever wants one.

![Build 002](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_002.jpg)

Here we've started by soldering all of the resistors, ensuring that we're using the correct values in each position. The diodes are installed similarly, but these have a polarity and so you need to install these correctly by matching up the stripe with the stripe as shown on the silkscreen.

![Build 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_003.jpg)

Moving things along, we've added the right-angle pin header - soldering one pin into place, then reheating and adjusting it's position so that it looks straight before soldering the rest of the pins. The sockets have been installed as well, here we've taken care to match up the indent in the socket as shown on the silkscreen - pins 1 on all of the ICs here will therefore be found on the lower-left corner. I recommend soldering in each of the corners on the sockets, but before soldering the rest - check that they're still sitting flush against the board.

![Build 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_004.jpg)

The capacitors used on this board are mainly non-polarized, these are the small yellow ones found next to the IC-sockets and these are quickly soldered into place. The electrolytic marked C5 on the other hand needs to be installed the correct way - the longer lead goes into the lower hole marked with a "*+*". Don't solder that into place yet though, you need to measure the height of the component first as we will only have space for one that is at most 8mm tall - if the ones you have are longer, you'll need to install it on it's side instead.

![Build 001](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_005.jpg)

Here, the LED have been added to the PCB. These also have a specific orientation that you need to install it in, but to keep things short without actually using any of the correct terms - just put the longer lead into the round hole. Solder one of the pins into place first, then reheat and push it firmly against the board before soldering in the remaining lead. We need this to line up with the faceplate that goes on top, so you need to aim straight here. Given that this is your new power LED, this will always be lit when the computer is on - so pick a colour you find comfortable to look at (preferably not one of those awful super-bright blue ones).

At this point we'll be jumping a bit ahead in the build, mainly because there are a few components that we need to ensure will match the cutouts on the faceplate. So here I've gone ahead and soldered in the two switches, choosing something that's long enough to poke through the faceplate so that you can actually push them (or not, in case you want to force yourself to use a sharpie to push them instead). The DB9-connectors I've just screwed onto the main PCB by using longer M3 nylon screws through eight M3 nylon nuts, through the board and finally adding four more M3 nylon nuts to the underside of the board.

![Build 006](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_006.jpg)

Now it's time to the install the card edge connectors that connects to the actual ZX Spectrum computer, but we'll need to cut it down for size and add a nail through it to add some keying. Given that doing this is an entirely different project by itself, at least when you're doing it for the first time - you'll find all of the details in [1.2> Card edge connectors](#12-card-edge-connectors), then come back here for the exciting continuation of this project.

Start by soldering the component, aligning the pins to the underside of the PCB without bending them in any way - keep them straight and take care that you install the keyed part with the section marked *SLOT* on the PCB. When it looks straight enough, solder in two of the opposing corners before doing the rest. At this point you need to check that the slot isn't at an angle, but looks to be parallell to the PCB. When satisfied continue soldering the rest of the pins on the underside.

![Build 007](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_007.jpg)

Now it's time to deal with the pins on the topside of the PCB. There are no correct way to install it as the part really has pins that are too short, but I thing you'll get the strongest joint when the pins have been bent into an L-shape like in the picture. You can easily get this shape by taking a flat-bladed screwdriver, place it onto the center of the pin and pushing it down until you get the desirable shape as you can see in the picture above. When done, recheck that the connector still is parallel to the main PCB - bend it slightly if not. Solder everything into place, as long as you don't bridge anything onto the next pin I recommend adding a *LOT* to give it some added strength.

![Build 008](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_008.jpg)
![Build 009](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_009.jpg)

The last of the big components to go into place is the cartridge connector, as with the other connector we'll need to match up the areas marked *SLOT* with the keying added. You should already have checked out [1.2> Card edge connectors](#12-card-edge-connectors), where I went into detail on how the keying part is done. Solder it into place. If you haven't already soldered the DB9-connectors into place, feel free to do so after testing that the alignment will fit snuggly with the faceplate.

![Build 010](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_010.jpg)

Finally, we're ready to add the jumper caps to the board as shown above - the joystick enable jumper must be in the lower position (across pins 1-2) for the Sinclair joystick interface to work. The other jumper should be kept in the upper position, this can be used to select between the two lower ROM banks of the inserted cartridge - the idea here was that with a non-functional computer you could use this to swap between two diagnostic ROMs. The various ICs have also been inserted into the sockets, taking care to match up the indented part of the chip with the socket as well as the silkscreen underneath.

At this point you should be ready to skip forward to section [1.3> Assembling the unit](#13-assembling-the-unit), mainly as we've already done everything that was described in section [1.2> Card edge connectors](#12-card-edge-connector) at an earlier stage.

## 1.2> Card edge connectors
The card edge connectors used with the *ZX Interface 2.021* widely vary in terms of quality, especially those sold from sites that primarily sell Chinese components tend to be somewhat weak. If you want one that is of a better quality, you can usually get them ready-made from Ben Versteeg at [bytedelight.com](https://www.bytedelight.com/?product=edge-connector-ready-for-zx-spectrum-a-brand). The cheaper ones are however the ones I have, so these are the ones you'll find in the pictures. If you intend to sell a completed unit to someone else, you'll probably need to look for one for sale at a more reputable electronics shop such as mouser etc.

![Build 050](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_050.jpg)

Cheap or expensive, unless you bought some that have already been adapted for use - we'll need to make some changes to them. If you find an ebay seller that describes them as *uncut* ZX Spectrum edge connectors, you're getting the cheap ones at a higher price - you'll still need to follow the rest of this section to adapt them for use. For the computer-side of the interface, we'll need to cut down on the width of the connector as well as add keying to it.

![Build 051](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_051.jpg)

Starting with the ones that plug into the ZX Spectrum computer, you'll quickly find that these are a bit too wide to actually fit the computer. At this point you'll need some sort of fine-toothed saw, I simply can't recommend attempting to chew it off - they taste rather *industrial*. A vise such as the one shown above will help quite a bit if you have one, but you could always try holding it in place. Where exactly to cut? Well, notice the little nubs on the underside of the component? Just align your saw with the inner side of these and cut straight down through the plastic, use some sanding paper or a file to clean up the edges.

This connector, as well as the cartridge slot, will require some sort of keying - this ensures that the pins line up perfectly, or at least close enough that we don't accidentally short the wrong things. These are marked on the PCB as *SLOT*, the classic way of adding them is using nails. Not even kidding, I'm totally serious.

![Build 052](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_052.jpg)

Start by removing the copper spring from that area, just push the pin upwards from the underside of the connector, then pull them out from the top. For the next step I recommend finding an extremely small drill, it needs to be smaller than the nail you want to use and then drill a hole along the top of the connector - leaving enough space that the nail won't simply be pulled through the plastic.

![Build 053](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_053.jpg)

Take your selected nail, making sure that it's not a ridiculously big one or made super-strong so that you can't cut it - think of those super-cheap ones you get with IKEA furniture, these are ones you're looking for. Push it through the holes you drilled. In order to get the head flush with the plastic, I tend to use my soldering iron to push it slightly into the plastic - this'll also ensure that it won't be going anywhere soon. Use a strong pair of pliers to cut off the remainder of the nail from the other side, try to get it as close to the plastic as you can to avoid scratching up your desk or ZX Spectrum case too much.

![Build 054](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_054.jpg)
![Build 055](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_055.jpg)

That should be it, remember that the cartridge slot will have two keying pins that you need to add, but at least you won't have to cut the actual connector. When finished, get back to section [1.1> Soldering it together](#11-soldering-it-together) to finish building the actual interface.

## 1.3> Assembling the unit
There isn't all that much that can be said for assembling the unit, chances are you've already finished the entire thing by this point - test-fitting as you went along with it. A [faceplate](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates) might not be a requirement for building a functional interface, but it is highly recommend that you get it -  it helps keep the cartridge from flopping around in the cartridge slot. Not to mention the added visual flair!

![Build 011](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_011.jpg)
![Build 012](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_012.jpg)

The suggested way of attaching the faceplate is by using 8mm tall nylon hex standoffs between it and the main PCB, adding M3 screws from the top to fit it firmly into place. The middle section can be of the F-F kind, but the M-F will also work here. The most important part is that you need 6mm tall M3 nylon standoffs to the bottom of the PCB, this should ensure that the interface lines up with your desktop surface while plugged into ZX Spectrum computer without wobbling around - refer to the image above to see how they're assembled (just don't over-tighten them like I did).


## 1.4> Testing it out
I shouldn't have to say it at this point, but I'll do so anyway - cartridges are not memory cards, plugging them in or unplugging them while the system is powered on will **KILL** your equipment. With that out of the way, just plug any suitable cartridge into the slot and then apply power to see if whatever you put into the first 16K of the (E)EPROM comes up as expected.

With the interface connected to your ZX Spectrum computer, but no cartridge inserted - the computer should boot into ZX Basic as normal. If it doesnt't then quickly disconnect it as something will have gone wrong with the build, you should attempt to figure out what that is before powering it up again. Try comparing your built unit to the pictures earlier in this document, pay particular attention to the components that need to be installed in a specific way - especially the diodes, the transistor and the various ICs all have a specific orientation that they need to be installed in.

If it boots as normal, then you can test out the joystick interface - simply by plugging in an Atari-style joystick into any of the ports and you should get characters printed on the screen when any of the directions or the button is pushed.

![ZX Spectrum Diagnostics](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-01%2022.18.58.jpg)

When you're ready to plug in a cartridge, remember to unplug the power to the computer - now that we've added that fancy new power LED, this should be easy to remember so unplug the bleeping thing. Ahem... now just plug in a cartridge you've previously built, it should start up whatever has been added as the first data bank on the inserted cartridge. This could be a a game, a diagnostic program, which was badly photographed above, or even a complete replacement for the ZX Basic.

If you want to access something in the other banks, you'll at least need a basic or some other kind of selector program in the first bank - these are all details I've attempted to describe in a separate document named [bank_switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md). For more information, also see the README that comes with each of the cartridges.

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation/schematic) and this is what you'll need to print and work your way through this things don't work as expected after assembly.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). Components in parenthesis can be considered optional to enable basic functionality, but where's the fun in that? You deserve the complete package.

| Reference             | Item                                                              | Count | Order  |
| --------------------- | ----------------------------------------------------------------- | ----- | ------ |
| Interface PCB         | Fabricate using Gerber files                                      |     1 | [PCBWay](https://www.pcbway.com/project/shareproject/ZX_Interface_2_021.html)
| Faceplate PCB *       | Fabricate using Gerber files                                      |    (1)| [PCBWay](https://www.pcbway.com/project/shareproject/ZX_Interface_2_021__Faceplate_FA1_.html)
| C1-C4,C6-C8           | 100nF ceramic capacitor (5mm pin spacing)                         |     6 |
| C5                    | 10uF 25v electrolytic capacitor (2mm pin spacing)                 |    (1)|
| D11                   | 5mm LED, preferably one that is frosted                           |     1 |
| D1-D10,D12-D16        | 1N4148 small signal diode (DO-35)                                 |    15 | 
| J1,J2                 | D-SUB 9 Pin Male straight round pin PCB connector                 |     2 |
| J3                    | 3pin right-angle pin-header (with jumper cap)                     |     1 |
| J4                    | Industrial Card Edge Slot Socket Connector 22x2P 44P 2.54mm 0.1"  |     1 |
| J5                    | 3pin straight pin-header (with jumper cap)                        |     1 |
| Q1                    | 2N3904 transistor (TO-92)                                         |     1 |
| R1-R5,R12             | 10k ohm resistor                                                  |     6 |
| R11,R13               | 1k ohm resistor                                                   |     2 |
| R14                   | 330 ohm resistor                                                  |     1 |
| R15                   | 20k ohm resistor                                                  |     1 |
| SW1,SW2               | 6x6x9mm momentary switch                                          |     2 |
| U1,U2                 | 74LS245 (DIP-20)                                                  |     2 |
| U3                    | 74LS27 (DIP-14)                                                   |     1 |
| U4                    | 74LS04 (DIP-14)                                                   |     1 |
| U6                    | 74LS273 (DIP-20)                                                  |     1 |
| U7,U8                 | 74LS138 (DIP-14)                                                  |     2 |
| Z1                    | Industrial Card Edge Slot Socket Connector 28x2P 56P 2.54mm 0.1"  |     1 |
| Metal nails           | Small metal nails used for keying edge connectors                 |     3 |
| Mounting **           | Nylon M3 hex standoffs 6mm (F-F)                                  |     6 |
| Mounting **           | Nylon M3 hex standoffs 8mm (M-F)                                  |    (6)|
| Mounting **           | Nylon M3x6mm nylon screws                                         |     6 |
| Mounting ***          | Nylon M3x10mm nylon screws                                        |    (4)|
| Mounting ***          | M3 nylon nut                                                      |   (12)|  

*) Check out [faceplate](https://github.com/tebl/ZX-Interface-2.021/tree/main/faceplates) section of this repository or [PCBWay shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021) for available options. The default one will be linked as the order URL.

**) These are used in various places of the project. You can usually find some kits for M3 nylon standoffs, but given the amounts we're using - it's a good idea to order extras as well. The F-F variants won't be included with the tip, but with some creative cutting and combining things you should be able to achieve the same results - the important part is the heights between the components. When not installing a faceplates you'll be able to save on these, just keep the 6mm tall standoffs on the bottom.

***) These are used when bolting the DB9 connectors to the PCB - you can do without them, but in order to reduce the wear and tear on the main PCB I recommend installing them. You can't add these after the DB9-connectors have been soldered into place, at least not easily.