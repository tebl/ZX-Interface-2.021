		.CR		z80
		.TF		blank_slot.rom,BIN
		.LF		blank_slot.list
		.OR		$0000

		.IN		constants.asm
		.IN		attributes.asm
;
; This is the main program entrypoint when first starting up, also run when
; the user hits the reset button on the interface. The rest of the reset
; vectors are simply put here just in case the CPU retains something from
; previously run software.
;
RESET:	JP		MAIN			; Just restart the main program.
		.NO		$0008,$FF
RST_08:	JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.
		.NO		$0010,$FF
RST_10:	JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.
		.NO		$0018,$FF
RST_18:	JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.
		.NO		$0028,$FF
RST_28:	JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.
		.NO		$0030,$FF
RST_30:	JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.

;
; This is the standard maskable interrupt entrypoint that is normally used
; with the ZX Spectrum, it is hardwired into the ULA and will automatically
; initiate an interrupt every 100ms. This is referred to as Interrupt mode 1.
;
		.NO		$0038,$FF
RST_38:	DI
		JP		MAIN			; Just restart the main program.
		RETI					; We won't get here.

;
; The non-maskable interrupt (NMI) is hardwired to do a jump to this address,
; this needs to be here so that pushing the NMI button on the interface doesn't
; simply crash the code - it'll jump here, expecting the code to be ready for
; it.
;
		.NO		$0066,$FF
RST_66:	DI
		JP		MAIN			; Jump to the regular RESET routine
		RETN					; We won't get here.

;
; Main program, relocated here to stay clear of the ROM space associated with
; the various interrupts. The code will run only once; copying the boot screen
; into the screen memory, copy the payload program ("selector program") from
; payload to a RAM location and then start it from there.
;
		.NO		$0100,$FF
MAIN:	DI						; Disable interrupts (just to be safe)
		LD		HL,STACK		; Load stack address to use
		LD		SP,HL			;  then configure it for use.
		IM		1				; Set interrupt mode 1
		LD		A,A_BLACK		; Load black colour into A
		LD		C,CTRL_BORDER	;  and use it to initialize
		OUT		(C),A			;  the border colour.
		
		LD		HL,BOOT_SCREEN	; Set location of boot screen data
		CALL	SHOW_SCR		; Copy boot image to screen memory
.LOOP:	CALL	DELAY
		JR		.LOOP			; Loop forever.

LIB_SCR:						; Routines for copying SCR into screen memory
		.IN		lib_scr.asm
LIB_DLY:
		.IN		lib_delay.asm
		
		.NO		$0400
SIGNATURE_LOCATION:				; Used when checking if bank actually switched
		.AZ		"Blank Slot"
		
		.NO		$0500
BOOT_SCREEN:
		.BI		blank.scr