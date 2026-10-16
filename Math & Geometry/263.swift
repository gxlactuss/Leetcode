class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n <= 0 { return false }
        var n = n
        for p in [2, 3, 5] {
            while n % p == 0 { n /= p }
        }
        return n == 1
    }
}
