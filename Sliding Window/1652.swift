class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var result = [Int](repeating: 0, count: n)
        if k == 0 { return result }
        var l = k > 0 ? 1 : n + k
        var r = k > 0 ? k : n - 1
        var sum = (l...r).reduce(0) { $0 + code[$1 % n] }
        for i in 0..<n {
            result[i] = sum
            sum -= code[l % n]
            l += 1
            r += 1
            sum += code[r % n]
        }
        return result
    }
}
