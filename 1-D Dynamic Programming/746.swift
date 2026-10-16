class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var a = 0
        var b = 0
        for i in 2...cost.count {
            (a, b) = (b, min(b + cost[i - 1], a + cost[i - 2]))
        }
        return b
    }
}
