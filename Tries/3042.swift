class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        var count = 0
        for j in words.indices {
            for i in 0..<j where words[j].hasPrefix(words[i]) && words[j].hasSuffix(words[i]) {
                count += 1
            }
        }
        return count
    }
}
