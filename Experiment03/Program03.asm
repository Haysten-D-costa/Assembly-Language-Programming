; PROGRAM TO CHECK WHETHER NUMBER ENTERED IS POSITIVE OR A NEGATIVE NUMBER...

section .data
	msg1 db "Enter a number : "
	msg1L equ $ - msg1
    positive db "Positive", 13, 10
    posL equ $ - positive
    negative db "Negative", 13, 10
    negL equ $ - negative

section .bss
    num resb 2

section .text
    global _start

_start:
	MOV EDX, msg1L
	MOV ECX, msg1
	MOV EBX, 1
	MOV EAX, 4
	INT 80H

    MOV EDX, 2
    MOV ECX, num
    MOV EBX, 0
    MOV EAX, 3
    INT 80H

    MOV AL, [num]
    SUB AL, '0'
    ROL AL, 1
    JNC positive_msg
    
        negative_msg:
        MOV EDX, negL
        MOV ECX, negative
        MOV EBX, 1
        MOV EAX, 4
        INT 80H

        JMP exit

    positive_msg:
        MOV EDX, posL
        MOV ECX, positive
        MOV EBX, 1
        MOV EAX, 4
        INT 80H

    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H
