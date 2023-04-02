section .data
        msg dw 10, "Hello World, This is Haysten D'costa", 10, 10
        msgL equ $ -msg

section .text
        global _start
_start:
        ; displaying message...
        mov edx, msgL
        mov ecx, msg
        mov ebx, 1
        mov eax, 4
        int 80h

        mov ebx, 0
        mov eax, 1
        int 80h
