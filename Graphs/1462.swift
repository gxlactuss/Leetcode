class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        let n = numCourses
        var reach = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        for pre in prerequisites {
            reach[pre[0]][pre[1]] = true
        }
        for k in 0..<n {
            for i in 0..<n where reach[i][k] {
                for j in 0..<n where reach[k][j] {
                    reach[i][j] = true
                }
            }
        }
        return queries.map { reach[$0[0]][$0[1]] }
    }
}
