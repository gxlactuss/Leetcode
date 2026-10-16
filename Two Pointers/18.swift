class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        let n = nums.count
        var result = [[Int]]()
        for i in 0..<n where i == 0 || nums[i] != nums[i - 1] {
            for j in (i + 1)..<n where j == i + 1 || nums[j] != nums[j - 1] {
                var l = j + 1
                var r = n - 1
                while l < r {
                    let sum = nums[i] + nums[j] + nums[l] + nums[r]
                    if sum < target {
                        l += 1
                    } else if sum > target {
                        r -= 1
                    } else {
                        result.append([nums[i], nums[j], nums[l], nums[r]])
                        l += 1
                        r -= 1
                        while l < r && nums[l] == nums[l - 1] { l += 1 }
                    }
                }
            }
        }
        return result
    }
}
