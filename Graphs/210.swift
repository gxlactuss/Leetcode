class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = [[Int]](repeating: [], count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses)
        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
            indegree[pre[0]] += 1
        }
        var queue = (0..<numCourses).filter { indegree[$0] == 0 }
        var order = [Int]()
        while let course = queue.popLast() {
            order.append(course)
            for next in adj[course] {
                indegree[next] -= 1
                if indegree[next] == 0 { queue.append(next) }
            }
        }
        return order.count == numCourses ? order : []
    }
}
