class Solution {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        var result = x
        var remaining = n - 1
        var bit = 1
        while remaining > 0 {
            if x & bit == 0 {
                if remaining & 1 == 1 { result |= bit }
                remaining >>= 1
            }
            bit <<= 1
        }
        return result
    }
}
