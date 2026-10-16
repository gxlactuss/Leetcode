class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var parent = Array(accounts.indices)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        var owner = [String: Int]()
        for (i, account) in accounts.enumerated() {
            for email in account.dropFirst() {
                if let j = owner[email] {
                    parent[find(i)] = find(j)
                } else {
                    owner[email] = i
                }
            }
        }
        var groups = [Int: [String]]()
        for (email, i) in owner {
            groups[find(i), default: []].append(email)
        }
        return groups.map { [accounts[$0.key][0]] + $0.value.sorted() }
    }
}
