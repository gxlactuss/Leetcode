class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var i = 0
        var j = 0
        while i < nums1.count || j < nums2.count {
            if j == nums2.count || (i < nums1.count && nums1[i][0] < nums2[j][0]) {
                result.append(nums1[i])
                i += 1
            } else if i == nums1.count || nums2[j][0] < nums1[i][0] {
                result.append(nums2[j])
                j += 1
            } else {
                result.append([nums1[i][0], nums1[i][1] + nums2[j][1]])
                i += 1
                j += 1
            }
        }
        return result
    }
}
