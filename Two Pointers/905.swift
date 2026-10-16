class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var l = 0
        for r in nums.indices where nums[r] % 2 == 0 {
            nums.swapAt(l, r)
            l += 1
        }
        return nums
    }
}
