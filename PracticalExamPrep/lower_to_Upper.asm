section .data
    msg db "Error", 13, 10
    msgL equ $ - msg

section .bss
    lower resb 1
    upper resb 1

section .text
    global _start

_start:
    MOV EDX, 1
    MOV ECX, lower
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    CALL to_upper
    
    MOV EDX, 1
    MOV ECX, upper
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H

    to_upper:
        MOV AL, [lower]
        CMP AL, 'a'
        JB invalid

        CMP AL, 'z'
        JA invalid

        SUB AL, 32
        MOV [upper], AL
        RET

        invalid:
            MOV EDX, msgL
            MOV ECX, msg
            MOV EBX, 1
            MOV EAX, 4
            INT 80H
            RET
