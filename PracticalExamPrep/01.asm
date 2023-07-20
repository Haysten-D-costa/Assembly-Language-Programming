section .data
    space db " "
    spaceL  equ $ - space

section .bss
    array resb 5
    whitespace resb 1

%macro read 2
    PUSHA
    MOV EDX, %2
    MOV ECX, %1
    MOV EBX, 0
    MOV EAX, 3
    INT 80H
    POPA
%endmacro

%macro write 2
    PUSHA
    MOV EDX, %2
    MOV ECX, %1
    MOV EBX, 1
    MOV EAX, 4
    INT 80H
    POPA
%endmacro

section .text   
    global _start

_start:
    MOV ECX, 5
    MOV EDI, array

    input:
        read EDI, 1
        read whitespace, 1
        INC EDI
        LOOP input
    
    MOV ECX, 5
    MOV ESI, array

    output:
        write ESI, 1
        write space, spaceL
        INC ESI
        LOOP output
    MOV EBX, 0
    MOV EAX, 1
    INT 80H
