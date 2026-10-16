class FreqStack {
    private var freq = [Int: Int]()
    private var groups = [[Int]]()

    init() {}

    func push(_ val: Int) {
        freq[val, default: 0] += 1
        let f = freq[val]!
        if f > groups.count { groups.append([]) }
        groups[f - 1].append(val)
    }

    func pop() -> Int {
        let val = groups[groups.count - 1].removeLast()
        if groups.last!.isEmpty { groups.removeLast() }
        freq[val]! -= 1
        return val
    }
}
