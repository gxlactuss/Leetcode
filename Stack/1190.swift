class Solution {
    func reverseParentheses(_ s: String) -> String {
        var stack = [[Character]]()
        var current = [Character]()
        for c in s {
            if c == "(" {
                stack.append(current)
                current = []
            } else if c == ")" {
                current = stack.removeLast() + current.reversed()
            } else {
                current.append(c)
            }
        }
        return String(current)
    }
}
