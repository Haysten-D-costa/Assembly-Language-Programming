section .data
    even db "Even", 13, 10
    evenL equ $ - even
    odd db "Odd", 13, 10
    oddL equ $ - odd

section .bss
    num resb 2

section .text
    global _start
_start:
    MOV EDX, 2
    MOV ECX, num
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV AL, [num]
    TEST AL, 1    ;! If 110'1' (LAST DIGITS MATCH)
    JZ even_msg   ;!    000'1' ==> ZF = 0...

    odd_msg:
        MOV EDX, oddL
        MOV ECX, odd
        MOV EBX, 1
        MOV EAX, 4
        INT 80H
        
        JMP exit

    even_msg:
        MOV EDX, evenL
        MOV ECX, even
        MOV EBX, 1
        MOV EAX, 4
        INT 80H


    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H