section .data
    msg db "Haysten D'costa! Hello World...", 13, 10
    msgL equ $ - msg

section .text
    global _start

_start:
    MOV EDX, msgL
    MOV ECX, msg
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H