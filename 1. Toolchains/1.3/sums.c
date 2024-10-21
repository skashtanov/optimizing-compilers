int sum_recursive(int n) {
    if (n == 1) {
        return 1;
    }
    return n + sum_recursive(n - 1);
}

int sum_loop(int n) {
    int s = 1;
    for (int i = n; i != 1; --i) {
        s += i;
    }
    return s;
}

int sum_formula(int n) {
    return n * (n + 1) / 2;
}

int sum_recursive_formula(int n) {
    if (n > 0) {
        return n * (n + 1) / 2;
    }
    return n + sum_recursive_formula(n - 1);
}

int main() {
    return 0;
}