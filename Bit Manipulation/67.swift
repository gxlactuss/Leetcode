class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a)
        let b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var carry = 0
        var result = [Character]()
        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            if i >= 0 { sum += a[i] == "1" ? 1 : 0 }
            if j >= 0 { sum += b[j] == "1" ? 1 : 0 }
            result.append(sum % 2 == 1 ? "1" : "0")
            carry = sum / 2
            i -= 1
            j -= 1
        }
        return String(result.reversed())
    }
}
