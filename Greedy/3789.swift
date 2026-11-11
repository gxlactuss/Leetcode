class Solution {
    func minimumCost(_ cost1: Int, _ cost2: Int, _ costBoth: Int, _ need1: Int, _ need2: Int) -> Int {
        func cost(_ k: Int) -> Int {
            k * costBoth + max(0, need1 - k) * cost1 + max(0, need2 - k) * cost2
        }
        return [0, min(need1, need2), max(need1, need2)].map(cost).min()!
    }
}
