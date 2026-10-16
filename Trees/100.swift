class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else { return p == nil && q == nil }
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
