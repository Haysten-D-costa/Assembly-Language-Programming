; PROGRAM TO CHECK WHETHER NUMBER ENTERED IS POSITIVE OR A NEGATIVE NUMBER...

section .data
	msg1 db "Enter a number : "
	msg1L equ $ -msg1
	msg2 db "Number entered is a 'POSITIVE' number.", 10, 10 
	msg2L equ $ -msg2
	msg3 db "Number entered is a 'NEGATIVE' number.", 10, 10
	msg3L equ $ -msg3
	msg4 db "Number entered is neither positive nor negative.", 10, 10
	msg4L equ $ -msg4

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
	sub al, '0'

	rol al, 1     ; Rotate bit to left, and store leftmost bit(sign-bit) to CF, if(CF=1) ==> Number negative...
	jz zero       ; Jump to zero section...
	jc negative   ; Jump to negative section...
	
	mov edx, msg2L
	mov ecx, msg2
	mov ebx, 1
	mov eax, 4
	int 80H
	jmp exit

zero:
	mov edx, msg4L
	mov ecx, msg4
	mov ebx, 1
	mov eax, 4
	int 80H
	jmp exit

negative:
	mov edx, msg3L
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 80H

exit:
	mov ebx, 0
	mov eax, 1
	int 80H
