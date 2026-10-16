class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var best = Int.min
        func gain(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let left = max(0, gain(node.left))
            let right = max(0, gain(node.right))
            best = max(best, node.val + left + right)
            return node.val + max(left, right)
        }
        _ = gain(root)
        return best
    }
}
