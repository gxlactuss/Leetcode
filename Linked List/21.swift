class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var tail = dummy
        var a = list1
        var b = list2
        while let x = a, let y = b {
            if x.val <= y.val {
                tail.next = x
                a = x.next
            } else {
                tail.next = y
                b = y.next
            }
            tail = tail.next!
        }
        tail.next = a ?? b
        return dummy.next
    }
}
