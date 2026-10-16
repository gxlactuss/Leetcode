class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        func height(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let left = height(node.left)
            let right = height(node.right)
            if left == -1 || right == -1 || abs(left - right) > 1 { return -1 }
            return 1 + max(left, right)
        }
        return height(root) != -1
    }
}
