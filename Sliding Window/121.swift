class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var best = 0
        for price in prices {
            minPrice = min(minPrice, price)
            best = max(best, price - minPrice)
        }
        return best
    }
}
