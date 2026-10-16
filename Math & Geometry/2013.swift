class DetectSquares {
    private var counts = [[Int]: Int]()

    init() {}

    func add(_ point: [Int]) {
        counts[point, default: 0] += 1
    }

    func count(_ point: [Int]) -> Int {
        let (x, y) = (point[0], point[1])
        var result = 0
        for (p, n) in counts where abs(p[0] - x) == abs(p[1] - y) && p[0] != x {
            result += n * counts[[p[0], y], default: 0] * counts[[x, p[1]], default: 0]
        }
        return result
    }
}
