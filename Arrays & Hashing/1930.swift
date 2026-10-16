class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let chars = Array(s)
        var result = 0
        for c in Set(chars) {
            if let left = chars.firstIndex(of: c), let right = chars.lastIndex(of: c), right - left > 1 {
                result += Set(chars[(left + 1)..<right]).count
            }
        }
        return result
    }
}
