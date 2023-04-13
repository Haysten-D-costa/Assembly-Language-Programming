; TO CONVERT LOWERCASE CHARACTER TO UPPERCASE CHARACTER USING PROCEDURE...

section .data
	msg1 db 10, "Enter an lowercase character : "
	msg1L equ $ -msg1
    msg2 db 10, "RESULT : ", 10, "-> Entered lowercase character   : "
    msg2L equ $ -msg2
	msg3 db 10, "-> Converted uppercase character : "
	msg3L equ $ -msg3
	msg4 db 10, "-> Invalid character entered !"
	msg4L equ $ -msg4
	new_line db " ", 10, 10
	new_lineL equ $ -new_line
	
section .bss
	upper_char resb 1
	lower_char resb 1

section .text
	global _start
_start:
	MOV EDX, msg1L ; Prompt user to enter an lowercase character...
	MOV ECX, msg1
	MOV EBX, 1
	MOV EAX, 4
	INT 80H
	
	MOV EDX, 1 ; Accept an lowercase character...
	MOV ECX, lower_char
	MOV EBX, 0
	MOV EAX, 3
	INT 80H
	
	CALL LOWER_to_UPPER ; Calling procedure...
	
	MOV EDX, msg2L
	MOV ECX, msg2
	MOV EBX, 1
	MOV EAX, 4
	INT 80H
	
    MOV EDX, 1
	MOV ECX, lower_char
	MOV EBX, 1
	MOV EAX, 4
	INT 80H

    MOV EDX, msg3L
	MOV ECX, msg3
	MOV EBX, 1
	MOV EAX, 4
	INT 80H

	MOV EDX, 1
	MOV ECX, upper_char
	MOV EBX, 1
	MOV EAX, 4
	INT 80H
	JMP EXIT
	
LOWER_to_UPPER:
 	MOV AL, [lower_char]
 	CMP AL, 'a'
 	JB INVALID
 	CMP AL, 'z'
 	JA INVALID
 	SUB AL, 32
 	MOV [upper_char], AL
 	RET
 	
INVALID:
	MOV EDX, msg4L
	MOV ECX, msg4
	MOV EBX, 1
	MOV EAX, 4
	INT 80H
 	
EXIT:
 	MOV EDX, new_lineL
 	MOV ECX, new_line
 	MOV EBX, 1
 	MOV EAX, 4
 	INT 80H
 
 	MOV EBX, 0
	MOV EAX, 1
	INT 80H		
