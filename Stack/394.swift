class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [(String, Int)]()
        var current = ""
        var num = 0
        for c in s {
            if let digit = c.wholeNumberValue {
                num = num * 10 + digit
            } else if c == "[" {
                stack.append((current, num))
                current = ""
                num = 0
            } else if c == "]" {
                let (prev, k) = stack.removeLast()
                current = prev + String(repeating: current, count: k)
            } else {
                current.append(c)
            }
        }
        return current
    }
}
