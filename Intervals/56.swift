class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        for interval in intervals.sorted(by: { $0[0] < $1[0] }) {
            if let last = result.last, interval[0] <= last[1] {
                result[result.count - 1][1] = max(last[1], interval[1])
            } else {
                result.append(interval)
            }
        }
        return result
    }
}
