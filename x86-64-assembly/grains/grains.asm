section .text

global square
global total

square:
    ; rdi contains the input number to be squared

    ; Value must be between 1-64
    ; If input is out of bounds send to bad_input
    cmp rdi, 0
    jle bad_input
    cmp rdi, 65
    jge bad_input

    ; Set a 1 to start logical bit shift left
    mov rax, 1
    ; Decrement rdi to prepare for calculation 2 ^ N - 1
    ; rdi = N for this calculation
    dec rdi
    ; Move rdi contents into rcx
    mov rcx, rdi
    ; Rotate left rax by cl (low 8 bits of rcx)
    rol rax, cl
    ret

; This function returns 0
; Outputs: RAX : rax = 0
bad_input:
    mov rax, 0
    ret

; No need for a fancy loop if you understand the formula
; All grains for 64 squares on a chess board = (2^65) - 1 = 0xFFFFFFFFFFFFFFFF
total:
    mov rax, 0xFFFFFFFFFFFFFFFF
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
