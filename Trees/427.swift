class Solution {
    func construct(_ grid: [[Int]]) -> Node? {
        func build(_ row: Int, _ col: Int, _ size: Int) -> Node {
            let value = grid[row][col]
            var same = true
            for r in row..<(row + size) where same {
                for c in col..<(col + size) where grid[r][c] != value {
                    same = false
                    break
                }
            }
            if same { return Node(value == 1, true) }
            let half = size / 2
            let node = Node(true, false)
            node.topLeft = build(row, col, half)
            node.topRight = build(row, col + half, half)
            node.bottomLeft = build(row + half, col, half)
            node.bottomRight = build(row + half, col + half, half)
            return node
        }
        return build(0, 0, grid.count)
    }
}
