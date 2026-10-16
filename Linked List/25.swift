class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var groupPrev = dummy
        while true {
            var kth: ListNode? = groupPrev
            for _ in 0..<k {
                kth = kth?.next
            }
            guard let groupEnd = kth else { break }
            let groupNext = groupEnd.next
            var prev = groupNext
            var current = groupPrev.next
            while current !== groupNext {
                let node = current!
                current = node.next
                node.next = prev
                prev = node
            }
            let first = groupPrev.next!
            groupPrev.next = groupEnd
            groupPrev = first
        }
        return dummy.next
    }
}
