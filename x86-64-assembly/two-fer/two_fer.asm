section .data
  first_part db "One for ", 0
  second_part db ", one for me.", 0

section .text
global two_fer

; Helper function: copy a null-terminated string from rdx to rsi
copy_string:
    ; rdx: source address
    ; rsi: destination address
copy_loop:
    mov al, byte [rdx]           ; Load a byte from source
    test al, al                  ; Check if null terminator
    je copy_done                 ; If zero, end of string
    mov byte [rsi], al           ; Copy byte to destination
    inc rsi                      ; Advance destination pointer
    inc rdx                      ; Advance source pointer
    jmp copy_loop                ; Repeat the loop
copy_done:
    ret                          ; Return to caller

two_fer:
    ; rdi contains const char with the name that should be inserted
    ; rsi contains the char array that is passed by reference for the output
    ; mov rsi, rdi
    ; mov rdi, rsi
    ; lea rdx, [first_part]
    lea [first_part], rdx
    call copy_String
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
