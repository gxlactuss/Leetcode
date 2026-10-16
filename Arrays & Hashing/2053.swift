class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var count = [String: Int]()
        for s in arr { count[s, default: 0] += 1 }
        var k = k
        for s in arr where count[s] == 1 {
            k -= 1
            if k == 0 { return s }
        }
        return ""
    }
}
