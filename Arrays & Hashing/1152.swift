class Solution {
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        let order = timestamp.indices.sorted { timestamp[$0] < timestamp[$1] }
        var sitesByUser = [String: [String]]()
        for i in order {
            sitesByUser[username[i], default: []].append(website[i])
        }
        var count = [[String]: Int]()
        for sites in sitesByUser.values {
            var patterns = Set<[String]>()
            for i in sites.indices {
                for j in (i + 1)..<max(i + 1, sites.count) {
                    for k in (j + 1)..<max(j + 1, sites.count) {
                        patterns.insert([sites[i], sites[j], sites[k]])
                    }
                }
            }
            for pattern in patterns {
                count[pattern, default: 0] += 1
            }
        }
        return count.max { a, b in
            a.value != b.value ? a.value < b.value : b.key.lexicographicallyPrecedes(a.key)
        }!.key
    }
}
