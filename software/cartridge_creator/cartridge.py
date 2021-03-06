import os
import sys
from argparse import ArgumentParser
from configparser import ConfigParser
from output_handler import OutputHandler
from settings import Settings

settings = Settings('cartridge.ini')


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
    parser.add_argument('-t', '--cartridge-type', help='Specify the type of cartridge, either standard or snapshot', default='Standard', choices=['standard', 'snapshot'])
    
    parser.add_argument('-p', '--process', help='Process cartridge configuration', nargs='*', default=[])
    parser.add_argument('-v', '--verify', help='Verify cartridge configuration', nargs='*', default=[])    
    parser.add_argument('--version', action='version', version='Cartridge parser 1.0')
    args = parser.parse_args()

    errors = False
    if not errors:
        for dirname in args.create:
            try:
                OutputHandler.create(dirname, args, settings)
                print()
            except Exception as err:
                errors = True
                print("Uncaught exception creating {0} ({1})".format(dirname, err))
                break
    
    if not errors:
        for dirname in args.verify:
            try:
                OutputHandler.get_instance(dirname, settings).verify()
                print()
            except Exception as err:
                errors = True
                print("Uncaught exception verifying {0} ({1})".format(dirname, err))

    if not errors:
        for dirname in args.process:
            try:
                OutputHandler.get_instance(dirname, settings).process()
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