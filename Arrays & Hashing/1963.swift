class Solution {
    func minSwaps(_ s: String) -> Int {
        var unmatched = 0
        for c in s {
            if c == "[" {
                unmatched += 1
            } else if unmatched > 0 {
                unmatched -= 1
            }
        }
        return (unmatched + 1) / 2
    }
}
