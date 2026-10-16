class Solution {
    func isValid(_ s: String) -> Bool {
        let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        var stack = [Character]()
        for c in s {
            if let open = pairs[c] {
                if stack.popLast() != open { return false }
            } else {
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
}
