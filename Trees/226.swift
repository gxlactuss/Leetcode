class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
        return root
    }
}
