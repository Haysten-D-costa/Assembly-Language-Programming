section .data
    msg01 db 10, 13, "Displaying numbers : ", 10, 13
    msg01L equ $ - msg01

    limit db 9

section .bss
    num resb 1

section .text
    global _start:

_start:
    mov eax, '0'

    mov edx, 1
    mov ecx, limit
    mov ebx, 1
    mov eax, 4
    int 80h
exit :
    mov eax, 1
    int 80h
