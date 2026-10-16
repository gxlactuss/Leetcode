class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func build(_ l: Int, _ r: Int) -> TreeNode? {
            if l > r { return nil }
            let mid = (l + r) / 2
            return TreeNode(nums[mid], build(l, mid - 1), build(mid + 1, r))
        }
        return build(0, nums.count - 1)
    }
}
