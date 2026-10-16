class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var count = [Character: Int]()
        var maxFreq = 0
        var l = 0
        var best = 0
        for r in chars.indices {
            count[chars[r], default: 0] += 1
            maxFreq = max(maxFreq, count[chars[r]]!)
            if r - l + 1 - maxFreq > k {
                count[chars[l]]! -= 1
                l += 1
            }
            best = max(best, r - l + 1)
        }
        return best
    }
}
