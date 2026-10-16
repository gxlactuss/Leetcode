class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = [[Int]](repeating: [], count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses)
        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
            indegree[pre[0]] += 1
        }
        var queue = (0..<numCourses).filter { indegree[$0] == 0 }
        var taken = 0
        while let course = queue.popLast() {
            taken += 1
            for next in adj[course] {
                indegree[next] -= 1
                if indegree[next] == 0 { queue.append(next) }
            }
        }
        return taken == numCourses
    }
}
