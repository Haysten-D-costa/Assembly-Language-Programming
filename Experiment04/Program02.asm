; TO COUNT NO. OF POSITIVE AND NEGATIVE NUMBERS IN ARRAY USING PROCEDURES...

section .data
    num_array db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10; Number array containing numbers..

    disp_neg_count db 10, "Count of negative numbers : "
    disp_neg_countL equ $ -disp_neg_count
    disp_pos_count db 10, "Count of positive numbers : "
    disp_pos_countL equ $ -disp_pos_count
    new_line db " ", 10
    new_lineL equ $ -new_line

section .bss
    neg_count resb 5
    pos_count resb 5

section .text
    global _start
_start:

    mov bl, 0
    mov dl, 0
    mov cl, 11
    mov esi, num_array

    CalL CHECK_pos_neg ; Function to count positive and negative count...

    mov edx, disp_neg_countL
    mov ecx, disp_neg_count
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 5
    mov ecx, neg_count
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, disp_pos_countL
    mov ecx, disp_pos_count
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, 5
    mov ecx, pos_count
    mov ebx, 1
    mov eax, 4
    int 80H

    mov edx, new_lineL
    mov ecx, new_line
    mov ebx, 1
    mov eax, 4
    int 80H

    mov ebx, 0 ; Exit...
    mov eax, 1
    int 80H

CHECK_pos_neg: ; Procedure definition...

NEXT:
    mov al, [esi]
    rol al, 1
    jc NEGATIVE

    inc bl
    inc esi
    dec cl
    jnz NEXT
    jmp COUNTER

NEGATIVE:
    inc dl
    inc esi
    dec cl
    jnz NEXT
    jmp COUNTER
    
COUNTER:
    add dl, '0'
    mov [neg_count], dl
    add bl, '0'
    mov [pos_count], bl
    ret
