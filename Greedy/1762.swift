class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        var result = [Int]()
        var tallest = 0
        for i in heights.indices.reversed() where heights[i] > tallest {
            result.append(i)
            tallest = heights[i]
        }
        return result.reversed()
    }
}
