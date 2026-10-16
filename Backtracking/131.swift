class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        var result = [[String]]()
        var parts = [String]()
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
        func dfs(_ start: Int) {
            if start == chars.count {
                result.append(parts)
                return
            }
            for end in start..<chars.count where isPalindrome(start, end) {
                parts.append(String(chars[start...end]))
                dfs(end + 1)
                parts.removeLast()
            }
        }
        dfs(0)
        return result
    }
}
