import os
from configparser import ConfigParser
from constants import *
from output_handler import OutputHandler
from functions import *

class SnapshotFile(OutputHandler):
    def __init__(self, dir_path, program_settings):
        super().__init__(dir_path, program_settings)

        if not os.path.isfile(self.get_input_path()):
            raise FileNotFoundError(f"Snapshot loader ROM \'{self.get_input_path()}\' not found")

        if not os.path.isfile(self.get_source_file('FileName')):
            raise FileNotFoundError(f"Snapshot \'{self.get_source_file('FileName')}\' not found")


    def cartridge_type(self):
        return 'Snapshot'
        
        
    def get_input_path(self):
        return self.program_settings.snapshot


    def get_target_file(self, file_format='bin'):
        filename = f"{self.get_basename()}.{self.program_settings.output_extension}"
        if file_format == 'hex':
            filename = f"{self.get_basename()}.hex"
        return os.path.join(self.get_basepath(), filename)


    def create(dir_path, program_settings):
        '''
        Create a blank cartridge configuration with a few of the available
        options already filled in, this is mostly just the basics.
        '''
        print(f"Creating cartridge '{dir_path}':")
        print_result('Type', 'Snapshot', 'OK')
        os.makedirs(dir_path, exist_ok=True)
        config = ConfigParser(allow_no_value=True)
        config.optionxform = lambda option: option
        config.add_section('Cartridge')
        config.set('Cartridge', 'Type', 'Snapshot')
        config.set('Cartridge', ';BasePath=..\\..\\')
        config.set('Cartridge', 'BaseName', 'cartridge')
        config.set('Cartridge', 'FileName', 'loader.sna')
        config.set('Cartridge', ';LoaderAddress = 0xFFF0')

        definition = os.path.join(dir_path, '_cartridge.ini')
        with open(definition, 'w') as config_file:
            config.write(config_file)
        print_result('Create definition', definition, 'OK')


    def process(self):
        print(f"Processing data for '{self.dir_path}':")
        target_file = self.get_target_file('bin')
        print_result('(E)EPROM image', target_file, '...')
        self.bytes_written = 0

        with open(target_file, 'wb') as output_file:
            with open(self.get_source_file('FileName'), 'rb') as snapshot:
                self.header = snapshot.read(27)
                self.update_all_fields()
                print_result('Header', '', '', indent_count=2)
                self.print_header(indent_count=3)
                for bank_id in range(0,4):
                    base_address = 0x4000 * bank_id

                    print_result(f"Create <BANK {bank_id}>", f"{format_number(base_address, format='address')} - {format_number(base_address + 0x3FFF, format='address')}", '...', indent_count=2)
                    with open(self.get_input_path(), 'rb') as input_file:
                        self.file_fast_forward(base_address + 0x0FE3, input_file, output_file, indent_count=3)
                        self.file_write_loader_address(output_file)
                        self.file_write_segment('Header data', self.header, output_file)
                        self.file_write_segment('Snapshot RAM', snapshot.read(0x3000), output_file)
                    print_result(f"Create <BANK {bank_id}>", f"{format_number(self.bytes_written - base_address, format='human')} written", 'END', indent_count=2)
        
        status = self.process_bytecount(target_file, 0x10000)
        print_result('(E)EPROM image', status['parameter'], status['result'])
        if status['result'] == 'END':
            self.file_convert_hex(target_file, self.get_target_file('hex'))
            
            
    def file_write_segment(self, name, data, output_file, indent_count=3):
        '''
        Write a named segment to the output file, the name is just used when
        printing the resulting status information.
        '''
        num_bytes = self.file_write_byte(data, output_file)
        print_result(name, f"{format_number(num_bytes, format='human')} written", 'OK', indent_count)


    def file_write_loader_address(self, output_file, indent_count=3):
        '''
        The routine used to perform the last steps in resuming a snapshot must
        be placed in RAM, mostly because we'll be banking out the cartridge and
        can't control what shows up in the programs place. When specified as
        0x0000, we'll leave it to the snapshot_loader code running on the Z80
        to guess at a suitable place, at the moment we'll just write below the
        current stack. This requires 17 bytes, including 4 bytes left over for
        actual stack usage.
        '''
        data = self.get_loader_address()
        num_bytes = self.file_write_byte(data, output_file)
        data = list(map(format_hex8, data))
        print_result('Loader Address', ', '.join(data), 'OK', indent_count)
    

    def get_loader_address(self):
        '''
        Ideally we'd like to add some logic here in order to locate space for
        a 13-byte routine in RAM. At the moment we'll just leave it up to the
        Z80 to figure out a position below stack, with the LoaderAddress
        we can override this with a suitable starting address.
        '''
        address = 0
        if self.have_setting('LoaderAddress'):
            address = int(self.setting('LoaderAddress'), 16)
            if address < 0x4000:
                raise ValueError('LoaderAddress can\'t be placed in ROM')
        address_hi = (address & 0xFF00) >> 8
        address_lo = address & 0x00FF

        return bytes(
            [
                address_lo,
                address_hi
            ]
        )


    def verify(self):
        '''
        Attempts to verify most of the user entered data in order to aid with
        usage, unknown errors may crop up as the codebase is mostly separate.
        Main program values are assumed to be OK as an exception will be raised
        before we get to this point.
        '''
        super().verify()
        self.verify_path('Loader ROM', self.get_input_path(), indent_count=1)
        print()        
        self.verify_cartridge()


    def verify_cartridge(self):
        super().verify_cartridge()
        self.verify_snapshot()
        self.verify_loader_address()
        
        
    def verify_snapshot(self, indent_count=2):
        path = self.get_source_file('FileName')
        size = os.path.getsize(path)
        if size == SNAPSHOT_SIZE:
            print_result('FileName', f"{path}, {format_number(size, format='human')}", 'OK', indent_count)
            self.update_header()
            self.print_header(indent_count + 1)
            return True
        print_result('FileName', f"{path}, {format_number(size, format='human')}", 'ERR', indent_count)
        raise ValueError('Snapshot file size mismatch')
        return False
        
        
    def verify_loader_address(self):
        if self.have_setting('LoaderAddress'):
            setting = self.setting('LoaderAddress')
            try:
                address_lo,address_hi = self.get_loader_address()
                print_result('LoaderAddress', setting, 'OK', indent_count=2)
                return True
            except ValueError:
                print_result('LoaderAddress', f"Invalid value '{setting}'", 'ERR', indent_count=2)
        return False
    

    def print_header(self, indent_count=2):
        for i, (k, v) in enumerate(self.fields.items()):
            print_result(k, ', '.join(list(map(format_hex8, v))), ' ', indent_count)
    
        
    def update_header(self):
        with open(self.get_source_file('FileName'), 'rb') as input_file:
            self.header = input_file.read(27)
            self.update_all_fields()
        return self.fields
        
        
    def update_all_fields(self):
        self.fields = {}
        position = self.update_field('I', 1, 0)
        position = self.update_field('HL\'', 2, position)
        position = self.update_field('DE\'', 2, position)
        position = self.update_field('BC\'', 2, position)
        position = self.update_field('AF\'', 2, position)
        position = self.update_field('HL', 2, position)
        position = self.update_field('DE', 2, position)
        position = self.update_field('BC', 2, position)
        position = self.update_field('IY', 2, position)
        position = self.update_field('IX', 2, position)
        position = self.update_field('Interrupt', 1, position)
        position = self.update_field('R', 1, position)
        position = self.update_field('AF', 2, position)
        position = self.update_field('SP', 2, position)
        position = self.update_field('IntMode', 1, position)
        position = self.update_field('BorderColor', 1, position)

        
    def update_field(self, name, length, position):
        data = self.header[(position):(position + length)]
        data = [b for b in data]
        self.fields[name] = data
        return position + length