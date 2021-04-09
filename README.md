# ZX Interface 2.021
I woke up in the middle of the night with idea, and like most non-sensical ideas - they usually disappear in the morning. Can't remember what that idea was, but it was properly better than this one: recreating a simple version of the *ZX Interface 2* because I simply can't afford the prices the original ones are going for. Having made a few *improvements* to the original design, I was going to call it the *ZX Interface 2000* - that would however imply that I had put anything modern into it, so *ZX Interface 2.021* was the name I came up with instead. There's even a short video showing it running on [YouTube](https://youtu.be/rGyqisjjOV8).

![ZX Interface 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-01%2015.55.49.jpg)

There are other more modern implementations for putting together a ZX Spectrum cartridge solution, the Dandanator comes to mind, but I wanted something without the magic black boxes (MCUs, FPGAs or GALs) - my goal is that it should be easy to build and easy to understand. Also, I kind of like having various physical cartridges that can plug into it - so an actual cartridge slot was always a requisite for this project. 

![ZX Diagnostic 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-01%2002.16.15.jpg)

Over to the improvements then, of which there are mainly just one that hasn't already been mentioned (the first one being the elimination of custom IC, for which there are no replacements). The other one is that logic for bank switching has been integrated into the interface, in its current state it allows you to access up to 512k ROMs in 16k segments. Four of them actually, bringing the maximum addressable ROM up to a whopping 4096 MB (that's 4096KB, not merely 4 Mbit).

![ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_cartridge_004.jpg)
![ZX Diagnostic 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_diagnostic_007.jpg)

The cartridges available mostly will have some different attributes, so you'll need to check out the README for each one of them to access all relevant information. When starting out I recommend starting with the diagnostic cartridge, it supports a single EPROM of up to 64K - giving you access to four 16K ROM images that can be switched between. The ZX Spectrum computer doesn't exactly expect you to hot-swap them this way, so there is a need to add a loader program to ensure that the program starts correctly (until that actually exists, just switch active image and hit the NMI button - that usually works). The diagnostic software I'm using by Brendan Alford, will attempt to write state information to the LEDs on port 63. You can also play around with them directly from basic, just do an "*OUT 63, 255*" - to turn all of them on. Battlestar Galactica fans will intuitively know what tomorrows project ought to be!

![ZX Diagnostic 2.021 FA1](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_diagnostic_008.jpg)

The project includes a bunch of faceplates, they are mainly just there to look incredibly cool! Especially in black. While I've done a few pretty ones to match specific games, I've not obtained permission to include the likeness of any of the characters - for that reason, those have been intentionally kept separate from the github-repository. They may however show up in the gallery sections, because they exist and I had fun making them for my own personal enjoyment.

## Getting one
I don't have the capability of selling completed units or "kits" for building one, mainly due to health reasons. If you want one you will probably have to build it yourself, alternatively you could always call your favourite friend - preferably one that owns or is willing to buy a soldering iron of reasonable quality. The following links will point you to more information about the specific modules, including a list of the components that goes into building one of them (usually referred to as a BOM, or Bill of Manufacturing). The interface can be used as a standalone Sinclair joystick interface, but you'll more than likely want at least one of the cartridges to have something to plug into it as well.

* [ZX Interface 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Interface%202021)
* [ZX Diagnostic 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Diagnostic%202021)
* [ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%202021)
* [PCBWay shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021)

As with all things you're soldering together by yourself, the one who soldered it takes responsibility for it. I'll try answer any opened tickets as far as I am able, but know that this is a hobby-grade project and I might be busy spending what little energy I have on other things at the moment. Check out the [schematic](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation/schematic) while you wait - every problem is an opportunity for learning and there is a significant chance that it already contains the answer to your question.

## Setting it up
The *ZX Interface 2.021* has a handful of jumpers that need to be set correctly in order to keep everything working as intended (refer to image below for reference). The jumper in the top left corner is used to enable the joystick interface, put a jumper across pins 1-2 (the lower position) and it should provide you with many hours of joy with your favourite Atari-compatible stick.

![ZX Interface Jumpers](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/build_010.jpg)

The second jumper, middle right section allows you to hardcode one of the address lines used for bank switching. Setting it the lower position forces it high, in effect allowing you to quickly select between two 16k ROM images in the first and second bank - when all else fails. This is here as a way to swap between diagnostic images when the machine isn't capabable of doing this in the preferred way. In normal use, jumper across pins 1-2 (this is the upper position).

**NB!** As with all kinds of vintage electronics that you don't want to destroy, you shouldn't attempt to insert or remove a cartridge when the system is powered up. Ignoring this will either kill this interface, the cartridge or your computer - sometimes all of them.

## References
I'm not good enough to just intuitively know how everything works by looking at it, and especially the fact that I don't actually own a ZX Interface 2 means that this project didn't actually materialize out of nothing. I've tried adding a list below for my main inspirations when it comes to the inner workings of the design, it can be considered a safe assumption to consider the bugs implemented - mine alone. For the stuff that actually works, I recommend having a read-through of the following pages:

* http://www.users.globalnet.co.uk/~jg27paw4/yr01/yr01_58.htm
* http://www.users.globalnet.co.uk/~jg27paw4/yr03/yr03_19.htm#Buffer
* http://www.users.globalnet.co.uk/~jg27paw4/yr04/yr04_25.htm
* https://k1.spdns.de/Vintage/Sinclair/82/Doityourself/IF2%20cartridges/
* https://blog.gjmccarthy.co.uk/wp-content/uploads/2019/12/how.html
* http://www.fruitcake.plus.com/Sinclair/Interface2/Interface/Interface2_Circuitry.htm