class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let target = nums.reduce(0, |)
        func dfs(_ i: Int, _ current: Int) -> Int {
            if i == nums.count { return current == target ? 1 : 0 }
            return dfs(i + 1, current | nums[i]) + dfs(i + 1, current)
        }
        return dfs(0, 0)
    }
}
