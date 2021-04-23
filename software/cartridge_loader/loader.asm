		.CR		z80
		.TF		loader.rom,BIN
		.LF		loader.list
		.OR		$0000

		.IN		constants.asm
TARGET	.EQU	$6000			; Payload target RAM start
SZ_RAM	.EQU	$2000			; Maximum payload size

;
; This is the main program entrypoint when first starting up, also run when
; the user hits the reset button on the interface. The rest of the reset
; vectors are simply put here just in case the CPU retains something from
; previously run software.
;
RESET:	DI						; Disable interrupts
		JP		MAIN
		.NO		$0008,$FF
RST_08:	RETI
		.NO		$0010,$FF
RST_10:	RETI
		.NO		$0018,$FF
RST_18:	RETI
		.NO		$0028,$FF
RST_28:	RETI
		.NO		$0030,$FF
RST_30:	RETI

;
; This is the standard maskable interrupt entrypoint that is normally used
; with the ZX Spectrum, it is hardwired into the ULA and will automatically
; initiate an interrupt every 100ms. This is referred to as Interrupt mode 1.
;
		.NO		$0038,$FF
RST_38:	DI						; Disable interrupts
		RETI

;
; The non-maskable interrupt (NMI) is hardwired to do a jump to this address,
; this needs to be here so that pushing the NMI button on the interface doesn't
; simply crash the code - it'll jump here, expecting the code to be ready for
; it.
;
		.NO		$0066,$FF
RST_66:	JP		RESET			; Jump to the regular RESET routine
		RETN					; We won't get here.

;
; Main program, relocated here to stay clear of the ROM space associated with
; the various interrupts. The code will run only once; copying the boot screen
; into the screen memory, copy the payload program ("selector program") from
; payload to a RAM location and then start it from there.
;
		.NO		$0100,$FF
MAIN:	LD		HL,BOOT_SCREEN	; Set location of boot screen data
		CALL	SHOW_SCR		; Copy boot image to screen memory
		CALL	COPY_TO_RAM		; Copy payload data to new RAM location
		JP		TARGET			; Start execution of payload program.

;
; Copy the payload program, usually the "selector" program, into RAM. Given
; that we want to avoid using more RAM than is available on the 16K version of
; the ZX Spectrum we'll limit the program size to 8K.
;
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