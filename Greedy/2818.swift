class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let mod = 1_000_000_007
        let n = nums.count
        let limit = nums.max()!
        var primeScore = [Int](repeating: 0, count: limit + 1)
        if limit >= 2 {
            for p in 2...limit where primeScore[p] == 0 {
                for multiple in stride(from: p, through: limit, by: p) {
                    primeScore[multiple] += 1
                }
            }
        }
        let score = nums.map { primeScore[$0] }
        var left = [Int](repeating: -1, count: n)
        var right = [Int](repeating: n, count: n)
        var stack = [Int]()
        for i in 0..<n {
            while let top = stack.last, score[top] < score[i] {
                right[top] = i
                stack.removeLast()
            }
            left[i] = stack.last ?? -1
            stack.append(i)
        }

        func power(_ base: Int, _ exp: Int) -> Int {
            var result = 1
            var base = base % mod
            var exp = exp
            while exp > 0 {
                if exp & 1 == 1 { result = result * base % mod }
                base = base * base % mod
                exp >>= 1
            }
            return result
        }

        var k = k
        var result = 1
        for i in nums.indices.sorted(by: { nums[$0] > nums[$1] }) {
            let uses = min(k, (i - left[i]) * (right[i] - i))
            result = result * power(nums[i], uses) % mod
            k -= uses
            if k == 0 { break }
        }
        return result
    }
}
