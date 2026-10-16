class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var result = [[Int]]()
        var combo = [Int]()
        func dfs(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(combo)
                return
            }
            for i in start..<candidates.count {
                if i > start && candidates[i] == candidates[i - 1] { continue }
                if candidates[i] > remaining { break }
                combo.append(candidates[i])
                dfs(i + 1, remaining - candidates[i])
                combo.removeLast()
            }
        }
        dfs(0, target)
        return result
    }
}
