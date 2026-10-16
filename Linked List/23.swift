class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var lists = lists
        while lists.count > 1 {
            var merged = [ListNode?]()
            for i in stride(from: 0, to: lists.count, by: 2) {
                merged.append(mergeTwoLists(lists[i], i + 1 < lists.count ? lists[i + 1] : nil))
            }
            lists = merged
        }
        return lists[0]
    }

    private func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
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
