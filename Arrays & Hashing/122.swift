class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        zip(prices, prices.dropFirst()).reduce(0) { $0 + max(0, $1.1 - $1.0) }
    }
}
