class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count
        while l < r {
            let mid = (l + r) / 2
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
}
