section .data
    star TIMES 10 db "*", 13, 10
    starL equ $ - star

section .text
    global _start

_start:
    MOV EDX, starL
    MOV ECX, star
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H
