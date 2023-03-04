; TO PRINT AND DISPLAY 10 STARS USING ONE VARIABLE...

section .data
	msg db 'Displaying 10 starts :', 13,10	; STORING FIRST STRING (in msg)...
	msg_len equ $ -msg						; STORING LENGTH OF STRING (in msg_len)...
	star times 10 db '*', 13,10				; STORING STAR Character (in star)...
	star_len equ $ -star					; STOring STAR Character LENGTH (in star_len)... 

section .text
	global _start

_start :
	mov eax, 4								; DISPLAYS FIRST MESSAGE(msg)...
	mov ebx, 1
	mov ecx, msg
	mov edx, msg_len
	int 80h

	mov eax, 4								; DISPLAYS THE 10 STARS(star times 10)...
	mov ebx, 1
	mov ecx, star
	mov edx, star_len
	int 80h  

	mov eax, 1								; EXIT...
	int 80h
	