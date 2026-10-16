class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let rows = grid.count
        let cols = grid[0].count
        let total = rows * cols
        let flat = Array(grid.joined())
        let shift = k % total
        let rotated = Array(flat[(total - shift)...] + flat[..<(total - shift)])
        return (0..<rows).map { Array(rotated[($0 * cols)..<($0 * cols + cols)]) }
    }
}
