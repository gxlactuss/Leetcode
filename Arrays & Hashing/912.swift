class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        let mid = nums.count / 2
        let left = sortArray(Array(nums[..<mid]))
        let right = sortArray(Array(nums[mid...]))
        var result = [Int]()
        result.reserveCapacity(nums.count)
        var i = 0
        var j = 0
        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }
        result += left[i...]
        result += right[j...]
        return result
    }
}
