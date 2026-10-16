class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var arrows = 0
        var end = Int.min
        for point in points.sorted(by: { $0[1] < $1[1] }) where point[0] > end {
            arrows += 1
            end = point[1]
        }
        return arrows
    }
}
