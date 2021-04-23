;
; Performs a simple 16-bit delay loop. I've got no idea of the actual timings,
; but it feels like a little over a second.
;
DELAY:	PUSH	BC
		PUSH	DE
		LD		BC,$0400
		LD		DE,$0100
		CALL	CUSTOM_DELAY
		POP		DE
		POP		BC
		RET

;
; Custom delay routine, uses just about anything to burn as many cycles as
; possible. Load BC for an outer loop count, DE for an inner loop to control
; how much time this routine uses. For the exact timings, someone'd need to
; count the cycles and divide it by CPU frequency.
;
CUSTOM_DELAY:
		PUSH	BC				; Save current registers, mainly because we
		PUSH	DE				; overwrite just about anything and we need
		PUSH	AF				; the calling routines to stay working.	
		PUSH	HL
		LD		A,D				; Let's save the starting value of DE - there's
		LD		H,A				; probably an easier way, but that requires
		LD		A,E				; reading.
		LD		L,A
.OUTER:	LD		A,H				; Restore initial DE value
		LD		D,A
		LD		A,L
		LD		E,A
.INNER:	DEC		DE
		LD		A,D				; Decrementing DE does not set Z-flag, so we'll
		OR		E				;  need to do do this. It's a quirk.
		JP		NZ,.INNER		; If DE not 0, then do inner loop again.
		DEC		BC				; Z-flag. Again.
		LD		A,B
		OR		C
		JP		NZ,.OUTER		; If BE not 0, then do outer loop again.
		POP		HL				; Restore registers that were overwritten.
		POP		AF
		POP		DE
		POP		BC
		RET		
