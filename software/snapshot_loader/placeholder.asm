		.CR		z80
		.TF		placeholder.bin,BIN
		.LF		placeholder.list
		.OR		$6000

		.IN		constants.asm	; Constants
		.IN		attributes.asm	; Attribute definitions
		
MAIN:	DI
		LD		SP,$5F00
		LD		A,A_BLUE
.NEXT:	OUT		(CTRL_BORDER),A
		CALL	DELAY
		INC		A
		CP		A_WHITE
		JR		NC,.RESET
		JR		.NEXT
.RESET:	LD		A,A_BLACK
		JP		MAIN
		
LIB_DELAY:
		.IN		lib_delay.asm