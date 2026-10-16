class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var result = arr
        var maxRight = -1
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            result[i] = maxRight
            maxRight = max(maxRight, arr[i])
        }
        return result
    }
}
