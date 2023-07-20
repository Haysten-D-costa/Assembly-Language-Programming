%macro write 2
    MOV EDX, %2
    MOV ECX, %1
    MOV EBX, 1
    MOV EAX, 4
    INT 80H
%endmacro

section .data
    msg01 db "Welcome ! Haysten D'costa...", 13, 10
    msg01L equ $ - msg01
    msg02 db "Happy Coding !! You can do this !", 13, 10
    msg02L equ $ - msg02
section .text
    global _start
_start:
    write msg01, msg01L
    write msg02, msg02L

    MOV EBX, 0
    MOV EAX, 1
    INT 80H
