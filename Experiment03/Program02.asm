; PROGRAM TO CHECK WHETHER NUMBER IS EVEN OR ODD...

section .data
	msg1 db "Enter a number : "
	msg1L equ $ -msg1
	msg2 db "Number you entered is an 'even' number.", 10, 10
	msg2L equ $ -msg2
	msg3 db "Number you entered is an 'ODD' number.", 10, 10 
	msg3L equ $ -msg3
	
section .bss
	num resb 2
	
section .text 
	global _start

_start:
	mov edx, msg1L
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 80H
	
	mov edx, 2
	mov ecx, num
	mov ebx, 0
	mov eax, 3
	int 80H
	
	mov al, [num]
	AND al, 1H
	jz even
	
	mov edx, msg3L
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 80H
	jmp exit
	
even:
	mov edx, msg2L
	mov ecx, msg2
	mov ebx, 1
	mov eax, 4
	int 80H

exit:
	mov ebx, 0
	mov eax, 1
	int 80H