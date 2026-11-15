class Solution {
    func digitSum(_ s: String, _ k: Int) -> String {
        var digits = Array(s)
        while digits.count > k {
            var next = ""
            for start in stride(from: 0, to: digits.count, by: k) {
                let group = digits[start..<min(start + k, digits.count)]
                next += String(group.reduce(0) { $0 + $1.wholeNumberValue! })
            }
            digits = Array(next)
        }
        return String(digits)
    }
}
