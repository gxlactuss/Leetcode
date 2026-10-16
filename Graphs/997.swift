class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var score = [Int](repeating: 0, count: n + 1)
        for t in trust {
            score[t[0]] -= 1
            score[t[1]] += 1
        }
        return (1...n).first { score[$0] == n - 1 } ?? -1
    }
}
