class Solution {
    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        var count = [Int: Int]()
        func dfs(_ i: Int) -> Int {
            if i == nums.count { return 1 }
            var total = dfs(i + 1)
            let num = nums[i]
            if count[num - k, default: 0] == 0 && count[num + k, default: 0] == 0 {
                count[num, default: 0] += 1
                total += dfs(i + 1)
                count[num]! -= 1
            }
            return total
        }
        return dfs(0) - 1
    }
}
