; This programm checks if the substraction result is negative or positive and writes information about it to the console
; Assembler: NASM
; Assembler Version: 2.14


section .text
global _start


; Prints that sub result is POSITIVE
_print_positive:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg2,
	mov rdx, len1
	syscall
	jmp _programm_end

; Prints, that the sub result is NEGATIVE
_print_negative:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg1,
	mov rdx, len2
	syscall
	jmp _programm_end


; End the programm
_programm_end: 
    mov rax, 60
    xor rdi, rdi
    syscall	
	
_start:
	mov rax, 5 ; from where we subtract
	mov rbx, 6 ; what do we subtract
	sub rax, rbx
	cmp rax, 0
	
	js _print_negative ; Checks if the number has a sign (there is a sign if the number is negative) 
	jmp _print_positive
	

; Variables initialization
section .data
	msg1 db "NEGATIVE", 0xA, 0xD
	len1 equ $ - msg1 ; length of msg1
	msg2 db "POSITIVE", 0xA, 0xD 
	len2 equ $ - msg2 ; length of msg1 ; length of msg2 
	

		
	
