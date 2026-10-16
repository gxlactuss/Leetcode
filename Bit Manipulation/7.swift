class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x != 0 {
            result = result * 10 + x % 10
            x /= 10
        }
        return result > Int(Int32.max) || result < Int(Int32.min) ? 0 : result
    }
}
