class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var fast: ListNode? = dummy
        var slow = dummy
        for _ in 0...n {
            fast = fast?.next
        }
        while fast != nil {
            fast = fast?.next
            slow = slow.next!
        }
        slow.next = slow.next?.next
        return dummy.next
    }
}
