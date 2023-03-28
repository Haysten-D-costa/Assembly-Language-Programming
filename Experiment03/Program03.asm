; TO CHECK WHETHER NUMBER ENTERED IS POSITIVE OR A NEGATIVE NUMBER...

section .data
	msg1 db "Enter a number : "
	msg1L equ $ -msg1
	msg2 db "Number you entered is a 'POSITIVE' number."
	msg2L equ $ -msg2
	msg3 db "Number you entered is a 'NEGATIVE' number."
	msg3L equ $ -msg3
	
section .bss
	num resb 1
	
section .text 
	global _start

_start : 
	; MOV edx, msg1L
	; MOV ecx, msg1
	; MOV ebx, 1
	; MOV eax, 4
	; INT 80h
	
	; MOV edx, 1
	; MOV ecx, num
	; MOV ebx, 0
	; MOV eax, 3
	; INT 80h
	
	MOV eax, 11111111H

	ROL eax, 1 ; Rotate bit to left...
	JC negative
	
	MOV edx, msg2L
	MOV ecx, msg2
	MOV ebx, 1
	MOV eax, 4
	INT 80h
	JMP exit
	
  negative :  
	MOV edx, msg3L
	MOV ecx, msg3
	MOV ebx, 1
	MOV eax, 4
	INT 80h

  exit : 
	MOV ebx, 0
	MOV eax, 1
	INT 80h
