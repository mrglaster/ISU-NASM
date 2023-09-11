; NASM printf implementation
; Prints some crap using printf function from C 
; Assembler: NASM
; Assembler version: 2.14


section .text
global main
extern printf


main:
	push rbp
	mov rdi, format
	mov rsi, 99999
	call printf
	pop rbp
	


; End of the programm
_end:
    mov rax, 60
    xor rdi, rdi
    syscall	


section .data
    format db "%d", 0xA, 0xD
		
	