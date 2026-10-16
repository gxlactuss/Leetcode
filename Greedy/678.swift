class Solution {
    func checkValidString(_ s: String) -> Bool {
        var low = 0
        var high = 0
        for c in s {
            if c == "(" {
                low += 1
                high += 1
            } else if c == ")" {
                low -= 1
                high -= 1
            } else {
                low -= 1
                high += 1
            }
            if high < 0 { return false }
            low = max(low, 0)
        }
        return low == 0
    }
}
