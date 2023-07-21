; TO INPUT, STORE AND DISPLAY THE SUM OF TWO NUMBERS...

section .data
    msg01 db "Enter 1st number : "
    msg01L equ $ - msg01
    msg02 db "Enter 2nd number : "
    msg02L equ $ - msg02
    msg03 db 13, 10, "Summation     : "
    msg03L equ $ - msg03
    
section .bss
    num1 resb 2
    num2 resb 2
    summ resb 2

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

    MOV AL, [num1] ; Summation procedure...
    MOV BL, [num2]
    SUB AL, '0'
    SUB BL, '0'
    ADD AL, BL
    ADD AL, '0'
    MOV [summ], AL

    MOV EDX, msg03L
    MOV ECX, msg03
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, summ
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0    ; Exit...
    MOV EAX, 1
    INT 80H
