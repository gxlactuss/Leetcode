class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        func count(_ node: TreeNode?, _ maxSoFar: Int) -> Int {
            guard let node = node else { return 0 }
            let good = node.val >= maxSoFar ? 1 : 0
            let newMax = max(maxSoFar, node.val)
            return good + count(node.left, newMax) + count(node.right, newMax)
        }
        return count(root, Int.min)
    }
}
