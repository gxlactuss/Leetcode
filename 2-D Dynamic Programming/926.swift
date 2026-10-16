class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var ones = 0
        var flips = 0
        for c in s {
            if c == "1" {
                ones += 1
            } else {
                flips = min(flips + 1, ones)
            }
        }
        return flips
    }
}
