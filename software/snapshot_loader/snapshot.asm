		.CR		z80
		.TF		snapshot.rom,BIN
		.LF		snapshot.list
		.OR		$0000

		.IN		constants.asm
		.IN		attributes.asm
TARGET0	.EQU	$4000			; Bank 0, target RAM start
TARGET1	.EQU	$7000			; Bank 1
TARGET2	.EQU	$A000			; Bank 2
TARGET3	.EQU	$D000			; Bank 3
SZ_BANK	.EQU	$3000			; Maximum payload size

;
; This is the main program entrypoint when first starting up, also run when
; the user hits the reset button on the interface. The rest of the reset
; vectors are simply put here just in case the CPU retains something from
; previously run software.
;
RESET:	JP		MAIN			; Just restart the main program.
		.NO		$0008,$FF
RST_08:	JP		MAIN			; Just restart the main program.
		RETI					; We shouldn't get here.
		.NO		$0010,$FF
RST_10:	JP		MAIN			; Just restart the main program.
		RETI					; We shouldn't get here.
		.NO		$0018,$FF
RST_18:	JP		MAIN			; Just restart the main program.
		RETI					; We shouldn't get here.
		.NO		$0028,$FF
RST_28:	JP		MAIN			; Just restart the main program.
		RETI					; We shouldn't get here.
		.NO		$0030,$FF
RST_30:	JP		MAIN			; Just restart the main program.
		RETI					; We shouldn't get here.

;
; This is the standard maskable interrupt entrypoint that is normally used
; with the ZX Spectrum, it is hardwired into the ULA and will automatically
; initiate an interrupt every 100ms. This is referred to as Interrupt mode 1.
;
		.NO		$0038,$FF
RST_38:	RETI

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
; payload to a RAM location and then start it from there. Note that we're
; avoiding the use of the stack, duplicating code instead of doing sensible
; things.
;
		.NO		$0100,$FF
MAIN:	DI						; Disable interrupts (just to be safe)
		; IM		0				; Set interrupt mode 1

		LD		A,$00			; Load black colour into A
		OUT		(CTRL_BORDER),A	;  and write to the border.

		; Copy bank 0
		LD		HL,PAYLOAD		; Set source location
		LD		BC,SZ_BANK		; Number of bytes to copy	
		LD		DE,TARGET0		; Set target location
		LDIR					; Have Z80 copy data until all bytes copied

		; Copy bank 1
		LD		A,$01
		OUT		(CTRL_BANK),A
		LD		HL,PAYLOAD		; Set source location
		LD		BC,SZ_BANK		; Number of bytes to copy	
		LD		DE,TARGET1		; Set target location
		LDIR					; Have Z80 copy data until all bytes copied

		; Copy bank 2
		LD		A,$02
		OUT		(CTRL_BANK),A
		LD		HL,PAYLOAD		; Set source location
		LD		BC,SZ_BANK		; Number of bytes to copy	
		LD		DE,TARGET2		; Set target location
		LDIR					; Have Z80 copy data until all bytes copied

		; Copy bank 3
		LD		A,$03
		OUT		(CTRL_BANK),A
		LD		HL,PAYLOAD		; Set source location
		LD		BC,SZ_BANK		; Number of bytes to copy	
		LD		DE,TARGET3		; Set target location
		LDIR					; Have Z80 copy data until all bytes copied
		
		; Copy last stand instructions
		LD		HL,(H_SP)		; Place our stack below program stack,
		LD		SP,HL			;  then configure it for use.
		LD		B,17			; Need 13 bytes, add space for 4 bytes of actual stack
.DEC_B:	DEC		HL
		DJNZ	.DEC_B
		PUSH	HL				; This is the start of last stand routine,
		LD		B,13			;  we have 13 bytes of instructions that
		LD		DE,LAST_STAND	;  will be read from address in DE (B for B).
.NEXT_BYTE:
		LD		A,(DE)			; Load byte
		LD		(HL),A			;  and store in memory pointed to by HL
		INC		DE
		INC		HL
		DJNZ	.NEXT_BYTE		; Do this until 13 bytes copied.

		; Restore registers
		LD		A,(H_I)			; Load interrupt page into A
		LD		I,A				;  and use it to set the page.

		EXX						; Restore shadow registers
		LD		HL,(H_A_AF)		; Load AF to HL and
		PUSH	HL				;  push onto stack
		POP		AF				;  the retrieve it to AF'.
		LD		HL,(H_A_HL)		; Restore HL'
		LD		DE,(H_A_DE)		; Restore DE'
		LD		BC,(H_A_BC)		; Restore BC'
		EXX						; Switch back to primary registers.
		
		LD		DE,(H_DE)		; DE
		LD		BC,(H_BC)		; BC
		LD		IY,(H_IY)		; IY
		LD		IX,(H_IX)		; IX
								; Interrupt needs to be set in last stand.
		LD		A,(H_BOR)		; Set the border colour by
		OUT		(CTRL_BORDER),A	;  writing it to the port.
		LD		HL,(H_AF)		; AF register can only be set via the
		PUSH	HL				;  stack so we push the HL register
		POP		AF				;  to stack and then pop it back.
	
		POP		HL				; Pop last stand location
		PUSH	AF				; Push AF
		JP		(HL)

		.NO		$0F00
LAST_STAND:
		LD		HL,$0100		; We can't use any of the registers, so this
								;  will have to be substituted in some other way.
		LD		A,%00100000		; Map out the cartridge ROM to enable ZX Basic
		OUT		(CTRL_BANK),A
		POP		AF
		; IM		0			; IM2 ($ED5e), IM1 ($ED56), IM0 ($ED46)
		NOP
		NOP
		; EI					; $FB Replace with NOP if H_INT is Zero
		NOP
		RETN

;
; Snapshot header information to be duplicated into every slot, the values
; here are just placeholders without any significance (to be replaced later).
;
		.NO		$0FE5
HEADER:
H_I:	.DB		$00
H_A_HL:	.DB		$01,$02
H_A_DE:	.DB		$03,$04
H_A_BC:	.DB		$05,$06
H_A_AF:	.DB		$00,$00
H_HL:	.DB		$00,$01
H_DE:	.DB		$AF,$00
H_BC:	.DB		$BA,$02   	 
H_IY:	.DB		$00,$00
H_IX:	.DB		$00,$00
H_INT:	.DB		$00
H_R:	.DB		$34
H_AF:	.DB		$AC,$AF
H_SP:	.DB		$EE,$5E
H_INTM:	.DB		$00
H_BOR:	.DB		$03

		.NO		$1000
PAYLOAD:
		.BI		placeholder_ram.bin
