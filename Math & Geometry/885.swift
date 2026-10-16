class Solution {
    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {
        var result = [[rStart, cStart]]
        var r = rStart
        var c = cStart
        var dr = 0
        var dc = 1
        var steps = 1
        while result.count < rows * cols {
            for _ in 0..<2 {
                for _ in 0..<steps {
                    r += dr
                    c += dc
                    if r >= 0 && r < rows && c >= 0 && c < cols {
                        result.append([r, c])
                    }
                }
                (dr, dc) = (dc, -dr)
            }
            steps += 1
        }
        return result
    }
}
