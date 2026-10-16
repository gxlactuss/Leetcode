class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var merged = newInterval
        var i = 0
        while i < intervals.count && intervals[i][1] < merged[0] {
            result.append(intervals[i])
            i += 1
        }
        while i < intervals.count && intervals[i][0] <= merged[1] {
            merged = [min(merged[0], intervals[i][0]), max(merged[1], intervals[i][1])]
            i += 1
        }
        result.append(merged)
        result += intervals[i...]
        return result
    }
}
