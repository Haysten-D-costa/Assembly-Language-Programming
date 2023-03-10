; ASSEMBLY LANGUAGE PROGRAM TO PRINT HELLO WORLD...

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

section .data
        msg db "Hello World !" 0xa
        msgl equ $ -msg