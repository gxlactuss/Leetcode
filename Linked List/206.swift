class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = head
        while let node = current {
            current = node.next
            node.next = prev
            prev = node
        }
        return prev
    }
}
