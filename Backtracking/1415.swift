class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        var count = 0
        var current = [Character]()
        func dfs() -> String? {
            if current.count == n {
                count += 1
                return count == k ? String(current) : nil
            }
            for c in "abc" where current.last != c {
                current.append(c)
                if let found = dfs() { return found }
                current.removeLast()
            }
            return nil
        }
        return dfs() ?? ""
    }
}
