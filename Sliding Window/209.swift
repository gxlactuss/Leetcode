class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var l = 0
        var sum = 0
        var best = Int.max
        for r in nums.indices {
            sum += nums[r]
            while sum >= target {
                best = min(best, r - l + 1)
                sum -= nums[l]
                l += 1
            }
        }
        return best == Int.max ? 0 : best
    }
}
