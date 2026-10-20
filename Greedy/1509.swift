class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        if nums.count <= 4 { return 0 }
        let nums = nums.sorted()
        let n = nums.count
        var result = Int.max
        for i in 0...3 {
            result = min(result, nums[n - 4 + i] - nums[i])
        }
        return result
    }
}
