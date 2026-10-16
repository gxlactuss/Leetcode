class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var before = dummy
        for _ in 1..<left {
            before = before.next!
        }
        let start = before.next!
        for _ in left..<right {
            let moved = start.next!
            start.next = moved.next
            moved.next = before.next
            before.next = moved
        }
        return dummy.next
    }
}
