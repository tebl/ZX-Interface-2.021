		.CR		z80
		.TF		selector.bin,BIN
		.LF		selector.list
		.OR		$6000

		.IN		constants.asm	; Constants
		.IN		attributes.asm	; Attribute definitions

C_DEF	.EQU	A_P_BLACK|A_WHITE|A_BRIGHT
C_TITLE	.EQU	A_P_BLACK|A_WHITE|A_BRIGHT
C_NAME	.EQU	A_P_BLACK|A_WHITE
C_TEXT	.EQU	A_P_BLACK|A_WHITE
C_SEL	.EQU	A_P_WHITE|A_BLACK|A_BRIGHT
C_HELP	.EQU	A_P_BLACK|A_WHITE|A_BRIGHT
C_ERROR	.EQU	A_P_BLACK|A_RED|A_BRIGHT

CUR_X	.EQU	VARS+0			; Current cursor location on screen, X
CUR_Y	.EQU	VARS+1			;  and Y-location.
LAST_A	.EQU	VARS+2			; Last attribute used when clearing screen
CUR_IDX	.EQU	VARS+3			; Index for title selected
LAST_K	.EQU	VARS+4			; Last key value in case we need it
SLOTS	.EQU	VARS+5			; Number of slots available

MAIN:	CALL	GET_SLOT_COUNT	; Calculate SLOTS value
		CALL	RESET_CURSOR	; Reset cursor
		LD		BC,$0400		; Set up the custom delay routine, 
		LD		DE,$0100		;  mainly so that we have time to
		CALL	CUSTOM_DELAY	;  actually see loader boot screen.
		CALL	SELECTOR		; Show selection screen
.LOOP:	CALL	READ_INPUT		; Read keyboard		
		JR		.LOOP			; Loop forever.

LIB_DELAY:
		.IN		lib_delay.asm

;
; Performs an initial calculation to figure out how many slots we need to
; display on the screen. There is a maximum of 4 different values to account
; for the four chip selects on cartridge port. CUR_IDX will be a value between
; 1 and this calculated value.
;
GET_SLOT_COUNT:
		LD		HL,SLOT_COUNT
		LD		B,4
		LD		A,0
.NEXT:	ADD		(HL)
		INC		HL
		DEC		B
		JR		NZ,.NEXT
		LD		(SLOTS),A
		RET

;
; Error screen display.
;
ERROR:	LD		A,C_ERROR		; Load error screen attribute definition,
		CALL	CLR_BG			;  and clear the screen with it.

		; Outputs the title block
		LD		DE,ERR_TITLE
		LD		B,A
		LD		C,C_ERROR|A_FLASH
		CALL	TITLE_BOX

		; Error message section
		CALL	SET_FONT2		; Set regular font
		LD		HL,$000A
		CALL	SET_CURSOR
		LD		HL,ERR_MSG
		CALL	PUTS
.LOOP:	JR		.LOOP			; Loop forever.

;
; Selection screen display
;
SELECTOR:
		LD		A,1				; Initialize title index
		LD		(CUR_IDX),A		;  save in RAM for later.
		LD		A,C_DEF			; Get default attribute value
		CALL	CLR_BG			;  and clear screen with it.

		; Outputs the title block
		LD		DE,TITLE0
		LD		B,C_TITLE
		LD		C,C_NAME
		CALL	TITLE_BOX

		; Output bank names
		CALL	UPDATE_TITLES
		
		; Output help section
.HELP:	LD		A,C_HELP
		LD		HL,$0015
		CALL	SET_CURSOR
		CALL	SET_ATTR_ROW
		LD		HL,$0016
		CALL	SET_CURSOR
		CALL	SET_ATTR_ROW

		CALL	SET_FONT1
		LD		HL,MSG_HELP
		CALL	PUTS
		LD		HL,$0017
		CALL	SET_CURSOR
		CALL	SET_ATTR_ROW
		; Print symbols over text as those aren't in the default font.
		LD		DE, FONT_SYMBOLS
		LD		HL,$0416
		CALL	SET_CURSOR
		LD		A,0
		CALL	SET_SYMBOL
		LD		HL,$0B16
		CALL	SET_CURSOR
		LD		A,1
		CALL	SET_SYMBOL
		RET

