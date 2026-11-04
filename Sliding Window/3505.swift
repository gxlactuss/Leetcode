class Solution {
    func minOperations(_ nums: [Int], _ x: Int, _ k: Int) -> Int {
        let n = nums.count
        let vals = Array(Set(nums)).sorted()
        let m = vals.count
        var rank = [Int: Int]()
        for (i, v) in vals.enumerated() { rank[v] = i + 1 }
        var cnt = [Int](repeating: 0, count: m + 1)
        var sum = [Int](repeating: 0, count: m + 1)
        func add(_ v: Int, _ d: Int) {
            var i = rank[v]!
            while i <= m { cnt[i] += d; sum[i] += d * v; i += i & -i }
        }
        var log = 1
        while log * 2 <= m { log *= 2 }

        var cost = [Int](repeating: 0, count: n - x + 1)
        var windowSum = 0
        let half = (x + 1) / 2
        for i in 0..<n {
            add(nums[i], 1)
            windowSum += nums[i]
            if i >= x { add(nums[i - x], -1); windowSum -= nums[i - x] }
            if i < x - 1 { continue }
            var pos = 0, c = 0, s = 0, step = log
            while step > 0 {
                if pos + step <= m && c + cnt[pos + step] < half {
                    pos += step; c += cnt[pos]; s += sum[pos]
                }
                step /= 2
            }
            let med = vals[pos]
            let need = half - c
            c += need; s += need * med
            cost[i - x + 1] = med * c - s + (windowSum - s) - med * (x - c)
        }

        let inf = Int.max / 2
        var prev = [Int](repeating: 0, count: n + 1)
        for _ in 1...k {
            var cur = [Int](repeating: inf, count: n + 1)
            for i in x...n {
                cur[i] = min(cur[i - 1], prev[i - x] + cost[i - x])
            }
            prev = cur
        }
        return prev[n]
    }
}
