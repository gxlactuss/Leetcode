class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var cols = Set<Int>()
        var diagonals = Set<Int>()
        var antiDiagonals = Set<Int>()
        func dfs(_ r: Int) -> Int {
            if r == n { return 1 }
            var count = 0
            for c in 0..<n where !cols.contains(c) && !diagonals.contains(r - c) && !antiDiagonals.contains(r + c) {
                cols.insert(c)
                diagonals.insert(r - c)
                antiDiagonals.insert(r + c)
                count += dfs(r + 1)
                cols.remove(c)
                diagonals.remove(r - c)
                antiDiagonals.remove(r + c)
            }
            return count
        }
        return dfs(0)
    }
}
