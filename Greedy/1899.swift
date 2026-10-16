class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var found = [false, false, false]
        for t in triplets where t[0] <= target[0] && t[1] <= target[1] && t[2] <= target[2] {
            for i in 0..<3 where t[i] == target[i] {
                found[i] = true
            }
        }
        return !found.contains(false)
    }
}
