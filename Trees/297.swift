class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var parts = [String]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                parts.append("N")
                return
            }
            parts.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        return parts.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        let parts = data.split(separator: ",")
        var i = 0
        func dfs() -> TreeNode? {
            let part = parts[i]
            i += 1
            guard let val = Int(part) else { return nil }
            let node = TreeNode(val)
            node.left = dfs()
            node.right = dfs()
            return node
        }
        return dfs()
    }
}
