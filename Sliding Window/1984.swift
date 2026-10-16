class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var best = Int.max
        for i in 0...(nums.count - k) {
            best = min(best, nums[i + k - 1] - nums[i])
        }
        return best
    }
}
