class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target { return true }
            if nums[l] == nums[mid] {
                l += 1
            } else if nums[l] < nums[mid] {
                if nums[l] <= target && target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[r] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return false
    }
}
