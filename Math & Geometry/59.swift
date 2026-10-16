class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var r = 0
        var c = 0
        var dr = 0
        var dc = 1
        for value in 1...(n * n) {
            matrix[r][c] = value
            let nr = r + dr
            let nc = c + dc
            if nr < 0 || nr >= n || nc < 0 || nc >= n || matrix[nr][nc] != 0 {
                (dr, dc) = (dc, -dr)
            }
            r += dr
            c += dc
        }
        return matrix
    }
}
