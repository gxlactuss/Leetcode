class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        var total = 0
        var flips = 0
        var minLoss = Int.max
        for num in nums {
            let flipped = num ^ k
            total += max(num, flipped)
            if flipped > num { flips += 1 }
            minLoss = min(minLoss, abs(flipped - num))
        }
        return flips % 2 == 0 ? total : total - minLoss
    }
}
