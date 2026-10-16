class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        let n = senate.count
        var radiant = [Int]()
        var dire = [Int]()
        for (i, c) in senate.enumerated() {
            if c == "R" {
                radiant.append(i)
            } else {
                dire.append(i)
            }
        }
        var r = 0
        var d = 0
        while r < radiant.count && d < dire.count {
            if radiant[r] < dire[d] {
                radiant.append(radiant[r] + n)
            } else {
                dire.append(dire[d] + n)
            }
            r += 1
            d += 1
        }
        return r < radiant.count ? "Radiant" : "Dire"
    }
}
