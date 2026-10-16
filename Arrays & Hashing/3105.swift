class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var best = 1
        var inc = 1
        var dec = 1
        for i in 1..<nums.count {
            inc = nums[i] > nums[i - 1] ? inc + 1 : 1
            dec = nums[i] < nums[i - 1] ? dec + 1 : 1
            best = max(best, inc, dec)
        }
        return best
    }
}
