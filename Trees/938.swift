class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        if root.val < low { return rangeSumBST(root.right, low, high) }
        if root.val > high { return rangeSumBST(root.left, low, high) }
        return root.val + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
    }
}
