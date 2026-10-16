class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var combo = [Int]()
        func dfs(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(combo)
                return
            }
            for i in start..<candidates.count where candidates[i] <= remaining {
                combo.append(candidates[i])
                dfs(i, remaining - candidates[i])
                combo.removeLast()
            }
        }
        dfs(0, target)
        return result
    }
}
