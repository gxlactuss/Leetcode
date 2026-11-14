class Solution {
    func minimumSumSubarray(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var prefix = [0]
        for num in nums { prefix.append(prefix.last! + num) }
        var ans = Int.max
        for end in l...nums.count {
            for len in l...min(r, end) {
                let sum = prefix[end] - prefix[end - len]
                if sum > 0 { ans = min(ans, sum) }
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
