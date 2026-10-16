class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var seen = Set<String>()
        for r in 0..<9 {
            for c in 0..<9 {
                let value = board[r][c]
                if value == "." { continue }
                let keys = ["r\(r)\(value)", "c\(c)\(value)", "b\(r / 3)\(c / 3)\(value)"]
                for key in keys where !seen.insert(key).inserted {
                    return false
                }
            }
        }
        return true
    }
}
