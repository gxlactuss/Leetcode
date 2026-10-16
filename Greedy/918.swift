class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var currentMax = 0
        var currentMin = 0
        var best = Int.min
        var worst = Int.max
        var total = 0
        for num in nums {
            currentMax = max(num, currentMax + num)
            currentMin = min(num, currentMin + num)
            best = max(best, currentMax)
            worst = min(worst, currentMin)
            total += num
        }
        return best < 0 ? best : max(best, total - worst)
    }
}
