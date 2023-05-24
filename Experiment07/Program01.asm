; ASSEMBLY PROGRAM TO IMPLEMENT THE LINEAR SEARCH ALGORITHM...

%macro display 2
    MOV EDX, %2
    MOV ECX, %1
    MOV EBX, 1
    MOV EAX, 4
    INT 80H
%endmacro

%macro read 2
    MOV EDX,%2
    MOV ECX,%1
    MOV EBX,0
    MOV EAX,3
    INT 80H
%endmacro

section .data
    msg db 10, 13,"Searching from....", 10, 13
    msglen equ $-msg
    msg1 db 10, 13, 10, 13, "Enter element to be searched : "
    len1 equ $-msg1
    msg2 db 10, 13,"Element found at position : "
    len2 equ $-msg2
    msg3 db 10, 13,"Element not present in array", 10, 13
    len3 equ $-msg3
    array db 13H, 15H, 22H, 69H, 89H
    newline db 10, 13
    space db " "

section .bss
    num1 resb 3
    temp resb 1
    pos resb 1
    counter1 resb 1
    counter2 resb 1
    result resb 4

section .text
    globAL _start
_start:

    display msg, msglen
    MOV byte[counter1], 05
    MOV ESI, array
next:
    MOV AL, [ESI]
    PUSH ESI
    CALL disp
    POP ESI
    INC ESI
    DEC byte[counter1]
    JNZ next
    display msg1, len1
    read num1, 3
    CALL convert
    MOV [temp], BL
    XOR EAX, EAX
    XOR EBX, EBX
    MOV AL, 00h
    MOV BL, 04h
up: 
    MOV ESI, array
    XOR EDX, EDX
    MOV DL, AL
    XOR EAX, EAX
    MOV AL, DL
    ADD AL, BL
    XOR EDX, EDX
    MOV DL, 02h
    DIV DL
    XOR ECX, ECX
    MOV CL, AL
    ADD ESI, ECX
    XOR EDX, EDX
    MOV DL, [temp]
    CMP DL, [ESI]
    je next1
    jb next2
    ADD AL, 01H
    JMP under
next2:
    XOR EBX, EBX
    MOV BL, AL

    DEC BL
    XOR EAX, EAX
    MOV AL, 00H
    JMP under
    next1:
    INC AL
    ADD AL, 30H
    MOV [pos], AL
    display msg2, len2
    display pos, 1
    display newline, 1
    JMP exit
under:
    JS low
    CMP AL, BL
    JBE up
low:
    display msg3, len3
    display newline, 1
exit:
    MOV EAX, 1
    MOV EBX, 0
    INT 80H
convert:
    MOV EDI, num1
    XOR ECX, ECX
    MOV CL, 02H
    XOR EBX, EBX
above:
    ROL BL, 04
    MOV AL, [EDI]
    CMP AL, 39H
    JBE below
    SUB AL, 07H
below:
    SUB AL, 30H
    ADD BL, AL
    INC EDI
    LOOP above
    RET
disp:
    MOV BL, AL
    MOV EDI, result
    MOV CX, 02
again:
    ROL BL, 4
    MOV AL, BL
    AND AL, 0fh
    CMP AL, 09
    JG down
    ADD AL, 30H
    JMP skip
down:
    ADD AL, 37H
skip:
    MOV[EDI], AL
    INC EDI
    DEC CX
    JNZ again
    display result, 2
    display space, 2
    RET