; PROGRAM TO GENERATE NUMBERS FROM 0-9 (USING LOOPS)...

section .data
	msg1 db 10, "Displaying numbers(-i.e- from 1-9) : ", 10, "-> "
	msg1L equ $ -msg1
	gap db "  "
	gapL equ $ -gap
	new_line db " ", 10
	new_lineL equ $ -new_line
	
section .bss
	num resb 1
	
section .text
	global _start
	
_start:
	mov edx, msg1L ; To display the 'msg1'...
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 80H
	
	mov eax, '1'
	mov ecx, '9'
	sub ecx, '0'
	
up:
	mov [num], eax
	push ecx
	
	mov edx, 1 ; To display the number...
	mov ecx, num
	mov ebx, 1
	mov eax, 4
	int 80H
	
	mov edx, gapL ; To display gap...
	mov ecx, gap
	mov ebx, 1
	mov eax, 4
	int 80H
	
	mov eax, [num]
	sub eax, '0'
	
	inc eax
	add eax, '0'
	
	pop ecx
	loop up
	
	mov edx, new_lineL
	mov ecx, new_line
	mov ebx, 1
	mov eax, 4
	int 80H
	
	mov ebx, 0 ; To exit...
	mov eax, 1
	int 80H
		
	
	 
