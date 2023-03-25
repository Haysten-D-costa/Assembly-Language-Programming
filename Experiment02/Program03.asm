; TO PERFORM BASIC MATHEMATICAL OPERATRIONS ON INPUTED num1BERS...

section .data
	msg1 db "Enter first number   : "
	msgl1 equ $-msg1
	msg2 db "Enter second number  : "
	msgl2 equ $-msg2
	msg3 db 13,10, "RESULT : ", 13,10, "-> First number entered   : "
	msgl3 equ $-msg3  
	msg4 db "-> Second number entered  : "
	msgl4 equ $-msg4
	msg5 db "-> Sum   : "
	msgl5 equ $-msg5
	msg6 db 13,10, "-> Diff  : "
	msgl6 equ $-msg6
	msg7 db 13,10, "-> Prod  : "
	msgl7 equ $-msg7
	msg8 db 13,10, "-> Div   : "
	msgl8 equ $-msg8
	msg9 db 13,10, " "
	msgl9 equ $-msg9
	
section .bss
	num1 resb 2 
	num2 resb 2 
	summ resb 1
	diff resb 1
	mult resb 1
	divi resb 1

section .text
	global _start

_start:
	mov edx, msgl1 ; OUTPUT : "Enter first number : "...
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2     ; "User enters using keyboard"...
	mov ecx, num1
	mov ebx, 0
	mov eax, 3
	int 80h
	
	mov edx, msgl2 ; OUTPUT : "Enter second number : "...
	mov ecx, msg2
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2     ; "User enters using keyboard"...
	mov ecx, num2
	mov ebx, 0
	mov eax, 3
	int 80h
	
	mov edx, msgl3 ; OUTPUT : "First number entered : "... 
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2
	mov ecx, num1
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, msgl4 ; OUTPUT : "Second number entered : "... 
	mov ecx, msg4
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2
	mov ecx, num2
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov eax, [num1]
	sub eax, '0'
	
	mov ebx, [num2]
	sub ebx, '0'
	
	add eax, ebx
	add eax, '0'
	
	mov [summ], eax
	
	mov edx, msgl5
	mov ecx, msg5
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1           
	mov ecx, summ          
	mov ebx, 1 
	mov eax, 4            
	int 80h   
	
	mov eax, [num1]
	sub eax, '0'
	
	mov ebx, [num2]
	sub ebx, '0'
		
	sub eax, ebx
	add eax, '0'
	
	mov [diff], eax
	
	mov edx, msgl6
	mov ecx, msg6
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx,1           
	mov ecx,diff          
	mov ebx,1 
	mov eax,4            
	int 80h 
	
	mov ax, [num1]
	sub ax, '0'

	mov bx, [num2]
	sub bx, '0'
	
	mul bx
	add ax, '0'
	
	mov [mult], ax
	
	mov edx, msgl7
	mov ecx, msg7
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1           
	mov ecx, mult          
	mov ebx, 1 
	mov eax, 4            
	int 80h 
	
	mov al, [num1]
	sub al, '0'
	
	mov bl, [num2]
	sub bl, '0'
	
	div bl
	add al, '0'
	
	mov [divi], ax
	
	mov edx, msgl8
	mov ecx, msg8
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1           
	mov ecx, divi          
	mov ebx, 1 
	mov eax, 4            
	int 80h 
	
	mov edx, msgl9
	mov ecx, msg9
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov eax,1
	int 80h	
