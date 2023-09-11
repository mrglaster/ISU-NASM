; Programm replacing one letter in the word "MESSAGE" 
; Expected output: words TEST, BEST, BUS, BOO separated by \n
; Assembler: NASM 
; Version: 2.14.02 


section .text
global _start

_start: 
	
	; print message. Output: TEST
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 6
	syscall
	
	mov [message], byte 'B' ; Replaces first letter T with letter B	
	
	; print message. Output: BEST
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 6
	syscall 
	
	
	; print message. output: BUS
	mov [message+1], byte 'U' ; Replaces 3nd letter  with letter U	
	mov [message+3], byte ' ' ; Deletes the latest letter	
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 6
	syscall 
	
	; print message. output: BOO
	mov [message+1], word 'OO' ; Replaces first letter T with letter B	
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 6
	syscall 
	
	
	
	
	; End the programm 
	mov rax, 60
    xor rdi, rdi
    syscall	
	


section .data
	message db "TEST", 0xA, 0xD ; create  "variable" message ending with \n

		
	
