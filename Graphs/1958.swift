class Solution {
    func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        for (dr, dc) in directions {
            var r = rMove + dr
            var c = cMove + dc
            var length = 1
            while r >= 0 && r < 8 && c >= 0 && c < 8 {
                length += 1
                if board[r][c] == "." { break }
                if board[r][c] == color {
                    if length >= 3 { return true }
                    break
                }
                r += dr
                c += dc
            }
        }
        return false
    }
}
