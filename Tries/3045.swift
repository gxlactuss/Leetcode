class Solution {
    private class Node {
        var children = [Int: Node]()
        var count = 0
    }

    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        let root = Node()
        var result = 0
        for word in words {
            let chars = Array(word.utf8)
            let n = chars.count
            var node = root
            for i in 0..<n {
                let key = Int(chars[i]) * 128 + Int(chars[n - 1 - i])
                if node.children[key] == nil { node.children[key] = Node() }
                node = node.children[key]!
                result += node.count
            }
            node.count += 1
        }
        return result
    }
}
