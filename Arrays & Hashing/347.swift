class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        for num in nums { count[num, default: 0] += 1 }
        var buckets = [[Int]](repeating: [], count: nums.count + 1)
        for (num, freq) in count {
            buckets[freq].append(num)
        }
        return Array(buckets.reversed().joined().prefix(k))
    }
}
