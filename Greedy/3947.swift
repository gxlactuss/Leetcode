class Solution {
    func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
        let n = items.count
        var freq = [Int](repeating: 0, count: n + 1)
        for item in items { freq[item[0]] += 1 }
        var multiples = [Int](repeating: 0, count: n + 1)
        for f in 1...n where freq[f] > 0 {
            for m in stride(from: f, through: n, by: f) { multiples[f] += freq[m] }
        }
        let cheapest = items.map { $0[1] }.min()!
        let bonus = items.map { ($0[1], multiples[$0[0]] - 1) }
            .filter { $0.1 > 0 && $0.0 < 2 * cheapest }
            .sorted { $0.0 < $1.0 }
        var left = budget
        var doubles = 0
        for (price, count) in bonus {
            let take = min(count, left / price)
            doubles += take
            left -= take * price
            if take < count { break }
        }
        return 2 * doubles + left / cheapest
    }
}
