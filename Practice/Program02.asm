section .data
        msg1 db 10, "Enter first number to be displayed : "
        msg1L equ $ -msg1
        msg2 db "Enter second number to be displayed : "
        msg2L equ $ -msg2
        msg3 db 10, "RESULT : ", 10, "-> First number you entered is : "
        msg3L equ $ -msg3
        msg4 db "-> Second number you entered is : "
        msg4L equ $ -msg4

        new_line db 10, 10 " "
        new_lineL equ $ -new_line

section .bss
        num1 resb 2
        num2 resb 2


section .text
        global _start
_start:
        ; prompting user...
        mov edx, msg1L
        mov ecx, msg1
        mov ebx, 1
        mov eax, 4
        int 80h

        ; accepting and storing in num1...
        mov edx, 2
        mov ecx, num1
        mov ebx, 2
        mov eax, 3
        int 80h

        ; prompting user...
        mov edx, msg2L
        mov ecx, msg2
        mov ebx, 1
        mov eax, 4
        int 80h


        ; accepting and storing in num2...
        mov edx, 2
        mov ecx, num2
        mov ebx, 2
        mov eax, 3
        int 80h

        ; displaying msg...
        mov edx, msg3L
        mov ecx, msg3
        mov ebx, 1
        mov eax, 4
        int 80h

        ; displaying entered number...
        mov edx, 2
        mov ecx, num1
        mov ebx, 1
        mov eax, 4
        int 80h

        ; displaying msg...
        mov edx, msg4L
        mov ecx, msg4
        mov ebx, 1
        mov eax, 4
        int 80h

        ; displaying entered number...
        mov edx, 2
        mov ecx, num2
        mov ebx, 1
        mov eax, 4
        int 80h

        ; displaying a new line...
        mov edx, new_lineL
        mov ecx, new_line
        mov ebx, 1
        mov eax, 4
        int 80h

        ; exiting program...
        mov ebx, 0
        mov eax, 1
        int 80h
