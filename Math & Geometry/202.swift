class Solution {
    func isHappy(_ n: Int) -> Bool {
        func next(_ n: Int) -> Int {
            var n = n
            var sum = 0
            while n > 0 {
                sum += (n % 10) * (n % 10)
                n /= 10
            }
            return sum
        }
        var slow = n
        var fast = next(n)
        while fast != 1 && slow != fast {
            slow = next(slow)
            fast = next(next(fast))
        }
        return fast == 1
    }
}
