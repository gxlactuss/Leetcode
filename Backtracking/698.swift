class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let total = nums.reduce(0, +)
        if total % k != 0 { return false }
        let target = total / k
        let nums = nums.sorted(by: >)
        if nums[0] > target { return false }
        var buckets = [Int](repeating: 0, count: k)
        func dfs(_ i: Int) -> Bool {
            if i == nums.count { return true }
            for j in 0..<k where buckets[j] + nums[i] <= target {
                if j > 0 && buckets[j] == buckets[j - 1] { continue }
                buckets[j] += nums[i]
                if dfs(i + 1) { return true }
                buckets[j] -= nums[i]
            }
            return false
        }
        return dfs(0)
    }
}
