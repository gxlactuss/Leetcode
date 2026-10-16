class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
                continue
            }
            let b = stack.removeLast()
            let a = stack.removeLast()
            switch token {
            case "+": stack.append(a + b)
            case "-": stack.append(a - b)
            case "*": stack.append(a * b)
            default: stack.append(a / b)
            }
        }
        return stack[0]
    }
}
