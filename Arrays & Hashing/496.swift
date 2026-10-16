class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var next = [Int: Int]()
        var stack = [Int]()
        for num in nums2 {
            while let top = stack.last, top < num {
                next[stack.removeLast()] = num
            }
            stack.append(num)
        }
        return nums1.map { next[$0] ?? -1 }
    }
}
