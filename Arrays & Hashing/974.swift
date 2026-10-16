class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var remainderCount = [0: 1]
        var sum = 0
        var result = 0
        for num in nums {
            sum += num
            let remainder = (sum % k + k) % k
            result += remainderCount[remainder, default: 0]
            remainderCount[remainder, default: 0] += 1
        }
        return result
    }
}
