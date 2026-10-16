class Solution {
    func minLength(_ s: String) -> Int {
        var stack = [Character]()
        for c in s {
            if (c == "B" && stack.last == "A") || (c == "D" && stack.last == "C") {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return stack.count
    }
}
