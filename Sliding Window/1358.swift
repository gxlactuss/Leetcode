class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        var last = [-1, -1, -1]
        var result = 0
        for (i, c) in s.utf8.enumerated() {
            last[Int(c) - 97] = i
            result += last.min()! + 1
        }
        return result
    }
}
