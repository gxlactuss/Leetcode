class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let cols = matrix[0].count
        var l = 0
        var r = matrix.count * cols - 1
        while l <= r {
            let mid = (l + r) / 2
            let value = matrix[mid / cols][mid % cols]
            if value == target { return true }
            if value < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return false
    }
}
