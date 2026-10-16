class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var n = columnNumber
        var result = [Character]()
        while n > 0 {
            n -= 1
            result.append(Character(UnicodeScalar(65 + n % 26)!))
            n /= 26
        }
        return String(result.reversed())
    }
}
