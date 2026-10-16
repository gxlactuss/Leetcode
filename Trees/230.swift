class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var current = root
        var k = k
        while true {
            while let node = current {
                stack.append(node)
                current = node.left
            }
            let node = stack.removeLast()
            k -= 1
            if k == 0 { return node.val }
            current = node.right
        }
    }
}
