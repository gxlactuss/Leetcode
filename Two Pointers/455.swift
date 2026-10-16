class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        var i = 0
        for cookie in s.sorted() where i < g.count && cookie >= g[i] {
            i += 1
        }
        return i
    }
}
