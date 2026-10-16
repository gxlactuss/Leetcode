class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = [Int]()
        var head = 0
        var result = [Int]()
        for i in nums.indices {
            while deque.count > head, nums[deque.last!] <= nums[i] {
                deque.removeLast()
            }
            deque.append(i)
            if deque[head] <= i - k { head += 1 }
            if i >= k - 1 { result.append(nums[deque[head]]) }
        }
        return result
    }
}
