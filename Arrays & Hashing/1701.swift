class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var time = 0
        var total = 0
        for customer in customers {
            time = max(time, customer[0]) + customer[1]
            total += time - customer[0]
        }
        return Double(total) / Double(customers.count)
    }
}
