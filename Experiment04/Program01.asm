; ALP TO CONVERT A HEXADECIMAL NUMBER TO ASCII...

section .data
	ecnt dw 12H
	msg db 'The converted number is :  '
	msglength equ $ -msg
	msg1 db 10, ' ', 10
	msgl1 equ $-msg1

section .bss
	dis_buffer resb 2

section .text
	global _start

_start:
	mov bx, word[ecnt]
	mov ecx, 2
	mov edi, dis_buffer

DUP:
	rol bl, 04
	mov al, bl
	and al, 0fH
	cmp al, 09H
	jbe NEXT
	add al, 07H

NEXT:
	add al, 30H
	mov [edi], al
	inc edi
	loop DUP

	mov edx, msglength
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80H
    
	mov edx, 2
	mov ecx, dis_buffer
	mov ebx, 1
	mov eax, 4
	int 80H


	mov edx, msgl1
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 80H

	mov ebx, 0
	mov eax, 1
	int 80H