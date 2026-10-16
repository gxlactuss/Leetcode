class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var best = 0
        for num in set where !set.contains(num - 1) {
            var length = 1
            while set.contains(num + length) {
                length += 1
            }
            best = max(best, length)
        }
        return best
    }
}
