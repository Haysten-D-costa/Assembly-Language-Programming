section .data
    
    counter 1 db 0
    num_array_limit 1 db 6
    num_array db 10, 20, 30, 40, 50, 60

    display_msg db 10, "Displaying the array elements : ", 10
    display_msgL equ $ -display_msg

section .bss
    ;counter resb 2
    ;num_array_limit resb 2

section .text
    global _start:
_start:

    mov edx, display_msgL
    mov ecx, display_msg
    mov ebx, 1
    mov eax, 4
    int 80H

next_index:
    mov cl, num_array + 1

    mov edx, 2
    mov ecx, cl
    mov ebx, 1
    mov eax, 4
    int 80H

    inc [counter]
    dec [num_array_limit]
    jz exit
    jnz next_index

exit:
    mov ebx, 0
    mov eax, 1
    int 80H

