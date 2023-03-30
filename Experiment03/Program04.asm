; PROGRAM TO FIND AND DISPLAY GREATEST OF THREE NUMBERS...

section .data
    msg1 db "Enter first number   : "
    msg1L equ $ -msg1
    msg2 db "Enter second number  : "
    msg2L equ $ -msg2
    msg3 db "Enter third number   : "
    msg3L equ $ -msg3
    msg4 db 10, "RESULT :", 10, "-> First number  : "
    msg4L equ $ -msg4
    msg5 db "-> Second number : "
    msg5L equ $ -msg5
    msg6 db "-> Third number  : "
    msg6L equ $ -msg6
    msg7 db 10, "-> All 3 Numbers entered are equal..."
    msg7L equ $ -msg7
    msg8 db 10, "First number is greatest...", 10
    msg8L equ $ -msg8
    msg9 db 10, "Second number is greatest...", 10
    msg9L equ $ -msg9
    msg10 db 10, "Third number is greatest...", 10
    msg10L equ $ -msg10
    new_line db " ", 10
    new_lineL equ $ -new_line

section .bss
    num1 resb 2
    num2 resb 2
    num3 resb 2

section .text
    global _start

_start:
    mov edx, msg1L ; Pormpts user to enter first number...
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2     ; Accepts and stores the number...
    mov ecx, num1
    mov ebx, 0
    mov eax, 3
    int 80H

    mov edx, msg2L ; Prompts user to enter second number...
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2     ; Accepts and stores the number... 
    mov ecx, num2
    mov ebx, 0
    mov eax, 3
    int 80H

    mov edx, msg3L ; Prompts use to enter third number...
    mov ecx, msg3
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2     ; Accepts and stores the number... 
    mov ecx, num3
    mov ebx, 0
    mov eax, 3
    int 80H

    mov edx, msg4L ; Displays the first number...
    mov ecx, msg4
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2    
    mov ecx, num1
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, msg5L ; Displays the second number...
    mov ecx, msg5
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2
    mov ecx, num2
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, msg6L ; Displays the third number...
    mov ecx, msg6
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 2
    mov ecx, num3
    mov ebx, 1
    mov eax, 4
    int 80H
    
    mov al, [num1] ; Moves number to 'al' register...
    mov bl, [num2] ; Moves number to 'bl' register...
    mov cl, [num3] ; Moves number to 'cl' register...

    cmp al, bl     ; Checks num1 & num2...
    jz check_zero  ; If 0...
    jg check_num1_num3 ; Checks num1 & num3 (if result is Greater)...
    jl check_num2_num3 ; Checks num2 & num3 (if result is Lower)...

check_zero:
    cmp al, cl
    jz equal

check_num1_num3:
    cmp al, cl
    jg num1_greater ; First number Greater...
    jl num3_greater ; Third number Greater...

check_num2_num3:
    cmp bl, cl
    jg num2_greater ; Second number Greater...
    jl num3_greater ; Third number Greater...

equal:
    mov edx, msg7L
    mov ecx, msg7
    mov ebx, 1
    mov eax, 4
    int 80H
    jmp exit

num1_greater:
    mov edx, msg8L
    mov ecx, msg8
    mov ebx, 1
    mov eax, 4
    int 80H
    jmp exit

num2_greater:
    mov edx, msg9L
    mov ecx, msg9
    mov ebx, 1
    mov eax, 4
    int 80H
    jmp exit

num3_greater:
    mov edx, msg10L
    mov ecx, msg10
    mov ebx, 1
    mov eax, 4
    int 80H

exit:
    mov edx, new_lineL
    mov ecx, new_line
    mov ebx, 1
    mov eax, 4
    int 80H

    mov ebx, 0
    mov eax, 1
    int 80H