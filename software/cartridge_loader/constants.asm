SCREEN			.EQU	$4000			; 16384
SZ_SCRN			.EQU	$1800			; 6144  256*192 pixels, 8-pixels per byte
ATTR			.EQU	$5800			; 22528
SZ_ATTR			.EQU	$300			; 768   32*24 8-pixel blocks
SZ_FONT 		.EQU	$60				; 96
VARS			.EQU	$5CC0			; 23744, used as start of variable space
STACK			.EQU	$5F00			; Stack decrement down from here	
SIGNATURE		.EQU	$0400			; Software signature, used when checking banks.

CTRL_BANK		.EQU	31				; ZX Interface 2.021 bank control port
CTRL_LED		.EQU	63				; LED for ZX Diagnostic 2.021 cartridge
CTRL_BORDER		.EQU	254				; Controls the screen border

; Keyboard row definitions
;                                        Bit     0   1 2 3 4
KR_SH_ZXCV		.EQU	$FEFE			;    SHIFT   Z X C V
KR_QWERT		.EQU	$FBFE			;        Q   W E R T
KR_ASDFG		.EQU	$FDFE			;        A   S D F G
KR_12345		.EQU	$F7FE			;        1   2 3 4 5
KR_09876 		.EQU	$EFFE			;        0   9 8 7 6
KR_POIUY		.EQU	$DFFE			;        P   O I U Y
KR_EN_LKJH		.EQU	$BFFE			;    ENTER   L K J H
KR_SP_SY_MNB	.EQU	$7FFE			;    SPACE SYM M N B