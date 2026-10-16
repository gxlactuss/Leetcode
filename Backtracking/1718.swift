class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var result = [Int](repeating: 0, count: 2 * n - 1)
        var used = [Bool](repeating: false, count: n + 1)
        func dfs(_ i: Int) -> Bool {
            if i == result.count { return true }
            if result[i] != 0 { return dfs(i + 1) }
            for num in stride(from: n, through: 1, by: -1) where !used[num] {
                let j = num == 1 ? i : i + num
                if j >= result.count || result[j] != 0 { continue }
                result[i] = num
                result[j] = num
                used[num] = true
                if dfs(i + 1) { return true }
                result[i] = 0
                result[j] = 0
                used[num] = false
            }
            return false
        }
        _ = dfs(0)
        return result
    }
}
