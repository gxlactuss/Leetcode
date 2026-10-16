class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max()!
        var r = weights.reduce(0, +)
        while l < r {
            let capacity = (l + r) / 2
            var needed = 1
            var load = 0
            for weight in weights {
                if load + weight > capacity {
                    needed += 1
                    load = 0
                }
                load += weight
            }
            if needed <= days {
                r = capacity
            } else {
                l = capacity + 1
            }
        }
        return l
    }
}
