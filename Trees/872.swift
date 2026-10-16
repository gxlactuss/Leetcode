class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func leaves(_ node: TreeNode?, _ result: inout [Int]) {
            guard let node = node else { return }
            if node.left == nil && node.right == nil { result.append(node.val) }
            leaves(node.left, &result)
            leaves(node.right, &result)
        }
        var a = [Int]()
        var b = [Int]()
        leaves(root1, &a)
        leaves(root2, &b)
        return a == b
    }
}
