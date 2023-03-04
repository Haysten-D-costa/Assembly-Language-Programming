section.data
	message01 db 'Hello World',13,10
	message_length01 equ $-message01
	message02 db 'My name is Haysten',13,10
	message_length02 equ $-message02
setion.text
	global _start
_start :
	mov edx, length_message01
	mov ecx, message01
	mov ebx,1
	mov eax,4
	int 80h
	mov edx,length_message02
	mov ecx, message02
	mov ebx,1
	mov eax,4
	int 80h 
	mov eax,1 ;to exit
	int 80h