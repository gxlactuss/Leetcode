class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        func isPalindrome(_ l: Int, _ r: Int) -> Bool {
            var l = l
            var r = r
            while l < r {
                if chars[l] != chars[r] { return false }
                l += 1
                r -= 1
            }
            return true
        }
        var l = 0
        var r = chars.count - 1
        while l < r {
            if chars[l] != chars[r] {
                return isPalindrome(l + 1, r) || isPalindrome(l, r - 1)
            }
            l += 1
            r -= 1
        }
        return true
    }
}