;
; The title box fiddles around with a lot of symbols to make it look pretty,
; so to avoid copying the code we'll generalize it instead. 
;  DE - Load with screen title address
;  B  - Load with title attribute
;  C  - Load with cartridge name attribute
;
TITLE_BOX:
		PUSH	DE				; Save DE as it points to the title.
.TEXT:	LD		A,B				; B holds title attribute
		CALL	SET_FONT1		; Set title font
		LD		HL,$0001 
		CALL	SET_CURSOR
		CALL	SET_ATTR_ROW
		LD		HL,MSG_TITLE
		CALL	PUTS
		LD		HL,$0002
		CALL	SET_CURSOR
		LD		A,C				; C holds cartridge name style
		CALL	SET_ATTR_ROW
		POP		HL				; Restore previously pushed DE to HL
		CALL	PUTS			;  and use it to output the string.

.SYMBOLS:
		LD		A,B
		LD		DE,FONT_SYMBOLS ; Set font to point to the symbols
		LD		HL,$0000		; Reset cursor to
		CALL	SET_CURSOR		;  start of the screen.
		CALL	SET_ATTR_ROW	; Update entire row with style.
		LD		HL,MSG_TB_UPPER
		CALL	PUTSS			; Print upper title bar
		LD		HL,$0003
		CALL	SET_CURSOR
		CALL	SET_ATTR_ROW
		LD		HL,MSG_TB_LOWER	; Print lower title bar
		CALL	PUTSS
		LD		HL,$0001		; Fix left title bar
		CALL	SET_CURSOR
		LD		A,$08
		CALL	SET_SYMBOL
		LD		HL,$0002
		CALL	SET_CURSOR
		LD		A,$08
		CALL	SET_SYMBOL
		LD		A,B
		CALL	SET_ATTR
		LD		HL,$1F01		; Fix right title bar
		CALL	SET_CURSOR
		LD		A,$09
		CALL	SET_SYMBOL
		LD		HL,$1F02
		CALL	SET_CURSOR
		LD		A,$09
		CALL	SET_SYMBOL
		LD		A,B
		CALL	SET_ATTR
.DONE:	RET

;
; Updates the names of titles displayed as well as their attributes. Sort of
; slow for just marking the active line, but too lazy to build a separate one
; for just the attributes.
;
UPDATE_TITLES:
		PUSH	AF
		PUSH	BC
		CALL	SET_FONT2
		LD		A,(SLOTS)	; Load number of titles configured.
		LD		B,A
.NEXT:	LD		A,B
		CALL	PRINT_TITLE_N
		DEC		B
		JR		NZ,.NEXT
		POP		BC
		POP		AF
		RET

;
; Prints bank titles to their corresponding line number, value in A is used as
; bank index.
;
PRINT_TITLE_N:
		PUSH	HL
		PUSH 	AF				; Store title index
		LD		HL,$0000		; Start calculation at 0,0	
		ADD		A,4				;  add 4 to get screen line to print to,
		LD		L,A				;  then set this as Y-coordinate.
		CALL	SET_CURSOR		; Update cursor	
		POP		AF				; Get back the original index
		CALL	SET_HIGHLIGHT	; Set background color depending on index
		CALL	GET_TITLE_ADDR	; Get title string
		CALL	PUTS			; Print it.
		POP 	HL
		RET

;
; With the currently being processed index in A, compare that to the actually
; selected bank index. Change attribute data for the entire row to show the
; difference.
;
SET_HIGHLIGHT:
		PUSH	DE
		PUSH	AF
		PUSH	BC
		LD		B,A
		LD		A,(CUR_IDX)
		CP		A,B				; Check if current index?
		JR		NZ,.INACTIVE	;  no, jump to inactive
		LD		A,C_SEL			;  yes, so set attribute style to selected.
		JR		.SET_ROW
