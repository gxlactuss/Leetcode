class Solution {
    func createGrid(_ m: Int, _ n: Int) -> [String] {
        var grid = [String(repeating: ".", count: n)]
        for _ in 1..<m {
            grid.append(String(repeating: "#", count: n - 1) + ".")
        }
        return grid
    }
}
