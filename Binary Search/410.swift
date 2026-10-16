class Solution {
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        var l = nums.max()!
        var r = nums.reduce(0, +)
        while l < r {
            let limit = (l + r) / 2
            var parts = 1
            var sum = 0
            for num in nums {
                if sum + num > limit {
                    parts += 1
                    sum = 0
                }
                sum += num
            }
            if parts <= k {
                r = limit
            } else {
                l = limit + 1
            }
        }
        return l
    }
}
