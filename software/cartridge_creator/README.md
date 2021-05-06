# Cartridge Creator
The *ZX Interface 2.021* supports more than a single 16K cartridge program, using a [bank switching](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/bank_switching.md) technique implemented on the interface itself. Unfortunately the computer has no concept of how to deal with bank switching by itself, so the we'll to add some sort of software to the machine to help it along.

![ZX Interface 2.021](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/2021-04-25%2021.40.32.jpg)

These are the various loader programs found within the repository, the first one is [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) and allows you to create compilations of 16K ROM files such as those released for the original ZX Interface 2 (complete with a boot screen and menu to select between them). The second one is the [Snapshot Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/snapshot_loader) and allows you to load and restore a snapshot file from the cartridge.

I did not want to change the assembly source every time I wanted to change out the program content or any of the settings, nor did I want the user to deal with installing an assembler and making them learning how to use it - the solution I came up with for all this is the *Cartridge Creator*. In reality it's just a fancy name for a [Python](https://www.python.org/) script, but it takes out a lot of the trial and error that would usually be associated with trying to do a lot of little things manually.

- [1> Requirements](#1-requirements)
- [2> Using the tools](#2-using-the-tools)
  - [2.1> Creating a blank cartridge](#21-creating-a-blank-cartridge)
    - [2.1.1> Creating a standard cartridge](#211-creating-a-standard-cartridge)
    - [2.1.2> Creating a snapshot cartridge](#212-creating-a-snapshot-cartridge)
  - [2.2> Verifying a cartridge](#22-verifying-a-cartridge)
  - [2.3> Processing cartridge](#23-processing-cartridge)
- [Appendix A> Command-line arguments](#appendix-a-command-line-arguments)
- [Appendix B> Cartridge defition](#appendix-b-cartridge-definition)
  - [B.1> 'standard' cartridge](#b-1-standard-cartridge)
  - [B.2> 'snapsho' cartridge](#b-1-snapshot-cartridge)
- [Appendix C> Attributes](#appendix-c-attributes)

# 1> Requirements
The scripts do not require anything other than a standard installation of [Python](https://www.python.org/), it should be available for all of the modern operating systems. though I don't have the ability to test on anything other than my Windows laptop. There will be some Windows batch included in the project, you can use them if you prefer or you can have a look at their contents to determine what they're attempting to do. 

The *Cartridge Creator* should come with everyting you need to use it, *loader.rom* as well as the fonts are from the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader) - that is also where you'll find source code can be found for these files. Likewise, there are also files from the [Snapshot Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/snapshot_loader) that will be used depending on the arguments used with the tool. The batch files *assemble.bat* and *copy_loader.bat*, respectively take care of assembling the machine code as well as copy the resulting files into the expected locations. For regular use, unless you want to change parts of the code, you probably don't want deal with these directly and so you wouldn't need to go through installing the assembler I'm using.

# 2> Using the tools
The *Cartridge Creator* is a command-line tool, it does not come with a graphical interface (for us Windows users starting up a new *Command Prompt*, usually just referred to as *cmd.exe*). You can get a brief descriptions of what each of the possible arguments that you can give by doing the following:
```
python cartridge.py --help
```
From looking at the file hierarchy, you can see that there is a subfolder called *cartridges* - when the tool refers to a cartridge name, it'll be a named directory found here. Supplied as part of the repository, you should have two of them already - one of them is a "blank" cartridge with placeholders that you can use as a template,  the other is a collection of BASIC replacements that can be used with the ZX Spectrum. The tool works by parsing the *_cartridge.ini* found within the folder. See [Appendix A> Command-line arguments](#appendix-a-command-line-arguments) for a more comprehensive description.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_001.jpg)

## 2.1> Creating a blank cartridge
The tool comes with the command-line arguments for creating a new blank cartridge, this mostly just creates the directory structure as well as a few of the files that are needed for it to generate a cartridge. Most of the contents should be considered placeholders, so after running the command you'll need to edit the file *_cartridge.ini* afterwards.

As there are two different loaders included in the project, there's two different cartridge types that can be created using the same tool. The **standard** cartridge are those created for use with the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader), this variant allows you to create compilations of 16K ROM files such as those released for the original ZX Interface 2 (complete with a boot screen and menu to select between them). The second is the **snapshot** cartridge, they're created using the [Snapshot Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/snapshot_loader) - allowing you to restore a snapshot file from a cartridge.

### 2.1.1> Creating a standard cartridge
The [ZX Cartridge 2.021](https://github.com/tebl/ZX-Interface-2.021/tree/main/ZX%20Cartridge%202021) installing two chips on the board itself, so you have the option of using 1 or 2 chips on these boards. The interface itself supports up to 4 chips, which is why the *Cartridge Creator* also support that **number** of chips. You will need to specify the size of (E)EPROMs that you intend to use as well as the number of these chips that you are going to install on the cartridge.

When there is a reference to the **size** of an (E)EPROM, this refers to the name of the chips that are used. When using a 27C512, you'd specify 512 here - 27C256 is 256 etc. In case you were wondering how a 64K (E)EPROM came to be specified as a 512, it's mainly just marketing - listing as thousands of Kilobits (Kb) instead of KiloBytes (KB) made it look like it was significantly more than you got. Just divide the number by 8 to get a sensible number, dividing that further by 16 gets you the number of 16K banks that we can put on the chip. The first bank will always be used by the [Cartridge Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/cartridge_loader), meaning that for a 512 chip we'll be able to fit 3 banks of data on it (4 on subsequent chips).

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_002.jpg)

To create a new standard cartridge called *test*, using a single 27C512 chips you'd issue a command like the following (note that this will overwrite the contents if you specify a name already in use):
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

### 2.1.2> Creating a snapshot cartridge
The snapshot cartridge, allows you to use ZX Spectrum [*.SNA*](https://worldofspectrum.org/faq/reference/formats.htm)-files instead of the traditional 16K ROM-files supported by the standard cartridge. What this means is that you aren't limited by the original 10 titles released for the ZX Interface 2, instead you'll have access to thousands of them instead. The [Snapshot Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/snapshot_loader) takes care of most of the complexity running on the ZX Spectrum itself, but the *Cartridge Creator* will take care of packaging the 48K snapshot data along with the loader itself on a single 27C512 or W27C512 (E)EPROM chip.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_012.jpg)

To create a new snapshot cartridge called *test*, you'd issue a command like the following (note that this will overwrite the contents if you specify that is already in use):
```
python cartridge.py --create test --cartridge-type snapshot
```
As long as the command finishes without any errors, you should now have an empty cartridge definition to work with - if you named it *test* as in the example, then you'll find the files in the directory named *cartridges/test*. You can refer to the pictures below.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_013.jpg)
![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_014.jpg)

The file *_cartridge.ini* defines how the script works, for the most part it should be familiar to anyone who's ever taken look at a standard ini-file before (given that you're interested in old stuff, I'll take that bet). Most of the settings that are there at the moment can be considered placeholders and while you actually could run it as it is, it probably won't be all too exciting stuff apart from showing that everything works as expected.

Put the snapshot-file that you want to use and copy it into the folder, then change the *FileName* option to match. The only other setting that you might need to deal with is *LoaderAddress*, it is used to override the current behavior of [Snapshot Loader](https://github.com/tebl/ZX-Interface-2.021/tree/main/software/snapshot_loader) when it comes to the final steps necessary to restore the snapshot - it is a routine that needs to be stored in RAM as we'll be banking out the cartridge in favor of the original ZX Spectrum ROM. Leaving it commented out or set to 0x0000, means that we'll try to put this routine below the system stack - possibly overwriting some parts of the program. If you experience a program where this destroys something that is needed for the game to work, you can specify a different address to use here instead. Finding a suitable location may require loading the snapshot in an emulator, then opening up the debugger or memory browser within it and look for a space that is at least 17 bytes then try again.

## 2.2> Verifying a cartridge
Somehow I ended up writing a lot of verification code to ensure that the options entered into the cartridge definition, for a description of most of the stuff that goes into them - see [Creating a blank cartridge](#21-creating-a-blank-cartridge). The idea is that you run through the verification routines and it spits out most of your errors in an understandable format.

The following command verifies the cartridge definition for a cartridge named *test*:
```
python cartridge.py --verify test
```
The output from my system is shown below, you just go through the list and ensure that the status of each task is listed with an *OK* in the second column. Relevant parameters should be listed along with it, check these sections of the configuration if you encounter any errors among the way - usually this is due to errors in filenames specified.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_005.jpg)

## 2.3> Processing cartridge
Processing a cartridge means actually going through the routines to generate the resulting *.bin* files (as well as Intel HEX files), these are the files that you need when you want to [flash your (E)EPROMs]([flashing](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md)). It's recommended that you [verify the cartridge](#22-verifying-a-cartridge) before going on with this step, mainly to catch the more obvious mistakes before using these routines - mainly because of the information overload.

The following command verifies the cartridge definition for a cartridge named test:
```
python cartridge.py --process test
```

The output from running this command on my system is shown below. The most important part is to ensure that the output is generated without any errors, for the most part you just check that most have a result listed as *OK*. The easiest is for the most part is to look for the part that reads *(E)EPROM image* near the end and ensure that it says *Size OK*, after that it'll have listed the status of the operation that took care of generating some Intel HEX files for use with your (E)EPROM Programmer.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_006.jpg)

Note that depending on the type of cartridge specified, you may have more than one output file generated and you should in those cases use the same size of (E)EPROMs and in the capacity specified (mixing of sizes is not supported by any of the loaders). As previously mentioned, head on over to [flashing (E)EPROMs](https://github.com/tebl/ZX-Interface-2.021/blob/main/documentation/flash_eeprom.md) for instructions on using one of the more common (E)EPROM Programmers (Minipro TL866).

# Appendix A> Command-line arguments
The main executable script file, *cartridge.py* supports a number of command-line arguments - most of which should be straight-forward. Most of the commands take a directory name as one or more parameters, these should correspond to a directory found within the *cartridges*-directory and will be referred to as *<dirname>*. Where certain arguments are only relevant in combination with a specific cartridge type, I've listed those specifically under *Cartridge type*.

| Argument                    | Cartridge type | Description |
| --------------------------- | -------------- | ----------- |
| -c, --create <dirname>      |                | Creates one or more empty cartridges, with <dirname> as specified. See *-t* to specify which cartridge type is used on creation, *standard* will be used if nothing else is specified.
| -cs, --chip-size <size>     | standard       | When creating a standard cartridge, specifies the size of the (E)EPROMs to be used. Specify 512 for 27C512, the number must be a multiple of 128 as that is the smallest unit.
| -cc, --chip-count <number>  | standard       | When creating a standard cartridge, specifies the number of (E)EPROMs to be physically installed on the cartridge. Valid values are from 1 to 4.
| -t, --cartridge-type <type> |                | When creating a cartridge, this specifies the type of cartridge that will be created. Valid types are either *standard* or *snapshot*.
| -p, --process <dirname>     |                | Processes a cartridge definition, <dirname> specifies the name of directory found within the *cartridge*-subdirectory. The command will generate *.bin*- and *.hex*-files to be flashed onto one or more (E)EPROMs (depending on cartridge type).
| -h, --help                  |                |  List recognized program arguments
| -v, --verify <dirname>      |                | Verifies the contents of a cartridge definition, <dirname> specifies the name of directory found within the *cartridge*-subdirectory. The command will attempt to sanity check all configured options. This step is recommended before you --process a definition.
| --version                   |                | Displays the scripts name and version, for reference. When in doubt, try to update and use the latest version of the files. 

# Appendix B> Cartridge definition
A cartridge definition will be named *_cartridge.ini*, found within the a named subdirectory within the folder named *cartridges* ([commands](#appendix-a-command-line-arguments) expects this in place of "*<dirname>*"). The structure of the file should be familiar to anyone with a passing experience with *.ini*, standard in the last truly great version of *MS Windows (3.11)*.

![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_014.jpg)

The configuration is divided into sections, the start of each of these is specified by placing the name of them within square brackets. Options are specified by name, value after the equal sign as expected. Any lines starting with a semi-colon have been commented out, the program will usually add most of these as an example of what is supported. Several cartridge types are supported, but given that they have different behavior these will be described in separate subchapters - note that some of these will have more than one section.

## B.1> 'standard' cartridge
![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_004.jpg)

| Section          | Option         | Required | Description |
| ---------------- | -------------- | -------- | ----------- |
| **[Cartridge]**  |                | Yes      | Start of the cartridge definition.
|                  | Title          | Yes      | Specify the name of the cartridge, this will be displayed at the top of the menu screen. Supports up to 30 ASCII letters.
|                  | ChipSize       | Yes      | Specifies the size of the (E)EPROMs to be used, it is specified as it is specified on the chip themselves - in thousands of kilobits. Specify 512 for 27C512 and so on, the number must be a multiple of 128.
|                  | ChipCount      | Yes      | Specifies the number of (E)EPROMs to be physically installed on the cartridge, valid values are from 1 to 4.
|                  | BaseName       | Yes      | Specifies the filename used when generating files (*.bin* and *.hex*)
|                  | BasePath       |          | Specifies a base-path used for all generated files (*.bin* and *.hex*), using a relative value such as "..\\..\\" will place files in the main script directory.
|                  | BootScreen     |          | Specify the filename of an SCR-file that will be used as a boot screen, this will be displayed for a few seconds before displaying the menu. For a tool to create your own, see [img2spec](https://github.com/jarikomppa/img2spec)
|                  | Font1          |          | Specifies the name of the font that will be used for the title-section of the menu. The font name is expected to correspond to a file within the *fonts*-directory, named in the format of *font_<name>.bin*
|                  | Font2          |          | Same as above, except this affects the text used in the other sections of the menu such as the slot titles.
| **[ROM X-Y]**    |                | Yes      | Specifies the start of a slot definition, X designates the chip ID with Y specifying slot ID (the IDs are numbered from 0). Note that these must be specified according to *ChipCount* and *ChipSize* specified, as the *Cartridge Loader* program takes up [ROM 0-0] there is no definition for it.
|                  | Title          | Yes      | Specifies the title of a specific slot, it will be displayed in the menu as a selectable title. Supports up to 30 ASCII letters.
|                  | FileName       | Yes      | Specifies the name of the ROM-file, the file is expected to have been placed within the cartridge definition folder.
| **[Attributes]** |                |          | Can optionally be used to specify text attributes used with various parts of the cartridge menu, see [Appendix C> Attributes](#appendix-c-attributes) for more information on valid combinations of values.
|                  | Border         |          | Specify the colour of the border while displaying the boot screen, usually to match the **BootScreen** used. Only supports colours, other attributes are not supported.
|                  | BorderMenu     |          | Specify the colour of the border when displaying the menu, Only supports colours, other attributes are not supported.
|                  | DefaultText    |          | Default text attributes, this is used when normally displaying text.
|                  | ProgramTitle   |          | Specify the attributes used with the program title at the top of the menu, also controls the appearance of the box around the title section.
|                  | CartridgeTitle |          | Specify the attributes used with the title of the cartridge, as specified by the *Title*-option in the *Cartridge*-section.
|                  | InactiveRow    |          | Used on rows corresponding to slots that are currently not selected.
|                  | ActiveRow      |          | Used on the row corresponding to the currently selected slot.
|                  | HelpText       |          | Used with the help text at the bottom of the screen, usually giving instructions for valid key combinations.
|                  | ErrorText      |          | Appearance of text on the error screen (if you are lucky enough to find it).
|                  | ErrorTitle     |          | Appearance of title on the error screen (if you are lucky enough to find it).

## B.2> 'snapshot' cartridge
![Cartridge Creator](https://github.com/tebl/ZX-Interface-2.021/raw/main/gallery/cartridge_creator_014.jpg)

| Section          | Option        | Required | Description |
| ---------------- | ------------- | -------- | ----------- |
| **[Cartridge]**  |               | Yes      | Start of the cartridge definition.
|                  | Type          | Yes      | Defines the type of cartridge that this file describes, for a *snapshot* cartridge this must be set to **snapshot**,
|                  | BaseName      | Yes      | Specifies the filename used when generating files (*.bin* and *.hex*)
|                  | BasePath      |          | Specifies a base-path used for all generated files (*.bin* and *.hex*), using a relative value such as "..\\..\\" will place files in the main script directory.
|                  | LoaderAddress |         | Can be used to specify where the last bit of the snapshot loader routines will be placed in RAM, this will override the default behavior of trying to place it directly below current stack pointer. The routines require 13 bytes of memory, the only way of figuring out a suitable place may be to use an emulator.

# Appendix C> Attributes
The **standard** cartridge type functions by adding a menu that is loaded from the first ROM slot, enabling you to interactively select between the remaining available slots. The menu appearance of the menu can be customized through the use of relevant definition keys, see [Appendix B> Cartridge definition](#appendix-b-cartridge-definition) for more information on what these are. Attributes is specified by adding the name to the value, separating multiple values by spaces where this is possible (borders only support a single colour). The following case-sensitive values are recognized:

| Name             | Description |
| ---------------- | ----------- |
| BLACK            |
| BLUE             |
| RED              |
| MAGENTA          |
| GREEN            |
| CYAN             |
| YELLOW           |
| WHITE            |
| BLACK_PAPER      |
| BLUE_PAPER       |
| RED_PAPER        |
| MAGENTA_PAPER    |
| GREEN_PAPER      |
| CYAN_PAPER       |
| YELLOW_PAPER     |
| WHITE_PAPER      |
| BRIGHT           | Affects colour brightness. Bright colours are the clearest, non-bright colours have a darker and slightly muddier appearance.
| FLASH            | The contents will flash, colour attributes for text and paper will alternate.