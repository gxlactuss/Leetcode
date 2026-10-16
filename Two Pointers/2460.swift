class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 0..<(nums.count - 1) where nums[i] == nums[i + 1] {
            nums[i] *= 2
            nums[i + 1] = 0
        }
        var l = 0
        for r in nums.indices where nums[r] != 0 {
            nums.swapAt(l, r)
            l += 1
        }
        return nums
    }
}
