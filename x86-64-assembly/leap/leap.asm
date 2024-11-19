section .text
global leap_year

leap_year:
    ; Get the input argument to this function from rdi, it can be saved into rax
    ; Function input year comes from rdi
    ; Function output should go into rax
    ; Save the input year (rdi) to rax, as we work with rax in divisions
    mov rax, rdi

    ; C code solution
    ; return (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0));

    ; Check if year is divisible by 400
    xor rdx, rdx                ; Clear rdx
    mov rcx, 400                ; Set divisor
    div rcx                     ; rax / rcx; quotient in rax, remainder in rdx
    cmp rdx, 0                  ; Compare rdx to 0
    je leap_year_return_true    ; Jump here if result is not equal to 0

    ; Check if year is divisible by 4
    mov rax, rdi                ; Reload year into rax
    xor rdx, rdx                ; Clear rdx
    mov rcx, 4                  ; Set divisor
    div rcx                     ; rax / rcx; quotient in rax, remainder in rdx
    cmp rdx, 0                  ; Compare rdx to 0
    jne leap_year_return_false  ; Jump here if result is not equal to 0

    ; Check if year is divisible by 100
    mov rax, rdi                ; Reload year into rax
    xor rdx, rdx                ; Clear rdx
    mov rcx, 100                ; Divide input by 100
    div rcx                     ; Run the division. Division result stored in rax, modulo result (remainder) stored in rdx.
    cmp rdx, 0                  ; Compare rdx to 0
    jne leap_year_return_true   ; Jump here if result is not equal to 0
    jmp leap_year_return_false

; Example output to return from function
; mov rax, 1 ; would return true
; mov rax, 0 ; would return false
leap_year_return_true:
    mov rax, 1
    ret

leap_year_return_false:
    mov rax, 0
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
