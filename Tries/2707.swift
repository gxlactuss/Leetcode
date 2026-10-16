class Solution {
    private class Node {
        var children = [Character: Node]()
        var isEnd = false
    }

    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let root = Node()
        for word in dictionary {
            var node = root
            for c in word {
                if node.children[c] == nil { node.children[c] = Node() }
                node = node.children[c]!
            }
            node.isEnd = true
        }
        let chars = Array(s)
        let n = chars.count
        var dp = [Int](repeating: 0, count: n + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            dp[i] = dp[i + 1] + 1
            var node = root
            for j in i..<n {
                guard let next = node.children[chars[j]] else { break }
                node = next
                if node.isEnd { dp[i] = min(dp[i], dp[j + 1]) }
            }
        }
        return dp[0]
    }
}
