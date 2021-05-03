import os
from configparser import ConfigParser

class Settings:
    def __init__(self, config_path):
        self.config = ConfigParser()
        self.config_path = config_path
        self.changed = False
        self.create_or_read()

    def __getattr__(self, attr):
        if attr == 'generate_hex':
            return self.config.getboolean('Settings', attr)
        return self.get('Settings', attr)
        
    def create_or_read(self):
        if os.path.isfile(self.config_path):
            self.config.read(self.config_path)
        
        # Update with defaults
        self.set_defaults('Settings','loader', 'loader.rom')
        self.set_defaults('Settings','blank_slot', 'blank_slot.rom')
        self.set_defaults('Settings','snapshot', 'snapshot.rom')
        self.set_defaults('Settings','output_extension', 'bin')
        self.set_defaults('Settings','output_basename', 'cartridge')
        self.set_defaults('Settings','default_title', 'Cartridge Loader')
        self.set_defaults('Settings','generate_hex', 'yes')
        
        if self.changed:
            with open(self.config_path, 'w') as configfile:
                self.config.write(configfile)
            self.changed = False
            
    def get(self, section, key):
        return self.config[section][key]

    def set(self, section, key, value):
        if section not in self.config.sections():
            self.config[section] = {}
            self.changed = True
        self.config[section][key] = value
            
    def set_defaults(self, section, key, value):
        if section not in self.config.sections():
            self.config[section] = {}
            self.changed = True
        if key not in self.config[section]:
            self.changed = True
            self.config[section][key] = value
