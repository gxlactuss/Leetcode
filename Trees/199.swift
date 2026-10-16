class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var level = [root].compactMap { $0 }
        while let last = level.last {
            result.append(last.val)
            level = level.flatMap { [$0.left, $0.right].compactMap { $0 } }
        }
        return result
    }
}
