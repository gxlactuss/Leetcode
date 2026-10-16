class SummaryRanges {
    private var intervals = [[Int]]()

    init() {}

    func addNum(_ value: Int) {
        var l = 0
        var r = intervals.count
        while l < r {
            let mid = (l + r) / 2
            if intervals[mid][0] > value {
                r = mid
            } else {
                l = mid + 1
            }
        }
        let i = l
        if i > 0 && intervals[i - 1][1] >= value { return }
        let joinsLeft = i > 0 && intervals[i - 1][1] + 1 == value
        let joinsRight = i < intervals.count && intervals[i][0] - 1 == value
        if joinsLeft && joinsRight {
            intervals[i - 1][1] = intervals[i][1]
            intervals.remove(at: i)
        } else if joinsLeft {
            intervals[i - 1][1] = value
        } else if joinsRight {
            intervals[i][0] = value
        } else {
            intervals.insert([value, value], at: i)
        }
    }

    func getIntervals() -> [[Int]] {
        intervals
    }
}
