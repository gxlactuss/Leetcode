class Solution {
    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        let s = Array(s)
        var reachable = [Bool](repeating: false, count: s.count)
        reachable[0] = true
        var window = 0
        for i in 1..<s.count {
            if i >= minJump && reachable[i - minJump] { window += 1 }
            if i > maxJump && reachable[i - maxJump - 1] { window -= 1 }
            reachable[i] = window > 0 && s[i] == "0"
        }
        return reachable[s.count - 1]
    }
}
