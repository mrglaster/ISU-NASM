; What does the programm do?
; What assembler do you use?
; What version of assembler do you use?
; What should the programm print? 


section .text
global _start


; End of the programm
_end:
    mov rax, 60
    xor rdi, rdi
    syscall	

_start: 
    jmp _end
	
section .data
    message db "TEST", 0xA, 0xD ; create  "variable" message ending with \n

		
	
