class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let j = seen[target - num] {
                return [j, i]
            }
            seen[num] = i
        }
        return []
    }
}
