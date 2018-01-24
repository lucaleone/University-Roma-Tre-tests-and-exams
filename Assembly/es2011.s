_EXIT = 1
_FPRINTF = 127

.SECT .TEXT 
start: 
	PUSH N
	CALL SUM
	ADD SP, 2

	PUSH N
	CALL EQU
	ADD SP, 2
	PUSH 0
	PUSH _EXIT
	SYS

EQU:
	PUSH BP
	MOV BP, SP
	MOV SI, 4(BP)
	MOV DI, M
	repe CMPSW 
		JNE no
	PUSH yesEQU
	JMP fin
	no: PUSH noEQU
	fin: PUSH _FPRINTF
		SYS

	MOV SP, BP
	POP BP
	RET


SUM:
	PUSH BP
	MOV BP, SP

	MOV BX, 4(BP)
	MOV CX, endN - N
	SHR CX, 1
	MOV AX, 0
	MOV SI, 0
	a: 
		ADD AX, (BX)(SI)
		ADD SI, 2
		LOOP a
	PUSH AX
	PUSH str
	PUSH _FPRINTF
	SYS

	MOV SP, BP
	POP BP
	RET

.SECT .DATA
N: .WORD 3, 2, 5, 8, 12
endN: .SPACE 1
M: .WORD 3, 2, 4, 7, 12
str: .ASCII "La somma e': %d"
sp0: .SPACE 1
yesEQU: .ASCII "I vettori sono uguali"
sp1: .SPACE 1
noEQU: .ASCII "I vettori NON sono uguali"
.SECT .BSS