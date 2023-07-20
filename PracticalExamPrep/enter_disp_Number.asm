section .data
    msg01 db "Enter a number : "
    msg01L equ $ - msg01

    msg02 db "Number you entered : "
    msg02L equ $ - msg02

section .bss
    result resb 5

section .text
    global _start

_start: 
    MOV EDX, msg01L
    MOV ECX, msg01
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 5
    MOV ECX, result
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV EDX, msg02L
    MOV ECX, msg02
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 5
    MOV ECX, result
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H
    