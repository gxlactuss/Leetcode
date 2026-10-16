class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if val < root.val {
            root.left = insertIntoBST(root.left, val)
        } else {
            root.right = insertIntoBST(root.right, val)
        }
        return root
    }
}
