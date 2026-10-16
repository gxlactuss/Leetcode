class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in nums.indices {
            let j = abs(nums[i]) - 1
            nums[j] = -abs(nums[j])
        }
        return nums.indices.filter { nums[$0] > 0 }.map { $0 + 1 }
    }
}
