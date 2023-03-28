; TO CHECK WHETHER NUMBER IS EVEN OR ODD...

section .data
	msg1 db "Enter a number : "
	msg1L equ $ -msg1
	msg2 db "Number you entered is an 'EVEN' number."
	msg2L equ $ -msg2
	msg3 db "Number you entered is an 'ODD' number."
	msg3L equ $ -msg3
	
section .bss
	num resb 1
	
section .text 
	global _start

_start : 
	MOV edx, msg1L
	MOV ecx, msg1
	MOV ebx, 1
	MOV eax, 4
	INT 80h
	
	MOV edx, 1
	MOV ecx, num
	MOV ebx, 0
	MOV eax, 3
	INT 80h
	
	MOV eax, [num]
	AND eax, 1H
	JZ EVEN
	
	MOV edx, msg3L
	MOV ecx, msg3
	MOV ebx, 1
	MOV eax, 4
	INT 80h
	JMP EXIT
	
EVEN :  
	MOV edx, msg2L
	MOV ecx, msg2
	MOV ebx, 1
	MOV eax, 4
	INT 80h

EXIT : 
	MOV ebx, 0
	MOV eax, 1
	INT 80h