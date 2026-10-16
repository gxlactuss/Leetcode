class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = n < 0 ? 1 / x : x
        var exp = abs(n)
        var result = 1.0
        while exp > 0 {
            if exp & 1 == 1 { result *= base }
            base *= base
            exp >>= 1
        }
        return result
    }
}
