class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let words = Set(wordDict)
        let chars = Array(s)
        var result = [String]()
        var parts = [String]()
        func dfs(_ start: Int) {
            if start == chars.count {
                result.append(parts.joined(separator: " "))
                return
            }
            for end in start..<chars.count {
                let word = String(chars[start...end])
                if words.contains(word) {
                    parts.append(word)
                    dfs(end + 1)
                    parts.removeLast()
                }
            }
        }
        dfs(0)
        return result
    }
}
