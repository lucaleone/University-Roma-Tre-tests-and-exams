_EXIT = 1
_FPRINTF = 127
.SECT .TEXT
start:

	MOV AX, num
	MOV CX, num
	a: 
		DIV CX
		CMP AH, 0
			JNE no
		LOOP a
	JMP si
	no: 
		PUSH str1
		JMP fin
	si:
	PUSH str2
	PUSH _FPRINTF
	SYS

	PUSH _EXIT
	PUSH 0
	SYS


.SECT .DATA
num: .WORD 12
str1: .ASCII "NON e' primo"
str1: .ASCII "e' primo"
.SECT .BSS