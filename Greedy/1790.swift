class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        let a = Array(s1)
        let b = Array(s2)
        let diff = a.indices.filter { a[$0] != b[$0] }
        if diff.isEmpty { return true }
        return diff.count == 2 && a[diff[0]] == b[diff[1]] && a[diff[1]] == b[diff[0]]
    }
}
