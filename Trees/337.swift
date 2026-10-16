class Solution {
    func rob(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> (withRoot: Int, withoutRoot: Int) {
            guard let node = node else { return (0, 0) }
            let left = dfs(node.left)
            let right = dfs(node.right)
            let withRoot = node.val + left.withoutRoot + right.withoutRoot
            let withoutRoot = max(left.withRoot, left.withoutRoot) + max(right.withRoot, right.withoutRoot)
            return (withRoot, withoutRoot)
        }
        let result = dfs(root)
        return max(result.withRoot, result.withoutRoot)
    }
}
