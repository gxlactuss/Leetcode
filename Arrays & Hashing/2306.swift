class Solution {
    func distinctNames(_ ideas: [String]) -> Int {
        var groups = [Set<String>](repeating: [], count: 26)
        for idea in ideas {
            groups[Int(idea.first!.asciiValue! - 97)].insert(String(idea.dropFirst()))
        }
        var result = 0
        for i in 0..<26 {
            for j in (i + 1)..<26 {
                let common = groups[i].intersection(groups[j]).count
                result += 2 * (groups[i].count - common) * (groups[j].count - common)
            }
        }
        return result
    }
}
