class Solution {
    func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
        var dp = [Int](repeating: 0, count: budget + 1)
        var cheapest = Int.max
        for (i, item) in items.enumerated() {
            let price = item[1]
            cheapest = min(cheapest, price)
            guard price <= budget else { continue }
            var gain = 1
            for (j, other) in items.enumerated() where j != i && other[0] % item[0] == 0 {
                gain += 1
            }
            for c in stride(from: budget, through: price, by: -1) {
                dp[c] = max(dp[c], dp[c - price] + gain)
            }
        }
        if cheapest <= budget {
            for c in cheapest...budget {
                dp[c] = max(dp[c], dp[c - cheapest] + 1)
            }
        }
        return dp[budget]
    }
}
