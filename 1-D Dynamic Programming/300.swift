class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = [Int]()
        for num in nums {
            var l = 0
            var r = tails.count
            while l < r {
                let mid = (l + r) / 2
                if tails[mid] < num {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            if l == tails.count {
                tails.append(num)
            } else {
                tails[l] = num
            }
        }
        return tails.count
    }
}
