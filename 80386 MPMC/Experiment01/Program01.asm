; PROGRAM TO PRINT AND DISPLAY 'HELLO WORLD' STRING WITH PROGRAMMER NAME...

section .data
	msg01 db 'Hello World', 13,10			; STORING FIRST STRING (in msg01)...
	msg01_length equ $-msg01				; STORING LENGTH OF FIRST STRING (in msg01_length)...
	msg02 db 'My name is Haysten', 13,10    	; STORING SECOND STRING (in msg02)...
	msg02_length equ $-msg02				; STORING LENGTH OF SECOND STRING (in msg02_length)...

section .text
	global _start

_start :
	mov eax, 4							; DISPLAYS FIRST MESSAGE(msg01)...
	mov ebx, 1
	mov ecx, msg01
	mov edx, msg01_length
	int 80h

	mov eax, 4							; DISPLAYS SECOND MESSAGE(msg02)...
	mov ebx, 1
	mov ecx, msg02
	mov edx, msg01_length
	int 80h 

	mov eax, 1							; EXIT...
	int 80h