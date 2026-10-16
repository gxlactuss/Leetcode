class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        var candies = [Int](repeating: 1, count: n)
        for i in 1..<n where ratings[i] > ratings[i - 1] {
            candies[i] = candies[i - 1] + 1
        }
        for i in stride(from: n - 2, through: 0, by: -1) where ratings[i] > ratings[i + 1] {
            candies[i] = max(candies[i], candies[i + 1] + 1)
        }
        return candies.reduce(0, +)
    }
}
