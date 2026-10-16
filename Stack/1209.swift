class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(char: Character, count: Int)]()
        for c in s {
            if stack.last?.char == c {
                stack[stack.count - 1].count += 1
                if stack.last!.count == k { stack.removeLast() }
            } else {
                stack.append((c, 1))
            }
        }
        return stack.map { String(repeating: $0.char, count: $0.count) }.joined()
    }
}
