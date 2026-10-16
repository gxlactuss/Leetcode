class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let heights = heights + [0]
        var stack = [Int]()
        var best = 0
        for i in heights.indices {
            while let top = stack.last, heights[top] >= heights[i] {
                stack.removeLast()
                let left = stack.last ?? -1
                best = max(best, heights[top] * (i - left - 1))
            }
            stack.append(i)
        }
        return best
    }
}
