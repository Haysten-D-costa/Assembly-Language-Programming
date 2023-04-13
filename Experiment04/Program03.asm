; TO COUNT NO. OF ODD AND EVEN NUMBERS FROM AN ARRAY, USING PROCEDURES...

section .data
    Numbers db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12
    mesg db "Number of even numbers : "
    mesglen equ $ -mesg
    mesg1 db 10, "Number of odd numbers  : "
    mesglen1 equ $ -mesg1
    newline db 10
    newlinelen equ $ -newline
section .bss
    even resb 1
    odd resb 1
section .text
    global _start
_start:
    CALL check
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, mesg
    MOV EDX, mesglen
    INT 80H
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, even
    MOV EDX, 1
    INT 80H
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, mesg1
    MOV EDX, mesglen1
    INT 80H
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, odd
    MOV EDX, 1
    INT 80H
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, newlinelen
    INT 80h
    
    MOV EAX, 1 ; Exit...
    INT 80H
check:
    MOV BL, 0
    MOV DL, 0
    MOV CL, 11
    MOV ESI, Numbers
Next:
    MOV AL, [ESI]
    ROR AL, 1
    JNC Even
    INC BL
    INC ESI
    DEC CL
    JNZ Next
    JMP counter
Even:
    INC DL
    INC ESI
    DEC CL
    JNZ Next
counter:
    ADD DL, '0'
    MOV [even], DL
    ADD BL, '0'
    MOV [odd], BL
    RET
