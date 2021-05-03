import os
from constants import *
from functions import *
from configparser import ConfigParser
from bin2hex import Bin2Hex

class OutputHandler:
    def __init__(self, dir_path, program_settings):
        self.dir_path = dir_path
        if not os.path.isdir(self.dir_path):
            raise FileNotFoundError(f"Cartridge directory '{dir_path}' does not exist")
            
        self.definition = os.path.join(self.dir_path, '_cartridge.ini')
        if not os.path.isfile(self.definition):
            raise FileNotFoundError(f"Cartridge definition file \'{self.definition}\' not found")
        self.program_settings = program_settings

        self.config = ConfigParser()
        self.config.read(self.definition)


    def cartridge_type(self):
        raise NotImplementedError()


    def get_basename(self):
        if self.have_setting('BaseName'):
            return self.setting('BaseName')
        return self.program_settings.output_basename


    def get_basepath(self):
        path = self.dir_path
        if self.have_setting('BasePath'):
            path = os.path.join(path, self.setting('BasePath'))
        return os.path.relpath(path)


    def get_source_file(self, key, section = 'Cartridge'):
        return os.path.join(self.dir_path, self.setting(key, section))

    
    #
    # Creating a blank cartridge
    #
    
    def create(dirname, args, program_settings):
        dir_path = os.path.join('cartridges', dirname)
        cartridge_type = args.cartridge_type.lower().strip()
        if cartridge_type == 'standard':
            from cartridge_file import CartridgeFile
            return CartridgeFile.create(dir_path, args.chip_size, args.chip_count, program_settings)
        elif cartridge_type == 'snapshot':
            from snapshot_file import SnapshotFile
            return SnapshotFile.create(dir_path, program_settings)
        else:
            raise ValueError(f"Unknown cartridge type '{cartridge_type}'")


    def get_instance(dirname, program_settings):
        dir_path = os.path.join('cartridges', dirname)
        if not os.path.isdir(dir_path):
            raise FileNotFoundError(f"Cartridge directory '{dir_path}' does not exist")
        def_path = os.path.join(dir_path, '_cartridge.ini')
        if not os.path.isfile(def_path):
            raise FileNotFoundError(f"Cartridge definition file \'{def_path}\' not found")
        
        config = ConfigParser()
        config.read(def_path)
        if 'Cartridge' in config:
            cartridge_type = config.get('Cartridge', 'Type', fallback = 'standard')
            return OutputHandler.get_class(cartridge_type)(dir_path, program_settings)
        else:
            raise ValueError('Invalid cartridge definition')
        pass


    def get_class(cartridge_type):
        '''
        Get the handler class used with the cartridge type that has been specified.
        '''
        cartridge_type = cartridge_type.lower().strip()
        if cartridge_type == 'standard':
            from cartridge_file import CartridgeFile
            return CartridgeFile
        elif cartridge_type == 'snapshot':
            from snapshot_file import SnapshotFile
            return SnapshotFile
        else:
            raise ValueError(f"Unknown cartridge type '{cartridge_type}'")
    
    #
    # Cartridge processing
    #
    
    def process(self):
        raise NotImplementedError()


    def process_bytecount(self, target_file, expected_size):
        '''
        Compares the expected number of bytes against what was counted in the
        code. To ensure this actually completed OK, we'll compare the counted
        number against what the operating system shows the size as.
        '''
        try:
            actual_size = os.path.getsize(target_file)
            if self.bytes_written != actual_size:
                return {'parameter': f"File size MISMATCH {format_number(actual_size, no_si=True)} found, expected {format_number(self.bytes_written, no_si=True)} Bytes", 'result': 'ERR'}

            if self.bytes_written == expected_size:
                return {'parameter': f"Size OK, {format_number(self.bytes_written, format='human')}", 'result': 'END'}
            else:
                return {'parameter': f"Size MISMATCH, {format_number(self.bytes_written, no_si=True)}/{format_number(expected_size, no_si=True)} Bytes", 'result': 'ERR'}
        except FileNotFoundError:
            return {'parameter': f"{target_file} does not exist!", 'result': 'ERR'}
    

    def file_fast_forward(self, target, input_file, output_file, indent_count=2):
        '''
        Fast forward through the input file, writing all bytes to the output
        until we come up on the specified target location. The location is not
        inclusive, meaning that the next byte written will end up on the
        address specified.
        '''
        num_bytes = target - output_file.tell()
        bytes_read = input_file.read(num_bytes)
        output_file.write(bytes_read)
        self.bytes_written += len(bytes_read)
        print_result(f"FF >>", format_number(target, format='address'), 'OK', indent_count)


    def file_write_byte(self, data, output_file):
        '''
        Write bytes to on opened output file, not that while we are counting
        written bytes - it is left to the calling function to handle any other
        synchronization tasks (in the hope that this function can be re-used).
        '''
        if data.__class__ == list:
            for byte in data:
                output_file.write(byte)
            self.bytes_written += len(data)
            return len(data)
        elif data.__class__ == bytes:
            output_file.write(data)
            self.bytes_written += len(data)
            return len(data)
        else:
            raise ValueError('Data type unknown')


    def file_convert_hex(self, source_file, target_file, indent_count=1):
        '''
        Converts the specified source file to Intel HEX-format, written to path
        specified as target_file. This is only done if the option is enabled in
        the main program configuration.
        '''
        if self.program_settings.generate_hex:
            with Bin2Hex(source_file, target_file) as converter:
                print_result('Generate Intel HEX', target_file, '   ', indent_count)
                num_bytes = converter.process()
                print_result(
                    'Data', 
                    f"{format_number(num_bytes, format='human')}, {source_file}", 
                    'ADD', 
                    indent_count + 1
                )

    
    #
    # Cartridge verification
    #
    
    def verify(self):
        print(f"Verifying data for '{self.dir_path}':")
        self.verify_basepath()
        print_result('Directory', self.dir_path, 'OK')
        print_result('Definition', self.definition, 'OK')
        return True
    
    def verify_cartridge(self):
        self.verify_section('Cartridge')
        self.verify_cartridge_type()
        return True
        
    def verify_cartridge_type(self):
        print_result('Type', self.cartridge_type(), 'OK', indent_count=2)
        return True
        
        
    def verify_basepath(self):
        '''
        Verifies that the basepath actually exists.
        '''
        path = self.get_basepath()
        if os.path.isdir(path):
            print_result('BasePath', path, 'OK')
            return True
        print_result('BasePath', f"{path} does not exist!", 'ERR')
        return False


    def verify_section(self, section, indent_count=1):
        '''
        Verifies that a section within a cartridge definition exists as
        expected.
        '''
        if self.have_section(section):
            print_result(section, '', 'OK', indent_count)
        else:
            print_result(section, 'Missing!', 'ERR', indent_count)
        return True
        
        
    def verify_key(self, key, section = 'Cartridge', indent_count=2):
        '''
        Verifies that a configuration key exists, will print missing if we do
        not have a value - usually it'll be required.
        '''
        if self.have_setting(key, section):
            print_result(key, self.setting(key, section), 'OK', indent_count)
            return True
        print_result(key, 'Missing!', 'ERR', indent_count)
        return False
        
        
    def verify_file(self, key, section = 'Cartridge', indent_count=2, check='file'):
        '''
        Verifies that the filename specified by a configuration key actually
        exists.
        '''
        if self.have_setting(key, section):
            filename = self.config[section][key]
            path = os.path.join(self.dir_path, filename)            
            return self.verify_path(key, path, indent_count, check)
        print_result(key, 'Missing!', 'ERR', indent_count)
        return False


    def verify_path(self, name, path, indent_count=2, check='file'):
        if os.path.exists(path):
            if check == 'file':
                if os.path.isfile(path):
                    print_result(name, path, 'OK', indent_count)
                    return True
                else:
                    print_result(name, f"{path} is not a file!", 'ERR', indent_count)
                    return False
            else:
                if os.path.isdir(path):
                    print_result(name, path, 'OK', indent_count)
                    return True
                else:
                    print_result(name, f"{path} is not a directory!", 'ERR', indent_count)
                    return False
        print_result(name, 'Missing!', 'ERR', indent_count)
        return False


    #
    # Cartridge definition
    #

    def have_section(self, section):
        '''
        Checks whether a section exists within the cartridge definition file.
        '''
        return section in self.config

    def have_setting(self, key, section = 'Cartridge'):
        '''
        Checks whether a setting exists within the cartridge definition file.
        '''
        return key in self.config[section]

    def setting(self, key, section = 'Cartridge'):
        '''
        Get configuration setting, will raise KeyError excetions when a key is
        missing - use have_setting first to ensure we have a valid value first.
        '''
        return self.config[section][key].strip('"')
        
    def is_enabled(self, key, section = 'Cartridge', default_value = False):
        '''
        Check whether a key used to specifiy a boolean value equates to True,
        the values yes/no as well as true/false can be used as expected.
        '''
        if not self.have_setting(key, section):
            return default_value
        return self.config.getboolean(section, key)