;to print stars 10 time using one variable
section.data
	msg db 'to display 10 stars ',13,10
	msgl equ $ -msg
	stars times 10 db '*',13,10
	starsl equ $ -stars
section.text
	global _start
_start :
	mov edx,msgl
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	mov edx,starsl
	mov ecx,stars
	mov ebx,1
	mov eax,4
	int 80h         
	;to exit
	mov eax,1
	int 80h
