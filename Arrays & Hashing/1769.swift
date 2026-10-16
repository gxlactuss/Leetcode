class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let balls = boxes.map { $0 == "1" ? 1 : 0 }
        var result = [Int](repeating: 0, count: balls.count)
        var count = 0
        var moves = 0
        for i in balls.indices {
            result[i] = moves
            count += balls[i]
            moves += count
        }
        count = 0
        moves = 0
        for i in balls.indices.reversed() {
            result[i] += moves
            count += balls[i]
            moves += count
        }
        return result
    }
}
