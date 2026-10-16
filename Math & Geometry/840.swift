class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        if rows < 3 || cols < 3 { return 0 }
        var count = 0
        for r in 0...(rows - 3) {
            for c in 0...(cols - 3) {
                let square = (0..<3).map { Array(grid[r + $0][c..<(c + 3)]) }
                if Set(square.joined()) != Set(1...9) { continue }
                let lines = square.map { $0.reduce(0, +) }
                    + (0..<3).map { j in square.reduce(0) { $0 + $1[j] } }
                    + [square[0][0] + square[1][1] + square[2][2], square[0][2] + square[1][1] + square[2][0]]
                if lines.allSatisfy({ $0 == 15 }) { count += 1 }
            }
        }
        return count
    }
}
