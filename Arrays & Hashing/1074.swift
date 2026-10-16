class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var result = 0
        for top in 0..<rows {
            var colSums = [Int](repeating: 0, count: cols)
            for bottom in top..<rows {
                for c in 0..<cols {
                    colSums[c] += matrix[bottom][c]
                }
                var prefixCount = [0: 1]
                var sum = 0
                for value in colSums {
                    sum += value
                    result += prefixCount[sum - target, default: 0]
                    prefixCount[sum, default: 0] += 1
                }
            }
        }
        return result
    }
}
