class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var bestStart = 0
        var bestLength = 0
        for center in 0..<(2 * chars.count - 1) {
            var l = center / 2
            var r = l + center % 2
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            if r - l - 1 > bestLength {
                bestStart = l + 1
                bestLength = r - l - 1
            }
        }
        return String(chars[bestStart..<(bestStart + bestLength)])
    }
}
