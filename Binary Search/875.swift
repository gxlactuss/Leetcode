class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max()!
        while l < r {
            let k = (l + r) / 2
            let hours = piles.reduce(0) { $0 + ($1 + k - 1) / k }
            if hours <= h {
                r = k
            } else {
                l = k + 1
            }
        }
        return l
    }
}
