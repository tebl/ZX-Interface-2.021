import os
import sys
from argparse import ArgumentParser

class Bin2Hex:
    '''
    Extremely simple, probably buggy, binary to Intel HEX conversion tool,
    converted from some Arduino code I did for the RC-ONE computer. Takes
    a binary file as input and writes it out as an Intel HEX-formatted file,
    supporting up to 
    '''

    RECORD_DATA = 0x00
    RECORD_EOF = 0x01
    RECORD_ELA = 0x04

    def __init__(self, input_path, output_path):
        self.input_path = input_path
        self.output_path = output_path
    
    def __enter__(self):
        self.input_file = open(self.input_path, 'rb')
        self.output_file = open(self.output_path, 'w')
        return self
    
    def __exit__(self, exception_type, exception_value, traceback):
        self.output_file.close()
        self.input_file.close()
    
    def process(self, record_size=16):
        counter = 0
        address = 0
        segment = 0
        
        while True:
            if address == 0:
                self.add_record_ela(segment)

            bytes_read = self.input_file.read(record_size)
            if bytes_read:
                self.add_record_data(address, list(map(int, bytes_read)))
                address += len(bytes_read)
                counter += len(bytes_read)

                if address == 0x10000:
                    segment += 1
                    address = 0
            else:
                break
        
        self.add_record_eof()
        return counter

    def add_record_ela(self, counter):
        '''
        Adds a header specifying Extended Linear Addressing, while not needed
        for files up to 64K in size - anything above won't fit directly into
        the 16-bit addressing scheme supported by the standard data records.
        An ELA record specifies the upper 16-bit of the 32-bit addresses
        needed for larger sizes relevant for this project, we just use it to
        count the number of 64K segments seen.
        '''
        counter_hi = (counter & 0xFF00) >> 8
        counter_lo = counter & 0x00FF
        self.add_record(0x0000, self.RECORD_ELA, [counter_hi, counter_lo])

    def add_record_eof(self):
        '''
        Add a special footer specifying End of File, this is needed by a few
        (E)EPROM programmers.
        '''
        self.add_record(0x0000, self.RECORD_EOF)

    def add_record_data(self, address, data):
        '''
        Add a data record.
        '''
        self.add_record(address, self.RECORD_DATA, data)

    def add_record(self, address, record_type, data = []):
        self.output_file.write(self.generate_record(address, record_type, data))
        self.output_file.write('\n')
        
    def generate_record(self, address, record_type, data = []):
        address_hi = (address & 0xFF00) >> 8
        address_lo = address & 0x00FF
        return ''.join(
            [
                ':',
                self.format_hex8(len(data)),
                self.format_hex8(address_hi),
                self.format_hex8(address_lo),
                self.format_hex8(record_type)
            ]
            + list(map(self.format_hex8, data))
            + [self.format_hex8(self.intel_checksum(data, address_hi, address_lo, record_type))]
        )
        
    def format_hex8(self, data):
        return format(data, '02X')
     
    def format_hex16(self, data):
        return format(data, '04X')

    def intel_checksum(self, data, address_hi, address_lo, record_type):
        '''
        Generates an Intel HEX checksum value, essentially it sums all of the
        byte-pairs in the record before calculating 2s complement. It's maths,
        I hate it and it works so don't mess with it.
        '''
        x = sum([
            len(data),
            address_hi,
            address_lo,
            record_type,
            sum(data)
        ])
        x = x % 256
        x = ~x;
        x = x + 1;
        x = x & 0xFF;
        return x;

def parse_arguments():
    '''
    Parses command line arguments and runs the appropriate tasks.
    '''
    help_text = '''
    Rather simple routines thrown together in order to convert binary files
    into Intel HEX-format, supported by most (E)EPROM Programmers. While most
    of them can also do binary files, the HEX-format is probably easiest for
    novices to deal with.
    '''
    parser = ArgumentParser(description=help_text)
    parser.add_argument('input', help='Specify input path', nargs='?')
    parser.add_argument('output', help='Specify output path', nargs='?')
    parser.add_argument('--version', action='version', version='Bin2Hex 1.0')
    args = parser.parse_args()

    print(f"Converting {args.input} to Intel HEX...")
    with Bin2Hex(args.input, args.output) as converter:
        converter.process()
    print('Done.')

if __name__ == "__main__":
    parse_arguments()