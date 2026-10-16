class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var rowCount = [Int](repeating: 0, count: grid.count)
        var colCount = [Int](repeating: 0, count: grid[0].count)
        for r in grid.indices {
            for c in grid[r].indices where grid[r][c] == 1 {
                rowCount[r] += 1
                colCount[c] += 1
            }
        }
        var result = 0
        for r in grid.indices {
            for c in grid[r].indices where grid[r][c] == 1 && (rowCount[r] > 1 || colCount[c] > 1) {
                result += 1
            }
        }
        return result
    }
}
