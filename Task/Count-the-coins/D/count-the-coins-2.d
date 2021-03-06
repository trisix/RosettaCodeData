import std.stdio, std.bigint;

BigInt countChanges(in int amount, in int[] coins)/*pure nothrow*/ {
    immutable size_t n = coins.length;
    int cycle;
    foreach (const c; coins)
        if (c <= amount && c >= cycle)
            cycle = c + 1;
    cycle *= n;
    auto table = new BigInt[cycle];
    table[0 .. n] = BigInt(1);

    int pos = n;
    foreach (s; 1 .. amount + 1) {
        foreach (i; 0 .. n) {
            if (i == 0 && pos >= cycle)
                pos = 0;
            if (coins[i] <= s) {
                immutable int q = pos - (coins[i] * n);
                table[pos] = (q >= 0) ? table[q] : table[q + cycle];
            }
            if (i)
                table[pos] += table[pos - 1];
            pos++;
        }
    }

    return table[pos - 1];
}

void main() {
    immutable usCoins = [100, 50, 25, 10, 5, 1];
    immutable euCoins = [200, 100, 50, 20, 10, 5, 2, 1];

    foreach (coins; [usCoins, euCoins]) {
        writeln(countChanges(     1_00, coins[2 .. $]));
        writeln(countChanges(  1000_00, coins));
        writeln(countChanges( 10000_00, coins));
        writeln(countChanges(100000_00, coins), "\n");
    }
}
