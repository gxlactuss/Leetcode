class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        for (i, jump) in nums.enumerated() {
            if i > reach { return false }
            reach = max(reach, i + jump)
        }
        return true
    }
}
