import os
import sys
from argparse import ArgumentParser
from cartridge_file import CartridgeFile
from settings import Settings

settings = Settings('cartridge.ini')

def create(name, chip_size, chip_count):
    dir_path = os.path.join('cartridges', name)
    CartridgeFile.create(dir_path, chip_size, chip_count)

def verify(name):
    '''
    Attempts to verify the cartridge configuration matching the directory
    name supplied. For the most part it should be able to tell you when
    something's a little bit iffy, but it will crash on you.
    '''
    dir_path = os.path.join('cartridges', name)
    file = CartridgeFile(dir_path, settings)
    file.verify()

def process(name):
    '''
    Process cartridge configuration, this will go through the configuration
    file and use the settings added to generate a bin-file suitable for
    flashing onto an (E)EPROM.
    '''
    dir_path = os.path.join('cartridges', name)
    file = CartridgeFile(dir_path, settings)
    file.process()

def parse_arguments():
    '''
    Parses command line arguments and runs the appropriate tasks.
    '''
    help_text = '''
    This is a simple tool for the ZX Interface 2.021, it is used to assemble
    cartridge files for flashing onto (E)EPROM chips. The loader will always
    be used as the first bank of program data, the rest can be configured to
    any 16K ROM.
    '''
    parser = ArgumentParser(description=help_text)
    parser.add_argument('-c', '--create', help='Create a new empty cartridge configuration for later customization', nargs='*', default=[])
    parser.add_argument('-cs', '--chip-size', help='Cartridge chip size to use with create', type=chip_size, default=512)
    parser.add_argument('-cc', '--chip-count', help='Cartridge chip count to use with create', type=chip_count, default=1)    
    
    parser.add_argument('-p', '--process', help='Process cartridge configuration', nargs='*', default=[])
    parser.add_argument('-v', '--verify', help='Verify cartridge configuration', nargs='*', default=[])    
    parser.add_argument('--version', action='version', version='Cartridge parser 1.0')
    args = parser.parse_args()

    errors = False
    for dirname in args.create:
        create(dirname, args.chip_size, args.chip_count)
    
    for dirname in args.verify:
        try:
            verify(dirname)
            print()
        except Exception as err:
            errors = True
            print("Uncaught exception verifying {0} ({1})".format(dirname, err))

    if not errors:
        for dirname in args.process:
            try:
                process(dirname)
                print()
            except Exception as err:
                print("Uncaught exception processing {0} ({1})".format(dirname, err))
        
    print("Done.")

def chip_size(string):
    '''
    Converts specified chip size into something that can be used with the
    create function, it'll do some simple verification to ensure that it looks
    OK.
    '''
    value = int(string)
    if value == 0:
        raise ValueError(f"Can't be zero")
    if (int(value / 128) * 128) != value:
        raise ValueError(f"{string} does not appear to be a valid chip size")
    return value

def chip_count(string):
    '''
    Converts specified chip size into something that can be used with the
    create function, it'll do some simple verification to ensure that it looks
    OK.
    '''
    value = int(string)
    if value == 0 or value > 4:
        raise ValueError(f"Chip count between 1 and 4 supported")
    return value


def print_welcome():
    print("ZX Interface 2.021")
    print("------------------")

if __name__ == "__main__":
    print_welcome()
    parse_arguments()