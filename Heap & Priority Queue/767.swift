class Solution {
    func reorganizeString(_ s: String) -> String {
        var count = [Character: Int]()
        for c in s { count[c, default: 0] += 1 }
        let n = s.count
        let sorted = count.sorted { $0.value > $1.value }
        if sorted[0].value > (n + 1) / 2 { return "" }
        var result = [Character](repeating: " ", count: n)
        var i = 0
        for (c, freq) in sorted {
            for _ in 0..<freq {
                if i >= n { i = 1 }
                result[i] = c
                i += 2
            }
        }
        return String(result)
    }
}
