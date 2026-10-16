class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        if original.count != m * n { return [] }
        return (0..<m).map { Array(original[($0 * n)..<($0 * n + n)]) }
    }
}
