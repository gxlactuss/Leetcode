class Solution {
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        var r = 0
        var c = 0
        var dr = 0
        var dc = 1
        var current = head
        while let node = current {
            matrix[r][c] = node.val
            current = node.next
            let nr = r + dr
            let nc = c + dc
            if nr < 0 || nr >= m || nc < 0 || nc >= n || matrix[nr][nc] != -1 {
                (dr, dc) = (dc, -dr)
            }
            r += dr
            c += dc
        }
        return matrix
    }
}
