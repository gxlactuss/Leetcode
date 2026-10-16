class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var available = [Int](repeating: 0, count: 26)
        for c in letters { available[Int(c.asciiValue! - 97)] += 1 }
        let wordLetters = words.map { $0.utf8.map { Int($0) - 97 } }
        func dfs(_ i: Int) -> Int {
            if i == wordLetters.count { return 0 }
            var best = dfs(i + 1)
            var valid = true
            var gained = 0
            for c in wordLetters[i] {
                available[c] -= 1
                gained += score[c]
                if available[c] < 0 { valid = false }
            }
            if valid { best = max(best, gained + dfs(i + 1)) }
            for c in wordLetters[i] { available[c] += 1 }
            return best
        }
        return dfs(0)
    }
}
