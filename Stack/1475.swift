class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var result = prices
        var stack = [Int]()
        for (i, price) in prices.enumerated() {
            while let top = stack.last, prices[top] >= price {
                result[top] -= price
                stack.removeLast()
            }
            stack.append(i)
        }
        return result
    }
}
