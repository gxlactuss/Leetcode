class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var subset = [Int]()
        func dfs(_ i: Int) {
            if i == nums.count {
                result.append(subset)
                return
            }
            subset.append(nums[i])
            dfs(i + 1)
            subset.removeLast()
            dfs(i + 1)
        }
        dfs(0)
        return result
    }
}
