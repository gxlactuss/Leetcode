class Solution {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var num = 0
        var op: Character = "+"
        for c in s + "+" {
            if let digit = c.wholeNumberValue {
                num = num * 10 + digit
            } else if c != " " {
                switch op {
                case "+": stack.append(num)
                case "-": stack.append(-num)
                case "*": stack.append(stack.removeLast() * num)
                default: stack.append(stack.removeLast() / num)
                }
                op = c
                num = 0
            }
        }
        return stack.reduce(0, +)
    }
}
