class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count * grid.count
        var seen = [Bool](repeating: false, count: n + 1)
        var repeated = 0
        for num in grid.joined() {
            if seen[num] { repeated = num }
            seen[num] = true
        }
        let missing = (1...n).first { !seen[$0] }!
        return [repeated, missing]
    }
}
