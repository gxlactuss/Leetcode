class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        func robLine(_ houses: ArraySlice<Int>) -> Int {
            var prev = 0
            var current = 0
            for num in houses {
                (prev, current) = (current, max(current, prev + num))
            }
            return current
        }
        return max(robLine(nums.dropFirst()), robLine(nums.dropLast()))
    }
}
