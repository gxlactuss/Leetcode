class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count

        func reachable(_ starts: [(Int, Int)]) -> [[Bool]] {
            var seen = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
            var stack = starts
            for (r, c) in starts { seen[r][c] = true }
            while let (r, c) = stack.popLast() {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < rows && nc >= 0 && nc < cols && !seen[nr][nc] && heights[nr][nc] >= heights[r][c] {
                    seen[nr][nc] = true
                    stack.append((nr, nc))
                }
            }
            return seen
        }

        let pacific = reachable((0..<rows).map { ($0, 0) } + (0..<cols).map { (0, $0) })
        let atlantic = reachable((0..<rows).map { ($0, cols - 1) } + (0..<cols).map { (rows - 1, $0) })
        var result = [[Int]]()
        for r in 0..<rows {
            for c in 0..<cols where pacific[r][c] && atlantic[r][c] {
                result.append([r, c])
            }
        }
        return result
    }
}
