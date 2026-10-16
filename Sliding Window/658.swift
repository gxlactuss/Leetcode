class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = 0
        var r = arr.count - k
        while l < r {
            let mid = (l + r) / 2
            if x - arr[mid] > arr[mid + k] - x {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return Array(arr[l..<(l + k)])
    }
}
