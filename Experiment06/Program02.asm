section .data
    msg1 db 10,"BLOCK A DATA: ",10
    msg1_len equ $ - msg1

    msg2 db 10,"BLOCK B DATA [After Transferring] ",10
    msg2_len equ $-msg2

    array db 11h,59h,33h,22h,44h
    darr db 00h,00h,00h,00h,00h
    newline db '',13,10

section .bss
    counter resb 1
    result resb 4
   
%macro write 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .text
    global _start 
_start: 
    write msg1,msg1_len
    mov byte[counter],05
    mov esi,array

next:   
    mov al,[esi]
    push esi
    call disp
    pop esi
    inc esi
    dec byte[counter]
    jnz next


    mov byte[counter],05
    mov esi,array
    mov edi,darr

next2:  
    mov al,[esi]
    mov [edi],al
    inc esi
    inc edi
    dec byte[counter]
    jnz next2

;display darr

    write msg2, msg2_len
    mov byte[counter],05
    mov edi,darr

next3:  
    mov al,[edi]
    push edi
    call disp
    pop edi
    inc edi
    dec byte[counter]
    jnz next3
    mov eax,1
    mov ebx,0
    int 80h


disp:
    mov bl,al             
    mov edi,result        
    mov cx,02             

again:  
    rol bl,04             
    mov al,bl             
    and al,0fh           
    cmp al,09            
    jg down               
    add al,30h          
    jmp skip1             

down:   
    add al,37h

skip1:  
    mov [edi],al          
    inc edi            
    dec cx                
    jnz again            
    write result,2
    write newline,2
    ret
