from constants import *

def format_hex(value, pad_length = 4):
    '''
    Format value for display in hex, suitable for displaying values used with
    common 8-bit systems with 16-bit addressing.
    '''
    if pad_length == 4:
        return '0x' + format(value, '04X')
    elif pad_length == 2:
        return '0x' + format(value, '02X')
        
    s = hex(value)[2:]
    s = ('0' * (pad_length - len(s))) + s.upper()
    return '0x' + s


def format_hex8(value):
    return format_hex(value, 2)


def format_hex16(value):
    return format_hex(value, 4)


def format_number(value, format='human', no_si=False):
    '''
    Format a number for printing to the screen, it can display four digit hex
    addresses in addition to regular file sizes - either in number of bytes or
    as human readable in number of KB.
    '''
    if format == 'address':
        value = format_hex(value)
        return value
    elif format == 'human':
        if int(value/1024)*1024 == value:
            return f"{int(value/1024)} KB"
    value = str(value)
    if not no_si:
        value += ' bytes'
    return value


def format_ascii_output(title, mode = TITLE_FORMAT_INDENT, size=32):
    '''
    Used to format title strings that is going to be written into the ROM,
    these have the specified amount of bytes available though this needs to
    include at least a single $00 termination as the last character.
    '''
    if mode == TITLE_FORMAT_INDENT:
       title = (' ' + title)
       title = title[:(size - 1)] 
    if mode == TITLE_FORMAT_CENTER:
        title = title[:(size - 1)].center((size - 1))
    result = list(map(convert_ascii_byte, title))
    result = result + ([0] * (size - len(result)))
    return bytes(result)


def convert_ascii_byte(char):
    '''
    The ZX Spectrum have a limited character set, so we'll just convert
    anything outside what was expected to a space. The Z80 code will take
    care of converting the ASCII data to its own character set - so no need
    to do that here.
    '''
    char = ord(char)
    if char < 32:
        char = 32
    if char > 127:
        return 32
    return char


def chip_to_bytes(chip_size):
    return int((chip_size / 8) * 1024)


def chip_to_slots(chip_size):
    return int((chip_size / 8 / (ROM_SIZE / 1024)))


def byte_to_int(a_byte):
    '''
    Converting a 'bytes' object back to an integer, this is the exact opposite
    of doing bytes([4]) -> b'\x04'.
    '''
    return int.from_bytes(a_byte, 'big')
  
  
def print_result(description, parameter = '', result = '', indent_count = 1):
    '''
    Print task result, mainly just here in order to keep the information flow
    looking sort of consistent.
    '''
    if result:
        result = result.ljust(3) + ' '
    if parameter:
        print(f"{(INDENT*indent_count + description).ljust(KEY_WIDTH)} {result}({parameter})")
    else:
        print(f"{(INDENT*indent_count + description).ljust(KEY_WIDTH)} {result}")


def selector_address(address):
    '''
    The selector is assembled into the ROM, starting at $2000 and relocated
    to $6000 before the z80 starts executing code from there. The references
    in the code will therefore be from $6000 and up, but since we're editing
    the file as we write it we need to subtract $4000 from the address.
    '''
    return (address - 0x4000)


def format_identifier(chip_id, slot_id):
    return f"ROM {chip_id}-{slot_id}"
