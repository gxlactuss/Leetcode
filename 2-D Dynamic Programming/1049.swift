class Solution {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        let total = stones.reduce(0, +)
        let half = total / 2
        var possible = [Bool](repeating: false, count: half + 1)
        possible[0] = true
        for stone in stones {
            for sum in stride(from: half, through: stone, by: -1) where possible[sum - stone] {
                possible[sum] = true
            }
        }
        let best = possible.lastIndex(of: true)!
        return total - 2 * best
    }
}
