class Solution {
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        let n = roads.count + 1
        var adj = [[Int]](repeating: [], count: n)
        for road in roads {
            adj[road[0]].append(road[1])
            adj[road[1]].append(road[0])
        }
        var parent = [Int](repeating: -1, count: n)
        var order = [0]
        var i = 0
        while i < order.count {
            let city = order[i]
            i += 1
            for next in adj[city] where next != parent[city] {
                parent[next] = city
                order.append(next)
            }
        }
        var people = [Int](repeating: 1, count: n)
        var fuel = 0
        for city in order.reversed() where city != 0 {
            fuel += (people[city] + seats - 1) / seats
            people[parent[city]] += people[city]
        }
        return fuel
    }
}
