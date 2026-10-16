class Solution {
    func climbStairs(_ n: Int) -> Int {
        var a = 1
        var b = 1
        for _ in 1..<max(n, 1) {
            (a, b) = (b, a + b)
        }
        return b
    }
}
