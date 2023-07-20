section .data
    msg01 db "Num1", 13, 10
    num1L equ $ - msg01
    msg02 db "Num2", 13, 10
    num2L equ $ - msg02
    msg03 db "Num3", 13, 10
    num3L equ $ - msg03

section .bss
    num1 resb 2
    num2 resb 2
    num3 resb 2

section .text
    global _start

_start:
    MOV EDX, 2
    MOV ECX, num1
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV EDX, 2
    MOV ECX, num2
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV EDX, 2
    MOV ECX, num3
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV AL, [num1]  ; store numbers in registers...
    MOV BL, [num2]
    MOV CL, [num3]

    CMP AL, BL
    JNC num1_num3  ;! JNC => num1 > num2
    JC num2_num3   ;! JC  => num2 > num1

    num1_num3:
        CMP AL, CL
        JNC disp_first
        JC disp_third
    
    num2_num3:
        CMP BL, CL
        JNC disp_second
        JC disp_third
    
    disp_first:
        MOV EDX, num1L
        MOV ECX, msg01
        MOV EBX, 1
        MOV EAX, 4
        INT 80H
        JMP exit

    disp_second:
        MOV EDX, num2L
        MOV ECX, msg02
        MOV EBX, 1
        MOV EAX, 4
        INT 80H
        JMP exit


    disp_third:
        MOV EDX, num3L
        MOV ECX, msg03
        MOV EBX, 1
        MOV EAX, 4
        INT 80H
        JMP exit

    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H
