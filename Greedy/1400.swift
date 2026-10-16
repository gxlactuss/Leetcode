class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        if s.count < k { return false }
        var count = [Character: Int]()
        for c in s { count[c, default: 0] += 1 }
        return count.values.filter { $0 % 2 == 1 }.count <= k
    }
}
