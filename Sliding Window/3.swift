class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastIndex = [Character: Int]()
        var l = 0
        var best = 0
        for (r, c) in s.enumerated() {
            if let j = lastIndex[c], j >= l {
                l = j + 1
            }
            lastIndex[c] = r
            best = max(best, r - l + 1)
        }
        return best
    }
}
