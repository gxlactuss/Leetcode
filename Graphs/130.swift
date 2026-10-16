class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let cols = board[0].count
        var stack = [(Int, Int)]()
        for r in 0..<rows {
            stack.append((r, 0))
            stack.append((r, cols - 1))
        }
        for c in 0..<cols {
            stack.append((0, c))
            stack.append((rows - 1, c))
        }
        while let (r, c) = stack.popLast() {
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != "O" { continue }
            board[r][c] = "T"
            stack += [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
        }
        for r in 0..<rows {
            for c in 0..<cols {
                board[r][c] = board[r][c] == "T" ? "O" : "X"
            }
        }
    }
}
