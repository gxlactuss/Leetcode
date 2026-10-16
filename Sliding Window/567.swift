class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let a = s1.utf8.map { Int($0) - 97 }
        let b = s2.utf8.map { Int($0) - 97 }
        guard a.count <= b.count else { return false }
        var need = [Int](repeating: 0, count: 26)
        var window = [Int](repeating: 0, count: 26)
        for i in a.indices {
            need[a[i]] += 1
            window[b[i]] += 1
        }
        if need == window { return true }
        for i in a.count..<b.count {
            window[b[i]] += 1
            window[b[i - a.count]] -= 1
            if need == window { return true }
        }
        return false
    }
}
