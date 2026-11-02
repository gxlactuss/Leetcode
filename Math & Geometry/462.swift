class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        let median = sorted[sorted.count / 2]
        return sorted.reduce(0) { $0 + abs($1 - median) }
    }
}
