class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var rowSum = rowSum
        var colSum = colSum
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: colSum.count), count: rowSum.count)
        for r in rowSum.indices {
            for c in colSum.indices {
                let value = min(rowSum[r], colSum[c])
                matrix[r][c] = value
                rowSum[r] -= value
                colSum[c] -= value
            }
        }
        return matrix
    }
}
