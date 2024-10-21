gcc -O2 -S -o gcc-asm.s -masm=intel sums.c
clang -O2 -S -o llvm-asm.s -mllvm --x86-asm-syntax=intel sums.c