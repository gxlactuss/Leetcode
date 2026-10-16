class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)
        if total % 2 == 1 { return false }
        let target = total / 2
        var possible = [Bool](repeating: false, count: target + 1)
        possible[0] = true
        for num in nums where num <= target {
            for sum in stride(from: target, through: num, by: -1) where possible[sum - num] {
                possible[sum] = true
            }
        }
        return possible[target]
    }
}
