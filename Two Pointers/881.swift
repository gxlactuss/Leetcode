class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted()
        var l = 0
        var r = people.count - 1
        var boats = 0
        while l <= r {
            if people[l] + people[r] <= limit { l += 1 }
            r -= 1
            boats += 1
        }
        return boats
    }
}
