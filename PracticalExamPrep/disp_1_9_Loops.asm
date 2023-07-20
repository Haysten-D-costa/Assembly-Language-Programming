section .data
    space db " ", 13, 10
    spaceL equ $ - space

section .bss
    num resb 2

section .text
    global _start

_start:
    MOV ECX, 9   ; To initialize count...
    MOV EAX, '1' ; To initialize num variable...

    up:
        MOV [num], EAX  ; Initialized num (storing EAX value in 'num')...
        PUSH ECX  ; Push (Storing ECX value on stack)...

        ; Display value in num...
        MOV EDX, 2
        MOV ECX, num
        MOV EBX, 1
        MOV EAX, 4
        INT 80H

        ; Retrieving values from 'num' and from 'stack'...
        MOV EAX, [num]
        POP ECX

        SUB EAX, '0' ; Subtracting ASCII '0';=> <{ ASCII -> Decimal }>...
        INC EAX      ; Increment EAX, (To display next number)...
        ADD EAX, '0' ; To concert from ;=> <{Decimal -> ASCII}>...

        LOOP up

    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H
