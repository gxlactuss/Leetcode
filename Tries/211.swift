class WordDictionary {
    private class Node {
        var children = [Character: Node]()
        var isEnd = false
    }

    private let root = Node()

    init() {}

    func addWord(_ word: String) {
        var node = root
        for c in word {
            if node.children[c] == nil { node.children[c] = Node() }
            node = node.children[c]!
        }
        node.isEnd = true
    }

    func search(_ word: String) -> Bool {
        let chars = Array(word)
        func dfs(_ i: Int, _ node: Node) -> Bool {
            if i == chars.count { return node.isEnd }
            if chars[i] == "." {
                return node.children.values.contains { dfs(i + 1, $0) }
            }
            guard let next = node.children[chars[i]] else { return false }
            return dfs(i + 1, next)
        }
        return dfs(0, root)
    }
}
