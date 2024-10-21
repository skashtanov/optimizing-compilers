clang -O2 -emit-llvm -S sumeven.c -Xclang -disable-llvm-passes -o initial.ll
clang -O2 -emit-llvm -S sumeven.c -o final.ll
clang -O2 -emit-llvm -S -mllvm --print-after-all sumeven.c &> optimized-ir.log
grep "\*\*\*" optimized-ir.log > passes.log
sed -i 's/; \*\*\* //g' passes.log
sed -i 's/IR Dump After //g' passes.log
