class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var row = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for c in 1..<n {
                row[c] += row[c - 1]
            }
        }
        return row[n - 1]
    }
}
