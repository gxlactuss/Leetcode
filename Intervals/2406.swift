class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()
        var groups = 0
        var best = 0
        var j = 0
        for start in starts {
            while ends[j] < start {
                groups -= 1
                j += 1
            }
            groups += 1
            best = max(best, groups)
        }
        return best
    }
}
