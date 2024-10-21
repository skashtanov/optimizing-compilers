#include <fstream>
#include <iostream>
#include <string>
#include <iomanip>
#include <vector>

/**
 * A -> e | BB | CD
 * B -> BB | CD
 * C -> (
 * D -> BE | )
 * E -> )
 */
constexpr size_t NON_TERMINALS_COUNT = 5;

enum NonTerminals {
    A,
    B,
    C,
    D,
    E
};

using Table = std::vector<std::vector<char>>;
using Dp = std::vector<Table>;

Dp allocate_dp_table(size_t n) {
    Dp dp(NON_TERMINALS_COUNT, Table(n));
    for (auto& table : dp) {
        for (auto& row : table) {
            row = std::vector<char>(n, 0);
        }
    }
    return dp;
}

void initialize_default_values(std::string_view source, Dp& dp) {
    const size_t n = source.size();
    for (size_t i = 0; i < n; ++i) {
        if (source[i] == '(') {
            dp[NonTerminals::C][i][i] = 1;
        } else {
            dp[NonTerminals::D][i][i] = 1;
            dp[NonTerminals::E][i][i] = 1;
        }
    }
}

Dp make_default_dp_table(std::string_view source) {
    Dp dp = allocate_dp_table(source.size());
    initialize_default_values(source, dp);
    return dp;
}

void make_cyk_dp_step(size_t i, size_t j, size_t k, Dp& dp) {
    if (dp[NonTerminals::B][i][k] && dp[NonTerminals::B][k + 1][j]) {
        dp[NonTerminals::A][i][j] = dp[NonTerminals::B][i][j] = 1;
    }
    if (dp[NonTerminals::C][i][k] && dp[NonTerminals::D][k + 1][j]) {
        dp[NonTerminals::A][i][j] = dp[NonTerminals::B][i][j] = 1;
    }
    if (dp[NonTerminals::B][i][k] && dp[NonTerminals::E][k + 1][j]) {
        dp[NonTerminals::D][i][j] = 1;
    }
}

bool cocke_younger_kasami(std::string_view source) {
    const size_t n = source.size();
    
    if (n == 0) {
        return true;
    }
    if (n % 2 != 0) {
        return false;
    }

    Dp dp = make_default_dp_table(source);

    for (size_t len = 2; len <= n; ++len) {
        for (size_t i = 0; i <= n - len; ++i) {
            const size_t j = i + len - 1;
            for (size_t k = i; k < j; ++k) {
                make_cyk_dp_step(i, j, k, dp);
            }
        }
    }

    return dp[NonTerminals::A][0][n - 1] != 0;
}

int main() {
    std::ifstream file("source.txt");
    std::string source;
    file >> source;

    const bool result = cocke_younger_kasami(source);
    std::cout << "Is " << std::quoted(source) << " a balanced parethesis sequence?: " << std::boolalpha << result << '\n';

    return 0;
}