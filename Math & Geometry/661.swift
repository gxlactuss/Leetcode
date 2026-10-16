class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let rows = img.count
        let cols = img[0].count
        var result = img
        for r in 0..<rows {
            for c in 0..<cols {
                var sum = 0
                var count = 0
                for nr in max(0, r - 1)...min(rows - 1, r + 1) {
                    for nc in max(0, c - 1)...min(cols - 1, c + 1) {
                        sum += img[nr][nc]
                        count += 1
                    }
                }
                result[r][c] = sum / count
            }
        }
        return result
    }
}
