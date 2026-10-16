class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        var white = blocks[0..<k].filter { $0 == "W" }.count
        var best = white
        for i in k..<blocks.count {
            if blocks[i] == "W" { white += 1 }
            if blocks[i - k] == "W" { white -= 1 }
            best = min(best, white)
        }
        return best
    }
}
