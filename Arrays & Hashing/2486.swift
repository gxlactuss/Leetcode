class Solution {
    func appendCharacters(_ s: String, _ t: String) -> Int {
        let t = Array(t)
        var j = 0
        for c in s where j < t.count && c == t[j] {
            j += 1
        }
        return t.count - j
    }
}
