foo:
    test esi, esi
    jle  .L4
    mov  rax, rdi
    lea  edx, -1[rsi]
    lea  rsi, 4[rdi + rdx * 4]
    mov  ecx, 0

.L3:
    add  ecx, DWORD PTR [rax]
    mov  DWORD PTR [rax], ecx 
    add  rax. 4
    cmp  rax, rsi
    jne  .L3 

.L1:
    mov  eax, ecx 
    ret 

.L4:
    mov  ecx, 0
    jmp  .L1
