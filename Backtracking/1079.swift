class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var count = [Character: Int]()
        for c in tiles { count[c, default: 0] += 1 }
        func dfs() -> Int {
            var total = 0
            for (c, n) in count where n > 0 {
                count[c] = n - 1
                total += 1 + dfs()
                count[c] = n
            }
            return total
        }
        return dfs()
    }
}
