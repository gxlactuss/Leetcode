class Solution {
    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }
        var slow = head
        var fast = head
        while let next = fast.next?.next {
            slow = slow.next!
            fast = next
        }
        var second = slow.next
        slow.next = nil
        var prev: ListNode? = nil
        while let node = second {
            second = node.next
            node.next = prev
            prev = node
        }
        var first: ListNode? = head
        second = prev
        while let s = second, let f = first {
            let firstNext = f.next
            let secondNext = s.next
            f.next = s
            s.next = firstNext
            first = firstNext
            second = secondNext
        }
    }
}