.INACTIVE:
		LD		A,C_TEXT
.SET_ROW:
		CALL	SET_ATTR_ROW
		POP		BC
		POP		AF
		POP		DE
		RET

;
; Get the memory address of the bank title, as indicated by the value in A.
; This works based on the fact that we chose to use 32 bytes for each of the
; title strings (this includes $00 termination, so 31 characters max for
; each of them).
;
GET_TITLE_ADDR:
		PUSH	AF
		RRCA					; Multiply by 32
		RRCA
		RRCA
		LD		L,A				; Store as low byte
		AND		3				; Mask bits for high byte
		ADD		A,$7C			;  and with first string address ($7C00)
		LD		H,A				; High byte done.
		LD		A,L				; Get back x*32
		AND		$E0
		LD		L,A				; Put in L.
		POP		AF
		RET
;
; Initial routine for handle keyboard input.
;
READ_INPUT:
		PUSH	HL
.JOY1:	CALL	READ_JOY1		; Read joystick 1, sets Z if no keys pressed.
		JR		Z,.JOY2			;  Check next joystick on no keys in use.
		JR		.DONE			;  Done for now if we've detected a key.
.JOY2:	CALL	READ_JOY2		; Read joystick 1, sets Z if no keys pressed.
		JR		Z,.CHK_Q		;  No keys pressed, so we go check Q instead.
		JR		.DONE			;  Done for now if we've detected a key.
.CHK_Q:	LD		BC,KR_QWERT		; Check for Q key
		CALL	READ_ROW		; Read corresponding keyboard row.
		AND		%00000001		; Is Q pressed?
		JR		NZ,.DONE		;  No, then we are done.
		JP		START_BASIC		;  Yes, then we go start ZX Basic.
.DONE:	POP		HL
		RET

;
; Read keyboard row as indicated by the BC registers, value
; will be put in A. Note that due to Z80 quirkiness, the
; entire BC value (address) will be put on the address bus.
;
READ_ROW:
		IN		A,(C)
		AND		%00011111		; Mask out floating bits
		RET

;
; Handles a detected key press, but we delay exectution until
; we've detected the release of the key (mostly to avoid having to
; deal with key repeat delays).
;
READ_JOY1:
		PUSH	BC
		LD		BC,KR_09876		; Keys 6 through 9
		CALL	READ_ROW		; Read row,
		CP		%00011111		;  check if no keys are pressed?
		JR		Z,.DONE			; Yes, so we go check Q instead.

		PUSH	DE
		LD		(LAST_K),A		; Store key for later
.AGAIN:	CALL	KEY_DELAY
		CALL	READ_ROW		; Read row again, and then
		CP		%00011111		;  check if no keys are pressed?
		JR		Z,.RELEASED		; Yes, so go do something.
		JR		.AGAIN
.RELEASED:
		POP		DE
		LD		A,(LAST_K)		; Read it back again.
.CHK_9:	CP		%00011101		; Bit 1 is zero for UP
		JR		NZ,.CHK_8		; Next key, unless we have a match.
		CALL	MOVE_UP
		JR		.DONE
.CHK_8:	CP		%00011011		; Bit 2 is zero for DOWN
		JR		NZ,.CHK_0		; Next key, unless we have a match.
		CALL	MOVE_DOWN
		JR		.DONE
.CHK_0:	CP		%00011110		; Bit 0 is zero for FIRE
		JR		NZ,.DONE		; Done checking, unless we have a match.
		CALL	PRESS_FIRE
.DONE:	POP		BC
		CP		%00011111		; Update Z-flag to indicate no key
		RET

