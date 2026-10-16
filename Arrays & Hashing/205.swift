class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var st = [Character: Character]()
        var ts = [Character: Character]()
        for (a, b) in zip(s, t) {
            if let m = st[a], m != b { return false }
            if let m = ts[b], m != a { return false }
            st[a] = b
            ts[b] = a
        }
        return true
    }
}
