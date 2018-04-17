;Execve Shell - /bin/sh
; SLAER

global _start

section .text

_start:


	xor edx, edx
	xor eax, eax
	push eax
	push 0x68732f2f      ; hs// - take care to the little endian representation
	push 0x6e69622f      ; nib/
	mov ebx, esp         ; pointer to command string
	mov ecx, eax
  	mov edx, eax
  	mov al, 11           ; __NR_execve
  	int 0x80
