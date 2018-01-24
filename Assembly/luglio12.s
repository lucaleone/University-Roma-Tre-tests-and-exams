_EXIT = 1
_PRINTF = 127

.SECT .TEXT
start:
	PUSH S
	CALL PAL
	
	PUSH 0
	PUSH _EXIT
	SYS

PAL: ! 1 se palindroma
	PUSH BP
	MOV BP, SP

	MOV BX, 4(BP)
	MOV DI, res-S
	SHR DI,1
	MOV AX, DI
	DIV (res)
	MOV CX, AX
	MOV SI, 0
	A: 
		CMP (BX)(SI), (BX)(DI)
			JNE no
		ADD SI, 2
		SUB DI, 2
		LOOP A
	PUSH y
	JMP end
	no: PUSH n
	end:
	PUSH _PRINTF
	SYS

	MOV SP, BP
	POP BP
	RET

.SECT .DATA
S: .ASCII "anna"
res: .WORD 2;
y: .ASCII "è palindromo"
n: .ASCII "non è palindromo"
.SECT .BSS