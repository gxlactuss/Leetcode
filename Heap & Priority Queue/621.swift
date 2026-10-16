class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var count = [Character: Int]()
        for task in tasks { count[task, default: 0] += 1 }
        let maxFreq = count.values.max()!
        let maxCount = count.values.filter { $0 == maxFreq }.count
        return max(tasks.count, (maxFreq - 1) * (n + 1) + maxCount)
    }
}
