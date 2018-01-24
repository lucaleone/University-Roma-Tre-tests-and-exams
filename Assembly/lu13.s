_EXIT = 1
_FPRINTF = 127

.SECT .TEXT
start:
	PUSH s
	CALL LUN
	ADD SP, 2

	PUSH s
	PUSH x
	CALL OCC
	ADD SP, 4

	PUSH 0
	PUSH _EXIT
	SYS

LUN:
	PUSH BP
	MOV BP, SP

	MOV BX, 4(BP)
	MOV CX, endS - s
	
	PUSH CX
	PUSH str
	PUSH _FPRINTF
	SYS

	MOV SP, BP
	POP BP
	RET

OCC:
	PUSH BP
	MOV BP, SP
	MOV CX, endS - s
	MOV BX, 4(BP)
	MOV AX, (BX)
	MOV DX, 0
	MOV DI, 6(BP)
	a:
		SCASB 	
			JE addres
		jmp fin
		addres: 
			ADD DX, 1
		fin:
			loop a	
	
	PUSH DX
	PUSH str2
	PUSH _FPRINTF
	SYS

	MOV SP, BP
	POP BP
	RET


.SECT .DATA
s: .ASCII "CIAOCIAO"
endS: .SPACE 1
x: .ASCII 'C'
endX: .SPACE 1
str: .ASCII "E' LUNGA: %d"
endSTR: .SPACE 1
str2: .ASCII " /n nummero occ: %d"
endSTR2: .SPACE 1

.SECT .BSS