;
; Handles a detected key press, but we delay exectution until
; we've detected the release of the key (mostly to avoid having to
; deal with key repeat delays).
;
READ_JOY2:
		PUSH	BC
		LD		BC,KR_12345		; Keys 1 through 5
		CALL	READ_ROW		; Read row,
		CP		%00011111		;  check if no keys are pressed?
		JR		Z,.DONE			; Yes, so we go check Q instead.

		PUSH	DE
		LD		(LAST_K),A		; Store key for later
.AGAIN:	CALL	KEY_DELAY
		CALL	READ_ROW		; Read row again, and then
		CP		%00011111		;  check if all keys released.
		JR		Z,.RELEASED		; Yes, so go do something.
		JR		.AGAIN
.RELEASED:
		POP		DE
		LD		A,(LAST_K)		; Read it back again.
.CHK_4:	CP		%00010111		; Bit 3 is zero for UP
		JR		NZ,.CHK_3		; Next key, unless we have a match.
		CALL	MOVE_UP
		JR		.DONE
.CHK_3:	CP		%00011011		; Bit 2 is zero for DOWN
		JR		NZ,.CHK_5		; Next key, unless we have a match.
		CALL	MOVE_DOWN
		JR		.DONE
.CHK_5:	CP		%00001111		; Bit 4 is zero for FIRE
		JR		NZ,.DONE		; Done checking, unless we have a match.
		CALL	PRESS_FIRE
.DONE:	POP		BC
		RET

;
; Move selection up, decrementing the index as we go. The code ensures that
; we don't go past the minimum value of of 1 (bank 0 is this program).
;
MOVE_UP:
		PUSH	AF
		LD		A,(CUR_IDX)		; Load current index number.

		CP		1				; Already at minimum index?
		JR		Z,.DONE			; Yes, then we are done.
		DEC		A				; No, so let's bump it up one position.
		LD		(CUR_IDX),A
.DONE:	CALL	UPDATE_TITLES	; Update the titles with highlight.
		POP		AF
		RET

;
; Move selection down, incrementing the index as far as we can go. This value
; comes from the SLOTS variable, initially calculated from the values entered
; in NUM_TITLES at the end of the image. We need to do this so that we can't
; go past the size of the actual EEPROM.
;
MOVE_DOWN:
		PUSH	AF
		PUSH	BC
		LD		A,(SLOTS)		; Get the maximum number we can have,
		LD		B,A				;  save it in C for later comparison.
		LD		A,(CUR_IDX)		; Load current index number.

		CP		B				; Already at maximum index?
		JR		Z,.DONE			; Yes, then we are done.
		INC		A				; No, so let's bump it up one position.
		LD		(CUR_IDX),A
.DONE:	CALL	UPDATE_TITLES	; Update the titles with highlight.
		POP		BC
		POP		AF
		RET

;
; The fire button has been pushed, so we'll attempt to perform bank switching.
;
PRESS_FIRE:
		PUSH	AF
		PUSH	BC
		PUSH	HL
		PUSH	DE
		
		CALL	GET_BANK_IDENTIFIER
		LD		A,H				; Bank identifier in A
		LD		B,L				; Chip identifier in B
		RL		B				; Shift CS value into correct position, these
		RL		B				;  should be bit 6 and 7 on the bank switching
		RL		B				;  register.
		RL		B
		RL		B
		RL		B
		ADD		B				; Add slot number to it

		CALL	SET_BANK

		POP		DE
		POP		HL
		POP		BC
		POP		AF
		RET						; We should never be able to get here.

;
; Converts the current slot index into a value suitable for use with the
; bank switching scheme, this is mostly complicated due to the four counters
; used. On return H will hold bank value, L will indicate the chip identifier.
;
GET_BANK_IDENTIFIER:
		PUSH	AF
		PUSH	BC
		PUSH	DE

		LD		HL,SLOT_COUNT
		LD		C,4
		LD		A,(CUR_IDX)
		LD		D,A
		LD		A,0
		LD		E,0
.NEXT_CHIP:
		LD		B,(HL)
		LD		E,0
