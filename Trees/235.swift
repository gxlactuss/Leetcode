class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let low = min(p!.val, q!.val)
        let high = max(p!.val, q!.val)
        var current = root
        while let node = current {
            if node.val > high {
                current = node.left
            } else if node.val < low {
                current = node.right
            } else {
                return node
            }
        }
        return nil
    }
}
