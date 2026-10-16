class Solution {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        zip(nums, nums.dropFirst()).allSatisfy { ($0 + $1) % 2 == 1 }
    }
}
