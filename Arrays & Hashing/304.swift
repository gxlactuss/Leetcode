class NumMatrix {
    private var prefix: [[Int]]

    init(_ matrix: [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        prefix = [[Int]](repeating: [Int](repeating: 0, count: cols + 1), count: rows + 1)
        for r in 0..<rows {
            for c in 0..<cols {
                prefix[r + 1][c + 1] = matrix[r][c] + prefix[r][c + 1] + prefix[r + 1][c] - prefix[r][c]
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        prefix[row2 + 1][col2 + 1] - prefix[row1][col2 + 1] - prefix[row2 + 1][col1] + prefix[row1][col1]
    }
}
