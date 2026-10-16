class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var level = [root].compactMap { $0 }
        while !level.isEmpty {
            result.append(level.map { $0.val })
            level = level.flatMap { [$0.left, $0.right].compactMap { $0 } }
        }
        return result
    }
}
