class Solution {
    func tribonacci(_ n: Int) -> Int {
        var t = [0, 1, 1]
        if n < 3 { return t[n] }
        for _ in 3...n {
            t = [t[1], t[2], t[0] + t[1] + t[2]]
        }
        return t[2]
    }
}
