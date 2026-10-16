class Solution {
    func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
        var free = 0
        var lastEnd = 0
        for meeting in meetings.sorted(by: { $0[0] < $1[0] }) {
            if meeting[0] > lastEnd { free += meeting[0] - lastEnd - 1 }
            lastEnd = max(lastEnd, meeting[1])
        }
        return free + days - lastEnd
    }
}
