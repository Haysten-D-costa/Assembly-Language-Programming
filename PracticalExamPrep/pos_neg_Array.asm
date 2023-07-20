section .data
    array DB 1, -2, 3, 4, -5, 5, 5, 5

section .bss
    pos_count resb 2
    neg_count resb 2

section .text
    global _start

_start:
    MOV CL, 8
    MOV BL, 0 ; positive...
    MOV DL, 0 ; negative...
    MOV EDI, array ; point to start of array....
    CALL count_pos_neg  ; Procedure call to count no. of +ve and -ve elements....
    
    MOV EDX, 2
    MOV ECX, pos_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    MOV EDX, 2
    MOV ECX, neg_count
    MOV EBX, 1
    MOV EAX, 4
    INT 80H

    exit:
        MOV EBX, 0
        MOV EAX, 1
        INT 80H
    
    count_pos_neg:
        next:
            MOV AL, [EDI]
            ROL AL, 1
            JC inc_neg
            JNC inc_pos

            inc_pos:
                INC BL
                INC EDI
                DEC CL
                JZ counter
                JNZ next

            inc_neg:
                INC DL
                INC EDI
                DEC CL
                JZ counter
                JNZ next
                
        counter:
            ADD DL, '0'
            ADD BL, '0'
            MOV [pos_count], BL
            MOV [neg_count], DL
            RET
