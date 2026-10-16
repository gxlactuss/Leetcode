class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var visited = Set(deadends.map { Int($0)! })
        let target = Int(target)!
        if visited.contains(0) { return -1 }
        visited.insert(0)
        var queue = [0]
        var turns = 0
        let powers = [1, 10, 100, 1000]
        while !queue.isEmpty {
            var next = [Int]()
            for code in queue {
                if code == target { return turns }
                for p in powers {
                    let digit = code / p % 10
                    for newDigit in [(digit + 1) % 10, (digit + 9) % 10] {
                        let neighbor = code + (newDigit - digit) * p
                        if visited.insert(neighbor).inserted {
                            next.append(neighbor)
                        }
                    }
                }
            }
            queue = next
            turns += 1
        }
        return -1
    }
}
