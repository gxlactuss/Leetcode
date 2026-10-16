class Solution {
    func numWays(_ words: [String], _ target: String) -> Int {
        let mod = 1_000_000_007
        let length = words[0].count
        var count = [[Int]](repeating: [Int](repeating: 0, count: 26), count: length)
        for word in words {
            for (i, c) in word.utf8.enumerated() {
                count[i][Int(c) - 97] += 1
            }
        }
        let target = target.utf8.map { Int($0) - 97 }
        var dp = [Int](repeating: 0, count: target.count + 1)
        dp[0] = 1
        for i in 0..<length {
            for j in stride(from: min(i + 1, target.count), through: 1, by: -1) {
                dp[j] = (dp[j] + dp[j - 1] * count[i][target[j - 1]]) % mod
            }
        }
        return dp[target.count]
    }
}
