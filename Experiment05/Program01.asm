; TO DISPLAY STRINGS USING MACROS...

%macro write_string 2 ; Definition of a macro...
	MOV EDX, %2
	MOV ECX, %1
	MOV EBX, 1
	MOV EAX, 4
	INT 80H
%endmacro

section .data
	msg1 db 10, "Hello Haysten D'costa", 10
	msg1L equ $ - msg1
	msg2 db "Welcome to Experiment 05 Program01", 10, 10
	msg2L equ $ - msg2

section .text
	global _start
_start:
	write_string msg1, msg1L ; Calling a macro(with two parameters)...
	write_string msg2, msg2L

	MOV EBX, 0
	MOV EAX, 1
	INT 80H
