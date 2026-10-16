class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        var subset = [Int]()
        func dfs(_ start: Int) {
            result.append(subset)
            for i in start..<nums.count {
                if i > start && nums[i] == nums[i - 1] { continue }
                subset.append(nums[i])
                dfs(i + 1)
                subset.removeLast()
            }
        }
        dfs(0)
        return result
    }
}
