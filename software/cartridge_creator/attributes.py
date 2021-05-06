BLACK           = int('0b00000000',2)
BLUE            = int('0b00000001',2)
RED             = int('0b00000010',2)
MAGENTA         = int('0b00000011',2)
GREEN           = int('0b00000100',2)
CYAN            = int('0b00000101',2)
YELLOW          = int('0b00000110',2)
WHITE           = int('0b00000111',2)

BLACK_PAPER     = BLACK << 3
BLUE_PAPER      = BLUE << 3
RED_PAPER       = RED << 3
MAGENTA_PAPER   = MAGENTA << 3
GREEN_PAPER     = GREEN << 3
CYAN_PAPER      = CYAN << 3
YELLOW_PAPER    = YELLOW << 3
WHITE_PAPER     = WHITE << 3

BRIGHT          = int('0b01000000',2)
FLASH           = int('0b10000000',2)

COLOUR_TOKENS   = [
    'BLACK',
    'BLUE',
    'RED',
    'MAGENTA',
    'GREEN',
    'CYAN',
    'YELLOW',
    'WHITE'
]

PAPER_TOKENS = [
    'BLACK_PAPER',
    'BLUE_PAPER',
    'RED_PAPER',
    'MAGENTA_PAPER',
    'GREEN_PAPER',
    'CYAN_PAPER',
    'YELLOW_PAPER',
    'WHITE_PAPER',
]

MODIFIER_TOKENS = [
    'BRIGHT',
    'FLASH'
]


def get_tokens(is_border = False):
    tokens = COLOUR_TOKENS
    if not is_border:
        tokens += PAPER_TOKENS
        tokens += MODIFIER_TOKENS
    return tokens


def format_tokens(tokens):
    return ' | '.join(tokens)


def from_value(value, is_border = False):
    results = []
    for key in COLOUR_TOKENS:
        pattern = globals()[key]
        if (value & int('0b00000111', 2)) == pattern:
            results.append(key)
            break

    if not is_border:
        for key in PAPER_TOKENS:
            pattern = globals()[key]
            if (value & int('0b00111000', 2)) == pattern:
                results.append(key)
                break

        if value & BRIGHT == BRIGHT:
            results.append('BRIGHT')
        if value & FLASH == FLASH:
            results.append('FLASH')
    return results


def from_tokens(tokens, is_border = False):
    allowed = get_tokens(is_border)
    value = 0
    for token in tokens:
        if token not in allowed:
            raise ValueError(f"Attribute '{token}' not recognized")
        value |= globals()[token]
    return value


def hex_argument(value):
    return int(value, 16)


if __name__ == "__main__":
    from argparse import ArgumentParser
    from functions import format_hex8

    parser = ArgumentParser(description='Attribute converter demo')
    parser.add_argument('--list-tokens', help='List recognized tokens (case-sensitive)', action='store_true')
    parser.add_argument('--from-hex', help='Specify attribute value', type=hex_argument, nargs='*', default=[])
    parser.add_argument('--from-value', help='Specify attribute value', type=int, nargs='*', default=[])
    parser.add_argument('--from-tokens', help='Convert tokens into a hex value', nargs='*', default=[])
    parser.add_argument('--border', help='Indicates if the supplied value should be limited to border colours', action='store_true')
    args = parser.parse_args()

    if args.list_tokens:
        print('Tokens recognized:')
        for token in get_tokens(is_border=args.border):
            value = format(globals()[token], '08b')
            print(f"  {token.ljust(15)} ({value})")

    for value in args.from_hex:
        attributes = from_value(value, is_border=args.border)
        attributes = format_tokens(attributes)
        print(f"{format_hex8(value)}: {attributes}")

    for value in args.from_value:
        attributes = from_value(value, is_border=args.border)
        attributes = format_tokens(attributes)
        print(f"{value}: {attributes}")
        
    if args.from_tokens:
        try:
            value = from_tokens(args.from_tokens, is_border=args.border)
            tokens = format_tokens(args.from_tokens)
            print(f"{format_hex8(value)}: {tokens}")
        except ValueError as e:
            print('ERROR: ' + str(e))
            exit(1)
            