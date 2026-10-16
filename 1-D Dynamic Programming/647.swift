class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        for center in 0..<(2 * chars.count - 1) {
            var l = center / 2
            var r = l + center % 2
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                count += 1
                l -= 1
                r += 1
            }
        }
        return count
    }
}
