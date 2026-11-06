class Solution {
    func countServers(_ n: Int, _ logs: [[Int]], _ x: Int, _ queries: [Int]) -> [Int] {
        let logs = logs.sorted { $0[1] < $1[1] }
        let order = queries.indices.sorted { queries[$0] < queries[$1] }
        var count = [Int](repeating: 0, count: n + 1)
        var active = 0
        var l = 0
        var r = 0
        var res = [Int](repeating: 0, count: queries.count)
        for i in order {
            let q = queries[i]
            while r < logs.count && logs[r][1] <= q {
                count[logs[r][0]] += 1
                if count[logs[r][0]] == 1 { active += 1 }
                r += 1
            }
            while l < r && logs[l][1] < q - x {
                count[logs[l][0]] -= 1
                if count[logs[l][0]] == 0 { active -= 1 }
                l += 1
            }
            res[i] = n - active
        }
        return res
    }
}
