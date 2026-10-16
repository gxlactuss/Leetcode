class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var i = 0
        for num in pushed {
            stack.append(num)
            while let top = stack.last, top == popped[i] {
                stack.removeLast()
                i += 1
            }
        }
        return stack.isEmpty
    }
}
