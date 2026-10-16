class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var clones = [ObjectIdentifier(node): Node(node.val)]
        var stack = [node]
        while let current = stack.popLast() {
            let clone = clones[ObjectIdentifier(current)]!
            for case let neighbor? in current.neighbors {
                let id = ObjectIdentifier(neighbor)
                if clones[id] == nil {
                    clones[id] = Node(neighbor.val)
                    stack.append(neighbor)
                }
                clone.neighbors.append(clones[id])
            }
        }
        return clones[ObjectIdentifier(node)]
    }
}
