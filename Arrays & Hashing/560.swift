class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixCount = [0: 1]
        var sum = 0
        var result = 0
        for num in nums {
            sum += num
            result += prefixCount[sum - k, default: 0]
            prefixCount[sum, default: 0] += 1
        }
        return result
    }
}
