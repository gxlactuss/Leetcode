class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        return (0..<(n - 2)).map { r in
            (0..<(n - 2)).map { c in
                (r..<(r + 3)).map { grid[$0][c..<(c + 3)].max()! }.max()!
            }
        }
    }
}
