; Checks if the Number is ODD  or EVEN
; Assembler: NASM
; Version: 2.14


; Macros print. First arg: length of the string, Second arg: the string itself
%macro print 2
	mov rax, 1
	mov rdi, 1
	mov rdx, %1
	mov rsi, %2
	syscall
%endmacro

section .text
global _start


_print_odd:
	print len1, odd
	jmp _end

_print_even:
	print len2, even
	jmp _end

__process_odd_even:
	mov rax, [number]
	and rax, 1
	cmp rax, 0
	jne _print_odd
	jmp _print_even
	

; End of the programm
_end:
    mov rax, 60
    xor rdi, rdi
    syscall	

_start: 
    jmp __process_odd_even
	
section .data
    number db 121 ; Nuber to check
	
    odd db "ODD", 0xA, 0xD ; нечетный
    len1 equ $ - odd ;
    even db "EVEN", 0xA, 0xD ; четный
    len2 equ $ - even 
	
