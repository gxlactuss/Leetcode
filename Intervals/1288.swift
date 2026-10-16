class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] > $1[1] }
        var count = 0
        var maxEnd = 0
        for interval in sorted where interval[1] > maxEnd {
            count += 1
            maxEnd = interval[1]
        }
        return count
    }
}
