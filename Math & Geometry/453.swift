class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let low = nums.min()!
        return nums.reduce(0) { $0 + $1 - low }
    }
}
