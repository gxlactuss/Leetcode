class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        let target = k * threshold
        var sum = arr[0..<(k - 1)].reduce(0, +)
        var result = 0
        for i in (k - 1)..<arr.count {
            sum += arr[i]
            if sum >= target { result += 1 }
            sum -= arr[i - k + 1]
        }
        return result
    }
}
