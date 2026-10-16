class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        matrix[0].indices.map { c in matrix.map { $0[c] } }
    }
}
