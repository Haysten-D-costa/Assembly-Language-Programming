; PROGRAM TO COMPUTE THE FACTORIAL OF A NUMBER

section .data
    inputMsg db 'Enter the value of n : '
    lenInputMsg equ $-inputMsg
    
    space db ' '
    lenSpace equ $-space
    
section .bss
    input resb 2
    hex resb 2
    ascii resb 2
    
%macro read 2
    pusha
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro

%macro write 2
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro

%macro factorial 1
    mov ecx, [%1]
    mov eax, 1
    next_term:
        mul ecx
        loop next_term
    mov [hex], eax
    call hex_to_ascii
    write ascii, 2
    
%endmacro
    
section .text
    global _start
    
_start:
    write inputMsg, lenInputMsg
    read input, 2
    call ascii_to_hex
    factorial hex 
    mov eax, 1
    int 80h
    
    
ascii_to_hex:
    mov esi, input
    mov ecx, 02h
    xor eax, eax
    xor ebx, ebx

    next_ascii_digit:
        rol bl, 4
        mov al, [esi]
        cmp al, 39h
        jbe skip_sub
        sub al, 07h

        skip_sub:
            sub al, 30h
            add bl, al
            inc esi
            loop next_ascii_digit
            mov [hex], bl
            ret
    
hex_to_ascii:
    mov bl, [hex]
    mov cl, 2
    mov edi, ascii

    next_hex_digit:
        rol bl, 4
        mov al, bl
        and al, 0Fh
        cmp al, 09H
        jbe skip_add
        add al, 07H
        
        skip_add:
            add al, 30h
            mov [edi], al
            inc edi
            loop next_hex_digit
            ret