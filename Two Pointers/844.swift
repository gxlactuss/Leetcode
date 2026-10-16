class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        func build(_ str: String) -> [Character] {
            var stack = [Character]()
            for c in str {
                if c == "#" {
                    _ = stack.popLast()
                } else {
                    stack.append(c)
                }
            }
            return stack
        }
        return build(s) == build(t)
    }
}
