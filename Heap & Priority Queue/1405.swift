class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var counts: [(char: Character, count: Int)] = [("a", a), ("b", b), ("c", c)]
        var result = [Character]()
        while true {
            counts.sort { $0.count > $1.count }
            var placed = false
            for i in counts.indices where counts[i].count > 0 {
                let char = counts[i].char
                if result.count >= 2 && result[result.count - 1] == char && result[result.count - 2] == char {
                    continue
                }
                result.append(char)
                counts[i].count -= 1
                placed = true
                break
            }
            if !placed { break }
        }
        return String(result)
    }
}
