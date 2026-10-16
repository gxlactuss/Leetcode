class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var nums = nums
        func dfs(_ start: Int) {
            if start == nums.count {
                result.append(nums)
                return
            }
            for i in start..<nums.count {
                nums.swapAt(start, i)
                dfs(start + 1)
                nums.swapAt(start, i)
            }
        }
        dfs(0)
        return result
    }
}
