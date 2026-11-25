class Solution {
    func smallestUniqueSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        let m1 = 1_000_000_007, m2 = 998_244_353
        let b1 = Int.random(in: 100_003..<m1), b2 = Int.random(in: 100_003..<m2)
        var h1 = [Int](repeating: 0, count: n + 1), h2 = h1
        var p1 = [Int](repeating: 1, count: n + 1), p2 = p1
        for i in 0..<n {
            h1[i + 1] = (h1[i] * b1 + nums[i]) % m1
            h2[i + 1] = (h2[i] * b2 + nums[i]) % m2
            p1[i + 1] = p1[i] * b1 % m1
            p2[i + 1] = p2[i] * b2 % m2
        }
        func hasUnique(_ len: Int) -> Bool {
            var freq = [Int: Int]()
            for i in 0...(n - len) {
                let x = ((h1[i + len] - h1[i] * p1[len]) % m1 + m1) % m1
                let y = ((h2[i + len] - h2[i] * p2[len]) % m2 + m2) % m2
                freq[x << 30 | y, default: 0] += 1
            }
            return freq.values.contains(1)
        }
        var lo = 1, hi = n
        while lo < hi {
            let mid = (lo + hi) / 2
            if hasUnique(mid) { hi = mid } else { lo = mid + 1 }
        }
        return lo
    }
}
