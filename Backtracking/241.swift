class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        var memo = [String: [Int]]()
        func compute(_ expr: String) -> [Int] {
            if let cached = memo[expr] { return cached }
            if let num = Int(expr) { return [num] }
            var result = [Int]()
            for (i, c) in expr.enumerated() where "+-*".contains(c) {
                let left = compute(String(expr.prefix(i)))
                let right = compute(String(expr.dropFirst(i + 1)))
                for a in left {
                    for b in right {
                        switch c {
                        case "+": result.append(a + b)
                        case "-": result.append(a - b)
                        default: result.append(a * b)
                        }
                    }
                }
            }
            memo[expr] = result
            return result
        }
        return compute(expression)
    }
}
