class Solution {
    func postorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        var stack = [root].compactMap { $0 }
        while let node = stack.popLast() {
            result.append(node.val)
            stack.append(contentsOf: node.children)
        }
        return result.reversed()
    }
}
