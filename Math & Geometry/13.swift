class Solution {
    func romanToInt(_ s: String) -> Int {
        let values: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let nums = s.map { values[$0]! }
        var total = 0
        for i in nums.indices {
            if i + 1 < nums.count && nums[i] < nums[i + 1] {
                total -= nums[i]
            } else {
                total += nums[i]
            }
        }
        return total
    }
}
