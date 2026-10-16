class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var count = [Int: Int]()
        for num in arr { count[num, default: 0] += 1 }
        return count.filter { $0.key == $0.value }.keys.max() ?? -1
    }
}
