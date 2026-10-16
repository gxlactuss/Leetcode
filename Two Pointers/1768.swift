class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let a = Array(word1)
        let b = Array(word2)
        var result = ""
        for i in 0..<max(a.count, b.count) {
            if i < a.count { result.append(a[i]) }
            if i < b.count { result.append(b[i]) }
        }
        return result
    }
}
