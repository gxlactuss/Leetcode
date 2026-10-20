class Solution {
    func minChanges(_ s: String) -> Int {
        let s = Array(s)
        var changes = 0
        for i in stride(from: 0, to: s.count, by: 2) where s[i] != s[i + 1] {
            changes += 1
        }
        return changes
    }
}
