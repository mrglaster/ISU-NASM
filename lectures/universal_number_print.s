; Programm for universal print
; Assembler: NASM
; Assembler Version: 2.14


%macro pushd 0
	push rdx
	push rcx
	push rbx
	push rax

%endmacro 


%macro popd 0
	pop rax
	pop rbx
	pop rcx
	pop rdx
%endmacro



; Print macros. First arg: length of the string, Second arg: the string itself
%macro print 2
	pushd
	mov rax, 1
	mov rdi, 1
	mov rdx, %1
	mov rsi, %2
	syscall
	popd
%endmacro


section .text
global _start

; Splits number by chars and pushes em to stack
divide:
	xor rdx, rdx
	div rcx
	push rdx
	inc rbx
	test rax, rax ; the number is compared with itself and rise flags (for example Zeroflag) 
	jnz divide
	jmp display
	
	
	
; Displays numbers from stack
display: 
	pop rax
	add rax, '0'
	mov [result], rax
	print 1, result
	dec rbx
	test rbx, rbx
	jnz display
	print 1, newline
	jmp  _end

	


_start:
	mov rcx, 10
	mov rbx, 0
	mov rax, [number]
	jmp divide
	



; End of the programm
_end:
    mov rax, 60
    xor rdi, rdi
    syscall	
	
	
	
; Variables initialization
section .data
	number dq 3214 
	message db "Done"
	len equ $ - message
	newline db 0xA, 0xD
	nlen equ $ - newline
	
section .bss ; initialize new section. Just for fun) 
	result resb 4; place to reserve the result
	