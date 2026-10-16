class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        for _ in 0..<32 {
            result = (result << 1) | (n & 1)
            n >>= 1
        }
        return result
    }
}
