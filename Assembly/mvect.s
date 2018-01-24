_EXIT = 1
_PRINTF = 127

.SECT .TEXT 
start:

	CALL lunghezza
	CALL printVec

	! controllo che num esista: esiste
	PUSH (num)
	CALL exists
		ADD SP, 2

	! controllo che num2 esista: false, non esiste
	PUSH (num2)
	CALL exists
		ADD SP, 2

	! controllo che  vect1 e vect2 siano uguali: deve risultare false
	PUSH vec2-vec1
	PUSH vec1
	PUSH vec1-vec
	PUSH vec
	CALL equals
	ADD SP, 6

	! controllo che  vect1 e vect2 siano uguali: deve risultare true
	PUSH num-vec2
	PUSH vec2
	PUSH vec1-vec
	PUSH vec
	CALL equals
	ADD SP, 6

	PUSH 0 
	PUSH _EXIT 
	SYS 

equals: !(vect1, longVect1, vect2, longVect2)  controlla che due vettori passati a parametro siano uguali
	PUSH BP
	MOV BP, SP
	MOV CX, 6(BP) !contiene longVect1
	MOV BX, 10(BP) !contiene  longVect2
	SHR CX, 1
	SHR BX, 1
	CMP CX, BX !se la lunghezza diversa sono per forza diversi
		JNE notequals
	MOV SI, 4(BP) !contiene  vect1
	MOV DI, 8(BP) !contiene  vect2
	
	REPE CMPSW
		JNE notequals
	JMP true		
	notequals:
		PUSH resEquals0
		JMP end		
	true:PUSH resEquals1
	end:
		PUSH _PRINTF
		SYS

	MOV SP, BP
	POP BP
	RET


exists: ! controlla se il valore passato a parametro e^ presente nel vettore
	PUSH BP
	MOV BP, SP

	MOV CX, vec1-vec
	SHR CX,1
	MOV BX, vec
	MOV SI, 0
	MOV AX, 4(BP)
	b:
		CMP AX, (BX)(SI)
			JE yes
		ADD SI, 2
		LOOP b
	JMP no

	yes: 
		MOV DX, resExists0
		JMP end1
	no: MOV DX, resExists1
	end1:
		PUSH AX
		PUSH DX
		PUSH _PRINTF
		SYS

	MOV SP, BP
	POP BP
	RET

lunghezza: !stampa la lunghezza del vettore
	PUSH BP
	MOV BP,SP

	MOV AX, vec1-vec
	SHR AX,1
	PUSH AX
	PUSH lengthStr
	PUSH _PRINTF
	SYS

	MOV SP, BP
	POP BP
	RET

printVec: !stampa il vettore con formattazione " {val} "
	PUSH BP
	MOV BP, SP

	MOV CX, vec1-vec
	SHR CX,1
	MOV SI, 0
	MOV BX, vec
	a:
		PUSH (BX)(SI)
		PUSH intStr
		PUSH _PRINTF
		SYS
		ADD SI, 2
		LOOP a

	MOV SP, BP
	POP BP
	RET

.SECT .DATA 
vec: .WORD 3,5,7,2,9
vec1: .WORD 3,7,1,10,2 !vettore diverso dal primo
vec2: .WORD 3,5,7,2,9	!vettore uguale al primo
num: .WORD 7
num2: .WORD 12
lengthStr: .ASCII "\nla Lunghezza e' %d \n"
sp1: .SPACE 1
resExists0: .ASCII "\nIl numero %d e' presente nel vettore \n"
sp2: .SPACE 1
resExists1: .ASCII "\nIl numero %d NON e' presente nel vettore\n"
sp3: .SPACE 1
resEquals0: .ASCII "\nI due vettori non sono uguali \n" 
sp4: .SPACE 1
resEquals1: .ASCII "\nI due vettori sono uguali \n"
sp5: .SPACE 1
intStr: .ASCII " %d "
.SECT .BSS
