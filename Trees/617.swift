class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let a = root1 else { return root2 }
        guard let b = root2 else { return root1 }
        return TreeNode(a.val + b.val, mergeTrees(a.left, b.left), mergeTrees(a.right, b.right))
    }
}
