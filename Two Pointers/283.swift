class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var l = 0
        for r in nums.indices where nums[r] != 0 {
            nums.swapAt(l, r)
            l += 1
        }
    }
}
