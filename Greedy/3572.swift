class Solution {
    func maxSumDistinctTriplet(_ x: [Int], _ y: [Int]) -> Int {
        var best = [Int: Int]()
        for i in x.indices {
            best[x[i]] = max(best[x[i], default: 0], y[i])
        }
        if best.count < 3 { return -1 }
        return best.values.sorted(by: >).prefix(3).reduce(0, +)
    }
}
