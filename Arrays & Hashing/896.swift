class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var increasing = true
        var decreasing = true
        for (a, b) in zip(nums, nums.dropFirst()) {
            if a > b { increasing = false }
            if a < b { decreasing = false }
        }
        return increasing || decreasing
    }
}
