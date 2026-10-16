class Solution {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        let node = root!
        switch node.val {
        case 0: return false
        case 1: return true
        case 2: return evaluateTree(node.left) || evaluateTree(node.right)
        default: return evaluateTree(node.left) && evaluateTree(node.right)
        }
    }
}
