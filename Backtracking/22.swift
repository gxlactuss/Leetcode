class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var current = ""
        func dfs(_ open: Int, _ close: Int) {
            if current.count == 2 * n {
                result.append(current)
                return
            }
            if open < n {
                current.append("(")
                dfs(open + 1, close)
                current.removeLast()
            }
            if close < open {
                current.append(")")
                dfs(open, close + 1)
                current.removeLast()
            }
        }
        dfs(0, 0)
        return result
    }
}
