class Solution {
    func countNonDecreasingSubarrays(_ nums: [Int], _ k: Int) -> Int {
        // Segments of equal prefix max, stored right to left: seg.last is the
        // leftmost segment, seg[head] is the rightmost one.
        var seg: [(value: Int, count: Int)] = []
        var head = 0
        var cost = 0
        var r = nums.count - 1
        var ans = 0
        for l in stride(from: nums.count - 1, through: 0, by: -1) {
            var count = 1
            while seg.count > head, seg[seg.count - 1].value <= nums[l] {
                let top = seg.removeLast()
                cost += (nums[l] - top.value) * top.count
                count += top.count
            }
            seg.append((nums[l], count))
            while cost > k {
                cost -= seg[head].value - nums[r]
                seg[head].count -= 1
                if seg[head].count == 0 { head += 1 }
                r -= 1
            }
            ans += r - l + 1
        }
        return ans
    }
}
