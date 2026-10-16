class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var combo = [Int]()
        func dfs(_ start: Int) {
            if combo.count == k {
                result.append(combo)
                return
            }
            if start > n { return }
            for num in start...n {
                combo.append(num)
                dfs(num + 1)
                combo.removeLast()
            }
        }
        dfs(1)
        return result
    }
}
