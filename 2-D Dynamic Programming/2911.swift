class Solution {
    func minimumChanges(_ s: String, _ k: Int) -> Int {
        let s = Array(s), n = s.count, inf = Int.max / 2
        var cost = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
        for i in 0..<n {
            for j in i + 1..<n {
                let len = j - i + 1
                for d in 1..<len where len % d == 0 {
                    var changes = 0
                    for r in 0..<d {
                        var lo = i + r, hi = j - d + 1 + r
                        while lo < hi {
                            if s[lo] != s[hi] { changes += 1 }
                            lo += d
                            hi -= d
                        }
                    }
                    cost[i][j] = min(cost[i][j], changes)
                }
            }
        }
        var dp = [[Int]](repeating: [Int](repeating: inf, count: n + 1), count: k + 1)
        dp[0][0] = 0
        for p in 1...k {
            for j in 2...n {
                for i in 0..<j - 1 where dp[p - 1][i] < inf {
                    dp[p][j] = min(dp[p][j], dp[p - 1][i] + cost[i][j - 1])
                }
            }
        }
        return dp[k][n]
    }
}
