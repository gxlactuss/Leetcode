class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var first = Int.max
        var second = Int.max
        for price in prices {
            if price < first {
                second = first
                first = price
            } else if price < second {
                second = price
            }
        }
        let cost = first + second
        return cost <= money ? money - cost : money
    }
}
