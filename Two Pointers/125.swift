class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
        var l = 0
        var r = chars.count - 1
        while l < r {
            if chars[l] != chars[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}
