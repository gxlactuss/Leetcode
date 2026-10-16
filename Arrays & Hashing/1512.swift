class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = [Int: Int]()
        var result = 0
        for num in nums {
            result += count[num, default: 0]
            count[num, default: 0] += 1
        }
        return result
    }
}
