class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        if gas.reduce(0, +) < cost.reduce(0, +) { return -1 }
        var tank = 0
        var start = 0
        for i in gas.indices {
            tank += gas[i] - cost[i]
            if tank < 0 {
                tank = 0
                start = i + 1
            }
        }
        return start
    }
}
