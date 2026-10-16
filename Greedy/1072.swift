class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var count = [[Int]: Int]()
        for row in matrix {
            let key = row[0] == 0 ? row : row.map { 1 - $0 }
            count[key, default: 0] += 1
        }
        return count.values.max()!
    }
}
