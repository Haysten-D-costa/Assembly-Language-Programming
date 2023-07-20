section .data
    hex dw 32H

section .bss
    ascii resb 2  ;=> storage for required result...

section .text
    global _start

_start:
    MOV BL, [hex]
    MOV CL, 2  ;=> Since two bytes in 'HEX' (3 and 4)...
    MOV EDI, ascii ;=> initialize EDI with memory location of ASCII...

    next_digit:
        ROL BL, 4 ;=> Rotate the HEX 4 times...
        MOV AL, BL ;=> Creating a copy of BL... 
        AND AL, 0FH    ;=> CLEARING 4 MSB's...
        CMP AL, 09H    ;=> Check if (AL > 9) if so, => no. is in Hex form (AH, BH, CH.....)
        
        JBE skip_add
        ADD AL, 07H ;=> Add 7 if greater than 9...

        skip_add:
            ADD AL, 30H  ;=> Add 30H to convert to corresponding ASCII form...
            MOV [EDI], AL   ;=> Move converted ASCII character to ASCII LOCATION stored in [EDI]...
            INC EDI ;=> Increment EDI, to convert next character...
            LOOP next_digit
            
    MOV EDX, 2
    MOV ECX, ascii
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0
    MOV EAX, 1
    INT 80H 
