class Solution {
    func minimumIndex(_ nums: [Int]) -> Int {
        var dominant = 0
        var count = 0
        for num in nums {
            if count == 0 { dominant = num }
            count += num == dominant ? 1 : -1
        }
        let total = nums.filter { $0 == dominant }.count
        let n = nums.count
        var left = 0
        for i in 0..<(n - 1) {
            if nums[i] == dominant { left += 1 }
            if left * 2 > i + 1 && (total - left) * 2 > n - i - 1 {
                return i
            }
        }
        return -1
    }
}
