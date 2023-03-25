; TO INPUT, STORE AND DISPLAY THE SUM OF TWO NUMBERS...

section .data
	msg1 db "Enter first number   : "
	msgl1 equ $-msg1
	msg2 db "Enter second number  : "
	msgl2 equ $-msg2
	msg3 db 13,10, "RESULT : ", 13,10, "-> First number entered    : "
	msgl3 equ $-msg3
	msg4 db 13,10, "-> Second number entered   : "
	msgl4 equ $-msg4
	msg5 db 13,10, "-> Sum of numbers          : "
	msgl5 equ $-msg5
	new_line db " ", 13, 10
	new_lineL equ $-new_line
	
section .bss
	num1 resb 1   ; Reserve byte(num1)...
	num2 resb 1   ; Reserve byte(num2)...
	sum resb 1    ; Reserve byte(sum)...
	
section .text
	global _start

_start:
	mov edx, msgl1 ; Prompts user to enter a number...
	mov ecx, msg1
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2     ; Accepts a number from user...
	mov ecx, num1
	mov ebx, 2
	mov eax, 3
	int 80h
	
	mov edx, msgl2 ; Prompts user to enter second number...
	mov ecx, msg2
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 2     ; Accepts the second number...
	mov ecx, num2
	mov ebx, 2
	mov eax, 3     
	int 80h
	
	mov edx, msgl3 ; Displays msg to show number...
	mov ecx, msg3
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1     ; Displays the number... 
	mov ecx, num1
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, msgl4 ; Msg to diaplay number...
	mov ecx, msg4
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1    ; Displays the 2nd number...
	mov ecx, num2
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov eax, [num1] ; moves value at address num to eax register...
	sub eax, '0'    ; to convert to asci (maybe)...
	
	mov ebx, [num2] ; moves value at address num to eax register...
	sub ebx, '0'    ; to convert to asci (maybe)...
	
	add eax, ebx	; adds and stores value in ebx to eax...	
	add eax, '0'
	
	mov [sum], eax  ; store value in eax at loaction pointed by sum...
	
	mov edx, msgl5  ; message to display the output...
	mov ecx, msg5
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov edx, 1      ; to display the sum value before the previous msg...
	mov ecx, sum    ; 
	mov ebx, 1 
	mov eax, 4      
	int 80h   
	
	mov edx, new_lineL 
	mov ecx, new_line
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov eax, 1
	int 80h
	
