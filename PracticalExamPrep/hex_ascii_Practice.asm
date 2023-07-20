section .data
    hex dw 32H
section .bss
    ascii resb 2
section .text
    global _start
_start:
    MOV BL, [hex]
    MOV CL, 2
    MOV EDI, ascii

    next_digit:
        ROL BL, 4
        MOV AL, BL
        AND AL, 0FH
        CMP AL, 09H
        
        JBE skip_add
        ADD AL, 07H

        skip_add:
            ADD AL, 30H
            MOV [EDI], AL
            INC EDI
            LOOP next_digit
    
    MOV EDX, 2
    MOV ECX, ascii
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H