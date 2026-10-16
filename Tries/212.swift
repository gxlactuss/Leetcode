class Solution {
    private class Node {
        var children = [Character: Node]()
        var word: String?
    }

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = Node()
        for word in words {
            var node = root
            for c in word {
                if node.children[c] == nil { node.children[c] = Node() }
                node = node.children[c]!
            }
            node.word = word
        }
        var board = board
        let rows = board.count
        let cols = board[0].count
        var result = [String]()

        func dfs(_ r: Int, _ c: Int, _ parent: Node) {
            let char = board[r][c]
            guard let node = parent.children[char] else { return }
            if let word = node.word {
                result.append(word)
                node.word = nil
            }
            board[r][c] = "#"
            for (dr, dc) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                let nr = r + dr
                let nc = c + dc
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] != "#" {
                    dfs(nr, nc, node)
                }
            }
            board[r][c] = char
            if node.children.isEmpty && node.word == nil {
                parent.children[char] = nil
            }
        }

        for r in 0..<rows {
            for c in 0..<cols {
                dfs(r, c, root)
            }
        }
        return result
    }
}
