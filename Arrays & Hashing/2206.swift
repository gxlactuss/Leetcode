class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var count = [Int: Int]()
        for num in nums { count[num, default: 0] += 1 }
        return count.values.allSatisfy { $0 % 2 == 0 }
    }
}
