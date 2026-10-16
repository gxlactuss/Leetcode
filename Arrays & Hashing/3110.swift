class Solution {
    func scoreOfString(_ s: String) -> Int {
        let values = s.unicodeScalars.map { Int($0.value) }
        var score = 0
        for i in 1..<values.count {
            score += abs(values[i] - values[i - 1])
        }
        return score
    }
}
