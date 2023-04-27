; PROGRAM TO COMPUTE THE FACTORIAL OF A NUMBER

%macro write 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

%macro read 2
    mov eax,3
    mov ebx,0
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

%macro proc_fact 1
    mov ebx, [%1]
    xyz:
    mul ebx

    dec bl
    jnz xyz
%endmacro

section .data
    msg1 db "Enter n value : "
    msglen1 equ $-msg1
    msg2 db "Factorial is : "
    msglen2 equ $-msg2
    newline db 13, 10

section .bss
    num1 resb 3
    num2 resw 1
    dispbuff resq 1

section .text
    global _start
_start:
    write msg1,msglen1
    read num1,2
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    call convert
    mov [num2],ebx
    write msg2,msglen2
    xor eax,eax
    xor ebx,ebx
    mov bx,[num2]
    mov eax,1
    proc_fact num2
    mov ebx,eax
    mov ecx,8
    mov edi,dispbuff
again:
    rol ebx,4
    mov al,bl
    and al,0fh
    cmp al,09h
    jbe down
    add al,07h
down:
    add al,30h
    mov [edi],al
    inc edi
    loop again
    write dispbuff,8
    write newline, 2
    mov eax,1
    int 80h
convert:
    mov esi ,num1
    mov edi ,num2
    mov cl ,02h
    xor eax,eax
    xor ebx,ebx
up:
    rol bl,04h
    mov al,[esi]
    cmp al,39h
    jbe skipc
    sub al,07h
skipc:
    sub al,30h
    add bl,al
    mov [edi],bl
    inc esi
    inc edi
    loop up
    ret