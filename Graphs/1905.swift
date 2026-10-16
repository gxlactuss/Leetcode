class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var grid2 = grid2
        let rows = grid2.count
        let cols = grid2[0].count
        var count = 0
        for r in 0..<rows {
            for c in 0..<cols where grid2[r][c] == 1 {
                var isSub = true
                grid2[r][c] = 0
                var stack = [(r, c)]
                while let (cr, cc) = stack.popLast() {
                    if grid1[cr][cc] == 0 { isSub = false }
                    for (nr, nc) in [(cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)]
                    where nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid2[nr][nc] == 1 {
                        grid2[nr][nc] = 0
                        stack.append((nr, nc))
                    }
                }
                if isSub { count += 1 }
            }
        }
        return count
    }
}
