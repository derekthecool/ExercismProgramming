section .text
global square_root
square_root:
    ; Provide your implementation here
    ; Convert integer input (RDI) to double
    cvtsi2sd xmm0, rdi       ; Convert RDI (integer) to XMM0 (double-precision float)

    ; Compute the square root
    sqrtsd xmm1, xmm0        ; Calculate the square root of XMM0, store result in XMM1

    ; Convert result back to integer
    cvttsd2si rax, xmm1      ; Convert XMM1 (double-precision float) to RAX (integer)
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
