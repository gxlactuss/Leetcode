class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        let target = nums.reduce(0, +) % p
        if target == 0 { return 0 }
        var lastIndex = [0: -1]
        var current = 0
        var best = nums.count
        for (i, num) in nums.enumerated() {
            current = (current + num) % p
            if let j = lastIndex[(current - target + p) % p] {
                best = min(best, i - j)
            }
            lastIndex[current] = i
        }
        return best == nums.count ? -1 : best
    }
}
