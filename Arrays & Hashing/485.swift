class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var best = 0
        var current = 0
        for num in nums {
            current = num == 1 ? current + 1 : 0
            best = max(best, current)
        }
        return best
    }
}
