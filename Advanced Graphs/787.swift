class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var prices = [Int](repeating: Int.max, count: n)
        prices[src] = 0
        for _ in 0...k {
            var next = prices
            for flight in flights where prices[flight[0]] != Int.max {
                next[flight[1]] = min(next[flight[1]], prices[flight[0]] + flight[2])
            }
            prices = next
        }
        return prices[dst] == Int.max ? -1 : prices[dst]
    }
}
