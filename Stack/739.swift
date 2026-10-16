class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: temperatures.count)
        var stack = [Int]()
        for (i, temp) in temperatures.enumerated() {
            while let top = stack.last, temperatures[top] < temp {
                result[top] = i - top
                stack.removeLast()
            }
            stack.append(i)
        }
        return result
    }
}
