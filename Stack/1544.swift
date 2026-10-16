class Solution {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if let top = stack.last, top != c, top.lowercased() == c.lowercased() {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}
