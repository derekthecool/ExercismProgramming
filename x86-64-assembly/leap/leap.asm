section .text
global leap_year
leap_year:
    ; Get the input argument to this function from rdi, it can be saved into rax
    mov rdi, rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
