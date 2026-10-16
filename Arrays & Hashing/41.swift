class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        for i in 0..<n {
            while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        for i in 0..<n where nums[i] != i + 1 {
            return i + 1
        }
        return n + 1
    }
}
