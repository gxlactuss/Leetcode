class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var best = nums[0]
        var currentMax = 1
        var currentMin = 1
        for num in nums {
            (currentMax, currentMin) = (
                max(num, currentMax * num, currentMin * num),
                min(num, currentMax * num, currentMin * num)
            )
            best = max(best, currentMax)
        }
        return best
    }
}
