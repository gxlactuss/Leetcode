class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)
        let rows = board.count
        let cols = board[0].count
        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count { return true }
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[i] { return false }
            board[r][c] = "#"
            let found = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) || dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)
            board[r][c] = word[i]
            return found
        }
        for r in 0..<rows {
            for c in 0..<cols where dfs(r, c, 0) {
                return true
            }
        }
        return false
    }
}
