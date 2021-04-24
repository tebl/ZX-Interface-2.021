import os
from configparser import ConfigParser
from functions import *

class CartridgeFile:
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
        
        if not os.path.isfile(self.get_input_path()):
            raise FileNotFoundError(f"Cartridge loader ROM \'{self.self.get_input_path()}\' not found")

    def get_input_path(self):
        return self.program_settings.loader

    def get_target_file(self, chip_id):
        return os.path.join(
            self.get_basepath(),
            f"{self.get_basename()}{chip_id}.{self.program_settings.output_extension}")

    def get_source_file(self, key, section = 'Cartridge'):
        return os.path.join(self.dir_path, self.setting(key, section))

    def get_basename(self):
        if self.have_setting('BaseName'):
            return self.setting('BaseName')
        return self.program_settings.output_basename

    def get_basepath(self):
        path = self.dir_path
        if self.have_setting('BasePath'):
            path = os.path.join(path, self.setting('BasePath'))
        return os.path.relpath(path)

    def get_cartridge_title(self):
        if self.have_setting('Title'):
            return self.setting('Title')
        return self.program_settings.default_title

    def get_rom_source_file(self, chip_id, slot_id):
        return self.get_source_file('FileName', format_identifier(chip_id, slot_id))

    def get_rom_title(self, chip_id, slot_id):
        return self.setting('Title', format_identifier(chip_id, slot_id))

    def get_chips(self):
        '''
        Get the number of chips that have been specified for this cartridge
        compilation. If a value haven't been specified in the configuration,
        we'll just use a default value of 1.
        '''
        value = 1
        if self.have_setting('ChipCount'):
            value = int(self.setting('ChipCount'))
        if (value == 0):
            raise ValueError("ChipCount can't be 0")
        if (value > 4):
            raise ValueError("ChipCount maximum is 4")
        return range(0, value)
        
    def get_slots(self, chip_id):
        '''
        Read configuration to determine the number of slots available to the
        size that has been specified.
        '''
        value = self.get_slots_per_chip(chip_id)
        if chip_id == 0:
            return range(1, value + 1)
        if chip_id not in self.get_chips():
            return []
        return range(0, value)

    def get_slots_per_chip(self, chip_id):
        '''
        Calculate the number of slots the specific chip_id can hold, this is
        mostly just the same as self.get_chip_size except we account for the
        first slot loosing a slot to the loader itself.
        '''
        value = self.get_chip_size()

        value = int(value / 8 / 16)
        if chip_id == 0:
            value -= 1
        return value
        
    def get_chip_size(self):
        '''
        Retrieves the specified chip size from the configuration, the size is
        mostly specified in the same manner as the more common (E)EPROMS. In
        case anyone were wondering, these specify their capacity in kilobits
        and not bytes - so a 27C512 actually have a capacity of 512/8 = 64KB.
        The value is specified without manufacturer or anything else, so use
        128, 256 or 512 etc.
        '''
        value = int(self.setting('ChipSize'))
        if (int(value / 128) * 128 != value):
            raise ValueError("Size not a multiple of 128")
        if (value == 0):
            raise ValueError("Size can't be 0")
        return value

    def create(dir_path, chip_size, chip_count, program_settings):
        '''
        Create a blank cartridge configuration with a few of the available
        options already filled in, this is mostly just the basics.
        '''
        print(f"Creating cartridge '{dir_path}':")
        os.makedirs(dir_path, exist_ok=True)
        config = ConfigParser(allow_no_value=True)
        config.optionxform = lambda option: option
        config.add_section('Cartridge')
        config.set('Cartridge', 'Title', '"Blank cartridge"')
        config.set('Cartridge', 'ChipSize', str(chip_size))
        config.set('Cartridge', 'ChipCount', str(chip_count))
        config.set('Cartridge', 'BaseName', 'cartridge')
        config.set('Cartridge', ';BasePath=..\\..\\')
        config.set('Cartridge', ';BootScreen=boot.scr')
        config.set('Cartridge', ';Font1=Computer')
        config.set('Cartridge', ';Font2=MSX')
        
        blank_path = os.path.join(dir_path, 'blank.rom')
        with open(program_settings.blank_slot, 'rb') as input_file:
            with open(blank_path, 'wb') as blank_file:
                blank_file.write(input_file.read())

        for chip_id in range(0, chip_count):
            slots = range(0, chip_to_slots(chip_size)) 
            if chip_id == 0:
                slots = range(1, chip_to_slots(chip_size))
                
            for slot_id in slots:
                section = format_identifier(chip_id, slot_id)
                config.add_section(section)
                config.set(section, 'Title', '"Blank slot"')
                config.set(section, 'FileName', 'blank.rom')

        with open(os.path.join(dir_path, '_cartridge.ini'), 'w') as config_file:
            config.write(config_file)

    def process(self):
        '''
        Process a cartridge definition, creating a binary file that should
        include a loader that has been customized according to the settings.
        '''
        print(f"Processing data for '{self.dir_path}':")
        for chip_id in self.get_chips():
            if chip_id == 0:
                self.process_chip0()
            else:
                self.process_chipN(chip_id)

    def process_chip0(self, chip_id = 0):
        '''
        Process the first chip. This contains most of the logic of this
        program, with the aim of substituting values coded into the ZX Spectrum
        loader. When we finish with that, any remaining ROM slots are written
        out to the same file.
        '''
        target_file = self.get_target_file(chip_id)
        print_result('(E)EPROM image', target_file, '...')
        self.bytes_written = 0
        with open(target_file, 'wb') as output_file:
            with open(self.get_input_path(), 'rb') as input_file:
                # Write loader data up to $500
                self.file_fast_forward(0x0500, input_file, output_file)

                # Replace boot screen with a new one
                self.file_add_boot_screen(input_file, output_file)
                
                # Replace default fonts
                self.file_fast_forward(selector_address(0x7500), input_file, output_file)
                self.file_add_font('Font1', input_file, output_file)
                self.file_fast_forward(selector_address(0x7800), input_file, output_file)
                self.file_add_font('Font2', input_file, output_file)
        
                # Write cartridge and slot titles at $7C00
                self.file_fast_forward(selector_address(0x7C00), input_file, output_file)
                self.file_add_slot_titles(input_file, output_file)

                # Write four slot counters at $7FFC
                self.file_fast_forward(selector_address(0x7FFC), input_file, output_file)
                self.file_add_slot_counters(input_file, output_file)

            # Write remaining slots for this chip
            for slot_id in self.get_slots(chip_id):
                self.file_copy_rom(self.get_rom_source_file(chip_id, slot_id), output_file)        

        status = self.process_bytecount(target_file)
        print_result('(E)EPROM image', status['parameter'], status['result'])

    def process_chipN(self, chip_id):
        '''
        Writes out content to any of the remaining chips, these are just
        organized into 16K slots.
        '''
        target_file = self.get_target_file(chip_id)
        print_result('(E)EPROM image', target_file, '...')
        self.bytes_written = 0
        with open(target_file, 'wb') as output_file:
            for slot_id in self.get_slots(chip_id):
                self.file_copy_rom(self.get_rom_source_file(chip_id, slot_id), output_file)    

        status = self.process_bytecount(target_file)
        print_result('(E)EPROM image', status['parameter'], status['result'])

    def process_bytecount(self, target_file):
        '''
        Compares the expected number of bytes against what was counted in the
        code. To ensure this actually completed OK, we'll compare the counted
        number against what the operating system shows the size as.
        '''
        expected_size = int((self.get_chip_size() / 8) * 1024)
        actual_size = os.path.getsize(target_file)
        if self.bytes_written != actual_size:
            return {'parameter': f"File size MISMATCH {format_number(actual_size, no_si=True)} found, expected {format_number(self.bytes_written, no_si=True)} Bytes", 'result': 'END'}

        if self.bytes_written == expected_size:
            return {'parameter': f"Size OK, {format_number(self.bytes_written, format='human')}", 'result': 'END'}
        else:
            return {'parameter': f"Size MISMATCH {format_number(self.bytes_written, no_si=True)}/{format_number(expected, no_si=True)} Bytes", 'result': 'END'}

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

    def file_add_boot_screen(self, input_file, output_file, indent_count=2):
        '''
        Replace the boot screen that is already in the loader, when one has not
        been specified we'll just fast forward instead.
        '''
        boot_screen = self.get_boot_screen()
        if boot_screen:
            print_result('Boot Screen', boot_screen, 'ADD', indent_count)
            self.file_inject_scr(boot_screen, input_file, output_file, indent_count + 1)
        else:
            self.file_fast_forward(SCR_SIZE, input_file, output_file)

    def get_boot_screen(self):
        if self.have_setting('BootScreen'):
            return self.get_source_file('BootScreen')
        return None

    def file_add_font(self, key, input_file, output_file, indent_count=2):
        font_path = self.get_font_path(key)
        if font_path != None:
            print_result(f"Copy <{key}>", font_path, '...', indent_count)
            num_bytes = self.file_inject_font(font_path, input_file, output_file, indent_count + 1)
            print_result(f"Copy <{key}>", format_number(num_bytes, format='human'), 'END', indent_count)

    def get_font_path(self, key):
        if self.have_setting(key):
            font_path = os.path.join('fonts', f"font_{self.setting(key).strip().lower()}.bin")
            if os.path.isfile(font_path):
                return font_path
        return None

    def file_inject_font(self, font_path, input_file, output_file, indent_count=2):
        num_bytes = self.file_inject(FONT_SIZE, font_path, input_file, output_file, indent_count + 1)
        if num_bytes < 768 or num_bytes > FONT_SIZE:
            raise RuntimeError(f"Font file was wrong size ({font_path}, {format_number(num_bytes, format='human')})")
        print_result('Data', format_number(num_bytes, format='human'), 'OK', indent_count)
        return num_bytes


    def file_add_slot_titles(self, input_file, output_file, indent_count=2):
        '''
        Add slot titles to the output, overriding those that are coded into the
        loader ROM. Each title is 32 bytes, including a $00 termination byte -
        remaining bytes should also be padded the same way. Given that the
        loader ROM always occupy the first slot, this is used to hold the title
        of the cartridge.
        '''
        print_result('Slot titles', '', '', indent_count)
        self.file_add_title(self.get_cartridge_title(), input_file, output_file, TITLE_FORMAT_CENTER, indent_count + 1)
        for chip_id in self.get_chips():
            for slot_id in self.get_slots(chip_id):
                self.file_add_title(
                    self.get_rom_title(chip_id, slot_id), 
                    input_file, 
                    output_file, 
                    TITLE_FORMAT_INDENT, indent_count + 1)

    def file_add_title(self, title, input_file, output_file, mode = TITLE_FORMAT_INDENT, indent_count=2):
        '''
        Writes out a title to the ROM, this is always 32 characters including
        the $00 used to terminate it. All titles added sequentially in the
        hopes that we know how to count on both ends.
        '''
        data = format_ascii_output(title, mode)
        num_bytes = self.file_write_byte(data, output_file)
        input_file.seek(input_file.tell() + num_bytes)
        print_result('Data', title, 'ADD', indent_count)

    def file_add_slot_counters(self, input_file, output_file, indent_count=2):
        '''
        The default loader supports up to four chips, the same as the hardware
        implementation of the ZX Interface 2.021. This function writes the
        number of slots available on each chip, but note that these are
        expected to be fillen in rising order.
        '''
        slot_bytes = self.get_slot_counters()
        self.file_write_byte(slot_bytes, output_file)
        s = []
        for data in slot_bytes:
            s.append(format_hex(byte_to_int(data), 2))
        input_file.seek(input_file.tell() + 4)
        print_result('Slot Counters', ' '.join(s), 'OK', indent_count)

    def get_slot_counters(self):
        '''
        Get a byte array with count of valid slots, suitable for injecting
        into the loader.
        '''
        slots = []
        for chip_id in range(0,4):
            slots.append(bytes([len(self.get_slots(chip_id))]))
        return slots

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

    def file_copy_rom(self, rom_path, output_file, indent_count=2):
        print_result('Copy <ROM>', rom_path, '...', indent_count)
        num_bytes = self.file_copy_into(ROM_SIZE, rom_path, output_file)
        print_result('Data', format_number(num_bytes, format='human'), 'OK', indent_count + 1)
        pad_bytes = self.file_write_padding(num_bytes, ROM_SIZE, output_file, indent_count + 1)
        print_result('Copy <ROM>', format_number(num_bytes + pad_bytes, format='human'), 'END', indent_count)

    def file_write_padding(self, num_bytes, expected_bytes, output_file, indent_count=2, pad_value=255):
        padding = bytes([pad_value]) * (expected_bytes - num_bytes)
        if len(padding) > 0:
            output_file.write(padding)
            self.bytes_written += len(padding)
            print_result(f"Padding", format_number(len(padding), format='human'), 'OK', indent_count)
        return len(padding)

    def file_copy_into(self, num_bytes, file_path, output_file):
        with open(file_path, 'rb') as input_file:
            bytes_read = input_file.read(num_bytes)
            output_file.write(bytes_read)
            self.bytes_written += len(bytes_read)
        return len(bytes_read)

    def file_inject_scr(self, scr_path, input_file, output_file, indent_count=2):
        num_bytes = self.file_inject(SCR_SIZE, scr_path, input_file, output_file, indent_count + 1)
        if num_bytes != SCR_SIZE:
            raise RuntimeError(f"SCR file was wrong size ({scr_path}, {num_bytes} bytes)")
        print_result('Inject <SCR>', format_number(num_bytes, format='human'), 'OK', indent_count)
        return
    
    def file_inject(self, num_bytes, inject_path, input_file, output_file, indent_count=2):
        with open(inject_path, 'rb') as inject_file:
            bytes_read = inject_file.read(num_bytes)
            output_file.write(bytes_read)
            self.bytes_written += len(bytes_read)
        input_file.seek(input_file.tell() + len(bytes_read))
        return len(bytes_read)

    def verify(self):
        '''
        Attempts to verify most of the user entered data in order to aid with
        usage, unknown errors may crop up as the codebase is mostly separate.
        Main program values are assumed to be OK as an exception will be raised
        before we get to this point.
        '''
        print(f"Verifying data for '{self.dir_path}':")
        print_result('Directory', self.dir_path, 'OK')
        print_result('Definition', self.definition, 'OK')
        self.verify_loader()
        self.verify_basepath()
        print()
        
        self.verify_section('Cartridge')
        self.verify_cartridge_title()
        if self.have_setting('BootScreen'):
            self.verify_file('BootScreen')
        self.verify_font('Font1')
        self.verify_font('Font2')
        
        if self.verify_chip_count():
            for chip_id in self.get_chips():
                self.verify_chip_size(chip_id)
            print()

            for chip_id in self.get_chips():
                self.verify_chip(chip_id)
    
    def verify_loader(self):
        signature = self.verify_read_signature()
        if signature[:2] == 'ZX':
            print_result('Loader ROM', f"{signature}, {self.get_input_path()}", 'OK')
            return True
        print_result('Loader ROM', f"{signature}, {self.get_input_path()}", 'ERR')
        return False
        
    def verify_read_signature(self):
        signature = []
        position = 0
        with open(self.get_input_path(), 'rb') as input_file:
            input_file.seek(0x0400)
            while position < 32:
                c = input_file.read(1)
                if c == bytes([0]):
                    break
                signature.append(chr(byte_to_int(c)))
                position += 1
        return ''.join(signature)

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

    def verify_section(self, section):
        if self.have_section(section):
            print_result(section, '', 'OK')
        else:
            print_result(section, 'Missing!', 'ERR')
        return True

    def verify_cartridge_title(self):
        print_result('Title', self.get_cartridge_title(), 'OK', indent_count=2)
        return True
        
    def verify_font(self, key, indent_count=2):
        '''
        Verifies that the font specified corresponds to an existing file, we'll
        look for it in the fonts directory - it's expected to have a name such
        as font_<name>.bin (all lowercase).
        '''
        if self.have_setting(key):
            path = self.get_font_path(key)
            if path != None and os.path.isfile(path):
                print_result(key, self.setting(key), 'OK', indent_count)
                return True
            print_result(key, 'Missing!', 'ERR', indent_count)
            return False
        return True

    def verify_chip(self, chip_id):
        for slot_id in self.get_slots(chip_id):
            self.verify_cartridge(format_identifier(chip_id, slot_id))

    def verify_chip_count(self):
        '''
        Verifies the specified number of chips.
        '''
        try:
            print_result('ChipCount', len(self.get_chips()), 'OK', indent_count=2)
            return True
        except ValueError as e:
            print_result('ChipCount', f"Invalid value ({e})", 'ERR', indent_count=2)
        return False

    def verify_chip_size(self, chip_id):
        '''
        Verify chip size specified, the program assumes that all chips will
        have the same size to match the current hardware implementation.
        '''
        name = f"ChipSize ({chip_id})"
        try:
            print_result(name, f"{len(self.get_slots(chip_id))} slots", 'OK', indent_count=2)
            return True
        except ValueError as e:
            print_result(name, f"Invalid value ({e})", 'ERR', indent_count=2)
        return False

    def verify_cartridge(self, section):
        self.verify_section(section)
        if self.have_section(section):
            self.verify_key('Title', section)
            self.verify_file('Filename', section)
        print()

    def verify_key(self, key, section = 'Cartridge'):
        '''
        Verifies that a configuration key exists, will print missing if we do
        not have a value - usually it'll be required.
        '''
        if self.have_setting(key, section):
            print_result(key, self.setting(key, section), 'OK', indent_count=2)
            return True
        print_result(key, 'Missing!', 'ERR', indent_count=2)
        return False
        
    def verify_file(self, key, section = 'Cartridge', indent_count=2):
        '''
        Verifies that the filename specified actually exists.
        '''
        if self.have_setting(key, section):
            filename = self.config[section][key]
            path = os.path.join(self.dir_path, filename)
            if os.path.isfile(path):
                print_result(key, self.setting(key, section), 'OK', indent_count)
                return True
        print_result(key, 'Missing!', 'ERR', indent_count)
        return False

    def have_section(self, section):
        return section in self.config

    def have_setting(self, key, section = 'Cartridge'):
        return key in self.config[section]

    def setting(self, key, section = 'Cartridge'):
        '''
        Get configuration setting, will raise KeyError excetions when a key is
        missing - use have_setting first to ensure we have a valid value first.
        '''
        return self.config[section][key].strip('"')