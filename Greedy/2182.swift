class Solution {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var count = [Int](repeating: 0, count: 26)
        for c in s.utf8 { count[Int(c) - 97] += 1 }
        var result = [UInt8]()
        var i = 25
        while i >= 0 {
            if count[i] == 0 {
                i -= 1
                continue
            }
            let use = min(count[i], repeatLimit)
            result += [UInt8](repeating: UInt8(97 + i), count: use)
            count[i] -= use
            if count[i] > 0 {
                var j = i - 1
                while j >= 0 && count[j] == 0 { j -= 1 }
                if j < 0 { break }
                result.append(UInt8(97 + j))
                count[j] -= 1
            }
        }
        return String(decoding: result, as: UTF8.self)
    }
}
