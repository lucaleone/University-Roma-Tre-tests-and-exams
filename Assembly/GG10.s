_EXIT = 1
_FPRINTF = 127
.SECT .TEXT
start:
	MOV AX, (num)
	MOV CX, (num)
	a: 
		div CX
		CMP DX, 0
			JNE no
		LOOP a
	JMP yes
	no: 
		PUSH str1
		JMP fin
	yes:
	PUSH str2
	fin:
	PUSH _FPRINTF
	SYS
		
	PUSH 0
	PUSH _EXIT
	SYS


.SECT .DATA
num: .WORD 5
res: .WORD 3
str1: .ASCII "NON e' primo"
sp1: .SPACE 1
str2: .ASCII "e' primo"
.SECT .BSS