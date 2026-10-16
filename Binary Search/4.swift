class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let (a, b) = nums1.count <= nums2.count ? (nums1, nums2) : (nums2, nums1)
        let m = a.count
        let n = b.count
        let half = (m + n + 1) / 2
        var l = 0
        var r = m
        while l <= r {
            let i = (l + r) / 2
            let j = half - i
            let aLeft = i > 0 ? a[i - 1] : Int.min
            let aRight = i < m ? a[i] : Int.max
            let bLeft = j > 0 ? b[j - 1] : Int.min
            let bRight = j < n ? b[j] : Int.max
            if aLeft <= bRight && bLeft <= aRight {
                if (m + n) % 2 == 1 {
                    return Double(max(aLeft, bLeft))
                }
                return Double(max(aLeft, bLeft) + min(aRight, bRight)) / 2
            } else if aLeft > bRight {
                r = i - 1
            } else {
                l = i + 1
            }
        }
        return 0
    }
}
