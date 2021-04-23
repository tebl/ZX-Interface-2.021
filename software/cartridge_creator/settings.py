import os
from configparser import ConfigParser

class Settings:
    def __init__(self, config_path):
        self.config = ConfigParser()
        self.config_path = config_path
        self.changed = False
        self.create_or_read()

    def __getattr__(self, attr):
        return self.get('Settings', attr)

    def create_or_read(self):
        if os.path.isfile(self.config_path):
            self.config.read(self.config_path)
        
        # Update with defaults
        self.set_defaults('Settings','loader', 'loader.rom')
        self.set_defaults('Settings','output_extension', 'bin')
        self.set_defaults('Settings','output_basename', 'cartridge')
        self.set_defaults('Settings','default_title', 'Cartridge Loader')
        
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
