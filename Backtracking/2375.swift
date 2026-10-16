class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pattern = Array(pattern)
        var result = ""
        var stack = [Int]()
        for i in 0...pattern.count {
            stack.append(i + 1)
            if i == pattern.count || pattern[i] == "I" {
                while let digit = stack.popLast() {
                    result += String(digit)
                }
            }
        }
        return result
    }
}
