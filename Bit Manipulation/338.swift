class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            result[i] = result[i >> 1] + (i & 1)
        }
        return result
    }
}
