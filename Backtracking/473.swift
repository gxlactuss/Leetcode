class Solution {
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let total = matchsticks.reduce(0, +)
        if total % 4 != 0 { return false }
        let side = total / 4
        let sticks = matchsticks.sorted(by: >)
        if sticks[0] > side { return false }
        var sides = [0, 0, 0, 0]
        func dfs(_ i: Int) -> Bool {
            if i == sticks.count { return true }
            for j in 0..<4 where sides[j] + sticks[i] <= side {
                if j > 0 && sides[j] == sides[j - 1] { continue }
                sides[j] += sticks[i]
                if dfs(i + 1) { return true }
                sides[j] -= sticks[i]
            }
            return false
        }
        return dfs(0)
    }
}
