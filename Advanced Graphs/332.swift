class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var adj = [String: [String]]()
        for ticket in tickets.sorted(by: { $0[1] > $1[1] }) {
            adj[ticket[0], default: []].append(ticket[1])
        }
        var route = [String]()
        var stack = ["JFK"]
        while let airport = stack.last {
            if let next = adj[airport]?.popLast() {
                stack.append(next)
            } else {
                route.append(stack.removeLast())
            }
        }
        return route.reversed()
    }
}
