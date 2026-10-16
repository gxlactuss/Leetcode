class Solution {
    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var current = 0
        for num in nums {
            (prev, current) = (current, max(current, prev + num))
        }
        return current
    }
}
