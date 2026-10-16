class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var change = [Int](repeating: 0, count: 1001)
        for trip in trips {
            change[trip[1]] += trip[0]
            change[trip[2]] -= trip[0]
        }
        var passengers = 0
        for delta in change {
            passengers += delta
            if passengers > capacity { return false }
        }
        return true
    }
}
