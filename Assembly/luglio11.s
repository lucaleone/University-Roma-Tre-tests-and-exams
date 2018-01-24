_EXIT = 1
_PRINTF = 127

.SECT .TEXT
start:
	PUSH N
	CALL LUN
	ADD SP, 2

	PUSH N
	CALL COM
	ADD SP, 2

	PUSH 0
	PUSH _EXIT
	SYS

LUN:
	PUSH BP
	MOV BP, SP

	MOV BX, 4(BP)
	MOV DX, endN - N
	SHR DX,1	

	PUSH DX
	PUSH STRlun
	PUSH _PRINTF
	SYS

	MOV SP, BP
	POP BP
	RET

COM:
	PUSH BP
	MOV BP, SP

	MOV BX, 4(BP)
	MOV CX, endN - N
	SHR CX,1
	MOV SI, 0
	a:
		CMP (BX)(SI) , 0
			JE yes
		MOV (BX)(SI), 0
		JMP fin
		yes: MOV(BX)(SI), 1
		fin:
		ADD SI, 2
		LOOP a
	


	MOV CX, endN - N
	SHR CX,1
	MOV SI, 0
	b:
		PUSH (BX)(SI)
		PUSH val
		PUSH _PRINTF
		SYS
		ADD SI, 2
		LOOP b

	MOV SP, BP
	POP BP
	RET

.SECT .DATA
N: .WORD 0,1,0,1,1
endN: .SPACE 1
M: .WORD 0
STRlun: .ASCII "La lunghezza e' %d"
val: .ASCII " %d "
.SECT BSS