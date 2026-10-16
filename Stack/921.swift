class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var open = 0
        var adds = 0
        for c in s {
            if c == "(" {
                open += 1
            } else if open > 0 {
                open -= 1
            } else {
                adds += 1
            }
        }
        return open + adds
    }
}
