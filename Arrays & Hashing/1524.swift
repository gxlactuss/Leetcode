class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var oddCount = 0
        var evenCount = 1
        var sum = 0
        var result = 0
        for num in arr {
            sum += num
            if sum % 2 == 1 {
                result += evenCount
                oddCount += 1
            } else {
                result += oddCount
                evenCount += 1
            }
        }
        return result % 1_000_000_007
    }
}
