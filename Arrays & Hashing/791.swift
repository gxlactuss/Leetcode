class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var count = [Character: Int]()
        for c in s { count[c, default: 0] += 1 }
        var result = ""
        for c in order {
            if let n = count.removeValue(forKey: c) {
                result += String(repeating: c, count: n)
            }
        }
        for (c, n) in count {
            result += String(repeating: c, count: n)
        }
        return result
    }
}
