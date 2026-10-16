class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while let next = fast?.next?.next {
            slow = slow?.next
            fast = next
            if slow === fast { return true }
        }
        return false
    }
}
