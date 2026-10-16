class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var indegree = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        var queue = [(Int, Int)]()
        for r in 0..<rows {
            for c in 0..<cols {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] < matrix[r][c] {
                    indegree[r][c] += 1
                }
                if indegree[r][c] == 0 { queue.append((r, c)) }
            }
        }
        var length = 0
        while !queue.isEmpty {
            var next = [(Int, Int)]()
            for (r, c) in queue {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] > matrix[r][c] {
                    indegree[nr][nc] -= 1
                    if indegree[nr][nc] == 0 { next.append((nr, nc)) }
                }
            }
            queue = next
            length += 1
        }
        return length
    }
}
