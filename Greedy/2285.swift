class Solution {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var degree = [Int](repeating: 0, count: n)
        for road in roads {
            degree[road[0]] += 1
            degree[road[1]] += 1
        }
        var result = 0
        for (i, d) in degree.sorted().enumerated() {
            result += d * (i + 1)
        }
        return result
    }
}
