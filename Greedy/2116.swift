class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        let s = Array(s)
        let locked = Array(locked)
        if s.count % 2 == 1 { return false }
        var balance = 0
        for i in s.indices {
            balance += locked[i] == "0" || s[i] == "(" ? 1 : -1
            if balance < 0 { return false }
        }
        balance = 0
        for i in s.indices.reversed() {
            balance += locked[i] == "0" || s[i] == ")" ? 1 : -1
            if balance < 0 { return false }
        }
        return true
    }
}
