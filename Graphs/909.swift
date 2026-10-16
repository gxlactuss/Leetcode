class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        func value(_ square: Int) -> Int {
            let r = (square - 1) / n
            let c = (square - 1) % n
            return board[n - 1 - r][r % 2 == 0 ? c : n - 1 - c]
        }
        var visited = [Bool](repeating: false, count: n * n + 1)
        visited[1] = true
        var queue = [1]
        var moves = 0
        while !queue.isEmpty {
            var next = [Int]()
            for square in queue {
                if square == n * n { return moves }
                for roll in 1...6 where square + roll <= n * n {
                    var target = square + roll
                    if value(target) != -1 { target = value(target) }
                    if !visited[target] {
                        visited[target] = true
                        next.append(target)
                    }
                }
            }
            queue = next
            moves += 1
        }
        return -1
    }
}
