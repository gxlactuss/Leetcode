class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var removed = 0
        var end = Int.min
        for interval in intervals.sorted(by: { $0[1] < $1[1] }) {
            if interval[0] >= end {
                end = interval[1]
            } else {
                removed += 1
            }
        }
        return removed
    }
}
