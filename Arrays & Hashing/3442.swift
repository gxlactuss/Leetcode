class Solution {
    func maxDifference(_ s: String) -> Int {
        var freq = [Character: Int]()
        for c in s { freq[c, default: 0] += 1 }
        let maxOdd = freq.values.filter { $0 % 2 == 1 }.max()!
        let minEven = freq.values.filter { $0 % 2 == 0 }.min()!
        return maxOdd - minEven
    }
}
