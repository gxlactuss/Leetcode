class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let rows = rooms.count
        let cols = rooms[0].count
        var queue = [(Int, Int)]()
        for r in 0..<rows {
            for c in 0..<cols where rooms[r][c] == 0 {
                queue.append((r, c))
            }
        }
        var head = 0
        while head < queue.count {
            let (r, c) = queue[head]
            head += 1
            for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
            where nr >= 0 && nr < rows && nc >= 0 && nc < cols && rooms[nr][nc] == Int(Int32.max) {
                rooms[nr][nc] = rooms[r][c] + 1
                queue.append((nr, nc))
            }
        }
    }
}
