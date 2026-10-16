class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var current = 0
        var best = Int.min
        for num in nums {
            current = max(num, current + num)
            best = max(best, current)
        }
        return best
    }
}
