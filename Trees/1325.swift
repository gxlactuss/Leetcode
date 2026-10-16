class Solution {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root = root else { return nil }
        root.left = removeLeafNodes(root.left, target)
        root.right = removeLeafNodes(root.right, target)
        if root.left == nil && root.right == nil && root.val == target { return nil }
        return root
    }
}
