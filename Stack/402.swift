class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack = [Character]()
        var k = k
        for c in num {
            while k > 0, let top = stack.last, top > c {
                stack.removeLast()
                k -= 1
            }
            stack.append(c)
        }
        stack.removeLast(k)
        let result = stack.drop { $0 == "0" }
        return result.isEmpty ? "0" : String(result)
    }
}
