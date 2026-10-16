class Trie {
    private class Node {
        var children = [Character: Node]()
        var isEnd = false
    }

    private let root = Node()

    init() {}

    func insert(_ word: String) {
        var node = root
        for c in word {
            if node.children[c] == nil { node.children[c] = Node() }
            node = node.children[c]!
        }
        node.isEnd = true
    }

    func search(_ word: String) -> Bool {
        find(word)?.isEnd ?? false
    }

    func startsWith(_ prefix: String) -> Bool {
        find(prefix) != nil
    }

    private func find(_ prefix: String) -> Node? {
        var node = root
        for c in prefix {
            guard let next = node.children[c] else { return nil }
            node = next
        }
        return node
    }
}
