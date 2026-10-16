class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        var left = 0
        for (i, num) in nums.enumerated() {
            if left == total - left - num { return i }
            left += num
        }
        return -1
    }
}
