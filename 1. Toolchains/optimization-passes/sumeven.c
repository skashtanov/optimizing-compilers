int sum_even(int* x, int n) {
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        if ((x[i] % 2) == 0) {
            sum += x[i];
        }
    }
    return sum;
}