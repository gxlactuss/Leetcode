class Solution {
    func alienOrder(_ words: [String]) -> String {
        var adj = [Character: Set<Character>]()
        var indegree = [Character: Int]()
        for word in words {
            for c in word { indegree[c] = 0 }
        }
        for (a, b) in zip(words, words.dropFirst()) {
            if a.count > b.count && a.hasPrefix(b) { return "" }
            for (x, y) in zip(a, b) where x != y {
                if adj[x, default: []].insert(y).inserted {
                    indegree[y]! += 1
                }
                break
            }
        }
        var queue = indegree.keys.filter { indegree[$0] == 0 }
        var result = [Character]()
        while let c = queue.popLast() {
            result.append(c)
            for next in adj[c, default: []] {
                indegree[next]! -= 1
                if indegree[next] == 0 { queue.append(next) }
            }
        }
        return result.count == indegree.count ? String(result) : ""
    }
}
