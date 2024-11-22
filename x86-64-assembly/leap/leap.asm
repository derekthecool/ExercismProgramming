section .text
global leap_year

; divisible_evenly_by
; Inputs:
;   RDI: The number to be divided
;   RSI: The divisor
; Outputs:
;   RAX: 1 if evenly divisible, 0 otherwise
divisible_evenly_by:
    xor rdx, rdx          ; Clear RDX (required for division)
    mov rax, rdi          ; Move dividend into RAX
    div rsi               ; Divide RAX by RSI (remainder in RDX)
    test rdx, rdx         ; Check if remainder is 0
    sete al               ; Set AL to 1 if zero, 0 otherwise
    movzx rax, al         ; Zero-extend AL to RAX
    ret

; leap_year
; Inputs:
;   RDI: Year to check
; Outputs:
;   RAX: 1 if leap year, 0 otherwise
leap_year:
    push rdi              ; Save the input year to the stack

    ; Check if year is divisible by 400
    mov rsi, 400          ; Divisor = 400
    call divisible_evenly_by
    cmp rax, 1            ; If divisible, it's a leap year
    je return_true

    ; Check if year is divisible by 4
    pop rdi               ; Restore year
    push rdi              ; Save again for further checks
    mov rsi, 4            ; Divisor = 4
    call divisible_evenly_by
    cmp rax, 1            ; If not divisible by 4, it's not a leap year
    jne return_false

    ; Check if year is divisible by 100
    pop rdi               ; Restore year
    push rdi              ; Save again for final check
    mov rsi, 100          ; Divisor = 100
    call divisible_evenly_by
    cmp rax, 1            ; If divisible by 100, it's not a leap year
    je return_false

return_true:
    mov rax, 1            ; Leap year
    pop rdi               ; Clean up stack
    ret

return_false:
    xor rax, rax          ; Not a leap year (RAX = 0)
    pop rdi               ; Clean up stack
    ret
