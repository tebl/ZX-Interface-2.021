;
; Loads a complete SCR-file, essentially overwriting the entire
; screen memory as well as corresponding attribute data. HL points
; to start of data.
;
SHOW_SCR:
		PUSH	DE
		PUSH	IX
		PUSH	AF
		LD		IX,SCREEN
		LD		DE,SZ_SCRN+SZ_ATTR
NEXT_BYTE:
		LD		A,(HL)
		INC		HL

		LD		(IX),A
		INC		IX
		
		DEC		DE
		LD		A,D
		OR		E
		JP		NZ,NEXT_BYTE
		POP		AF
		POP		IX
		POP		DE
		RET
