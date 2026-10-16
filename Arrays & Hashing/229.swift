class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var candidate1 = 0
        var candidate2 = 1
        var count1 = 0
        var count2 = 0
        for num in nums {
            if num == candidate1 {
                count1 += 1
            } else if num == candidate2 {
                count2 += 1
            } else if count1 == 0 {
                candidate1 = num
                count1 = 1
            } else if count2 == 0 {
                candidate2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        return [candidate1, candidate2].filter { candidate in
            nums.filter { $0 == candidate }.count > nums.count / 3
        }
    }
}
