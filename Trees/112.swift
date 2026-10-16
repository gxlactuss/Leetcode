class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        let remaining = targetSum - root.val
        if root.left == nil && root.right == nil { return remaining == 0 }
        return hasPathSum(root.left, remaining) || hasPathSum(root.right, remaining)
    }
}
