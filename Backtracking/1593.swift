class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        let chars = Array(s)
        var seen = Set<String>()
        func dfs(_ start: Int) -> Int {
            if start == chars.count { return 0 }
            var best = -1
            for end in start..<chars.count {
                let part = String(chars[start...end])
                if seen.contains(part) { continue }
                seen.insert(part)
                let rest = dfs(end + 1)
                if rest >= 0 { best = max(best, 1 + rest) }
                seen.remove(part)
            }
            return best
        }
        return dfs(0)
    }
}
