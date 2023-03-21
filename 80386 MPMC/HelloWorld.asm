; ASSEMBLY LANGUAGE PROGRAM TO PRINT HELLO WORLD...

section .data
        msg db "Hello World !", 10, 30
        msgl equ $ -msg
        
section .text
        global _start
_start:
        mov edx, msgl
        mov ecx, msg
        mov ebx, 1
        mov eax, 4
        int 80h

        mov eax, 1
        int 80h
