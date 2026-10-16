class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = nums.count
        for (i, num) in nums.enumerated() {
            result ^= i ^ num
        }
        return result
    }
}
