class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        var i = 0
        for c in t where i < s.count && c == s[i] {
            i += 1
        }
        return i == s.count
    }
}
