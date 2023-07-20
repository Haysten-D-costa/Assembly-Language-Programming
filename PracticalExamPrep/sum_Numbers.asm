section .data
    msg01 db "Enter 1st number : "
    msg01L equ $ - msg01
    msg02 db "Enter 1st number : "
    msg02L equ $ - msg02
    msg03 db 13, 10, "Sum of numbers : "
    msg03L equ $ - msg03

section .bss
    num1 resb 2
    num2 resb 2
    result resb 2

section .text
    global _start

_start:
    MOV EDX, msg01L
    MOV ECX, msg01
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, num1
    MOV EBX, 0
    MOV EAX, 3
    INT 80H
    
    MOV EDX, msg02L
    MOV ECX, msg02
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, num2
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV AL, [num1]
    SUB AL, '0'
    MOV DL, [num2]
    SUB DL, '0'
    ADD AL, DL
    ADD AL, '0'
    MOV [result], AL

    MOV EDX, msg03L
    MOV ECX, msg03
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, result
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H