		.CR		z80
		.TF		loader.rom,BIN
		.LF		loader.list
		.OR		$0000

		.IN		constants.asm
TARGET	.EQU	$6000			; Payload target RAM start
SZ_RAM	.EQU	$2000			; Maximum payload size

MAIN:	LD		HL,BOOT_SCREEN	; Set location of boot screen data
		CALL	SHOW_SCR		; Copy boot image to screen memory
		CALL	COPY_TO_RAM		; Copy payload data to new RAM location
		JP		TARGET			; Start execution of payload program.

COPY_TO_RAM:
		LD		HL,PAYLOAD		; Set source location
		LD		BC,SZ_RAM		; Number of bytes to copy	
		LD		DE,TARGET		; Set target location
		LDIR					; Have Z80 copy data until all bytes copied
		RET

LIB_SCR:						; Routines for copying SCR into screen memory
		.IN		lib_scr.asm
		
		.NO		$0400
SIGNATURE_LOCATION:				; Used when checking if bank actually switched
		.AZ		"ZX Interface 2.021"
		
		.NO		$0500
BOOT_SCREEN:
		.BI		boot.scr
				
		.NO		$2000
PAYLOAD:
		.BI		selector.bin