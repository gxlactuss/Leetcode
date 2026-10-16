class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        return nums.indices.filter { nums[$0] > nums[($0 + 1) % n] }.count <= 1
    }
}
