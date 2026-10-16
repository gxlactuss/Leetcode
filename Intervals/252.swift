class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let sorted = intervals.sorted { $0[0] < $1[0] }
        return zip(sorted, sorted.dropFirst()).allSatisfy { $0[1] <= $1[0] }
    }
}
