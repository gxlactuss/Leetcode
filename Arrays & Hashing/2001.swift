class Solution {
    func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        var count = [Double: Int]()
        var result = 0
        for rect in rectangles {
            let ratio = Double(rect[0]) / Double(rect[1])
            result += count[ratio, default: 0]
            count[ratio, default: 0] += 1
        }
        return result
    }
}