.NEXT:	INC		E
		INC 	A
		CP		D
		JR		Z,.DONE

		DEC		B
		JR		NZ,.NEXT

		INC		HL
		DEC		C
		JR		NZ,.NEXT_CHIP

.DONE:
		LD		A,4
		SUB		C
		LD		B,A
		JR		NZ,.OFFSET_LOADER
		INC		E
.OFFSET_LOADER:
		DEC		E
		LD		H,E
		LD		L,A
		
		POP		DE
		POP		BC
		POP		AF
		RET

;
; Configures bank switching according to value in A. Before restarting at
; $0000 to start the bank that has been switched in, we'll try to ensure
; that the bank was actually switched - this is done by looking for a text
; signature at $0400. After switching the first two bytes probably shouldn't
; match 'Z' and 'X'.
;
SET_BANK:
		DI						; Disable interrupts
		LD		C,CTRL_LED		; Controls LEDs found on ZX Diagnostic 2.021
		OUT		(C),A			;  so let's just write the value to it.
		LD		C,CTRL_BANK		; Port used for controlling the bank switching
		OUT		(C),A			;  we write the same value.
.CHECK:	LD		HL,SIGNATURE	; Banks should now have been switched around,	
		LD		A,(HL)			;  but in order	to make sure we'll check.
		CP		'Z'
		JR		NZ,.OK
		INC		HL
		LD		A,(HL)
		CP		'X'
		JR		NZ,.OK
.ERROR: JP		ERROR			; Jump out of main loop and set error screen.
.OK:	JP		$0000			; Looks good, so we'll just start from the bank.
		RET						; We should never be able to get here.

;
; Start ZX Basic. This is done by attempting to deactivate the bank switching
; hardware, then before restarting at $0000 a check will be made to see that
; the loader ROM has disappeared.
;
START_BASIC:
		LD		A,%00100000		; Bit 5 disables bank switching.
		CALL	SET_BANK		; Try to do it.
		RET						; We should never be able to get here.

;
; Reset cursor position.
;
RESET_CURSOR:
		LD		A,0		
		LD		(CUR_X),A
		LD		(CUR_Y),A
		RET

;
; Set cursor position, HL register is treated as X,Y character coordinates.
; Example: 
;		LD A,$0102 will set X=1 and Y=2
;
SET_CURSOR:
		PUSH	AF
		LD		A,H
		LD		(CUR_X),A
		LD		A,L
		LD		(CUR_Y),A
		POP		AF
		RET

;
; Loads cursor into HL register, this moves data in exactly the opposite
; way as SET_CURSOR.
;
GET_CURSOR:
		PUSH	AF
		LD		A,(CUR_X)
		LD		H,A
		LD		A,(CUR_Y)
		LD		L,A
		POP		AF
		RET

;
; Increment cursor position. While the screen attribute memory is organized
; as expected, the RAM used for the pixel data is not - so we need to track
; when we cross over from one line into the next.
;
INC_CURSOR:
		PUSH	AF				; Save AF for when I forget it
		LD		A,(CUR_X)
		CP		32-1			; Check if in last column
		JR		C,.INC_X		; no, just increment X
		LD		A,0				; yes, so we:
		LD		(CUR_X),A		;   reset X
		JR		.INC_Y			;   increment Y
.INC_X:	LD		A,(CUR_X)
		INC		A
		LD		(CUR_X),A
		JR		.DONE
.INC_Y:	LD		A,(CUR_Y)
		CP		24-1			; Check if on last row
		JR		C,.NXT_Y		; no, just go to the next
		LD		A,0				;   yes, so we:
		LD		(CUR_Y),A		;   reset Y
		JR		.DONE			;   and we are done.
.NXT_Y:	LD		A,(CUR_Y)
		INC		A
		LD		(CUR_Y),A		
.DONE:	POP		AF				; Restore AF
		RET

