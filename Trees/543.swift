class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var best = 0
        func height(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let left = height(node.left)
            let right = height(node.right)
            best = max(best, left + right)
            return 1 + max(left, right)
        }
        _ = height(root)
        return best
    }
}
