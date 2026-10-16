class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n != 0 {
            n &= n - 1
            count += 1
        }
        return count
    }
}
