class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let target = nums.reduce(0, +) - x
        if target < 0 { return -1 }
        var l = 0
        var sum = 0
        var best = -1
        for r in nums.indices {
            sum += nums[r]
            while sum > target {
                sum -= nums[l]
                l += 1
            }
            if sum == target { best = max(best, r - l + 1) }
        }
        return best == -1 ? -1 : nums.count - best
    }
}
