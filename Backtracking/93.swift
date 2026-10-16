class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let chars = Array(s)
        var result = [String]()
        var parts = [String]()
        func dfs(_ start: Int) {
            if parts.count == 4 {
                if start == chars.count { result.append(parts.joined(separator: ".")) }
                return
            }
            for end in start..<min(start + 3, chars.count) {
                let part = String(chars[start...end])
                if part.count > 1 && part.first == "0" { break }
                if Int(part)! > 255 { break }
                parts.append(part)
                dfs(end + 1)
                parts.removeLast()
            }
        }
        dfs(0)
        return result
    }
}
