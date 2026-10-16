class Solution {
    func removeStars(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if c == "*" {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}