;
; Get the memory address for the attribute as indicated by the cursor.
; At the end, HL should hold an address from $5800 and upwards.
;
GET_ATTR_ADDR:
		PUSH	AF
		LD		A,(CUR_Y)		; X position
		RRCA					; Multiply by 32
		RRCA
		RRCA
		LD		L,A				; Store as low byte
		AND		3				; Mask bits for high byte
		ADD		A,$58			; And with start of attribute address
		LD		H,A				; High byte done.
		LD		A,L				; Get back x*32
		AND		$E0
		LD		L,A				; Put in L.
		LD		A,(CUR_X)		; Get row start
		ADD		A,L				; Add to low byte
		LD		L,A
		POP		AF
		RET

;
; Set attributes for the block currently indicated by the
; cursor.
;
SET_ATTR:
		PUSH	HL
		CALL	GET_ATTR_ADDR
		LD		(HL),A
		POP		HL
		RET

;
; Set the attributes for a row of screen memory, automatically setting the
; cursor location to the beginning of the row. Does not increment after
; every character as we're not actually printing data.
;
SET_ATTR_ROW:
		PUSH	HL
		PUSH	BC
		CALL	GET_ATTR_ADDR
		
		LD		B,32
.NEXT:	LD		(HL),A
		INC		HL
		DEC		B
		JR		NZ,.NEXT
		POP		BC
		POP		HL
		RET

;
; Output character to the screen. Given that the assembled sources will be
; expected to be ASCII, we'll need to subtract 32 from the value.
;
SET_CHAR:
		PUSH	AF	
		SUB		32				; Subtract 32 from ASCII to get font offset
		CALL	SET_SYMBOL
		POP		AF
		RET

;
; Outputs character with A specifying index into font data, note that DE is
; expected to hold the memory reference for the font used.
;
SET_SYMBOL:
		PUSH	BC
		PUSH	DE
		PUSH	HL
		CALL	GET_SCREEN_ADDR	; Get screen address for cursor location
		LD		B,0				; Find FONT_DATA character index
		LD		C,A
		
		SLA		C
		RL		B
		SLA		C
		RL		B
		SLA		C
		RL		B
		
		EX 		DE, HL
		ADD 	HL, BC 
		EX 		DE, HL	
		CALL 	SET_CHAR_PIXELS	; Output pixels to screen memory
		POP 	HL
		POP		DE
		POP		BC
		RET 

SET_FONT1:
		LD		DE,FONT1		; Start of font data
		RET

SET_FONT2:
		LD		DE,FONT2
		RET

;
; Get the memory address for the character as indicated by the cursor,
; the location in screen memory will be left in HL (from $4000 to $57FF).
;
GET_SCREEN_ADDR:
		PUSH	AF
		LD		A,(CUR_X)
		LD		L,A
		
		LD 		A,(CUR_Y)
		AND 	%00000111
		RRA
		RRA
		RRA
		RRA
		OR 		L
		LD 		L,A
		LD 		A,(CUR_Y)
		AND 	%00011000
		OR 		/SCREEN			; Screen address HI byte
		LD 		H,A
		
		POP		AF
		RET

;
; Print string to the current cursor position, incrementing for each character
; that is "printed" to the screen memory.
;
PUTS:	PUSH	HL
		PUSH	AF	
.NEXT:	LD		A,(HL)
		OR		A				; OR with itself to update the Z-flag.
		JR		Z,.DONE			; Done if we found byte that is $00
		CALL	SET_CHAR		; Output character to cursor location
		CALL	INC_CURSOR		; Increment cursor to next position
		INC		HL				; Next character
		JP		.NEXT
.DONE:	POP		AF	
		POP		HL
		RET

