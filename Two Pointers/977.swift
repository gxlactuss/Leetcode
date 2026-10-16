class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var l = 0
        var r = nums.count - 1
        for k in stride(from: nums.count - 1, through: 0, by: -1) {
            if abs(nums[l]) > abs(nums[r]) {
                result[k] = nums[l] * nums[l]
                l += 1
            } else {
                result[k] = nums[r] * nums[r]
                r -= 1
            }
        }
        return result
    }
}
