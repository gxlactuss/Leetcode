class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var prefix = 0
        var result = 0
        for i in nums.indices {
            prefix += nums[i]
            result = max(result, (prefix + i) / (i + 1))
        }
        return result
    }
}
