class Solution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let w = Array(word)
        let a = Array(abbr)
        var i = 0
        var j = 0
        while i < w.count && j < a.count {
            if a[j].isNumber {
                if a[j] == "0" { return false }
                var num = 0
                while j < a.count, let digit = a[j].wholeNumberValue {
                    num = num * 10 + digit
                    j += 1
                }
                i += num
            } else {
                if w[i] != a[j] { return false }
                i += 1
                j += 1
            }
        }
        return i == w.count && j == a.count
    }
}
