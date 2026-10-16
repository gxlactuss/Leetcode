class Solution: GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var l = 1
        var r = n
        while true {
            let mid = l + (r - l) / 2
            switch guess(mid) {
            case 0: return mid
            case -1: r = mid - 1
            default: l = mid + 1
            }
        }
    }
}
