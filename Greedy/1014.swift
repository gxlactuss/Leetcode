class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var bestLeft = values[0]
        var best = 0
        for j in 1..<values.count {
            best = max(best, bestLeft + values[j] - j)
            bestLeft = max(bestLeft, values[j] + j)
        }
        return best
    }
}
