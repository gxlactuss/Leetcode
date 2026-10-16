class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var lastIndex = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let j = lastIndex[num], i - j <= k { return true }
            lastIndex[num] = i
        }
        return false
    }
}
