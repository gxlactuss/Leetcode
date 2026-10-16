class Solution {
    func totalMoney(_ n: Int) -> Int {
        let weeks = n / 7
        let days = n % 7
        let fullWeeks = 28 * weeks + 7 * weeks * (weeks - 1) / 2
        let lastWeek = days * (weeks + 1) + days * (days - 1) / 2
        return fullWeeks + lastWeek
    }
}
