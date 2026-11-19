class Solution {
    func minimizeSum(_ nums: [Int]) -> Int {
        let a = nums.sorted(), n = a.count
        return min(a[n - 1] - a[2], a[n - 3] - a[0], a[n - 2] - a[1])
    }
}
