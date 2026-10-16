class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        while top <= bottom && left <= right {
            for c in left...right { result.append(matrix[top][c]) }
            top += 1
            if top <= bottom {
                for r in top...bottom { result.append(matrix[r][right]) }
            }
            right -= 1
            if top <= bottom && left <= right {
                for c in stride(from: right, through: left, by: -1) { result.append(matrix[bottom][c]) }
                bottom -= 1
            }
            if left <= right && top <= bottom {
                for r in stride(from: bottom, through: top, by: -1) { result.append(matrix[r][left]) }
                left += 1
            }
        }
        return result
    }
}
