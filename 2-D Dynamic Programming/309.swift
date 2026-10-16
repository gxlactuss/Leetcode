class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var hold = Int.min
        var sold = 0
        var rest = 0
        for price in prices {
            (hold, sold, rest) = (max(hold, rest - price), hold + price, max(rest, sold))
        }
        return max(sold, rest)
    }
}
