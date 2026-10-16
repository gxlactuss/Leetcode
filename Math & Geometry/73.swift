class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        let firstRowZero = matrix[0].contains(0)
        let firstColZero = matrix.contains { $0[0] == 0 }
        for r in 1..<rows {
            for c in 1..<cols where matrix[r][c] == 0 {
                matrix[r][0] = 0
                matrix[0][c] = 0
            }
        }
        for r in 1..<rows {
            for c in 1..<cols where matrix[r][0] == 0 || matrix[0][c] == 0 {
                matrix[r][c] = 0
            }
        }
        if firstRowZero {
            for c in 0..<cols { matrix[0][c] = 0 }
        }
        if firstColZero {
            for r in 0..<rows { matrix[r][0] = 0 }
        }
    }
}
