class Solution {
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        func gcd(_ a: Int, _ b: Int) -> Int {
            b == 0 ? a : gcd(b, a % b)
        }
        var current = head
        while let node = current, let next = node.next {
            node.next = ListNode(gcd(node.val, next.val), next)
            current = next
        }
        return head
    }
}
