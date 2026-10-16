class Solution {
    func clearDigits(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if c.isNumber {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}
