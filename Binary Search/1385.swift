class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let sorted = arr2.sorted()
        var count = 0
        for x in arr1 {
            var l = 0
            var r = sorted.count
            while l < r {
                let m = (l + r) / 2
                if sorted[m] < x - d {
                    l = m + 1
                } else {
                    r = m
                }
            }
            if l == sorted.count || sorted[l] > x + d {
                count += 1
            }
        }
        return count
    }
}
