class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 > $1.0 }
        var fleets = 0
        var slowest = 0.0
        for (pos, spd) in cars {
            let time = Double(target - pos) / Double(spd)
            if time > slowest {
                fleets += 1
                slowest = time
            }
        }
        return fleets
    }
}
