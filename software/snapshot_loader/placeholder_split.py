with open('placeholder.sna', 'rb') as input_file:
    with open('placeholder_header.bin', 'wb') as output_file:
        output_file.write(input_file.read(27))
    with open('placeholder_ram.bin', 'wb') as output_file:
        output_file.write(input_file.read(0x3000))