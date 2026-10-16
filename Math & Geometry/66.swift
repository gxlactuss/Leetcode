class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in digits.indices.reversed() {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            }
            digits[i] = 0
        }
        return [1] + digits
    }
}
