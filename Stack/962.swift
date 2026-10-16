class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        var stack = [Int]()
        for i in nums.indices where stack.isEmpty || nums[i] < nums[stack.last!] {
            stack.append(i)
        }
        var best = 0
        for j in nums.indices.reversed() {
            while let top = stack.last, nums[top] <= nums[j] {
                best = max(best, j - top)
                stack.removeLast()
            }
        }
        return best
    }
}
