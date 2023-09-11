; Checks if the Number is ODD  or EVEN
; Assembler: NASM
; Version: 2.14



section .text
global _start


_print_odd:
	mov rax, 1
	mov rdi, 1
	mov rsi, odd,
	mov rdx, len1
	syscall
	jmp _end

_print_even:
	mov rax, 1
	mov rdi, 1
	mov rsi, even,
	mov rdx, len2
	syscall
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
	number db 122 ; Nuber to check
	
    odd db "ODD", 0xA, 0xD ; нечетный
	len1 equ $ - odd ;
	even db "EVEN", 0xA, 0xD ; четный
	len2 equ $ - even 
	

		
	