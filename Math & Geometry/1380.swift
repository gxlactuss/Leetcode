class Solution {
    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        let rowMins = Set(matrix.map { $0.min()! })
        let colMaxes = Set(matrix[0].indices.map { c in matrix.map { $0[c] }.max()! })
        return Array(rowMins.intersection(colMaxes))
    }
}
