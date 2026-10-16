class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        func dfs(_ i: Int, _ xor: Int) -> Int {
            if i == nums.count { return xor }
            return dfs(i + 1, xor ^ nums[i]) + dfs(i + 1, xor)
        }
        return dfs(0, 0)
    }
}
