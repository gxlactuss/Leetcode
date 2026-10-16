class Solution {
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        func canCut(_ start: Int, _ end: Int) -> Bool {
            let sorted = rectangles.sorted { $0[start] < $1[start] }
            var gaps = 0
            var maxEnd = sorted[0][end]
            for rect in sorted.dropFirst() {
                if rect[start] >= maxEnd { gaps += 1 }
                maxEnd = max(maxEnd, rect[end])
            }
            return gaps >= 2
        }
        return canCut(0, 2) || canCut(1, 3)
    }
}
