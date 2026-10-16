class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        func valid(_ node: TreeNode?, _ low: Int, _ high: Int) -> Bool {
            guard let node = node else { return true }
            if node.val <= low || node.val >= high { return false }
            return valid(node.left, low, node.val) && valid(node.right, node.val, high)
        }
        return valid(root, Int.min, Int.max)
    }
}
