class Solution {
    func numDecodings(_ s: String) -> Int {
        let digits = s.map { $0.wholeNumberValue! }
        var prev = 1
        var current = digits[0] == 0 ? 0 : 1
        for i in 1..<digits.count {
            var next = digits[i] == 0 ? 0 : current
            let pair = digits[i - 1] * 10 + digits[i]
            if pair >= 10 && pair <= 26 { next += prev }
            (prev, current) = (current, next)
        }
        return current
    }
}
