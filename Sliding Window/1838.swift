class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var l = 0
        var total = 0
        var best = 0
        for r in nums.indices {
            total += nums[r]
            while nums[r] * (r - l + 1) - total > k {
                total -= nums[l]
                l += 1
            }
            best = max(best, r - l + 1)
        }
        return best
    }
}
