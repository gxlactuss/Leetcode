class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var best = nums[0]
        var current = nums[0]
        for i in 1..<nums.count {
            current = nums[i] > nums[i - 1] ? current + nums[i] : nums[i]
            best = max(best, current)
        }
        return best
    }
}
