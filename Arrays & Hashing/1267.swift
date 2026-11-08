class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var rows = [Int](repeating: 0, count: grid.count)
        var cols = [Int](repeating: 0, count: grid[0].count)
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] == 1 {
                rows[i] += 1
                cols[j] += 1
            }
        }
        var count = 0
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] == 1 && (rows[i] > 1 || cols[j] > 1) {
                count += 1
            }
        }
        return count
    }
}