;
; Same as above except that we output symbols directly instead of translating
; ASCII characters (that way we don't have to hardcode symbols at +32).
;
PUTSS:	PUSH	HL
		PUSH	AF	
.NEXT:	LD		A,(HL)
		OR		A				; OR with itself to update the Z-flag.
		JR		Z,.DONE			; Done if we found byte that is $00
		CALL	SET_SYMBOL		; Output character to cursor location
		CALL	INC_CURSOR		; Increment cursor to next position
		INC		HL				; Next character
		JP		.NEXT
.DONE:	POP		AF	
		POP		HL
		RET

;
; Output character data into screen memory, these are 8x8 pixels - meaning
; we'll need to update eight different lines on the screen.
; 
SET_CHAR_PIXELS:
		LD		B,8				; 8 lines per character
.NEXT:	LD		A,(DE)			; Load character byte data 
		LD		(HL),A			; Store byte data in screen memory
		INC		DE				; Next character byte
		INC		H				; Screen line start every $100, so we do that
		DJNZ	.NEXT			; Loop unless B reached 0.
		RET

;
; Clear the entire screen, value in A is used to initialize the corresponding
; attribute bytes (when CLR_BG is called directly). The byte must have the
; following composition:
; 	bit 0 (ink bit 0)
;	    1 (        1)
;	    2 (        2)
;	bit 3 (paper bit 0)
;	    4 (          1)
;       5 (          2)
;   bit 6 (bright mode)
;   bit 7 (flash mode)
;
CLEAR:	LD		A,0
CLR_BG:	PUSH	AF
		LD		(LAST_A),A		; Save attribute value for later
		LD 		HL,SCREEN		; Screen memory start
		LD 		DE,SCREEN+1
		LD		BC,SZ_SCRN
		LD		(HL),0
		LDIR					; Loop until we've written SZ_SCRN bytes
		LD		BC,SZ_ATTR-1
		LD		(HL),A
		LDIR					; Loop until we've written all attributes
		POP		AF
		RET

MSG_TB_UPPER:
		.DB		$02,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
		.DB		$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
		.DB		$03,$04,$00
MSG_TB_LOWER:
		.DB		$06,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
		.DB		$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
		.DB		$05,$07,$00
MSG_TITLE:
		.AZ		"       ZX INTERFACE 2.021       "
MSG_HELP:
		.AS		"   (? = 8  ? = 9  START = 0)    "
		.AZ		"        (Q = ZX Basic)         "
ERR_TITLE:
		.AZ		"             ERROR             "
ERR_MSG:
		.AS		" \"Cartridge bank not switched out as expected. Software for"
		.AZ		" use with ZX Interface 2.021 or compatible hardware.\""

		.NO		$7400
FONT_SYMBOLS:
		.IN		font_symbols.asm
		.NO		$7500,$FF
FONT1:	.BI		font1.bin
		.NO		$7800,$FF
FONT2:	.BI		font2.bin

		.NO		$7C00,$FF
TITLE0	.AZ		"        Cartridge Loader       "
		.NO		$7C20,$00
TITLE1:	.AZ		" Name 1"
		.NO		$7C40,$00
TITLE2:	.AZ		" Name 2"
		.NO		$7C60,$00
TITLE3:	.AZ		" Name 3"
		.NO		$7C80,$00
TITLE4:	.AZ		" Name 4"
		.NO		$7CA0,$00
TITLE5:	.AZ		" Name 5"
		.NO		$7CC0,$00
TITLE6:	.AZ		" Name 6"
		.NO		$7CE0,$00
TITLE7:	.AZ		" Name 7"
		.NO		$7D00,$00
TITLE8:	.AZ		" Name 8"
		.NO		$7D20,$00
TITLE9:	.AZ		" Name 9"
		.NO		$7D40,$00
TITLE10:
		.AZ		" Name A"
		.NO		$7D60,$00
TITLE11:
		.AZ		" Name B"
		.NO		$7D80,$00
TITLE12:
		.AZ		" Name C"
		.NO		$7DA0,$00
TITLE13:
		.AZ		" Name D"
		.NO		$7DC0,$00
TITLE14:
		.AZ		" Name E"
		.NO		$7DE0,$00
TITLE15:
		.AZ		" Name F"
		.NO		$7FFC,$00
SLOT_COUNT:
		.DB		3
		.DB		0
		.DB		0
		.DB		0