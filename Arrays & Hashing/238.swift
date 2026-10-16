class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 1, count: nums.count)
        var prefix = 1
        for i in nums.indices {
            result[i] = prefix
            prefix *= nums[i]
        }
        var suffix = 1
        for i in nums.indices.reversed() {
            result[i] *= suffix
            suffix *= nums[i]
        }
        return result
    }
}
