class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var count = [Character: Int]()
        for c in text { count[c, default: 0] += 1 }
        return [
            count["b", default: 0],
            count["a", default: 0],
            count["l", default: 0] / 2,
            count["o", default: 0] / 2,
            count["n", default: 0],
        ].min()!
    }
}
