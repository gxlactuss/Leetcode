class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var masks = [(mask: Int, length: Int)]()
        for word in arr {
            var mask = 0
            var valid = true
            for c in word.utf8 {
                let bit = 1 << (Int(c) - 97)
                if mask & bit != 0 {
                    valid = false
                    break
                }
                mask |= bit
            }
            if valid { masks.append((mask, word.count)) }
        }
        func dfs(_ i: Int, _ used: Int, _ length: Int) -> Int {
            if i == masks.count { return length }
            var best = dfs(i + 1, used, length)
            if used & masks[i].mask == 0 {
                best = max(best, dfs(i + 1, used | masks[i].mask, length + masks[i].length))
            }
            return best
        }
        return dfs(0, 0, 0)
    }
}
