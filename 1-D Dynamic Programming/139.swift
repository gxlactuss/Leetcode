class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        let words = Set(wordDict)
        let lengths = Set(wordDict.map { $0.count })
        var dp = [Bool](repeating: false, count: chars.count + 1)
        dp[0] = true
        for end in 1...chars.count {
            for length in lengths where length <= end && dp[end - length] {
                if words.contains(String(chars[(end - length)..<end])) {
                    dp[end] = true
                    break
                }
            }
        }
        return dp[chars.count]
    }
}
