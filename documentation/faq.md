# FAQ
You probably have a lot of questions and while I sometimes appear to have them, they're usually a best-effort sort of thing. Electronics is not my day job, I actually don't one as I'm currently suffering from a chronic illness that severely limits my ability to function beyond basic day-to-day stuff. I dabble in electronics when I have the energy to do so, because everyone needs a hobby and I find that building simple things gives me a sense of accomplishment though it might not seem like much to actual EE-engineers.

The files made available through any of my repositories are free, but that those not mean that they come without any sort of limitations. Read through the [LICENSE](https://github.com/tebl/ZX-Interface-2.021/blob/main/LICENSE.txt) if you want to, but for most practical purposes - the most important one is that the software and hardware designs come without anything even resembling a warranty. If you soldered it together, you take full responsibility for it (intended or accidental). If you connected it, ran it or powered it up - you're still responsible. I will however attempt to help you to the best of my abilities.

For anything else not answered up until this point, I've attempted to organize things into relevant sections below. Again, to the best of my abilities - which may at times be somewhat limited.

- [1> General](#general)
- [2> Hardware](#hardware)
- [2> Software](#software)

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

## 1.3> Can I sell these?
Yes, but please treat your customers kindly - be prepared to support them as I have limited capacity to do so. Don't charge more than what is reasonable. If you'd like to support the project, consider contributing towards improving the project with your experiences from doing so. I'd appreciate it if you ordered your PCBs via my [PCBway shared projects](https://www.pcbway.com/project/shareproject/?tag=ZX%20Interface%202.021), but I understand that you'd probably use your own favourite PCB fabrication company. Alternatively, you could simply buy me a coffee instead.

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/teblunde)

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

It might work, it might not work, it might kill your computer and/or peripheral that you somehow managed to connect together. This is not a limitation of my design, for the most part it is the limitations of the original hardware. Most peripherals of the day simply weren't meant to be used together and without detailed of how a peripheral functions - I couldn't even pretend to know what would happen if you chose to combine them. Except tape players, those are safe.

## 2.4> What joysticks can I use?
Contrary to popular misconceptions, the original ZX Interface 2 supported standard Atari-style joysticks. The pinouts were shuffled around with the release of the ZX Spectrum +2 computer, this was an attempt by new owner - Amstrad - to force their customers to buy their vastly inferior SJS-line of joysticks.

The ZX Interface 2.021 retains the original port pinouts, meaning that most Atari-style joysticks should function properly as long as it doesn't require a power source to work. Most joysticks produced for the Atari 2600, Commodore 64, Commodore Amiga or simply marked Kempston-compatible should be sufficient.

# 3> Software
Nothing here.