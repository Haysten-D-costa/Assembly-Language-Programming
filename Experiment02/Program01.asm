; TO DISPLAY A SINGLE DIGIT NUMBER INPUTTED BY USER...

section .data
	msg01 db "Enter a number : "     ; Prompt user to enter a number...
	msglength01 equ $-msg01
	msg02 db "Number you entered : " ; To indicate entered number...
	msglength02 equ $-msg02
	msg03 db "     ", 13, 10         ; To display blank line...
	msglength03 equ $-msg03
	
section .bss
	num resb 1           ; Declaring an un-initialised variable (num)...
	
section .text
	global _start

_start :
	MOV edx, msglength01 ; To display the 1st message... 
	MOV ecx, msg01
	MOV ebx, 1
	MOV eax, 4 
	INT 80H

	MOV edx, 1           ; To input and store the number in num...
	MOV ecx, num
	MOV ebx, 0
	MOV eax, 3 
	INT 80H
	
	MOV edx, msglength02 ; To display the 2nd message...
	MOV ecx, msg02
	MOV ebx, 1
	MOV eax, 4 
	INT 80H
	
	MOV edx, 1           ; To display no. entered...
	MOV ecx, num
	MOV ebx, 1
	MOV eax, 4 
	INT 80H
	
	MOV edx, msglength03 ; To display the 3rd message...   
	MOV ecx, msg03
	MOV ebx, 1
	MOV eax, 4 
	INT 80H
	
	MOV eax, 1           ; To exit...
	INT 80H
