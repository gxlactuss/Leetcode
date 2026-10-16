class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var count = [Character: Int]()
        for c in s { count[c, default: 0] += 1 }
        for c in t { count[c, default: 0] -= 1 }
        return count.values.allSatisfy { $0 == 0 }
    }
}
