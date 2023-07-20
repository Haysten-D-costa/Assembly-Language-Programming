section .data
    array db 1, 2, 3, 4, 5, 2, 2

section .bss
    even_count resb 2
    odd_count resb 2

section .text
    global _start
_start:
    MOV BL, 0 ; even...
    MOV DL, 0 ; odd...
    MOV CL, 7 ; element count...
    MOV EDI, array ; point to start of the array...

    CALL count_even_odd

    MOV EDX, 2
    MOV ECX, even_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, odd_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H
    
    count_even_odd:
        next:
            MOV AL, [EDI]
            TEST AL, 1
            JZ inc_even
            JNZ inc_odd

            inc_odd:
                INC DL
                INC EDI
                DEC CL
                JZ counter
                JNZ next

            inc_even:
                INC BL
                INC EDI
                DEC CL
                JZ counter
                JNZ next
        
        counter:
            ADD DL, '0'
            ADD BL, '0'
            MOV [odd_count], DL
            MOV [even_count], BL
            RET
