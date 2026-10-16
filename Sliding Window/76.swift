class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = Array(s.utf8)
        var need = [Int](repeating: 0, count: 128)
        for c in t.utf8 { need[Int(c)] += 1 }
        var missing = t.utf8.count
        var l = 0
        var bestStart = 0
        var bestLength = Int.max
        for r in s.indices {
            if need[Int(s[r])] > 0 { missing -= 1 }
            need[Int(s[r])] -= 1
            while missing == 0 {
                if r - l + 1 < bestLength {
                    bestStart = l
                    bestLength = r - l + 1
                }
                need[Int(s[l])] += 1
                if need[Int(s[l])] > 0 { missing += 1 }
                l += 1
            }
        }
        return bestLength == Int.max ? "" : String(decoding: s[bestStart..<(bestStart + bestLength)], as: UTF8.self)
    }
}
