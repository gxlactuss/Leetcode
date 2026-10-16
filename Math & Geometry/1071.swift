class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 { return "" }
        var a = str1.count
        var b = str2.count
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return String(str1.prefix(a))
    }
}
