class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if key < root.val {
            root.left = deleteNode(root.left, key)
        } else if key > root.val {
            root.right = deleteNode(root.right, key)
        } else {
            guard let left = root.left else { return root.right }
            guard let right = root.right else { return left }
            var successor = right
            while let next = successor.left {
                successor = next
            }
            root.val = successor.val
            root.right = deleteNode(right, successor.val)
        }
        return root
    }
}
