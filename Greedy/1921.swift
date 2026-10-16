class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let arrivals = zip(dist, speed).map { ($0 + $1 - 1) / $1 }.sorted()
        for (minute, arrival) in arrivals.enumerated() where arrival <= minute {
            return minute
        }
        return arrivals.count
    }
}
