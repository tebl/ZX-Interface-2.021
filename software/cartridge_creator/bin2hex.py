import os
import sys
from argparse import ArgumentParser

class Bin2Hex:
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
        self.add_record_ela()
        address = 0
        
        while True:
            bytes_read = self.input_file.read(record_size)
            if bytes_read:
                self.add_record_data(address, list(map(int, bytes_read)))
                address += len(bytes_read)
            else:
                break
        
        self.add_record_eof()
        return address

    def add_record_ela(self):
        '''
        Adds a header specifying Extended Linear Addressing, it is mainly just
        here so that the generated file is identical to my control sample. It
        doesn't add much of a difference for such small files.
        '''
        self.add_record(0x0000, self.RECORD_ELA, [0, 0])

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
        adress_hi = (address & 0xFF00) >> 8
        adress_lo = address & 0x00FF
        return ''.join(
            [
                ':',
                self.format_hex8(len(data)),
                self.format_hex8(adress_hi),
                self.format_hex8(adress_lo),
                self.format_hex8(record_type)
            ]
            + list(map(self.format_hex8, data))
            + [self.format_hex8(self.intel_checksum(data, adress_hi, adress_lo, record_type))]
        )
        
    def format_hex8(self, data):
        return format(data, '02X')
     
    def format_hex16(self, data):
        return format(data, '04X')

    def intel_checksum(self, data, adress_hi, adress_lo, record_type):
        x = sum([
            len(data),
            adress_hi,
            adress_lo,
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