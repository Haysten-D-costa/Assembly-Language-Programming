; TO COUNT NO. OF POSITIVE AND NEGATIVE NUMBERS IN ARRAY USING PROCEDURES...

section .data
    num_array db 0, -1, -2, 3, -4, 5, -6, 7, -8, 9, -10 ; Number array containing numbers..

    disp_neg_count db 10, "Count of negative numbers : "
    disp_neg_countL equ $ -disp_neg_count
    disp_pos_count db 10, "Count of positive numbers : "
    disp_pos_countL equ $ -disp_pos_count
    new_line db " ", 10
    new_lineL equ $ -new_line

section .bss
    neg_count resb 1
    pos_count resb 1

section .text
    global _start
_start:

    MOV BL, 0
    MOV DL, 0
    MOV CL, 11
    MOV ESI, num_array

    CALL CHECK_pos_neg
    MOV EDX, disp_neg_countL
    MOV ECX, disp_neg_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 1
    MOV ECX, neg_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, disp_pos_countL
    MOV ECX, disp_pos_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 1
    MOV ECX, pos_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, new_lineL
    MOV ECX, new_line
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EBX, 0 ; Exit...
    MOV EAX, 1
    INT 80H

CHECK_pos_neg:

NEXT:
    MOV AL, [ESI]
    ROL AL, 1
    JC NEGATIVE
    
    INC BL
    INC ESI
    DEC CL
    JNZ NEXT
    JMP COUNTER

NEGATIVE:
    INC DL
    INC ESI
    DEC CL
    JNZ NEXT
    JMP COUNTER

COUNTER:
    ADD DL, '0'
    MOV [neg_count], DL
    ADD BL, '0'
    MOV [pos_count], BL
    RET