class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var tail = dummy
        var a = l1
        var b = l2
        var carry = 0
        while a != nil || b != nil || carry > 0 {
            let sum = (a?.val ?? 0) + (b?.val ?? 0) + carry
            carry = sum / 10
            tail.next = ListNode(sum % 10)
            tail = tail.next!
            a = a?.next
            b = b?.next
        }
        return dummy.next
    }
}
