class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let cost = zip(s.utf8, t.utf8).map { abs(Int($0) - Int($1)) }
        var l = 0
        var total = 0
        var best = 0
        for r in cost.indices {
            total += cost[r]
            while total > maxCost {
                total -= cost[l]
                l += 1
            }
            best = max(best, r - l + 1)
        }
        return best
    }
}
