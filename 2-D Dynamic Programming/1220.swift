class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var (a, e, i, o, u) = (1, 1, 1, 1, 1)
        for _ in 1..<n {
            (a, e, i, o, u) = (
                (e + i + u) % mod,
                (a + i) % mod,
                (e + o) % mod,
                i,
                (i + o) % mod
            )
        }
        return (a + e + i + o + u) % mod
    }
}
