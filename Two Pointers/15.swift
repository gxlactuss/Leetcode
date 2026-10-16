class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        for i in nums.indices where nums[i] <= 0 && (i == 0 || nums[i] != nums[i - 1]) {
            var l = i + 1
            var r = nums.count - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if sum < 0 {
                    l += 1
                } else if sum > 0 {
                    r -= 1
                } else {
                    result.append([nums[i], nums[l], nums[r]])
                    l += 1
                    r -= 1
                    while l < r && nums[l] == nums[l - 1] { l += 1 }
                }
            }
        }
        return result
    }
}
