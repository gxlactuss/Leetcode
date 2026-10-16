class Solution {
    private class Node {
        var children = [Character: Node]()
        var count = 0
    }

    func sumPrefixScores(_ words: [String]) -> [Int] {
        let root = Node()
        for word in words {
            var node = root
            for c in word {
                if node.children[c] == nil { node.children[c] = Node() }
                node = node.children[c]!
                node.count += 1
            }
        }
        return words.map { word in
            var node = root
            var score = 0
            for c in word {
                node = node.children[c]!
                score += node.count
            }
            return score
        }
    }
}
