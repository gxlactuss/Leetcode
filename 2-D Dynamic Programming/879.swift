class Solution {
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        let mod = 1_000_000_007
        var dp = [[Int]](repeating: [Int](repeating: 0, count: minProfit + 1), count: n + 1)
        dp[0][0] = 1
        for (members, gain) in zip(group, profit) {
            for people in stride(from: n, through: members, by: -1) {
                for p in stride(from: minProfit, through: 0, by: -1) {
                    let target = min(minProfit, p + gain)
                    dp[people][target] = (dp[people][target] + dp[people - members][p]) % mod
                }
            }
        }
        return dp.reduce(0) { ($0 + $1[minProfit]) % mod }
    }
}
