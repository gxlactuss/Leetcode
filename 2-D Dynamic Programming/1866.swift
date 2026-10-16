class Solution {
    func rearrangeSticks(_ n: Int, _ k: Int) -> Int {
        let mod = 1_000_000_007
        var dp = [Int](repeating: 0, count: k + 1)
        dp[0] = 1
        for i in 1...n {
            for j in stride(from: min(i, k), through: 0, by: -1) {
                let visible = j > 0 ? dp[j - 1] : 0
                dp[j] = (visible + (i - 1) * dp[j]) % mod
            }
        }
        return dp[k]
    }
}
