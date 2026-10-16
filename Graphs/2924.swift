class Solution {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var indegree = [Int](repeating: 0, count: n)
        for edge in edges {
            indegree[edge[1]] += 1
        }
        let champions = indegree.indices.filter { indegree[$0] == 0 }
        return champions.count == 1 ? champions[0] : -1
    }
}
