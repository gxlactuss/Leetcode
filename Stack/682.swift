class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        for op in operations {
            switch op {
            case "+":
                stack.append(stack[stack.count - 1] + stack[stack.count - 2])
            case "D":
                stack.append(stack.last! * 2)
            case "C":
                stack.removeLast()
            default:
                stack.append(Int(op)!)
            }
        }
        return stack.reduce(0, +)
    }
}
