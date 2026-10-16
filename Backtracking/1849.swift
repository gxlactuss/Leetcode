class Solution {
    func splitString(_ s: String) -> Bool {
        let digits = s.map { UInt64($0.wholeNumberValue!) }
        let n = digits.count
        func dfs(_ start: Int, _ prev: UInt64) -> Bool {
            if start == n { return true }
            var num: UInt64 = 0
            for i in start..<n {
                num = num * 10 + digits[i]
                if num + 1 == prev && dfs(i + 1, num) { return true }
                if num >= prev { break }
            }
            return false
        }
        var num: UInt64 = 0
        for i in 0..<(n - 1) {
            num = num * 10 + digits[i]
            if dfs(i + 1, num) { return true }
        }
        return false
    }
}
