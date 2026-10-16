class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var copies = [ObjectIdentifier: Node]()
        var current = head
        while let node = current {
            copies[ObjectIdentifier(node)] = Node(node.val)
            current = node.next
        }
        current = head
        while let node = current {
            let copy = copies[ObjectIdentifier(node)]!
            copy.next = node.next.map { copies[ObjectIdentifier($0)]! }
            copy.random = node.random.map { copies[ObjectIdentifier($0)]! }
            current = node.next
        }
        return head.map { copies[ObjectIdentifier($0)]! }
    }
}
