class Solution {
    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        if nums.count == 1 { return true }
        if nums.contains(1) { return false }
        var parent = Array(nums.indices)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        var owner = [Int: Int]()
        for (i, num) in nums.enumerated() {
            var n = num
            var p = 2
            while p * p <= n {
                if n % p == 0 {
                    if let j = owner[p] {
                        parent[find(i)] = find(j)
                    } else {
                        owner[p] = i
                    }
                    while n % p == 0 { n /= p }
                }
                p += 1
            }
            if n > 1 {
                if let j = owner[n] {
                    parent[find(i)] = find(j)
                } else {
                    owner[n] = i
                }
            }
        }
        let root = find(0)
        return nums.indices.allSatisfy { find($0) == root }
    }
}
