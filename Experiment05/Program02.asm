; TO DISPLAY FIBONACCI SERIES USING MACROS...

%macro write 2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, %1
    MOV edx, %2
    int 80h
%endmacro

%macro read 2
    MOV eax, 3
    MOV ebx, 0
    MOV ecx, %1
    MOV edx, %2
    int 80h
%endmacro

%macro fibo 1
    mov eax, 00H
    mov ebx, 01H
    mov ecx, [%1]
back:
    mov edx, eax
    add edx, ebx
    mov [temp], eax
    pusha
    JMP HEX
done:
    write dis_buffer, 2
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, space
    MOV edx, spacelen
    int 80h
    popa
    mov eax, ebx
    mov ebx, edx
    dec ecx
    jnz back
%endmacro

section .data
    msg db "Enter the n value : "
    msglen equ $-msg
    space db " "
    spacelen equ $-space

section .bss
    num1 resw 5
    num2 resw 5
    n resb 1
    temp resw 2
    dis_buffer resb 2

section .text
    global _start
_start:
write msg, msglen
    read num1, 2
    ;read num2, 1
    CALL convert
    mov [num1],ebx
    fibo num1
    MOV eax, 1
    int 80h
convert:
    MOV esi, num1
    MOV edi, num2
    MOV ecx, 02h
    xor eax, eax
    xor ebx, ebx
up:
    rol bl,04h
    mov al, [esi]
    cmp al, 39h
    jbe skipe
    sub al, 07h
skipe:
    sub al, 30h
    add bl, al
    mov [edi], bl
    inc esi
    inc edi
    loop up
    ret
HEX:
    MOV bx, word[temp]
    MOV ecx, 2
    MOV edi, dis_buffer
DUP:
    ROL bl, 4
    MOV al, bl
    AND al, 0Fh
    CMP al, 09h
    JBE NEXT
    add al, 07h
NEXT:
    ADD al, 30h
    MOV [edi], al
    INC edi
    LOOP DUP
    JMP done