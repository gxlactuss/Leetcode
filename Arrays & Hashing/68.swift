class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [String]()
        var line = [String]()
        var length = 0
        for word in words {
            if length + word.count + line.count > maxWidth {
                let spaces = maxWidth - length
                let gaps = max(1, line.count - 1)
                var row = ""
                for (i, w) in line.enumerated() {
                    row += w
                    if i < gaps {
                        row += String(repeating: " ", count: spaces / gaps + (i < spaces % gaps ? 1 : 0))
                    }
                }
                result.append(row)
                line = []
                length = 0
            }
            line.append(word)
            length += word.count
        }
        let last = line.joined(separator: " ")
        result.append(last + String(repeating: " ", count: maxWidth - last.count))
        return result
    }
}
