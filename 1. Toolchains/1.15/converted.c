/**
 * Notes:
 *     SF - sign flag (is set if an operand is < 0)
 *     OF - overflow flag (is set if an operand is overflowed)
 *     ZF - zero flag (is set if an operand is equal to 0)
 *
 * 1. test esi, esi -> esi & esi
 *    Sets ZF to 1 if esi was 0
 *    Sets SF to 1 if esi was < 0 (highest bit was 1)
 *
 *    jle .L4 would jump to .L4 if SF != OF or ZF = 0
 *    We have no overflow, so OF is always 0
 *    It means we jump if SF != 0 (SF = 1) or ZF = 0
 *    So if esi(second argument, lets call it 'n') is <= 0
 *
 * 2. Lets have a look at DWORD PTR[rax]
 *    Its loading from a memory pointed by rax (temp register or return value).
 *    It means that one of arguments (lets assume it's the first one is an array)
 *    Lets call it 'arr'
 *
 * 3. rdi is the first argument register.
 *    so mov rax, rdi does smth like int* ptr = arr;
 *
 * 4. Next 2 lines are simple:
 *    lea edx, -1[rsi] -> edx = rsi - 1 -> int p = n - 1;
 *    lea rsi, 4[rdi + rdx * 4] -> rsi = rdi + rdx * 4 + 4 
 *                              -> rsi = rdi + p * 4 + 4 
 *                              -> rsi = rdi + (n - 1) * 4 + 4 
 *                              -> rsi = rdi + n
 *    
 *    Since we are working with an array of ints, 4 is sizeof(int), so
 *    rsi = rdi + n -> int* end = arr + n;
 *
 * 5. mov ecx, 0 -> int s = 0;
 * 6. Next we have a loop (have a look at jne .L3)
 *    add ecx, DWORD PTR[rax] -> s += *arr
 *    mov DWORD PTR [rax], ecx -> *arr = s
 *    add rax, 4 -> rax = rax + 4 -> ++arr
 *    cmp rax, rsi |
 *                 | -> comparing 'arr' with 'end' and repeat a loop if arr != end  
 *    jne .L3      |    
 *
 * 7. mov eax, ecx |
 *                 | -> return s
 *    ret          |
 *
 * 8. So our function should look like this:
 *
 *    int foo(int* arr, int n) {
 *      if (n <= 0) {
 *        return 0;
 *      }
 *      int* ptr = arr;
 *      int* end = arr + n;
 *      int sum = 0;
 *      do {
 *        sum += *ptr;
 *        *ptr = sum;
 *        ++ptr;
 *      } while (ptr != end);
 *      return sum;
 *    }
 *
 * 9. So, its an in-place prefix sums evaluation.
 *    It could be simplified via using a for loop instead of do-while one.
 */
int prefix_sums(int* arr, int n) {
    if (n <= 0) {
        return 0;
    }
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += arr[i];
        arr[i] = sum;
    }
    return sum;
}