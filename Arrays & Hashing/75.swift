class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0
        var mid = 0
        var high = nums.count - 1
        while mid <= high {
            switch nums[mid] {
            case 0:
                nums.swapAt(low, mid)
                low += 1
                mid += 1
            case 1:
                mid += 1
            default:
                nums.swapAt(mid, high)
                high -= 1
            }
        }
    }
}
