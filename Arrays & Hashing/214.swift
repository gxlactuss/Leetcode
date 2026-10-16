class Solution {
    func shortestPalindrome(_ s: String) -> String {
        let chars = Array(s + "#" + String(s.reversed()))
        var lps = [Int](repeating: 0, count: chars.count)
        for i in 1..<chars.count {
            var j = lps[i - 1]
            while j > 0 && chars[i] != chars[j] {
                j = lps[j - 1]
            }
            if chars[i] == chars[j] { j += 1 }
            lps[i] = j
        }
        return String(s.dropFirst(lps.last!).reversed()) + s
    }
}
