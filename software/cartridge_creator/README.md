# Cartridge Creator
The *ZX Interface 2.021* supports more than a single 16K cartridge program, using a [bank switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md) technique implemented on the interface itself. However, the computer has no idea of how to deal with this and so the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) program was created in order to sit in the first 16K bank and allow the user to select which of the banks the user wants to start. The *loader.rom* includes hardcoded areas set aside for things such as individual bank titles as well as other things such as fonts and a boot screen.

I did not want to change the assembly source every time I wanted to change some of these details, nor did I want the user to deal with installing an assembler and making them learning how to use it. The solution I came up with is the *Cartridge Creator*, which is for the most part just a fancy name for a [Python](https://www.python.org/) script I put together in order to automate the task of customizing a resulting cartridge.

Currently it supports generating a blank cartridge, with a specified count of (E)EPROMs the user want to install on their cartridge as well as the size of them (mixing sizes is not supported). You can verify an existing cartridge definition, such as those included in the repository, as well as process a definiton in order to generate Intel HEX-files that can be used when [flashing](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md) the chips.

# 1> Requirements
The scripts do not require anything other than a standard installation of [Python](https://www.python.org/), it should be available for all of the modern operating systems. though I don't have the ability to test on anything other than my Windows laptop. There will be some Windows batch included in the project, you can use them if you prefer or you can have a look at their contents to determine what they're attempting to do. 

The *Cartridge Creator* should come with everyting you need to use it, *loader,rom* as well as the fonts are from the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) - that is also where you'll find source code can be found for these files. The batch files *assemble.bat* and *copy_loader.bat*, respectively take care of assembling the machine code as well as copy the resulting files into the expected locations. For regular use, unless you want to change parts of the code, you probably won't need to deal with these directly.

# 2> Using the tools
The *Cartridge Creator* is a command-line tool, it does not come with a graphical interface (for us Windows users starting up a new *Command Prompt*, usually just referred to as *cmd.exe*). You can get a brief descriptions of what each of the possible arguments that you can give by doing the following:
```
python cartridge.py --help
```
From looking at the file hierarchy, you can see that there is a subfolder called *cartridges* - when the tool refers to a cartridge name, it'll be a named directory found here. Supplied as part of the repository, you should have two of them already - one of them is a "blank" cartridge with placeholders that you can use as a template,  the other is a collection of BASIC replacements that can be used with the ZX Spectrum. The tool works by parsing the *_cartridge.ini* found within the folder.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_001.jpg)

When there is a reference to the **size** of an (E)EPROM, this refers to the name of the chips that are used. When using a 27C512, you'd specify 512 here - 27C256 is 256 and so it goes. In case you were wondering how a 64K (E)EPROM came to be specified as a 512, it's mainly just marketing - listing as thousands of Kilobits (Kb) instead of KiloBytes (KB) made it look like it was significantly more than you got. Just divide the number by 8 to get a sensible number, dividing that further by 16 gets you the number of 16K banks that we can put on the chip. Note that we always use the first one for the *Cartridge Loader*, meaning that for a 512 chip we'll be able to fit 3 banks of data on it.

The [ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%202021) installing two chips on the board itself, so you have the option of using 1 or 2 chips on these boards. The interface itself supports up to 4 chips, which is why the *Cartridge Creator* also support that **number** of chips.

## 2.1> Creating a blank cartridge
The tool comes with the command-line arguments for creating a new blank cartridge, this mostly just creates the directory structure as well as a few of the files that are needed for it to generate a cartridge. Most of the contents should be considered placeholders, so after running the command you'll need to edit the file *_cartridge.ini* afterwards. You will need to specify the size of (E)EPROMs that you intend to use as well as the number of these chips that you are going to install on the cartridge.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_002.jpg)

To create a new blank cartridge called *test*, using a single 27C512 chips you'd issue a command like the following (note that this will overwrite the contents if you specify a name already in use):
```
python cartridge.py --create test --chip-size 512 --chip-count 1
```
As long as the command finishes without any errors, you should now have an empty cartridge definition to work with - if you named it *test* as in the example, then you'll find the files in the directory named *cartridges/test*. You can refer to the pictures below.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_003.jpg)
![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_004.jpg)

As I went into detail on earlier, we have 3 slots available on a 512 chip (ROM 0-0 is taken up by the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader)). You can customize what you want in here, it is a configuration format just about anyone wanting to deal with old hardware should have come across before. The easiest ones to tackle are the titles, all you need to do is put in what you want here - as long as you keep it under 30 characters and don't use any weird non-ASCII characters.

For the ROMs, you just copy them into the folder and then copy the FileName into the file. The *blank.rom* just displays an image on the screen, so it is actually a valid ZX Spectrum machine code program though you'll no doubt have more interesting things to put in the slots. If you just want something to test things out with, you can find a few of the original cartridge titles on [www.fruitcake.plus.com](http://www.fruitcake.plus.com/Sinclair/Interface2/Cartridges/Interface2_RC_Cartridges.htm), they've also got a set of [Cassette Conversions](http://www.fruitcake.plus.com/Sinclair/Interface2/Cartridges/Interface2_RC_New_3rdParty_GameConversions.htm) that I've enjoyed immensely.

The *Cartridge Creator* also supports replacing a few of the assets used by the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader), you can uncomment the **BootScreen** option and supply it with a filename to change out the boot screens that shows when the computer is started. It expects a ZX Spectrum SCR-file, these can either be created by saving the contents of a screen in a ZX Spectrum emulator or you can download something from [zxart.ee](https://zxart.ee/eng/graphics/top-rated/) (click on the title of the picture to get to the download links).

**Font1** is used for the title at the top, **Font2** is used for the rest. The value here should match any of the fonts found within the fonts-directory, the case is ignored and the name corresponds to a file named *fonts/font_<name>.bin*. The fonts were adapted for the ZX Spectrum by Jim Blimey and there are pictures of each one on his [blog](https://www.jimblimey.com/blog/24-zx-spectrum-fonts/).

## 2.2> Verifying the cartridge
Somehow I ended up writing a lot of verification code to ensure that the options entered into the cartridge definition, for a description of most of the stuff that goes into them - see [Creating a blank cartridge](#21-creating-a-blank-cartridge). The idea is that you run through the verification routines and it spits out most of your errors in an understandable format.

The following command verifies the cartridge definition for a cartridge named *test*:
```
python cartridge.py --verify test
```
The output from my system is shown below, you just go through the list and ensure that the status of each task is listed with an *OK* in the second column. Relevant parameters should be listed along with it, check these sections of the configuration if you encounter any errors among the way - usually this is due to errors in filenames specified.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_005.jpg)

## 2.2> Processing cartridge
Processing a cartridge means actually going through the routines to generate the resulting *.bin* files (as well as Intel HEX files), these are the files that you need when you want to [flash your (E)EPROMs]([flashing](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md)). It's recommended that you [verify the cartridge](#21-verifying-the-cartridge) before going on with this step, mainly to catch the more obvious mistakes before using these routines - mainly because of the information overload.

The following command verifies the cartridge definition for a cartridge named test:
```
python cartridge.py --process test
```

The output from running this command on my system is shown below. The most important part is to ensure that the output is generated without any errors, for the most part you just check that most have a result listed as *OK*. The easiest is for the most part is to look for the part that reads *(E)EPROM image* near the end and ensure that it says *Size OK*, after that it'll have listed the status of the operation that took care of generating some Intel HEX files for use with your (E)EPROM Programmer.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_006.jpg)
