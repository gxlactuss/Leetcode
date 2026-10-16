class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var adj = [String: [(String, Double)]]()
        for (equation, value) in zip(equations, values) {
            adj[equation[0], default: []].append((equation[1], value))
            adj[equation[1], default: []].append((equation[0], 1 / value))
        }
        return queries.map { query in
            let (source, target) = (query[0], query[1])
            guard adj[source] != nil, adj[target] != nil else { return -1.0 }
            var visited: Set = [source]
            var stack = [(source, 1.0)]
            while let (node, product) = stack.popLast() {
                if node == target { return product }
                for (next, weight) in adj[node]! where visited.insert(next).inserted {
                    stack.append((next, product * weight))
                }
            }
            return -1.0
        }
    }
}
