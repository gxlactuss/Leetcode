class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        zip(heights, heights.sorted()).filter { $0 != $1 }.count
    }
}
