class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let maxVal = nums.max()!
        return nums.reduce(0) { $0 + maxVal - $1 }
    }
}
