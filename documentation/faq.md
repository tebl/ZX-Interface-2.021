# FAQ
You probably have a lot of questions and while I sometimes appear to have them, they're usually a best-effort sort of thing. Electronics is not my day job, I actually don't one as I'm currently suffering from a chronic illness that severely limits my ability to function beyond basic day-to-day stuff. I dabble in electronics when I have the energy to do so, because everyone needs a hobby and I find that building simple things gives me a sense of accomplishment though it might not seem like much to actual EE-engineers.

The files made available through any of my repositories are free, but that those not mean that they come without any sort of limitations. Read through the [LICENSE](https://github.com/tebl/ZX-Interface-2.021/blob/main/LICENSE.txt) if you want to, but for most practical purposes - the most important one is that the software and hardware designs come without anything even resembling a warranty. If you soldered it together, you take full responsibility for it (intended or accidental). If you connected it, ran it or powered it up - you're still responsible. I will however attempt to help you to the best of my abilities.

For anything else not answered up until this point, I've attempted to organize things into relevant sections below. Again, to the best of my abilities - which may at times be somewhat limited.

- [1> General](#1-general)
  - [1.1> Why did you make it?](#11-why-did-you-make-it)
  - [1.2> How can I help?](#how-can-i-help)
  - [1.3> Is this the same as a ZX Interface 2?](#13-is-this-the-same-as-a-zx-interface-2)
  - [1.4> Can I use my original cartridges?](#14-can-i-use-my-original-cartridges)
  - [1.5> Can I sell these?](#15-can-i-sell-these)
  - [1.6> Did you design this from scratch?](#15-did-you-design-this-from-scratch)
- [2> Hardware](#2-hardware)
  - [2.1> Can you build me one?](#21-can-you-build-me-one)
  - [2.2> Where can I get the PCBs?](#22-where-can-get-the-pcbs)
  - [2.3> Is it compatible with the…?](#23-is-it-compatible-with-the)
  - [2.4> What joysticks can I use?](#24-what-joysticks-can-i-use)
  - [2.5> Where’s the BOM?](#25-wheres-the-bom)
  - [2.6> It doesn’t work, why doesn’t it work?](#26-it-doesnt-work-why-doesnt-it-work)
- [3> Software](#3-software)
  - [3.1> How do I put something on my cartridge?](#31-how-do-i-put-something-on-my-cartridge) 

# 1> General
## 1.1> Why did you make it?
As previously mentioned, probably because I saw it done somewhere or read about it somewhere - and - wanted one. I mainly build simple things, usually related to 8bit computers as most of those were at one point simple enough that I can figure out how the work using various descriptions found online or in my extensive library of outdated reference books.

Usually I enjoy drawing or building projects more than using them, so if I can - I do it is as a little hobby project rather than just buy one that is ready-made (as long as the skills required appears to be within my limitations). I can spend a month doing tiny little increments, build it and if it works - I usually just put it in a drawer and wonder about what to do next.

When it comes to the expensive stuff, I can't afford them. So my options are either to save up for them over extended periods of time or build them. For the excessively expensive stuff, I have to convince myself that I don't need them.

## 1.2> How can I help?
There are many ways that you can help out with projects such as this, the easiest way is to just share your pictures and the fun you had building and using it - that's inspiring for aspiring hobby-tinkerers such as myself. If you find problems and have some bit of knowledge that you feel should exist somewhere within the repository, that is also a great way to contribute.

A PCB is cheap once it is ready for use, but there are usually several versions that never worked sufficiently - every time, I'm paying out of my own pocket to the PCB fabrication company, shipping and finally the import fees collected by the country where I live. For these three alone, a project usually is in the scale of a few hundred dollars. When ordering PCBs via projects that I've shared on [PCBway](https://www.pcbway.com/project/member/?bmbno=04C9EDC7-08B5-43), you can get one without dealing with most of the difficult questions as well as give me a small discount on my next order - you can also get a list of all projects related to the [ZX Interface 2.021](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021).

If on the other hand, you'd like to buy me a cup of coffee instead - there's a button below for that stuff.

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/teblunde)

## 1.3> Is this the same as a ZX Interface 2?
The original ZX Interface 2 from Sinclair used a custom IC that doesn't have any direct replacements, which is why the ZX Interface 2.021 uses quite a lot of components in an attempt to replace it. One feature that the original interface supports, that my version of the interface does not - is the machine can't tell the difference between a keyboard press and a button or direction pushed on any of the joystick ports. For all practical purposes, both interfaces function the same.

[Bank switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md) was added directly to the Interface 2.021, this means that you no longer need to implement this on every cartridge. Building a [ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%202021) only requires the (E)EPROM and nothing else, meaning that you can easily build all of the cartridge you'd ever want with just a handful of components.

Yes, but no - mostly it's  more.

## 1.4> Can I use my original cartridges?
I don't own any original cartridges, I can't even afford them and I've never actually seen one - so I can't give you a straight answer here. What I can say is that I've tested it with reproduction cartridges that were designed for the original ZX Interface 2, those worked without any issues so it's unlikely that you'd have any issues using them. If in doubt, send me an original cartridge - I promise that someone'd have to pry it from my cold, dead hands to get it back from me. 

## 1.5> Can I sell these?
Yes, but please treat your customers kindly - be prepared to support them as I have limited capacity to do so. Don't charge more than what is reasonable. If you'd like to support the project, consider contributing towards improving the project with your experiences from doing so. I'd appreciate it if you ordered your PCBs via my [PCBway shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021), but I understand that you'd probably use your own favourite PCB fabrication company. Alternatively, you could simply buy me a coffee instead.

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/teblunde)

## 1.6> Did you design this from scratch?
No. I'm not good enough to just intuitively know how everything works - not even by sniffing the air around it, which is something I can't do since I simply don't own one. When it comes to technology, nothing ever comes out of nothing - everything is built upon the knowledge on things that came before it. I've tried to maintain a list of my primary sources of information when it comes to the inner workings of this design below, mainly because I repeatedly fail at finding my previous set of bookmarks. It's a safe assumption to consider that the bugs added, are probably mine alone.

* http://www.users.globalnet.co.uk/~jg27paw4/yr01/yr01_58.htm
* http://www.users.globalnet.co.uk/~jg27paw4/yr03/yr03_19.htm#Buffer
* http://www.users.globalnet.co.uk/~jg27paw4/yr04/yr04_25.htm
* https://k1.spdns.de/Vintage/Sinclair/82/Doityourself/IF2%20cartridges/
* https://blog.gjmccarthy.co.uk/wp-content/uploads/2019/12/how.html
* http://www.fruitcake.plus.com/Sinclair/Interface2/Interface/Interface2_Circuitry.htm
* http://trastero.speccy.org/cosas/droy/cartuchos/cartuchos_s.htm

# 2> Hardware
## 2.1> Can you build me one?
I unfortunately don't have the energy necessary to build more than my own prototypes, which is why they're available for *free* instead of being put on a web-shop somewhere. That's a good thing, it means you have everything I have so you can build as many as you'd like. At times there *may* be other people selling them, so consider asking on facebook groups related to the computer this project belongs to.

I take pride in doing simple things that anyone with access to decent tools should be able to build - using only the cheapest ebay parts. If someone is charging more than a moderate amount of money for them, I recommend you build it yourself - you'll enjoy it more as well.

## 2.2> Where can I get the PCBs?
- You can ask in your favourite facebook group, in particular those that specificly discuss vintage computers, to see if someone has extras.
- You can order them from [PCBway](https://www.pcbway.com/setinvite.aspx?inviteid=88707), that way you don't need to deal with Gerber files and figure out how to fill in the order forms. Add them to the cart, then someone from PCBway will come along and verify that everything looks right - only at that point can you pay for the order. Check out my [shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021) related to the *ZX Interface 2.021*.
- You can have them produced used the Gerber-files found within this repository, usually what they'll want is a zipped-up copy of the files found within each projects *export* directory. Fill in the options you need, what you'd need is two-layer PCB though there might be a few different values you'd need to fill in correctly.

## 2.3> Is it compatible with the...?
If the *...* is a *ZX Spectrum 48K* computer, either the rubber-keyed one that we all know and love - or - the *ZX Spectrum+*. Clones of these computers should also work, in fact I'm primarily using it on a ZX Harlequin 48K computer - which is why mine is the white variety as shown below.

![ZX Harlequin](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-25%2021.40.32.jpg)

For anything else, probably not.

It might work, it might not work, it might kill your computer and/or peripheral that you somehow managed to connect together. This is not a limitation of my design, for the most part it is the limitations of the original hardware. Most peripherals of the day simply weren't meant to be used together and without detailed of how a peripheral functions - I couldn't even pretend to know what would happen if you chose to combine them.

Except tape players, those are safe.

## 2.4> What joysticks can I use?
Contrary to popular misconceptions, the original ZX Interface 2 supported standard Atari-style joysticks. The pinouts were shuffled around with the release of the ZX Spectrum +2 computer, this was an attempt by new owner - Amstrad - to force their customers to buy their vastly inferior SJS-line of joysticks.

The ZX Interface 2.021 retains the original port pinouts, meaning that most Atari-style joysticks should function properly as long as it doesn't require a power source to work. Most joysticks produced for the Atari 2600, Commodore 64, Commodore Amiga or simply marked Kempston-compatible should be sufficient.

## 2.5> Where's the BOM?
The BOM (*Bill of Manufacturing*) is the list of components needed to build the ZX Interface 2.021, so where is it? That depends on your definition of what a BOM should look like. I unfortunately can't afford the rather extreme import and shipping costs associated with ordering from mouser, digikey and similar professional sites, so I can't provide you with the specific part numbers for those sites as I don't have the ability to verify their suitability - I would rather redesign to avoid parts that are only found on those sites. Sorry, but until the country I live decide that importing across country-lines isn't an inherent evil - then this probably won't change.

The parts I use primarily come from sources such as ebay, aliexpress or banggood. Unfortunately these sites aren't exactly known for being particularly detailed when it comes to sales listings, but on the other hand most of them only sell the same parts. My BOMs can therefore be considered as a general search query, then usually you'd need to compare the pictures to see if the listing matches what has been used. This does lead to some open questions, this is unavoidable, but usually you could order a couple of different options for a modest amount of money.

Each of the main project modules have their own BOM, most of them should have been linked here: 
- [ZX Interface 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Interface%202021#3-bom)
  - [ZX Diagnostic 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Diagnostic%202021#3-bom)
  - [ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%202021#3-bom)
- [ZX Cartridge 1.983](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%201983#3-bom)

## 2.6> It doesn't work, why doesn't it work?
I try my best to make my designs easy to build, but that doesn't mean everyone's guaranteed success on their first attempt at building one. All is definitely not lost though, what you've earned is the perfect chance to learn more than you've bargained for. Start by doing a visual inspection, check that every components that have a polarity (meaning that they go in a certain way) is in the same orientation as can be seen in the pictures. Look for jumpers that are missing, pins you've forgotten to solder or simply accidentally bridged.

With all of the easy stuff out of the way, now comes the time that you'll need to learn how to decipher a [schematic](https://github.com/tebl/ZX-Interface-2.021/tree/main/documentation/schematic). They're more of a logical view of how the components work together, not the physical location of them, but you shouldn't have any problems finding out which part part connects given the time - a pro tip is to print it to paper and then mark, note down your findings along the way. The designs are simple and should for the most part be easy to follow using a multimeter, allowing you to observe or decide how to isolate the problem to a specific area.

If all of that fails, you could always open a ticket here on github. Alternatively, you could always ask on any of the ZX Spectrum facebook groups to see if someone knows what the problem would appear to be. 

# 3> Software
## 3.1> How do I put something on my cartridge?
This depends somewhat on which type of cartridge you mean, but for the resmainder of this answer I'll assume you mean either the ZX Cartridge 2.021 or the ZX Diagnostic 2.021. In the case of the [ZX Cartridge 1.983](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%201983), I recommend that you take a look at [combining ROM files](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md#11-combining-roms) directly as it does not support [bank switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md) like the other two.

For the other two, I've put together a piece of software that I've creatively called the [Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator) in order to prepare a *.bin* or *.hex* suitable for [flashing onto an (E)EPROM using](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md) an (E)EPROM Programmer. Check out [Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_creator) for all of the details, but in shorter terms you find the ROM-files you want to put onto the same cartridge or you can put a single .sna (*snapshot*) file on one of them - the tool will take care of preparing the image for you.