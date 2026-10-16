class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var right = right
        while right > left {
            right &= right - 1
        }
        return right
    }
}
