class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        let n = colors.count
        var length = 1
        var result = 0
        for i in 1..<(n + k - 1) {
            length = colors[i % n] != colors[(i - 1) % n] ? length + 1 : 1
            if length >= k { result += 1 }
        }
        return result
    }
}
