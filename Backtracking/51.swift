class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var queens = [Int](repeating: 0, count: n)
        var cols = Set<Int>()
        var diagonals = Set<Int>()
        var antiDiagonals = Set<Int>()
        func dfs(_ r: Int) {
            if r == n {
                result.append(queens.map { col in
                    String(repeating: ".", count: col) + "Q" + String(repeating: ".", count: n - col - 1)
                })
                return
            }
            for c in 0..<n where !cols.contains(c) && !diagonals.contains(r - c) && !antiDiagonals.contains(r + c) {
                queens[r] = c
                cols.insert(c)
                diagonals.insert(r - c)
                antiDiagonals.insert(r + c)
                dfs(r + 1)
                cols.remove(c)
                diagonals.remove(r - c)
                antiDiagonals.remove(r + c)
            }
        }
        dfs(0)
        return result
    }
}
