; What does the programm do?
; What assembler do you use?
; What version of assembler do you use?
; What should the programm print? 


section .text
global _start

_start: 
	
	
	; End the programm 
	mov rax, 60
    xor rdi, rdi
    syscall	
	


section .data
	message db "TEST", 0xA, 0xD ; create  "variable" message ending with \n

		
	
