class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()
        var rooms = 0
        var best = 0
        var j = 0
        for start in starts {
            while ends[j] <= start {
                rooms -= 1
                j += 1
            }
            rooms += 1
            best = max(best, rooms)
        }
        return best
    }
}
