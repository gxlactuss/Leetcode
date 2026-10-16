class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var edges = [Int: Int]()
        for row in wall {
            var position = 0
            for brick in row.dropLast() {
                position += brick
                edges[position, default: 0] += 1
            }
        }
        return wall.count - (edges.values.max() ?? 0)
    }
}
