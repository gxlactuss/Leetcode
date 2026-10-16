class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l = 0
        var r = x
        var result = 0
        while l <= r {
            let mid = (l + r) / 2
            if mid * mid <= x {
                result = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return result
    }
}
